enum PaymentType { paypal, mastercard, visa }

class PaymentInfo {
  final PaymentType type;
  final String name;
  final String last4;
  final String expiry;
  PaymentInfo({required this.type, required this.name, required this.last4, required this.expiry, });
}