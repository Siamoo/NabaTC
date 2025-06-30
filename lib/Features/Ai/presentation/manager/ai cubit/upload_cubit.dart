import 'dart:convert';
import 'dart:io';
import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_state.dart';
import 'package:firebase1/Features/API/presentation/manager/core/api_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  Future<void> uploadImage(String userId, File imageFile) async {
    emit(UploadInProgress());

    try {
      final baseUrl = await ApiStorage.getPredictionUrl() ??
          'https://5961-156-207-169-184.ngrok-free.app/api/predict';

      final uri = Uri.parse(baseUrl);
      final request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'multipart/form-data'
        ..fields['userId'] = userId
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = jsonDecode(responseBody);

        String message = responseData['prediction'] ?? 'No message';
        String additionalInfo = responseData['confidence'] ?? 'No additional info';

        emit(UploadSuccess(message, additionalInfo));
      } else {
        emit(UploadFailure('Upload failed with status: ${response.statusCode}'));
      }
    } catch (e) {
      emit(UploadFailure('Error: $e'));
    }
  }
}
