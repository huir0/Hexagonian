import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/commuity_qna.dart';

final pb = PocketBase('http://43.202.59.218:8090');

Future<void> getPosts() async {
  final resultList = await pb.collection('qna').getList(
        page: 1,
        perPage: 50,
        filter: 'created >= "2022-01-01 00:00:00" && someField1 != someField2',
      );

// you can also fetch all records at once via getFullList
  final records = await pb.collection('qna').getFullList(
        sort: '-created',
      );

  print(records);
}
 

// fetch a paginated records list


// // or fetch only the first record that matches the specified filter
// final record = await pb.collection('qna').getFirstListItem(
//   'someField="test"',
//   expand: 'relField1,relField2.subRelField',
// );