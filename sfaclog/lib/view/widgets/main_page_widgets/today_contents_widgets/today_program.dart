import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_program_model.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/dot_indicator.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TodayProgram extends ConsumerStatefulWidget {
  const TodayProgram({
    super.key,
  });

  @override
  TodayProgramState createState() => TodayProgramState();
}

class TodayProgramState extends ConsumerState<TodayProgram> {
  int curIdx = 0;
  late CarouselController controller;

  @override
  void initState() {
    super.initState();
    controller = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    var programState = ref.watch(programsProvider).programs;

    if (programState.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            onPageChanged: (val, _) {
              curIdx = val;
              controller.jumpToPage(val);
              setState(() {});
            },
          ),
          items: List.generate(programState.length ?? 0, (index) {
            return ProgramCard(
              data: programState[index],
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        DotIndicator(
          curIdx: curIdx,
          controller: controller,
          length: programState.length ?? 0,
        ),
      ],
    );
  }
}

class ProgramCard extends StatefulWidget {
  const ProgramCard({
    super.key,
    required this.data,
    this.height,
  });
  final SfacProgramModel data;
  final double? height;

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  late String imageUrl = '';

  @override
  void initState() {
    super.initState();
    _getImage();
  }

  Future<void> _getImage() async {
    try {
      imageUrl = await RemoteDataSource()
          .getThumbNailURL('programs', widget.data.id, 0);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error fetching image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final url = Uri.parse(widget.data.link);
        launchUrl(url);
      },
      child: Container(
        width: 312,
        height: widget.height ?? 240,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: imageUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                )
              : null,
        ),
      ),
    );
  }
}
