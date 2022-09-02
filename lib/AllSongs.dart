import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/model.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  State<AllSongs> createState() => _AllSongsState();
}

                                    ////// musicpalyer Stop and Palay code /////

class _AllSongsState extends State<AllSongs> {
  AudioPlayer player = AudioPlayer();
  List<bool> statuslist = [];

  @override
  void initState() {
    super.initState();

    statuslist = List.filled(Model.songlist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Songs"),
      ),
      body: ListView.builder(
          itemCount: Model.songlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: statuslist[index]
                  ? IconButton(
                      onPressed: () async {
                        setState(() {
                          statuslist =
                              List.filled(Model.songlist.length, false);
                        });
                        print(statuslist);

                        await player.stop();
                      },
                      icon: Icon(Icons.pause))
                  : IconButton(
                      onPressed: () async {
                        await player.stop();
                        setState(() {
                          statuslist =
                              List.filled(Model.songlist.length, false);
                          statuslist[index] = true;
                        });
                        await player
                            .play(DeviceFileSource(Model.songlist[index].data));

                        print(statuslist);
                      },
                      icon: Icon(Icons.play_arrow)),
              title: Text("${Model.songlist[index].displayNameWOExt}"),
              subtitle: Text("${Model.songlist[index].duration}"),
            );
          }),
    );
  }
}

///// only music player Song list code/////

// class _AllSongsState extends State<AllSongs> {
//
//   AudioPlayer player = AudioPlayer();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("All Songs"),),
//       body: ListView.builder(itemBuilder: (context, index) {
//         return ListTile(onTap: () async {
//           await player.play(DeviceFileSource(Model.songlist[index].data));
//
//         },title: Text("${Model.songlist[index].displayNameWOExt}"),
//           subtitle: Text("${Model.songlist[index].duration}"),);
//       }),
//     );
//   }
// }
