import 'dart:convert'; // For decoding JSON
import 'dart:io';
import 'package:firebase1/Features/Ai/presntation/manger/ai%20cubit/upload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Cubit to manage the upload state
class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  Future<void> uploadImage(String userId , String url, File imageFile) async {
    emit(UploadInProgress()); // Start the loading process

    // Create multipart request
    final uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri)
      ..headers['Content-Type'] = 'multipart/form-data'
      ..fields['userId'] = userId
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();

        // Assuming the response is JSON, parse it
        final responseData = jsonDecode(responseBody);

        // Extract individual strings or fields from the response
        String message = responseData['prediction'] ?? 'No message';
        String additionalInfo =
            responseData['confidence'] ?? 'No additional info';

        emit(UploadSuccess(message, additionalInfo)); // Pass the extracted strings
      } else {
        emit(UploadFailure('Upload failed with status: ${response.statusCode}'));
      }
    } catch (e) {
      emit(UploadFailure('Error: $e'));
    }
  }
}
