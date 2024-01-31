import 'package:flutter/widgets.dart';
import 'package:sfaclog_widgets/buttons/sl_rect_icon_button.dart';

enum TabButtonType {
  log,
  project,
  qna,
  sfacProgram,
}

Map<String, dynamic> _buildTabButton(TabButtonType type) {
  switch (type) {
    case TabButtonType.log:
      return {'label': '로그', 'icon': 'assets/icons/log.svg'};
    case TabButtonType.project:
      return {'label': '프로젝트', 'icon': 'assets/icons/project.svg'};
    case TabButtonType.qna:
      return {'label': 'QnA', 'icon': 'assets/icons/qna.svg'};
    case TabButtonType.sfacProgram:
      return {'label': '스팩프로그램', 'icon': 'assets/icons/sfac_program.svg'};
  }
}

class SLMainTabButton extends StatelessWidget {
  final TabButtonType type;
  final bool isActive;
  final void Function()? onTap;

  const SLMainTabButton({
    super.key,
    required this.type,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tabInfo = _buildTabButton(type);
    return SLRectIconButton(
      label: tabInfo['label'],
      icon: tabInfo['icon'],
      isActive: isActive,
      onTap: onTap,
    );
  }
}

class SLMainTabButtonExample extends StatefulWidget {
  const SLMainTabButtonExample({super.key});

  @override
  _SLMainTabButtonExampleState createState() => _SLMainTabButtonExampleState();
}

class _SLMainTabButtonExampleState extends State<SLMainTabButtonExample> {
  TabButtonType _activeButton = TabButtonType.log;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SLMainTabButton(
          type: TabButtonType.log,
          isActive: _activeButton == TabButtonType.log,
          onTap: () {
            setState(() {
              _activeButton = TabButtonType.log;
            });
          },
        ),
        const SizedBox(width: 16),
        SLMainTabButton(
          type: TabButtonType.project,
          isActive: _activeButton == TabButtonType.project,
          onTap: () {
            setState(() {
              _activeButton = TabButtonType.project;
            });
          },
        ),
        const SizedBox(width: 16),
        SLMainTabButton(
          type: TabButtonType.qna,
          isActive: _activeButton == TabButtonType.qna,
          onTap: () {
            setState(() {
              _activeButton = TabButtonType.qna;
            });
          },
        ),
        const SizedBox(width: 16),
        SLMainTabButton(
          type: TabButtonType.sfacProgram,
          isActive: _activeButton == TabButtonType.sfacProgram,
          onTap: () {
            setState(() {
              _activeButton = TabButtonType.sfacProgram;
            });
          },
        ),
      ],
    );
  }
}
