import 'package:flutter/material.dart';
import 'package:podcast_app/components/collapsed_player_empty.dart';
import 'package:podcast_app/states/app_state.dart';
import 'package:provider/provider.dart';

class CollapsedPlayer extends StatefulWidget {
  @override
  _CollapsedPlayerState createState() => _CollapsedPlayerState();
}

class _CollapsedPlayerState extends State<CollapsedPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, _) {
        return Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          alignment: Alignment.centerRight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: CollapsedPlayerEmpty(),
        );
      },
    );
  }
}
