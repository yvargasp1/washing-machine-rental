import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;
import 'package:productos_app/src/models/profile.dart';
import 'package:flutter/foundation.dart';

class PerfilService extends ChangeNotifier {
  final String _baseUrl = 'productos-app-ef283-default-rtdb.firebaseio.com';
  final List<Profile> profiles = [];
  late Profile profileselected;
  final storage = new FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;
  File? newPictureFile;
  PerfilService() {
    this.loadprofiles();
  }

  Future<List<Profile>> loadprofiles() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'profile.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final respuesta = await http.get(url);
    final Map<String, dynamic> profilesMap = json.decode(respuesta.body);
    debugPrint('profile: $profilesMap');
    profilesMap.forEach((key, value) {
      final profileTemp = Profile.fromMap(value);
      profileTemp.id = key;
      this.profiles.add(profileTemp);
    });
    isLoading = false;
    notifyListeners();
    return profiles;
  }

  Future saveOrCreateprofile(Profile profile) async {
    isSaving = true;
    notifyListeners();
    if (profile.id != null) {
      await this.updateprofile(profile);
    } else {
      await this.createprofile(profile);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateprofile(Profile profile) async {
    final url = Uri.https(_baseUrl, 'profile/${profile.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final respuesta = await http.put(url, body: profile.toJson());
    final decoData = respuesta.body;
    print(decoData);
    final index =
        this.profiles.indexWhere((element) => element.id == profile.id);
    this.profiles[index] = profile;
    return profile.id!;
  }

  Future<String> createprofile(Profile profile) async {
    final url = Uri.https(_baseUrl, 'profile.json', {'auth':await storage.read(key: 'token') ?? ''});
    final respuesta = await http.post(url, body: profile.toJson());
    final decoData = json.decode(respuesta.body);
    print(decoData);
    profile.id = decoData['name'];
    this.profiles.add(profile);
    return profile.id!;
  }

  void updateSelectedprofileImage(String path) {
    this.profileselected.image = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> upladImage() async {
    if (newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/yvargasp1/image/upload?upload_preset=c0bbzuw5');
    final imageUpload = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUpload.files.add(file);
    final streamResponse = await imageUpload.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('error');
      print(resp.body);
      return null;
    }

    print(resp.body);
    this.newPictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData['secure_url'];
  }
}
