import 'package:easy_video_editor/easy_video_editor.dart';

abstract class EasyVideoEditor {
  static Future<String?> getThumbnail(String inputPath, int positionMs, String outputPath) async {
    final editor = VideoEditorBuilder(videoPath: inputPath);
    return await editor.generateThumbnail(
      positionMs: positionMs,
      quality: 0,
      outputPath: outputPath
    );
  }

  static Future<String?> trimVideo(String inputPath, String outputPath, int startTimeMs, int endTimeMs) async {
    final editor = VideoEditorBuilder(videoPath: inputPath )
        .trim(startTimeMs: startTimeMs, endTimeMs:endTimeMs);

    // Export the edited video with progress tracking
    final resultOutputPath = await editor.export(
        outputPath: outputPath,
    );
    return resultOutputPath;
  }
}