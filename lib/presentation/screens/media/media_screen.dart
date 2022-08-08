import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/di/injector.dart';
import 'package:photos_app/presentation/screens/media/bloc/media_bloc.dart';
import 'package:photos_app/presentation/screens/media/media_layout.dart';

class MediaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MediaBloc>(
      create: (BuildContext context) {
        return injector.get<MediaBloc>();
      },
      child: MediaLayout()
    );
  }
}