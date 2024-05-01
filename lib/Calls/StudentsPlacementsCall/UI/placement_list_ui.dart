
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Commons/text_style__constants.dart';
import '../Model/placement_model.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({
    Key? key,
    required this.backgroundColor,
    required this.children,
  });

  final Color backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

class BreakingNew extends StatelessWidget {
  final Rounds rounds;
  final PrimaryInfo primaryInfo;
  const BreakingNew(
      {super.key, required this.rounds, required this.primaryInfo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.grey,
        //     width: 1.0,
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '${primaryInfo.recruitmentTitle}',
              style: TextStyleConstants.titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              '${primaryInfo.companyAddress}', softWrap: true,
              style: TextStyleConstants.regularStyle,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => launchUrl(
                  Uri.parse(
                      '${primaryInfo.companyWebsite}')
              ),
              child: Text(
                primaryInfo.companyWebsite ?? '',softWrap: true,
                style: TextStyleConstants.weblink,
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Text(
            //         '${primaryInfo.companyWebsite}',
            //         style: TextStyleConstants.regularStyle,
            //       ),
            //     ),
            //     Text(
            //       '${primaryInfo.companyEmail1}',
            //       style: TextStyleConstants.regularStyle,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${primaryInfo.companyContactNo1}',
                  style: TextStyleConstants.regularStyle,
                ),
                Text(
                  '${primaryInfo.companyContactNo2}',
                  style: TextStyleConstants.regularStyle,
                ),
              ],
            ),

            ExpansionTileCard(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  '${primaryInfo.imageUrl}',
                ),
              ),
              title: Text("${primaryInfo.companyName}"),
              subtitle: const Text("Company's Detail Information"),
              children: [
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${primaryInfo.companyName}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Round Description',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Round Date & Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Round Venue',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(rounds.isAttain == null?'Not Attended':rounds.isAttain !=null ? 'Attended' : 'Pending'),
          ],
        ),
      ),
    );
  }
}
