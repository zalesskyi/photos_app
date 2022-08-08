import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/data/datasources/remote/models/media_response.dart';
import 'package:photos_app/presentation/screens/media/bloc/media_bloc.dart';
import 'package:widget_mask/widget_mask.dart';

class MediaLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MediaBloc>(context);
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<MediaBloc, MediaState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
                  body: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 16),
                      child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: state.medias
                              .map((e) => MediaItemLayout(e))
                              .toList(),
                        ),
                      ))));
        },
        listener: (context, state) {});
  }
}

class MediaItemLayout extends StatelessWidget {
  final MediaResponse _response;

  MediaItemLayout(this._response);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 12,
        child: SizedBox(
            width: 120,
            height: 120,
            child: Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/mask_3.png', width: 135, height: 135),
                    WidgetMask(
                      blendMode: BlendMode.srcATop,
                      childSaveLayer: true,
                      mask: Image.network(
                          'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/result.jpeg',
                          fit: BoxFit.cover),
                      child: Image.asset('assets/mask_3.png',
                          width: 130, height: 130),
                    )
                  ],
                ))));
  }
}
