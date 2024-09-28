import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:las_crew/main.dart';
import 'package:las_crew/presentation/bloc/app_bar/app_bar_bloc.dart';

class CustomAppBar {
  static AppBar build(BuildContext context, String title) {
    return AppBar(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white)),
      actions: <Widget>[
        //switch on off
        BlocBuilder<AppBarBloc, AppBarState>(builder: (context, state) {
          return Switch(
            value: state.isCrewReady,
            onChanged: (value) {
              context
                  .read<AppBarBloc>()
                  .add(UpdateAppBarEvent(isCrewReady: value));
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          );
        }),
      ],
      //hide back button
      automaticallyImplyLeading: false,
    );
  }
}
