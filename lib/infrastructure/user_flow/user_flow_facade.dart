import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/domain/user_flow/i_user_flow_facade.dart';
import 'package:ringo_media_management/domain/user_flow/project_model/project_model.dart';
import 'package:ringo_media_management/domain/user_flow/projects_statistics_model/projects_statistics_model.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';
import 'package:ringo_media_management/infrastructure/core/firebase_helper.dart';
import 'package:ringo_media_management/infrastructure/user_flow/calender_day_model_dtos/calender_day_model_dtos.dart';
import 'package:ringo_media_management/infrastructure/user_flow/project_model_dtos/project_model_dtos.dart';
import 'package:ringo_media_management/infrastructure/user_flow/projects_statistics_model_dtos/projects_statistics_model_dtos.dart';
import 'package:rxdart/rxdart.dart';

/// The implementations of the interface [IUserFlowFacade].
///
/// This implementation will have all the needed logic for user flow to deal
/// with APIs and third party libraries.
@LazySingleton(as: IUserFlowFacade)
class UserFlowFacade implements IUserFlowFacade {
  final FirebaseFirestore _firebaseFirestore;
  final InternetConnection _internetConnection;

  UserFlowFacade(
    this._firebaseFirestore,
    this._internetConnection,
  );

  /// Add or Update [CalenderDayModel] in the db.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- convert model to dto.
  /// 3- update the model on db.
  /// 4- return `right(Unit())`.
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, Unit>> addOrUpdateCalenderDayModel({required CalenderDayModel calenderDayModel}) async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }

      final calenderDayDto = CalenderDayModelDto.fromDomain(calenderDayModel);
      await _firebaseFirestore.userCalenderDaysCollection.doc(calenderDayDto.id).set(
            calenderDayDto.toJson(),
            SetOptions(merge: true),
          );
      return right(unit);
    } on FirebaseException catch (e) {
      debugPrint("Error In [addOrUpdateCalenderDayModel] By [FirebaseException]: $e");
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [addOrUpdateCalenderDayModel] By [GeneralCatch]: $e");
      return left(const UserFlowFailure.serverError());
    }
  }

  /// Return `List` of [ProjectModel] that is found in the db with no filtration.
  ///
  /// Note: If there is no record for [ProjectModel] an empty `KtList` will be returned.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- get all the models that is found in the db.
  /// 3- loop throw the list of records and convert them to [ProjectModel] by using [ProjectModelDto.fromFireStore(doc).toDomain()].
  /// 4- return `right(KtList<ProjectModel>)`.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> getAllProjectsModel() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }
      return _firebaseFirestore.userProjectsCollection.get().then((documents) {
        return right<UserFlowFailure, KtList<ProjectModel>>(
          documents.docs.map((doc) {
            return ProjectModelDto.fromFireStore(doc).toDomain();
          }).toImmutableList(),
        );
      });
    } on FirebaseException catch (e) {
      debugPrint("Error In [getAllProjectsModel] By [FirebaseException]: $e");
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [getAllProjectsModel] By [GeneralCatch]: $e");
      return left(const UserFlowFailure.serverError());
    }
  }

  /// Return a [CalenderDayModel] from db by [id].
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- convert the [inputDay] which is `DateTime` to [UniqueId] by using [UniqueId.fromDateTime].
  /// 3- convert the generated [UniqueId] to `String` By [UniqueId.getOrCrash].
  /// 4- search for the [CalenderDayModel] by the new generated `id`.
  /// 5- if the [CalenderDayModel] is not exists return `right(none())`.
  /// 6- if [CalenderDayModel] found use [CalenderDayModelDto.fromFireStore] to convert the firebase json data to dto.
  /// 7- convert [CalenderDayModelDto] to [CalenderDayModel] by [CalenderDayModelDto.toDomain].
  /// 8- return `some(CalenderDayModel())`.
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, Option<CalenderDayModel>>> getCalenderDayModelByDate({required DateTime inputDay}) async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }
      return _firebaseFirestore.userCalenderDaysCollection.doc(UniqueId.fromDateTime(inputDay).getOrCrash()).get().then((doc) {
        if (!doc.exists) {
          return right(none());
        }
        return right(some(CalenderDayModelDto.fromFireStore(doc).toDomain()));
      });
    } on FirebaseException catch (e) {
      debugPrint("Error In [getCalenderDayModelByDate] By [FirebaseException]: $e");
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [getCalenderDayModelByDate] By [GeneralCatch]: $e");
      return left(const UserFlowFailure.serverError());
    }
  }

  /// Return a [ProjectsStatisticsModel] from db.
  ///
  /// Note: [ProjectsStatisticsModel] is only 1 record in DB which holds all the data necessary for analysis purposes.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- get the only 1 record in the db.
  /// 3- if record is not exists return `left(UserFlowFailure.serverError())`.
  /// 4- if record is exists convert the record into [ProjectsStatisticsModel] by [ProjectsStatisticsModelDto.fromFireStore(doc).toDomain()].
  /// 5- return `right(ProjectsStatisticsModel())`.
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, ProjectsStatisticsModel>> getProjectsStatisticModel() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }

      return _firebaseFirestore.userProjectsStatisticsDocument.get().then((doc) {
        if (!doc.exists) {
          // at the registration stage each user we create this model for him
          return left(const UserFlowFailure.serverError());
        }
        return right(ProjectsStatisticsModelDto.fromFireStore(doc).toDomain());
      });
    } on FirebaseException catch (e) {
      debugPrint("Error In [getProjectsStatisticModel] By [FirebaseException]: $e");
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [getProjectsStatisticModel] By [GeneralCatch]: $e");
      return left(const UserFlowFailure.serverError());
    }
  }

  /// search for all [ProjectModel]s by [searchValue] in db and return `List` of [ProjectModel].
  ///
  /// Note:
  /// 1- I'm using `\uf8ff` special code to search the db as firebase does not support text search.
  /// 2- if there is no record for [ProjectModel] an empty `KtList` will be returned.
  ///
  /// Steps:
  /// 1- check internet connections.
  /// 2- prepare the search query and add a limit of `20` records as maximum result to not drain the `CRUD` and execute it.
  /// 3- loop throw the list of records and convert them to [ProjectModel] by using [ProjectModelDto.fromFireStore(doc).toDomain()].
  /// 4- return `right(KtList<ProjectModel>)`.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> searchForProjectsModel({required String? searchValue}) async {
    if (searchValue == null || searchValue.trim().isEmpty) {
      return right(const KtList.empty());
    } else {
      try {
        bool result = await _internetConnection.hasInternetAccess;
        if (!result) {
          return left(const UserFlowFailure.noInternetConnection());
        }

        return _firebaseFirestore.userProjectsCollection
            .orderBy("title")
            .startAt([searchValue])
            .endAt(
              ['$searchValue\uf8ff'],
            )
            .limit(20)
            .get()
            .then((snapshot) {
              final List<ProjectModel> projectsModel = snapshot.docs.map((doc) => ProjectModelDto.fromFireStore(doc).toDomain()).toList();
              return right(projectsModel.toImmutableList());
            });
      } on FirebaseException catch (e) {
        debugPrint("Error In [searchForProjectsModel] By [FirebaseException]: $e");
        if (e.message!.contains('PERMISSION_DENIED')) {
          return left(const UserFlowFailure.insufficientPermission());
        } else {
          return left(const UserFlowFailure.serverError());
        }
      } catch (e) {
        debugPrint("Error In [searchForProjectsModel] By [GeneralCatch]: $e");
        return left(const UserFlowFailure.serverError());
      }
    }
  }

  /// Return `Stream` for only one [CalenderDayModel] from db for real time updates.
  ///
  /// Note:
  /// 1- If there is no internet connection `onErrorReturnWith` will return `serverError`!
  ///
  /// Steps:
  /// 1- convert the [inputDay] which is `DateTime` to [UniqueId] by using [UniqueId.fromDateTime].
  /// 3- convert the generated [UniqueId] to `String` By [UniqueId.getOrCrash].
  /// 4- search for the [CalenderDayModel] by the new generated `id` using `Stream`.
  /// 5- if the [CalenderDayModel] is not exists return `right(none())` in `Stream` format.
  /// 6- if [CalenderDayModel] is found, then use [CalenderDayModelDto.fromFireStore] to convert the firebase json data to dto.
  /// 7- convert [CalenderDayModelDto] to [CalenderDayModel] by [CalenderDayModelDto.toDomain].
  /// 8- return `some(CalenderDayModel())` in `Stream` format.
  ///
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Stream<Either<UserFlowFailure, Option<CalenderDayModel>>> streamCalenderDayModelByDate({required DateTime inputDay}) async* {
    yield* _firebaseFirestore.userCalenderDaysCollection.doc(UniqueId.fromDateTime(inputDay).getOrCrash()).snapshots().map(
      (docSnap) {
        if (!docSnap.exists) {
          return right<UserFlowFailure, Option<CalenderDayModel>>(none());
        }
        return right<UserFlowFailure, Option<CalenderDayModel>>(
          some(CalenderDayModelDto.fromFireStore(docSnap).toDomain()),
        );
      },
    ).onErrorReturnWith((e, _) {
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        debugPrint("Error In [streamCalenderDayModelByDate] By [FirebaseException]: $e");
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        debugPrint("Error In [streamCalenderDayModelByDate] By [GeneralCatch]: $e");
        return left(const UserFlowFailure.serverError());
      }
    });
  }

  /// Update user profile data in the db.
  ///
  /// Steps:
  /// 1- validate the data which will sent to the db.
  /// 2- check internet connections.
  /// 3- update the db using the validated data.
  /// 4- return `right(Unit())`.
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  @override
  Future<Either<UserFlowFailure, Unit>> updateUserProfile({
    required Name name,
    required EmailAddress emailAddress,
    required Address address,
    required OptionWebsite website,
    required PhoneNumber phoneNumber,
  }) async {
    // getting the Raw data from the Domain to use it with backend
    final nameStr = name.getOrCrash();
    final emailAddressStr = emailAddress.getOrCrash();
    final addressStr = address.getOrCrash().fold(() => null, id);
    final phoneNumberStr = phoneNumber.getOrCrash().fold(() => null, id);
    final websiteStr = website.getOrCrash().fold(() => null, id);
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }
      await _firebaseFirestore.userModelDocument().update(
        {
          'name': nameStr,
          'emailAddress': emailAddressStr,
          'address': addressStr,
          'phoneNumber': phoneNumberStr,
          'website': websiteStr,
        },
      );
      return right(unit);
    } on FirebaseException catch (e) {
      debugPrint("Error In [updateUserProfile] By [FirebaseException]: $e");
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(const UserFlowFailure.insufficientPermission());
      } else {
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint("Error In [updateUserProfile] By [GeneralCatch]: $e");
      return left(const UserFlowFailure.serverError());
    }
  }
}
