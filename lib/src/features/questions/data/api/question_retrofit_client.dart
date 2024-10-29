import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/app_apis.dart';

part 'question_retrofit_client.g.dart';

@Singleton()
@Injectable()
@RestApi(baseUrl: AppApis.baseUrl)
abstract class QuestionRetrofitClient {
  @factoryMethod
  factory QuestionRetrofitClient(Dio dio) = _QuestionRetrofitClient;
}
