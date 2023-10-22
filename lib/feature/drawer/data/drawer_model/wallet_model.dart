// ignore_for_file: must_be_immutable, non_constant_identifier_names

import '../../domain/drawer_entity/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({required super.id, required super.funds, required super.ph_id});
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      funds: json['funds'],
      ph_id: json['ph_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'funds': funds,
      'ph_id': ph_id,
    };
  }
}
