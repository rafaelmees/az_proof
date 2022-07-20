import 'package:az_proof/app/data/models/dashboard_model.dart';
import 'package:az_proof/shared/utils/currency_utils.dart';
import 'package:az_proof/shared/utils/date_time_utils.dart';
import 'package:az_proof/shared/utils/doc_utils.dart';
import 'package:flutter/material.dart';

class OrdersTable extends StatefulWidget {
  const OrdersTable({
    Key? key,
    required this.orders,
  }) : super(key: key);

  final List<Order> orders;

  @override
  State<OrdersTable> createState() => _OrdersTableState();
}

class _OrdersTableState extends State<OrdersTable> {
  @override
  Widget build(BuildContext context) {
    return DataTableTheme(
      data: DataTableThemeData(
        headingRowColor: MaterialStateColor.resolveWith((states) {
          return Color(0xFFFE7C6E);
        }),
        headingTextStyle: TextStyle(color: Colors.white),
      ),
      child: Container(
        width: double.infinity,
        child: PaginatedDataTable(
          source: OrdersData(widget.orders),
          columns: [
            DataColumn(
              label: Flexible(
                child: Text(
                  'ID do Pedido',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'ID na Loja',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Criação',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Nome do cliente',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'CPF/CNPJ do cliente',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Status do pedido',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Status do pagamento',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Método de pagamento',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  'Total',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
          // rows: widget.orders.map((order) => DataRow(
          //   cells: [
          //     DataCell(Text(order.id)),
          //     DataCell(Text(order.sellerId)),
          //     DataCell(Text(DateTimeUtils.formatDate(order.createdAt, 'dd/MM/yyyy'))),
          //     DataCell(Text(order.customer.name)),
          //     DataCell(Text(DocUtils.formatDoc(order.customer.doc))),
          //     DataCell(Text(order.status.formatted)),
          //     DataCell(Text(order.payment.status.formatted)),
          //     DataCell(Text(order.payment.method.formatted)),
          //     DataCell(Text(CurrencyUtils.formatCurrency(
          //       value: order.payment.amount,
          //       locale: 'PT_BR',
          //       symbol: 'R\$',
          //     ))),
          //   ],
          // )).toList(),
        ),
      ),
    );
  }
}

class OrdersData extends DataTableSource {
  OrdersData(this.orders);

  final List<Order> orders;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => orders.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    Order order = orders.elementAt(index);

    return DataRow(cells: [
      DataCell(Text(order.id)),
      DataCell(Text(order.sellerId)),
      DataCell(Text(DateTimeUtils.formatDate(order.createdAt, 'dd/MM/yyyy'))),
      DataCell(Text(order.customer.name)),
      DataCell(Text(DocUtils.formatDoc(order.customer.doc))),
      DataCell(Text(order.status.formatted)),
      DataCell(Text(order.payment.status.formatted)),
      DataCell(Text(order.payment.method.formatted)),
      DataCell(Text(CurrencyUtils.formatCurrency(
        value: order.payment.amount,
        locale: 'PT_BR',
        symbol: 'R\$',
      ))),
    ]);
  }
}