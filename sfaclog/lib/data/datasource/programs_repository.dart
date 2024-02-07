import 'package:pocketbase/pocketbase.dart';

class ProgramsRepository {
  final pb = PocketBase('http://43.202.59.218:8090');
  ProgramsRepository();

  Future<ResultList<RecordModel>> getPrograms(int? count) async {
    final resultList = await pb.collection('programs').getList(
          page: 1,
          perPage: count ?? 5,
        );
    return resultList;
  }
}
