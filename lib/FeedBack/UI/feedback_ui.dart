import 'package:flutter/material.dart';
import '../../Commons/back_button.dart';
import '../../Commons/loading_dialog.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Bloc/feedback_bloc.dart';
import '../Model/feedback_model.dart';

class FeedBackUi extends StatefulWidget {
  const FeedBackUi({Key? key}) : super(key: key);

  @override
  _FeedBackUiState createState() => _FeedBackUiState();
}

class _FeedBackUiState extends State<FeedBackUi> {
  final FeedbackRequestBloc _bloc = FeedbackRequestBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student FeedBack'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            navigateToMainScreen(context); // This function is not defined in your provided code
          },
        ),
      ),
      body: StreamBuilder<List<Data>?>(
        stream: _bloc.feedBackStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingDialog();
            //CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text('No feedback available.');
          } else {
            List<Data> feedbackList = snapshot.data!;

            if (feedbackList.isEmpty) {
              return const Text('No feedback record found.');
            } else {
              return ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  Data feedback = feedbackList[index];
                  return Card(
                    elevation: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                            title: Text(feedback.feedbackTitle ),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    feedback.feedbackCreatedOn,
                                    overflow: TextOverflow.clip,
                                    style: TextStyleConstants.regularStyle,
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Text(
                                    feedback.expiryDate ,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            trailing: TextButton(
                              onPressed: feedback.isSubmitted ? null :(){
                                showToast('Button Clicked');
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const FeedBackUi()));
                              },
                              child: feedback.isSubmitted? const Text('Submitted'):const Text('Submit'),
                            )
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}