import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

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

  Future<String> uploadFile(
      String tableName, String imagePath, String title) async {
    String existId = '';
    try {
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      existId = await _getExistId(title);
      if (existId != '') {
        final record = await pb.collection(tableName).update(
          existId,
          files: [
            http.MultipartFile.fromBytes(
              'img',
              imageBytes,
              filename: imagePath.split('/')[7],
            ),
          ],
        );
        return record.id;
      } else {
        final record = await pb.collection(tableName).create(
          body: {
            'title': title, // some regular text field
          },
          files: [
            http.MultipartFile.fromString(
              'title',
              title,
            ),
            http.MultipartFile.fromBytes(
              'img',
              imageBytes,
              filename: imagePath.split('/')[7],
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

  Future<String> uploadThumbNail(
      String tableName, String imagePath, String title, String fileName) async {
    String existId = '';
    try {
      ByteData data = await rootBundle.load(imagePath);
      List<int> imageBytes = data.buffer.asUint8List();
      //File imageFile = File(imagePath);
      //List<int> imageBytes = await imageFile.readAsBytes();

      existId = await _getExistId(title);
      if (existId != '') {
        final record = await pb.collection(tableName).update(
          existId,
          files: [
            http.MultipartFile.fromBytes(
              'thumbnail',
              imageBytes,
              filename: fileName,
            ),
          ],
        );
        return record.id;
      } else {
        final record = await pb.collection(tableName).create(
          body: {
            'title': title, // some regular text field
          },
          files: [
            http.MultipartFile.fromString(
              'title',
              title,
            ),
            http.MultipartFile.fromBytes(
              'thumbnail',
              imageBytes,
              filename: fileName,
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
    String tableName,
    SFACLogModel logModel,
    String tagId,
  ) async {
    String tagsJson = jsonEncode(logModel.tag);
    try {
      await pb.collection(tableName).create(
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
            'tag',
            tagsJson,
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadLogWithImg(
      String tableName, String log, String tagId) async {
    try {
      await pb.collection(tableName).update(
        tagId,
        files: [
          http.MultipartFile.fromString(
            'body',
            log,
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
  }

  Future<String> getImgURL(String tableName, String recordId, int index) async {
    try {
      String imgUrl = '';
      var record = await pb.collection(tableName).getOne(recordId);
      final img = record.getListValue<String>('img')[index];
      imgUrl = pb.files.getUrl(record, img, thumb: '100x250').toString();
      return imgUrl;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> _getExistId(String title) async {
    try {
      var record = await pb.collection('imageTest').getFirstListItem(
            'title="$title"',
            expand: 'relField1,relField2.subRelField',
          );
      return record.id;
    } catch (e) {
      return '';
    }
  }
}
