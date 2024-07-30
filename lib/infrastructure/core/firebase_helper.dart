import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ringo_media_management/domain/auth_flow/i_auth_facade.dart';
import 'package:ringo_media_management/domain/core/errors.dart';
import 'package:ringo_media_management/infrastructure/core/injection/injection.dart';

extension FirebaseX on FirebaseFirestore {
  DocumentReference userModelDocument() {
    final userModelIdOption = getIt<IAuthFacade>().getSignedInUserId();
    final userModelId = userModelIdOption.getOrElse(() => throw UnexpectedNullValueError());
    return FirebaseFirestore.instance.collection('Users').doc(userModelId.getOrCrash());
  }

  CollectionReference get userCollection => collection('Users');

  CollectionReference get userCalenderDaysCollection => userModelDocument().collection('CalenderDays');

  CollectionReference get userProjectsCollection => userModelDocument().collection('Projects');

  DocumentReference get userProjectsStatisticsDocument => userModelDocument().collection("Configurations").doc("ProjectsStatisticsDocument");
}

extension DocumentReferenceX on DocumentReference {}
