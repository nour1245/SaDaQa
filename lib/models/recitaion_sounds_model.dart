class RecitaionSounds {
  List<AudioFiles>? audioFiles;

  RecitaionSounds({required this.audioFiles});

  RecitaionSounds.fromJson(Map<String, dynamic> json) {
    if (json['audio_files'] != null) {
      audioFiles = <AudioFiles>[];
      json['audio_files'].forEach((v) {
        audioFiles?.add(AudioFiles.fromJson(v));
      });
    }
  }
}

class AudioFiles {
  int? id;
  int? chapterId;
  int? fileSize;
  String? format;
  String? audioUrl;

  AudioFiles(
      {this.id, this.chapterId, this.fileSize, this.format, this.audioUrl});

  AudioFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    fileSize = json['file_size'];
    format = json['format'];
    audioUrl = json['audio_url'];
  }
}
