// import 'package:injectable/injectable.dart';
// import 'package:online_exam_app/src/features/auth/data/api/api_manager.dart';
// import 'package:online_exam_app/src/features/auth/data/datasources/contracts/sign_up_datasource_online.dart';
// import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
// import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
// import 'package:online_exam_app/src/features/auth/domain/core/result.dart';

// @Injectable(as: SignUpDatasourceOnline)
// class SignUpDatasourceOnlineImpl implements SignUpDatasourceOnline {

// ApiManager apiManager;

// @FactoryMethod()
//   SignUpDatasourceOnlineImpl(this.apiManager);


//   @override

//   Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel}) async{
//     var response = await apiManager.signUp(signUpModel: signUpModel);
//     return response;
//   }
// }