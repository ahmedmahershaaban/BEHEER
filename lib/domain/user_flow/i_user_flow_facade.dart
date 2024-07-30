import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ringo_media_management/domain/auth_flow/value_objects.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/domain/user_flow/calender_day_model/calender_day_model.dart';
import 'package:ringo_media_management/domain/user_flow/project_model/project_model.dart';
import 'package:ringo_media_management/domain/user_flow/projects_statistics_model/projects_statistics_model.dart';
import 'package:ringo_media_management/domain/user_flow/user_flow_failure/user_flow_failure.dart';

abstract class IUserFlowFacade {
  // Home Page Business functions
  Future<Either<UserFlowFailure, Unit>> getAllNeededInfo();

// Project Summary Page Business functions
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> searchForProjectsModel({required String? value});
  Future<Either<UserFlowFailure, KtList<ProjectModel>>> getAllProjectsModel();
  Future<Either<UserFlowFailure, ProjectsStatisticsModel>> getProjectsStatisticModel();

// Calender Page Business functions
  Stream<Either<UserFlowFailure, Option<CalenderDayModel>>> streamCalenderDayModelByDate({required DateTime day});
  Future<Either<UserFlowFailure, Option<CalenderDayModel>>> getCalenderDayModelByDate({required DateTime day});
  Future<Either<UserFlowFailure, Unit>> addOrUpdateCalenderDayModel({required CalenderDayModel calenderDayModel});

  // Profile Page Business functions
  Future<Either<UserFlowFailure, Unit>> updateUserProfile({
    required Name name,
    required EmailAddress emailAddress,
    required Address address,
    required OptionWebsite website,
    required PhoneNumber phoneNumber,
  });
}
