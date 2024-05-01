import 'package:flutter/material.dart';
import '../Bloc/enrollment_details_bloc.dart';
import '../Model/enrollment_details_model.dart' as EnrollmentDetailsModel;

class EnrollmentDetailUI extends StatefulWidget {
  const EnrollmentDetailUI({Key? key}) : super(key: key);

  @override
  _EnrollmentDetailUIState createState() => _EnrollmentDetailUIState();
}

class _EnrollmentDetailUIState extends State<EnrollmentDetailUI> {
  final EnrollmentDetailsBloc _bloc = EnrollmentDetailsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchDataFromApi();
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
        title: const Text('Payment Details'),
      ),
      body: StreamBuilder<List<EnrollmentDetailsModel.Payments>>(
        stream: _bloc.studentDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<EnrollmentDetailsModel.Payments> paymentDetailsList =
                snapshot.data!;
            return ListView.builder(
              itemCount: paymentDetailsList.length,
              itemBuilder: (context, index) {
                return PaymentRow(payment: paymentDetailsList[index]);
              },
            );
          } else if (snapshot.hasError) {
            // Handle error state if needed
            return const Center(
              child: Text('Error fetching data'),
            );
          } else {
            // Show a loading indicator while waiting for data
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PaymentRow extends StatelessWidget {
  final EnrollmentDetailsModel.Payments payment;

  const PaymentRow({Key? key, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = payment.paymentStatus == 1 ? Colors.green : Colors.red;

    return Card(
      child: ListTile(
        title: const Text("Payment Details"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: \$${payment.paidAmount?.toStringAsFixed(2)}'),
            //Text('Date: ${DateFormat.yMd().add_jm().format(payment.paymentDateTime as DateTime)}'),
            Text('Reference Code: ${payment.paymentReferenceCode}'),
          ],
        ),
        trailing: Icon(
          payment.paymentModeId == 1
              ? Icons.credit_card
              : Icons.money, // Example icons
          color: statusColor,
          size: 32,
        ),
      ),
    );
  }
}
