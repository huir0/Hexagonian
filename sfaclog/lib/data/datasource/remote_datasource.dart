import 'dart:convert';
import 'dart:io';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class RemoteDataSource {
  static String pocketBaseURL = 'http://43.202.59.218:8090';

  final pb = PocketBase(pocketBaseURL);
  Future<List<dynamic>> getTableData(
      {required String tableName, String? orderBy, String? filter = ''}) async {
    try {
      // 필터 문자열 구성
      String finalFilter = 'created >= "2022-01-01 00:00:00"';
      if (filter != '') {
        finalFilter += "&&$filter";
      }

      var data = await pb.collection(tableName).getList(
            page: 1,
            perPage: 50,
            sort: orderBy,
            filter: finalFilter,
          );

      return data.items;
    } catch (e) {
      // 예외 발생 시 처리
      print("Error fetching data: $e");
      return [];
    }
  }

  Future<String> createTableData(
    String tableName,
    Map<String, dynamic> creats,
  ) async {
    try {
      var record = await pb.collection(tableName).create(body: creats);
      return record.id;
    } catch (e) {
      return '';
    }
  }

  Future<String> updateTableData(
    String tableName,
    String tagId,
    Map<String, dynamic> updates,
  ) async {
    try {
      var record = await pb.collection(tableName).update(tagId, body: updates);
      return record.id;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<RecordModel> getDataOne(
      String tableName, String recordId, String expand) async {
    try {
      // 데이터를 가져옵니다.
      var data = await pb.collection(tableName).getOne(
            recordId,
            expand: expand,
          );

      return data;
    } catch (e) {
      // 예외 발생 시 처리
      print("Error fetching data: $e");
      return RecordModel();
    }
  }

  Future<List<String>> uploadFile(
      String tableName, SFACLogModel logModel, String tagId) async {
    List<String> imgUrlList = [];
    try {
      for (int i = 0; i < logModel.images.length; i++) {
        File imageFile = File(logModel.images[i]['insert']['source']);
        List<int> imageBytes = await imageFile.readAsBytes();
        final record = await pb.collection(tableName).update(
          tagId,
          files: [
            http.MultipartFile.fromBytes(
              'images',
              imageBytes,
              filename: 'image_$i.png',
            ),
          ],
        );
        String imgURL = await getImgURL(tableName, tagId, i);
        imgUrlList.add(imgURL);
      }
      return imgUrlList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> uploadThumbNail(
      String tableName, String imagePath, String title) async {
    String existId = '';
    List<int> imageBytes = [];
    try {
      if (imagePath.contains('cache')) {
        File imageFile = File(imagePath);
        imageBytes = await imageFile.readAsBytes();
      } else {
        ByteData data = await rootBundle.load(imagePath);
        imageBytes = data.buffer.asUint8List();
      }

      existId = await _getExistId(tableName, title);
      if (existId != '') {
        final record = await pb.collection(tableName).update(
          existId,
          files: [
            http.MultipartFile.fromBytes(
              'thumbnail',
              imageBytes,
              filename: 'thumbnail.png',
            ),
          ],
        );
        return record.id;
      } else {
        final record = await pb.collection(tableName).create(
          files: [
            http.MultipartFile.fromBytes(
              'thumbnail',
              imageBytes,
              filename: 'thumbnail.png',
            ),
          ],
        );
        return record.id;
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> uploadLog(
      String tableName, SFACLogModel logModel, String tagId) async {
    String tagsJson = jsonEncode(logModel.tag);
    try {
      await pb.collection(tableName).update(
        tagId,
        files: [
          http.MultipartFile.fromString(
            'title',
            logModel.title,
          ),
          http.MultipartFile.fromString(
            'category',
            logModel.category,
          ),
          http.MultipartFile.fromString(
            'body',
            logModel.body,
          ),
          http.MultipartFile.fromString(
            'public',
            logModel.public,
          ),
          http.MultipartFile.fromString(
            'user',
            logModel.user,
          ),
          http.MultipartFile.fromString(
            'tag',
            tagsJson,
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
  }

  Future<String> getImgURL(
    String tableName,
    String recordId,
    int index,
  ) async {
    try {
      String imgUrl = '';
      var record = await pb.collection(tableName).getOne(recordId);
      final img = record.getListValue<String>('images')[index];
      imgUrl = pb.files.getUrl(record, img, thumb: '100x250').toString();
      return imgUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> getAvatarURL(
    String tableName,
    String recordId,
    String avatarField,
  ) async {
    try {
      String imgUrl = '';
      var record = await pb.collection(tableName).getOne(recordId);
      final img = record.getListValue<String>(avatarField)[0];
      imgUrl = pb.files.getUrl(record, img, thumb: '15x15').toString();
      return imgUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> getThumbNailURL(
    String tableName,
    String recordId,
    int index,
  ) async {
    try {
      String imgUrl = '';
      var record = await pb.collection(tableName).getOne(recordId);
      final img = record.getListValue<String>('thumbnail')[index];
      imgUrl = pb.files.getUrl(record, img, thumb: '100x250').toString();
      return imgUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> _getExistId(String tableName, String title) async {
    try {
      var record = await pb.collection(tableName).getFirstListItem(
            'title="$title"',
            expand: 'relField1,relField2.subRelField',
          );
      return record.id;
    } catch (e) {
      print(e);
      return '';
    }
  }
}
