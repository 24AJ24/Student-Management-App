// import 'package:flutter/material.dart';
//
// class SubmitAssignmentDetails extends StatelessWidget {
//   const SubmitAssignmentDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       //elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: _buildChild(context),
//     );
//   }
//
//   Widget _buildChild(BuildContext context) {
//     return Container(
//       height: 350,
//       decoration: const BoxDecoration(
//         color: Colors.redAccent,
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//               ),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Text('Submit Assignment'),
//               //child: Icon(Icons.exit_to_app),
//             ),
//           ),
import 'package:flutter/material.dart';

class SubmitAssignmentDetails extends StatelessWidget {
  const SubmitAssignmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: Colors.transparent,

    child: SingleChildScrollView(
      child: Container(
        height: 900, // Adjust the height as needed
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Submit Assignment'),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Title',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Text(
                'File Manager Assignment using RecyclerView, Fragments, Intent Filters, Storage APIs and Runtime Permissions.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(color: Colors.white),
              // textAlign: TextAlign.center,
            ),
            const Text(
              'Duration: 9 Hrs\nComplexity: Normal',
              style: TextStyle(color: Colors.white),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 8),
            const Text(
              'Part 1',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Column(
                children: [
                  Text(
                    'Create an android application to implement file manager functionality.',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The app should display the list of files on external storage  in a RecyclerView. ',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The files in the RecyclerView should be displayed appropriately,e.g. if it is a folder then the folder icon should be displayed along with the folder name,if it is a pdf file then a pdf file icon should be displayed along with the file name and so on . ',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                      '\u2022When tapped on a file view from the RecyclerView appropriate action should be taken.(User intent filter)',
                      style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,)
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(color: Colors.white),
              // textAlign: TextAlign.center,
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.all(Colors.white),
            //       ),
            //       child: const Text('No'),
            //     ),
            //     const SizedBox(width: 8),
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.of(context).pop(true);
            //       },
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.white),
            //         foregroundColor: MaterialStateProperty.all(Colors.redAccent),
            //       ),
            //       child: const Text('Yes'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class SubmitAssignmentDetails extends StatelessWidget {
  const SubmitAssignmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      //elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Submit Assignment'),
              //child: Icon(Icons.exit_to_app),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Do you want to exit?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(right: 16, left: 16),
            child: Text(
              'If back button is pressed by mistake then click on no to continue.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('No'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

 */
