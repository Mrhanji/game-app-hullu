import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Repo/Game/GameListResponse.dart';
import '/Screens/Game/game_provider.dart';


class GameScreen extends ConsumerWidget {
  GameData data;
  GameScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    if(ref.watch(gameProvider).gameId.toString()==""){
      ref.read(gameProvider).onInit(data.gameId);
    }
    return Scaffold(
      appBar: AppBar(),
      
      body: Center(child:
      ref.read(gameProvider).dataLoading?CircularProgressIndicator():Column(
        children: [
          Text("${data.gameTitle}",),

          AnimatedFlipCounter(
            value: int.parse(ref.watch(gameProvider).response.timeRemaining.toString()),
            fractionDigits: 0, // decimal precision
            suffix: "Sec",
            textStyle: GoogleFonts.ooohBaby(
              fontSize: 40,
              color: int.parse(ref.watch(gameProvider).response.timeRemaining.toString()) >= 20 ? Colors.green : Colors.red,
            ),
          ),
        ],
      )),
    );
  }
}
