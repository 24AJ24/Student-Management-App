
///
///
///

///TODO::THIS 1 ui
///
///
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../Bloc/placement_bloc.dart';
import '../Model/placement_model.dart';

class PlacementScreen extends StatefulWidget {
  final int courseId1;

  const PlacementScreen({Key? key, required this.courseId1}) : super(key: key);

  @override
  _PlacementScreenState createState() => _PlacementScreenState();
}

class _PlacementScreenState extends State<PlacementScreen> {
  final PlacementInBloc _bloc = PlacementInBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.courseId1);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('News Details'),
      ),
      extendBodyBehindAppBar: true,
      body: StreamBuilder<PlacementModel>(
        stream: _bloc.placementStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final model = snapshot.data!;
            final primaryInfo = model.data.primaryInfo;
            final rounds = model.data.rounds;

            return ListView.builder(
              itemCount: rounds.length,
              itemBuilder: (context, index) {
                final details = rounds[index];
                return Column(
                  children: [
                    // Image and content inside the image
                    Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGroupedBackground,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage('${primaryInfo.imageUrl}',),
                          // image: NetworkImage(
                          //     'https://images.unsplash.com/photo-1656106534627-0fef76c8b042?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'
                          // ),
                          // fit: BoxFit.scaleDown,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              CustomTag(
                            backgroundColor: Colors.transparent,
                            // backgroundColor: Colors.grey.withAlpha(150),

                            children: [

                              Text(
                                'Number of Position:  ${primaryInfo.noOfPositions}',
                                style: TextStyleConstants.titleStyle,),
                              // Text('${primaryInfo.remark}')
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                    // Breaking news section
                    BreakingNew(rounds: details,primaryInfo: primaryInfo),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: LoadingDialog(),
            );
          }
        },
      ),
    );
  }
}

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

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '${primaryInfo.recruitmentTitle}',
              style: TextStyleConstants.titleStyle,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _launchMap('${primaryInfo.companyAddress}');
              },

              child: Text(
                '${primaryInfo.companyAddress}',
                softWrap: true,
                style: TextStyleConstants.regularStyle,
                // style: TextStyleConstants.regularStyle.copyWith(
                //   color: Colors.blue, // Change text color to indicate it's clickable
                //   decoration: TextDecoration.underline, // Add underline
                // ),
              ),
            ),

            const SizedBox(height: 15),
            // Text(
            //   '${primaryInfo.companyAddress}', softWrap: true,
            //   style: TextStyleConstants.regularStyle,
            // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              // First side: Contact Numbers
              Column(
                children: [
                  Text('${primaryInfo.companyContactNo1}'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,mainAxisSize: MainAxisSize.max,
                children: [
                  Text('${primaryInfo.companyEmail1}'),
                ],
              ),
            ],
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
            const SizedBox( height: 19),
            ExpansionTileCard(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  '${primaryInfo.imageUrl}',scale: 0.15,
                ),
              ),
              title: const Text("Round Description"),
              // subtitle: const Text("Round Description"),
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
                          '${rounds.roundTitle}',
                          style: TextStyleConstants.titleText
                          ),
                        const SizedBox(height: 19),
                         Text(
                          '${rounds.roundDescription}',
                          style: TextStyleConstants.regularStyle
                        ),
                        const SizedBox(height: 19),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${rounds.roundDateTime}',
                              style: TextStyleConstants.regularStyle,softWrap: true,
                            ),
                            Text(
                              rounds.isAttain == null?'Not Attended':rounds.isAttain !=null ? 'Attended' : 'Pending',style: TextStyleConstants.regularStyle,softWrap: true,maxLines: AndroidPointerProperties.kToolTypeEraser),
                          ],
                        ),
                        const SizedBox(height: 19),
                    Text(
                                '${rounds.roundVenue}',
                                style: TextStyleConstants.regularStyle,
                              ),
                        // Row(
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text('Round Venue', style: TextStyleConstants.regularStyle),
                        //         Text(
                        //           '${rounds.roundVenue}',
                        //           style: TextStyleConstants.regularStyle,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // Row(
                        //
                        //   children: [
                        //   Text ('Round Venue '),
                        //  Text(
                        //   '${rounds.roundVenue}',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text('${rounds.addedDateTime}', style: TextStyleConstants.regularStyle,),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchMap(String address) async {
  final query = Uri.encodeComponent(address);
  final url = 'https://www.google.com/maps/search/?api=1&query=$query';

  // if (await canLaunchUrl){
  if (await canLaunch(url)) {
    await launchUrl;
    // await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
