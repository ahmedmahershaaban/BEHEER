import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/domain/user_flow/project_model/project_model.dart';
import 'package:ringo_media_management/domain/user_flow/projects_statistics_model/projects_statistics_model.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';

/// Interface where all the user flow actions will be defined
abstract class IUserFlowFacade {
  // Home Page Business functions
  // This section will be empty for now as this is a demo project
  // but functions for home page would be added here

// Project Summary Page Business functions

  /// search for all [ProjectModel]s by [searchValue] in db and return `List` of [ProjectModel].
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> searchForProjectsModel({required String? searchValue});

  /// Return `List` of [ProjectModel] that is found in the db with no filtration.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> getAllProjectsModel();

  /// Return a [ProjectsStatisticsModel] from db.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, ProjectsStatisticsModel>> getProjectsStatisticModel();

// Calender Page Business functions

  /// Return `Stream` for only one [CalenderDayModel] from db for real time updates.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Stream<Either<UserFlowFailure, Option<CalenderDayModel>>> streamCalenderDayModelByDate({required DateTime inputDay});

  /// Return a [CalenderDayModel] from db by [id].
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, Option<CalenderDayModel>>> getCalenderDayModelByDate({required DateTime inputDay});

  /// Add or Update [CalenderDayModel] in the db.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, Unit>> addOrUpdateCalenderDayModel({required CalenderDayModel calenderDayModel});

  // Profile Page Business functions

  /// Update user profile data in the db.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, Unit>> updateUserProfile({
    required Name name,
    required EmailAddress emailAddress,
    required Address address,
    required OptionWebsite website,
    required PhoneNumber phoneNumber,
  });
}
