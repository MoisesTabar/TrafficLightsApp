import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:semaphore_iot_client/src/models/semaphore_model.dart';
import 'package:semaphore_iot_client/src/widgets/glowing_animation_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late int semaphoreColor;
  late String semaphoreMessage;
  late Status semaphoreStatus;

  late FlutterTts _textToSpeech;

  @override
  void initState() {
    super.initState();
    semaphoreColor = 0;
    semaphoreMessage = "";

    _textToSpeech = FlutterTts();
  }

  Future<void> _speak(String message) async {
    await _textToSpeech.setLanguage("es-ES");
    await _textToSpeech.setPitch(1);
    await _textToSpeech.speak(message);
  }

  void _semaphoreBuilder(int counter, Semaphore semaphore) {
     if(counter <= 30 && semaphoreMessage == ""){
      semaphoreStatus = semaphore.stop!;
      semaphoreMessage = semaphoreStatus.value!;
      _speak(semaphoreMessage);
      semaphoreColor = int.parse(semaphoreStatus.color!);
    }
    
    if(counter == 0 && semaphoreStatus == semaphore.stop){
      semaphoreStatus = semaphore.go!;
      semaphoreMessage = semaphoreStatus.value!;
      _speak(semaphoreMessage);
      semaphoreColor = int.parse(semaphoreStatus.color!);
      HapticFeedback.heavyImpact();
    }
    
    if(counter == 5 && semaphoreStatus == semaphore.go){
      semaphoreStatus = semaphore.warning!;
      semaphoreMessage = semaphoreStatus.value!;
      _speak(semaphoreMessage);
      semaphoreColor = int.parse(semaphoreStatus.color!);
      HapticFeedback.vibrate();
    }
    
    if(counter == 0 && semaphoreStatus == semaphore.warning){
      semaphoreStatus = semaphore.stop!;
      semaphoreMessage = "";
      semaphoreColor = int.parse(semaphoreStatus.color!);
      HapticFeedback.heavyImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, counter, child){
        return Consumer<Semaphore>(
          builder: (context, semaphore, child){
            
            _semaphoreBuilder(counter, semaphore);

            return Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$counter",
                      style: TextStyle(
                        color: Color(semaphoreColor),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      semaphoreMessage,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    GlowingAnimationIndicator(semaphoreColor: semaphoreColor)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

}