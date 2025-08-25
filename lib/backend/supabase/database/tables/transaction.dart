import '../database.dart';

class TransactionTable extends SupabaseTable<TransactionRow> {
  @override
  String get tableName => 'transaction';

  @override
  TransactionRow createRow(Map<String, dynamic> data) => TransactionRow(data);
}

class TransactionRow extends SupabaseDataRow {
  TransactionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get amount => getField<int>('amount');
  set amount(int? value) => setField<int>('amount', value);

  String get transid => getField<String>('transid')!;
  set transid(String value) => setField<String>('transid', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);
}
