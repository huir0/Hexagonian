import 'package:pocketbase/pocketbase.dart';

class SkillsReposotory {
  final pb = PocketBase('http://43.202.59.218:8090');

  SkillsReposotory();

  Future<List<RecordModel>> getAllSkills() async {
    final resultList = await pb.collection('skills').getFullList();
    return resultList;
  }

  Future<RecordModel> searchSkills({
    required String keyword,
  }) async {
    final record = await pb.collection('skills').getFirstListItem(
          'name="$keyword"',
        );
    return record;
  }
}
