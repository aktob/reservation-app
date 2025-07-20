class Wallet {
  final int id;
  final String name;
  final int partnerId;
  final String partnerName;
  final double balance;
  final int currencyId;
  final String currencyName;
  final List<WalletTransaction> transactions;

  Wallet({
    required this.id,
    required this.name,
    required this.partnerId,
    required this.partnerName,
    required this.balance,
    required this.currencyId,
    required this.currencyName,
    required this.transactions,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      name: json['name'],
      partnerId: json['partner_id'],
      partnerName: json['partner_name'],
      balance: (json['balance'] as num).toDouble(),
      currencyId: json['currency_id'],
      currencyName: json['currency_name'],
      transactions: (json['transactions'] as List)
          .map((e) => WalletTransaction.fromJson(e))
          .toList(),
    );
  }
}

class WalletTransaction {
  final int id;
  final double amount;
  final String type;
  final String date;

  WalletTransaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
      id: json['id'],
      amount: (json['amount'] as num).toDouble(),
      type: json['type'],
      date: json['date'],
    );
  }
}
