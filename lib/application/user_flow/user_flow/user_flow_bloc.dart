import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/application/auth_flow/auth/auth_bloc.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/domain/user_flow/i_user_flow_facade.dart';
import 'package:ringo_media_management/domain/user_flow/schedule_model/schedule_model.dart';
import 'package:ringo_media_management/domain/user_flow/task_model/task_model.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';

import 'user_flow_event.dart';
import 'user_flow_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@LazySingleton()
class UserFlowBloc extends Bloc<UserFlowEvent, UserFlowState> {
  final IUserFlowFacade _iUserFlowFacade;
  Stream<Either<UserFlowFailure, Option<CalenderDayModel>>>? calenderDayModelStream;

  UserFlowBloc(this._iUserFlowFacade) : super(UserFlowState.initial()) {
    // General Events
    on<LoadAllNeededDataForUserFlow>(_onLoadAllNeededDataForUserFlow, transformer: restartable());
    on<NormalUpdateForStateWithNoChange>(_onNormalUpdateForStateWithNoChange, transformer: restartable());

    // Home Page
    // Project Summary Page
    on<SearchForProjects>(_onSearchForProjects, transformer: restartable());
    on<GetAllProjects>(_onGetAllProjects, transformer: restartable());
    // Calender Page
    on<GetCalenderDayModel>(_onGetCalenderDayModel, transformer: restartable());
    on<AddNewCalenderTaskModel>(_onAddNewCalenderTaskModel, transformer: restartable());
    on<AddNewCalenderScheduleModel>(_onAddNewCalenderScheduleModel, transformer: restartable());
    on<AddNewCalenderDayModel>(_onAddNewCalenderDayModel, transformer: restartable());
    on<UpdateCalenderDayModel>(_onUpdateCalenderDayModel, transformer: restartable());
    on<CalenderDaysScrollControllerJumpToDay>(_onCalenderDaysScrollControllerJumpToDay, transformer: restartable());
    // Profile Page

    on<ProfileInputsChanged>(_onProfileInputsChanged, transformer: restartable());
    // Used transformer [droppable] to only accept the first request and ignore any other request may happened like double click and click more than one time while handling the first request
    on<UpdateUserProfile>(_onUpdateUserProfile, transformer: droppable());
  }

  void _onLoadAllNeededDataForUserFlow(LoadAllNeededDataForUserFlow event, Emitter<UserFlowState> emit) async {
    // Acting like database call
    // Loading Home data first and update the UI for each new data so user has a good experience and not waiting to much
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
      homePageIsLoadingWorkSpaceSection: false,
      userFlowFailureOrSuccessOption: none(),
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
      homePageIsLoadingWorkTodaySchedule: false,
      userFlowFailureOrSuccessOption: none(),
    ));
    debugPrint('[BLOC] Date Loaded ');
    // Loading Project Summary data
    await Future.delayed(const Duration(milliseconds: 2000));
    emit(state.copyWith(
      projectPageIsLoadingForProjectsStatisticsModel: false,
      userFlowFailureOrSuccessOption: none(),
    ));

    // Loading Calender Page data
    await Future.delayed(const Duration(milliseconds: 2000));
    add(UserFlowEvent.getCalenderDayModel(shouldUpdateScrollbar: false, date: state.selectedDayForCalenderDayModel));

    // Loading profile Page
    final userModel = getIt<AuthBloc>().userModelOption.getOrElse(() => throw UnexpectedNullValueError());
    emit(state.copyWith(
      name: userModel.name,
      emailAddress: userModel.emailAddress,
      address: userModel.address,
      website: userModel.website,
      phoneNumber: userModel.phoneNumber,
    ));
  }

  void _onNormalUpdateForStateWithNoChange(NormalUpdateForStateWithNoChange event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      /// Did not make it none() to enforce update for the UI , alternative solution to add a dummy propriety
      userFlowFailureOrSuccessOption: some(right(none())),
    ));
  }

  void _onSearchForProjects(SearchForProjects event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      projectPageIsLoadingForProjectsSearch: true,
      userFlowFailureOrSuccessOption: none(),
    ));

    final response = await _iUserFlowFacade.searchForProjectsModel(searchValue: event.valueStr);

    response.fold((f) {
      emit(state.copyWith(
        projectPageIsLoadingForProjectsSearch: false,
        userFlowFailureOrSuccessOption: some(left(f)),
      ));
    }, (projectsList) {
      emit(state.copyWith(
        projectPageIsLoadingForProjectsSearch: false,
        projectsModelFromSearchResult: projectsList,
        userFlowFailureOrSuccessOption: none(),
      ));
    });
  }

  void _onGetAllProjects(GetAllProjects event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      projectPageIsLoadingForAllProjectsSection: true,
      userFlowFailureOrSuccessOption: none(),
    ));

    final response = await _iUserFlowFacade.getAllProjectsModel();

    response.fold((f) {
      emit(state.copyWith(
        projectPageIsLoadingForAllProjectsSection: false,
        userFlowFailureOrSuccessOption: some(left(f)),
      ));
    }, (allProjectModel) {
      emit(state.copyWith(
        projectPageIsLoadingForAllProjectsSection: false,
        allProjectsModel: allProjectModel,
        userFlowFailureOrSuccessOption: none(),
      ));
    });
  }

  void _onGetCalenderDayModel(GetCalenderDayModel event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      calenderPageIsLoadingForCalenderDayModel: true,
      selectedDayForCalenderDayModel: event.date,
      userFlowFailureOrSuccessOption: none(),
    ));
    calenderDayModelStream = _iUserFlowFacade.streamCalenderDayModelByDate(inputDay: event.date);
    if (event.shouldUpdateScrollbar) {
      add(CalenderDaysScrollControllerJumpToDay(
        dayNumber: event.date.day,
      ));
    }
    await emit.forEach(
      calenderDayModelStream!,
      onData: (Either<UserFlowFailure, Option<CalenderDayModel>> onData) {
        return onData.fold((f) {
          return state.copyWith(
            calenderPageIsLoadingForCalenderDayModel: false,
            calendarDayModel: none(),
            userFlowFailureOrSuccessOption: some(left(f)),
          );
        }, (calenderDayModel) {
          return state.copyWith(
            calenderPageIsLoadingForCalenderDayModel: false,
            calendarDayModel: calenderDayModel.fold(
              () => Some(CalenderDayModel.empty()),
              (calenderDayModel) => some(calenderDayModel),
            ),
            userFlowFailureOrSuccessOption: none(),
          );
        });
      },
      onError: (e, s) {
        return state.copyWith(
          calenderPageIsLoadingForCalenderDayModel: false,
          calendarDayModel: none(),
          userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
        );
      },
    );
  }

  /// here we will remove the pup up so there is no waiting
  /// after we update the backend the UI should automatically update
  /// case we are using streams
  void _onAddNewCalenderTaskModel(AddNewCalenderTaskModel event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    final taskModel = TaskModel.create(title: event.title, isDone: event.isDone, deadLine: event.deadLine);
    final response = await _iUserFlowFacade.addOrUpdateCalenderDayModel(
      calenderDayModel: state.calendarDayModel.fold(() {
        return CalenderDayModel.create(
          schedules: const KtList.empty(),
          tasks: listOf(taskModel),
        );
      }, (calenderDayModel) {
        return calenderDayModel.copyWith(tasks: calenderDayModel.tasks.plusElement(taskModel));
      }),
    );

    emit(state.copyWith(
      userFlowFailureOrSuccessOption: response.fold((f) => some(left(f)), (_) => none()),
    ));
  }

  /// here we will remove the pup up so there is no waiting
  /// after we update the backend the UI should automatically update
  /// case we are using streams
  void _onAddNewCalenderScheduleModel(AddNewCalenderScheduleModel event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    final scheduleModel = ScheduleModel.create(
      title: event.title,
      url: event.url,
      color: event.color,
      startDate: event.startDate,
    );
    final response = await _iUserFlowFacade.addOrUpdateCalenderDayModel(
      calenderDayModel: state.calendarDayModel.fold(() {
        return CalenderDayModel.create(
          schedules: listOf(scheduleModel),
          tasks: const KtList.empty(),
        );
      }, (calenderDayModel) {
        return calenderDayModel.copyWith(schedules: calenderDayModel.schedules.plusElement(scheduleModel));
      }),
    );

    emit(state.copyWith(
      userFlowFailureOrSuccessOption: response.fold((f) => some(left(f)), (_) => none()),
    ));
  }

  /// here we will remove the pup up so there is no waiting
  /// after we update the backend the UI should automatically update
  /// case we are using streams
  void _onAddNewCalenderDayModel(AddNewCalenderDayModel event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    final response = await _iUserFlowFacade.addOrUpdateCalenderDayModel(
      calenderDayModel: CalenderDayModel.create(
        schedules: event.scheduleList.toImmutableList(),
        tasks: event.taskList.toImmutableList(),
      ),
    );
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: response.fold((f) => some(left(f)), (_) => none()),
    ));
  }

  /// here we will remove the pup up so there is no waiting
  /// after we update the backend the UI should automatically update
  /// case we are using streams
  void _onUpdateCalenderDayModel(UpdateCalenderDayModel event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    final response = await _iUserFlowFacade.addOrUpdateCalenderDayModel(
      calenderDayModel: CalenderDayModel.create(
        schedules: event.scheduleList.toImmutableList(),
        tasks: event.taskList.toImmutableList(),
      ),
    );
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: response.fold((f) => some(left(f)), (_) => none()),
    ));
  }

  void _onCalenderDaysScrollControllerJumpToDay(CalenderDaysScrollControllerJumpToDay event, Emitter<UserFlowState> emit) async {
    try {
      state.calenderDaysScrollController.animateTo(
        (event.dayNumber - 1) * 48.w,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    } catch (e) {
      debugPrint('ERROR In Bloc [UserFlowBloc] FOR [_onCalenderDaysScrollControllerJumpToDay]');
    }
  }

  // Profile Page
  void _onProfileInputsChanged(ProfileInputsChanged event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      name: Name(event.nameStr),
      emailAddress: EmailAddress(event.emailStr),
      address: Address(optionOf(event.addressStr)),
      website: OptionWebsite(optionOf(event.webSiteStr)),
      phoneNumber: PhoneNumber(optionOf(event.phoneNumberStr)),
      userFlowFailureOrSuccessOption: none(),
    ));
  }

  void _onUpdateUserProfile(UpdateUserProfile event, Emitter<UserFlowState> emit) async {
    Either<UserFlowFailure, Unit>? response;
    emit(state.copyWith(
      profilePageAutoValidateForm: true,
      profilePageIsSubmitting: true,
      userFlowFailureOrSuccessOption: none(),
    ));
    final nameIsValid = state.name.isValid();
    final emailAddressIsValid = state.emailAddress.isValid();
    final addressIsValid = state.address.isValid();
    final websiteIsValid = state.website.isValid();
    final phoneNumberIsValid = state.phoneNumber.isValid();
    if (nameIsValid && emailAddressIsValid && addressIsValid && websiteIsValid && phoneNumberIsValid) {
      response = await _iUserFlowFacade.updateUserProfile(
        name: state.name,
        emailAddress: state.emailAddress,
        address: state.address,
        website: state.website,
        phoneNumber: state.phoneNumber,
      );
    }
    emit(state.copyWith(
      profilePageIsSubmitting: false,
      userFlowFailureOrSuccessOption: optionOf(response).fold(
        () => none(),
        (res) => res.fold(
            (f) => some(left(f)),
            (r) => some(
                  right(some('Profile updated')),
                )),
      ),
    ));
  }
}
