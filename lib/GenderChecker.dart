import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:fyp/Auth/LoginPage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class VoiceRecorderApp extends StatefulWidget {
  @override
  _VoiceRecorderAppState createState() => _VoiceRecorderAppState();
}

class _VoiceRecorderAppState extends State<VoiceRecorderApp> {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecording = false;
  String? _recordingPath;
  String? _detectedGender;
  double? _detectedFrequency;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    _audioRecorder = FlutterSoundRecorder();
    if (await Permission.microphone.request().isGranted) {
      await _audioRecorder!.openRecorder();
    } else {
      throw RecordingPermissionException('Microphone permission denied.');
    }
  }

  Future<void> _startRecording() async {
    try {
      if (_audioRecorder!.isRecording) return;
      _recordingPath = '${Directory.systemTemp.path}/audio.wav';
      await _audioRecorder!.startRecorder(toFile: _recordingPath);
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      debugPrint('Error starting recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      if (!_audioRecorder!.isRecording) return;
      final path = await _audioRecorder!.stopRecorder();
      setState(() {
        _isRecording = false;
        _recordingPath = path;
      });
      _analyzePitch();
    } catch (e) {
      debugPrint('Error stopping recording: $e');
    }
  }

  void _analyzePitch() async {
    if (_recordingPath == null) return;
    _detectedFrequency = 120.0 + Random().nextInt(100);
    _detectedGender = _detectedFrequency! < 165 ? 'Male' : 'Female';
    setState(() {});
  }

  void _playRecording() async {
    if (_recordingPath == null) return;
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(DeviceFileSource(_recordingPath!));
  }

  @override
  void dispose() {
    _audioRecorder!.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'First, verify your ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Gender',
                    style: TextStyle(
                        color: Colors.pink,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: ' to become a valued member of the ',
                  ),
                  TextSpan(
                    text: 'HerCompanion ',
                    style: TextStyle(
                        color: Colors.pink,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: 'community – Where Strength Meets Support',
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: WaveWidget(
                config: CustomConfig(
                  colors: [Colors.yellow, Colors.green, Colors.pink],
                  durations: [18000, 8000, 5000],
                  heightPercentages: [0.65, 0.66, 0.68],
                ),
                waveAmplitude: 0,
                size: Size(double.infinity, double.infinity),
              ),
            ),
            SizedBox(height: 30),
            Text(
              _isRecording ? 'Recording in progress...' : 'Press to start recording',
              style: GoogleFonts.poppins(
                  fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            GestureDetector(
              onTap: _isRecording ? _stopRecording : _startRecording,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: _isRecording ? Colors.red : Colors.blueGrey,
                child: Icon(
                  _isRecording ? Icons.stop : Icons.mic,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            // ElevatedButton(
            //   onPressed: _playRecording,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.pink,
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            //   ),
            //   child: Text('Play Recording',
            //       style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
            // ),
            SizedBox(height: 20),
            if (_detectedFrequency != null && _detectedGender != null)
              Column(
                children: [
                  Text(
                    'Detected Gender: $_detectedGender',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // Show the button only if detected gender is Female
                  if (_detectedGender == 'Female')
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.arrow_right, color: Colors.white, size: 50),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
