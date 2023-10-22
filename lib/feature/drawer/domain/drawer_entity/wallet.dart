// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  int id, ph_id, funds;
  Wallet({required this.id, required this.funds, required this.ph_id});

  @override
  List<Object?> get props => [
        id,
        funds,
        ph_id,
      ];
}
