abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadInProgress extends UploadState {}

class UploadSuccess extends UploadState {
  final String message;
  final String additionalInfo; 
  UploadSuccess(this.message, this.additionalInfo);
}

class UploadFailure extends UploadState {
  final String error;
  UploadFailure(this.error);
}
