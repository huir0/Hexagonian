// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/buttons/answer_button.dart';

import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/textarea/sl_input2.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: const [],
      directories: [
        WidgetbookComponent(
          name: 'Chips',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => Center(
                child: SFACChip(
                  text: Text(
                    context.knobs.string(
                      label: 'Title',
                      initialValue: 'Title',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Tags',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => Center(
                child: SFACTag(
                  text: Text(
                    context.knobs.string(
                      label: 'Title',
                      initialValue: 'Title',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'PopUp',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => Center(
                child: SFACPopUpDialog(
                  widget: const Text('SFAC'),
                  onConfirmed: () {},
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Menus',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => Center(
                child: SFACMenuButton(
                  items: const ['1', '2', '3'],
                  onItemSelected: (value) {},
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Labels',
          useCases: [
            WidgetbookUseCase(
              name: 'Log Label',
              builder: (context) => const Center(
                child: reviselabel(
                  text: 'SFAC',
                  width: 80,
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Sky Label',
              builder: (context) => const Center(
                child: SkyLabel(
                  text: 'SFAC',
                  width: 80,
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Grey Label',
              builder: (context) => const Center(
                child: GrayLabel1(
                  text: 'SFAC',
                  width: 80,
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Buttons',
          useCases: [
            WidgetbookUseCase(
              name: 'ApplyButton',
              builder: (context) => const Center(
                  child: applyButton(
                text1: 'SFAC',
                width: 100,
              )),
            ),
            WidgetbookUseCase(
              name: 'ButtonSM',
              builder: (context) => const Center(
                  child: ButtonSm(
                text: 'SFAC',
              )),
            ),
            WidgetbookUseCase(
              name: 'Edit Button',
              builder: (context) => const Center(
                  child: EditButton(
                text: 'SFAC',
                width: 100,
                imagePath: 'assets/images/paper-plane.png',
              )),
            ),
            WidgetbookUseCase(
              name: 'Follow Button',
              builder: (context) => const Center(
                  child: middleokButton(
                text1: '팔로우',
                text2: '팔로우 취소',
                width: 100,
              )),
            ),
            WidgetbookUseCase(
              name: 'Grey Drop Button',
              builder: (context) => const Center(
                  child: dropButton(
                text1: 'SFAC',
                width: 100,
              )),
            ),
            WidgetbookUseCase(
              name: 'Circle Icon Button',
              builder: (context) => const Center(child: SLCircleIconButton()),
            ),
            WidgetbookUseCase(
              name: 'Main Tab Button',
              builder: (context) => const Center(
                  child: SLMainTabButton(
                type: TabButtonType.log,
              )),
            ),
            WidgetbookUseCase(
              name: 'Rect Icon Button',
              builder: (context) => const Center(
                  child: SLRectIconButton(
                isActive: false,
                icon: '',
                label: 'SFAC',
              )),
            ),
            WidgetbookUseCase(
              name: 'No Button',
              builder: (context) => const Center(child: NoButton()),
            ),
            WidgetbookUseCase(
              name: 'Self Box',
              builder: (context) => const Center(child: SelfBox()),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Tabs',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => const Center(
                child: SLTab(
                  height: 45,
                  menu: [Text('1'), Text('2')],
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'ToolTips',
          useCases: [
            WidgetbookUseCase(
              name: 'Bubble ToolTip',
              builder: (context) => const Center(
                  child: BubbleTooltip(
                tip: 'SFAC',
              )),
            ),
            WidgetbookUseCase(
              name: 'Alert',
              builder: (context) => const Center(
                  child: SizedBox(
                height: 100,
                width: 320,
                child: SLAlert(
                  content: 'SFAC',
                  from: '로그',
                  formatedDate: '오늘',
                ),
              )),
            ),
            // WidgetbookUseCase(
            //   name: 'Snack Bar',
            //   builder: (context) => Center(
            //     child: Column(
            //       children: [
            //         TextButton(
            //             onPressed: () {
            //               ScaffoldMessenger.of(context).showSnackBar(
            //                 SLSnackbar(
            //                   description: 'hello',
            //                   onTap: () {},
            //                   imageRadius: 20,
            //                 ),
            //               );
            //             },
            //             child: const Text('Snackbar Button')),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
        WidgetbookComponent(
          name: 'TextArea',
          useCases: [
            WidgetbookUseCase(
              name: 'SLInput2',
              builder: (context) => const Center(child: SLInput2()),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Checkbox',
          useCases: [
            WidgetbookUseCase(
              name: 'DefaultStyle',
              builder: (context) => Center(
                  child: SLCheckbox(
                value: false,
                onChange: (value) {},
              )),
            ),
          ],
        ),
      ],
    );
  }
}
