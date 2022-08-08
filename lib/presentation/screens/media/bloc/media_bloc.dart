import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/datasources/remote/models/media_response.dart';
import '../../../../domain/usecases/get_media_usecase.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {

  GetMediaUseCase mediaUseCase;

  MediaBloc(this.mediaUseCase) : super(MediaState()) {
    _getMedia();
  }

  void _getMedia() async {
    var media = await mediaUseCase();
    state.medias = media;
    emit(state);
  }
}
