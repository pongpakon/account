class Transactions {
  int? keyID;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String imagePath;
  final double amount;
  final DateTime date;
  
  Transactions({
    this.keyID,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.imagePath,
    required this.amount,
    required this.date,
  });
}
