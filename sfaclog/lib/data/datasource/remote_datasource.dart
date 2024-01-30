import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/skill_model.dart';

class RemoteDataSource {
  static String pocketBaseURL = 'http://43.202.59.218:8090';

  final pb = PocketBase(pocketBaseURL);
  Future<List<dynamic>> getTableData(String tableName) async {
    try {
      // 데이터를 가져옵니다.
      var data = await pb.collection(tableName).getList(
            page: 1,
            perPage: 50,
            filter: 'created >= "2022-01-01 00:00:00"',
          );

      return data.items;
    } catch (e) {
      // 예외 발생 시 처리
      print("Error fetching data: $e");
      return [];
    }
  }
}
