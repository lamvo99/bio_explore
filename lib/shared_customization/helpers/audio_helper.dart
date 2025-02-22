// Package imports:
import 'package:audioplayers/audioplayers.dart';

final AudioPlayer audioPlayer = AudioPlayer();
void playAudio(String fileName) async {
  audioPlayer.setReleaseMode(ReleaseMode.loop);
  // final audio = AudioCache(prefix: "assets/audios/");
  // final url = await audio.load(fileName);
  audioPlayer.setSourceUrl('audios/$fileName');
  await audioPlayer.play(AssetSource('audios/$fileName'));
  // audioPlayer.setSourceUrl(url.toString());
}

void stopAudio() {
  audioPlayer.stop();
  print("Audio stopped");
}
