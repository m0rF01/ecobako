import 'package:ecobako_app/common/widget/appbar/appbar.dart';
import 'package:ecobako_app/common/widget/custom_shape/containers/primary_header_container.dart';
import 'package:ecobako_app/features/module/models/learning_module_model.dart';
import 'package:ecobako_app/features/module/screens/learning_module_2.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_1.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_3.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_4.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_5.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_6.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_7.dart';
import 'package:ecobako_app/features/module/screens/leraning_module_8.dart';
import 'package:ecobako_app/features/module/screens/widget/learning_module_content.dart';
import 'package:ecobako_app/utils/constants/colors.dart';
import 'package:ecobako_app/utils/constants/sizes.dart';
import 'package:ecobako_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UserModuleScreen extends StatelessWidget {
  UserModuleScreen({super.key});

  final List<LearningModule> modules = [
    learningModule1(),
    learningModule2(),
    learningModule3(),
    learningModule4(),
    learningModule5(),
    learningModule6(),
    learningModule7(),
    learningModule8(),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = BakoHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BakoPrimaryHeaderContainer(
              child: Column(
                children: [
                  BakoAppBar(
                    title: Text(
                      "Learning Module",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: BakoColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: BakoSizes.defaultSpace,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(BakoSizes.defaultSpace),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap:
                        true, // Add this to fix the unbounded height issue
                    physics:
                        const NeverScrollableScrollPhysics(), // Add this to prevent inner ListView scrolling
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      final module = modules[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LearningModuleContent(module: module),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the radius as needed
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Image
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                          16.0), // Same radius as Card
                                      topRight: Radius.circular(
                                          16.0), // Same radius as Card
                                    ),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight:
                                            250, // Adjust maximum height as needed
                                        maxWidth: double
                                            .infinity, // Ensure container stretches to card width
                                      ),
                                      child: Image.asset(
                                        module.imagePath,
                                        fit: BoxFit
                                            .fitHeight, // Fit the image nicely inside the container
                                      ),
                                    ),
                                  ),
                                  // Title and Subtitle
                                  ListTile(
                                    title: Text(module.title),
                                    subtitle: Text(module.subTitle),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0), // Add gap between cards
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
