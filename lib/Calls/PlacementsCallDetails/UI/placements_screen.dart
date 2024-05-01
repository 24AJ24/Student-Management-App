/*import 'package:bitcode_student_app/Batch/BLoc/batch_bloc.dart';
import'package:bitcode_student_app/Config/palette.dart';
import 'package:flutter/material.dart';
import 'package:bitcode_student_app/Util/show_toast.dart';
import '../../../Commons/back_button.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../../StudentsPlacementsCall/UI/placement_ui.dart';
import '../Bloc/placements_details_bloc.dart';
import '../Model/placements_details_list_bloc.dart';
import '../../StudentsPlacementsCall/Bloc/placement_bloc.dart'as PlacementModel;
import '../../StudentsPlacementsCall/Bloc/placement_bloc.dart'as PlacementModel;
import '../../StudentsPlacementsCall/Model/placement_model.dart' as PlacementModel;
import 'package:bitcode_student_app/Batch/Model/batch_request_model.dart' as BatchRequestModel;
class PlacementDetailScreen extends StatefulWidget {

  final int courserId;
  // final int student;

  const PlacementDetailScreen({Key? key, required this.courserId}) : super(key: key);

  @override
  _PlacementDetailScreenState createState() => _PlacementDetailScreenState();
}
// cxvbnm,cvbnjmk
class _PlacementDetailScreenState extends State<PlacementDetailScreen> {
  final PlacementBloc _bloc = PlacementBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.courserId);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              navigateToMainScreen(context);
            },
          ),
          title: const Text('Placement Calls'),
        ),
        body: StreamBuilder<List<Data>>(
          stream: _bloc.studentPlacementStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final dataList = snapshot.data!;
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final show = dataList[index];
                  return InkWell(
                    onTap: () {
                      showToast('Clicked');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  PlacementScreen(courseId: show.recruitmentCallCourseId!),
                        ),
                      );
                    },
                    child: Card(

                      margin: const EdgeInsets.all(7),
                      child: Padding(
                        padding: const EdgeInsets.all(5),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                child: Image.network('${show.imageUrl}',height: 50),
                              ),
                              Text(
                                '${show.recruitmentTitle}',
                                style: TextStyleConstants.titleStyle
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${show.companyName}',
                                style: TextStyleConstants.regularStyle,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${show.addedOn}',
                                style: TextStyleConstants.regularStyle,
                              ),
                              const SizedBox(height: 9),

                            ],
                          ),
                        ),
                      ),
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
      ),
    );
  }

}*/
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../../../Util/show_toast.dart';
import '../../StudentsPlacementsCall/UI/placement_ui.dart';
import '../Model/placements_details_list_bloc.dart';
import '../../../Commons/back_button.dart';
import '../Bloc/placements_details_bloc.dart';

class PlacementDetailScreen extends StatefulWidget {
  final int courserId1;

  const PlacementDetailScreen({Key? key, required this.courserId1,}) : super(key: key);

  @override
  _PlacementDetailScreenState createState() => _PlacementDetailScreenState();
}

class _PlacementDetailScreenState extends State<PlacementDetailScreen> {
  final PlacementBloc _bloc = PlacementBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.courserId1);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context);
          },
        ),
        title: const Text('Placement Calls'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.studentPlacementStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final show = dataList[index];
                return InkWell(
                  onTap: () {
                    showToast('Clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacementScreen(courseId1: show.recruitmentCallCourseId!,),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(7),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 5), // Add top margin to move it down
                            // alignment: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.90)!,
                            width: 80,
                            height: 80,
                            child: Image.network(
                              '${show.imageUrl}',
                              fit: BoxFit.contain,
                              alignment: Alignment.lerp(Alignment.center, Alignment.bottomLeft, 0.10)!,
                              // Adjust the fit property
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.all(5),
                          //   alignment: Alignment.lerp(Alignment.center,Alignment.topRight,0.80)!,
                          //   width: 80,
                          //   height: 80,
                          //   child: Image.network(
                          //     '${show.imageUrl}',
                          //     fit: BoxFit.contain,
                          //     // Adjust the fit property
                          //   ),
                          // ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${show.recruitmentTitle}',
                                  style: TextStyleConstants.titleStyle,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${show.companyName}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${show.addedOn}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 9),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
}*/



import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../../../Util/show_toast.dart';
import '../../StudentsPlacementsCall/UI/placement_ui.dart';
import '../Model/placements_details_list_bloc.dart';
import '../../../Commons/back_button.dart';
import '../Bloc/placements_details_bloc.dart';

class PlacementDetailScreen extends StatefulWidget {
  final int courserId1;

  const PlacementDetailScreen({Key? key, required this.courserId1,}) : super(key: key);

  @override
  _PlacementDetailScreenState createState() => _PlacementDetailScreenState();
}

class _PlacementDetailScreenState extends State<PlacementDetailScreen> {
  final PlacementBloc _bloc = PlacementBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.courserId1);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context);
          },
        ),
        title: const Text('Placement Calls'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.studentPlacementStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final show = dataList[index];
                return InkWell(
                  onTap: () {
                    showToast('Clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacementScreen(courseId1: show.recruitmentCallCourseId!,),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(7),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 5), // Add top margin to move it down
                            // alignment: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.90)!,
                            width: 80,
                            height: 80,
                            child: Image.network(
                              '${show.imageUrl}',
                              fit: BoxFit.contain,
                              alignment: Alignment.lerp(Alignment.center, Alignment.bottomLeft, 0.10)!,
                              // Adjust the fit property
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.all(5),
                          //   alignment: Alignment.lerp(Alignment.center,Alignment.topRight,0.80)!,
                          //   width: 80,
                          //   height: 80,
                          //   child: Image.network(
                          //     '${show.imageUrl}',
                          //     fit: BoxFit.contain,
                          //     // Adjust the fit property
                          //   ),
                          // ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${show.recruitmentTitle}',
                                  style: TextStyleConstants.titleStyle,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${show.companyName}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${show.addedOn}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 9),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
/*

import 'package:bitcode_student_app/Auth/Model/login_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Commons/loading_dialog.dart';
import '../../../Commons/text_style__constants.dart';
import '../../../Util/show_toast.dart';
import '../../StudentsPlacementsCall/UI/placement_ui.dart';
import '../Model/placements_details_list_bloc.dart';
import '../../../Commons/back_button.dart';
import '../Bloc/placements_details_bloc.dart';

class PlacementDetailScreen extends StatefulWidget {
  final int courserId1;

  const PlacementDetailScreen({Key? key, required this.courserId1,}) : super(key: key);

  @override
  _PlacementDetailScreenState createState() => _PlacementDetailScreenState();
}

class _PlacementDetailScreenState extends State<PlacementDetailScreen> {
  // late PlacementBloc _bloc;
  //
  final PlacementBloc _bloc = PlacementBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi(widget.courserId1);
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context);
          },
        ),
        title: const Text('Placement Calls'),
      ),
      body: StreamBuilder<List<Data>>(
        stream: _bloc.studentPlacementStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dataList = snapshot.data!;
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final show = dataList[index];
                return InkWell(
                  onTap: () {
                    showToast('Clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlacementScreen(courseId1: show.recruitmentCallCourseId!,),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(7),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 5), // Add top margin to move it down
                            // alignment: Alignment.lerp(Alignment.center, Alignment.bottomCenter, 0.90)!,
                            width: 80,
                            height: 80,
                            child: Image.network(
                              '${show.imageUrl}',
                              fit: BoxFit.contain,
                              alignment: Alignment.lerp(Alignment.center, Alignment.bottomLeft, 0.10)!,
                              // Adjust the fit property
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.all(5),
                          //   alignment: Alignment.lerp(Alignment.center,Alignment.topRight,0.80)!,
                          //   width: 80,
                          //   height: 80,
                          //   child: Image.network(
                          //     '${show.imageUrl}',
                          //     fit: BoxFit.contain,
                          //     // Adjust the fit property
                          //   ),
                          // ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${show.recruitmentTitle}',
                                  style: TextStyleConstants.titleStyle,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '${show.companyName}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${show.addedOn}',
                                  style: TextStyleConstants.regularStyle,
                                ),
                                const SizedBox(height: 9),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
*/