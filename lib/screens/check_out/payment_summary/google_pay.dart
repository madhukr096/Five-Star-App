/*import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePay extends StatefulWidget {
  final total;
  GooglePay({this.total});
  @override
  State<GooglePay> createState() => _GooglePayState();
}

class _GooglePayState extends State<GooglePay> {
  void onGooglePayResult(paymentResult) {
    print(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: [
        PaymentItem(
          label: 'Total',
          amount: '\ ${widget.total}',
          status: PaymentItemStatus.final_price,
        )
      ],
      style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}*/
