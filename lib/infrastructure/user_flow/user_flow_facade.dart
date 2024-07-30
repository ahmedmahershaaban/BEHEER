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

@LazySingleton(as: IUserFlowFacade)
class UserFlowFacade implements IUserFlowFacade {
  final FirebaseFirestore _firebaseFirestore;
  final InternetConnection _internetConnection;

  UserFlowFacade(
    this._firebaseFirestore,
    this._internetConnection,
  );

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

  /// This for the first page of the application but there is no UI because this is a test app
  ///
  @override
  Future<Either<UserFlowFailure, Unit>> getAllNeededInfo() async {
    return left(const UserFlowFailure.notImplementedFeature());
  }

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

  @override
  Future<Either<UserFlowFailure, Option<CalenderDayModel>>> getCalenderDayModelByDate({required DateTime day}) async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }
      return _firebaseFirestore.userCalenderDaysCollection.doc(UniqueId.fromDateTime(day).getOrCrash()).get().then((doc) {
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

  @override
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> searchForProjectsModel({required String? value}) async {
    if (value == null || value.trim().isEmpty) {
      return right(const KtList.empty());
    } else {
      try {
        bool result = await _internetConnection.hasInternetAccess;
        if (!result) {
          return left(const UserFlowFailure.noInternetConnection());
        }

        return _firebaseFirestore.userProjectsCollection
            .orderBy("title")
            .startAt([value])
            .endAt(
              ['$value\uf8ff'],
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

  @override
  Stream<Either<UserFlowFailure, Option<CalenderDayModel>>> streamCalenderDayModelByDate({required DateTime day}) async* {
    yield* _firebaseFirestore.userCalenderDaysCollection.doc(UniqueId.fromDateTime(day).getOrCrash()).snapshots().map(
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
