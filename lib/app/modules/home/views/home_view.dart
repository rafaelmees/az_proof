import 'package:az_proof/app/modules/home/widgets/featured_cards.dart';
import 'package:az_proof/shared/utils/currency_utils.dart';
import 'package:az_proof/shared/utils/date_time_utils.dart';
import 'package:az_proof/shared/utils/doc_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0.0, 0.5),
                ),
              ],
            ),
            child: Drawer(
              backgroundColor: Colors.white,
              elevation: 2,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: (kToolbarHeight * 1.1),
                    height: (kToolbarHeight * 1.1),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/reduzido.svg',
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListTile(
                        textColor: Color(0xFF8F95B2),
                        iconColor: Color(0xFF8F95B2),
                        selected: true,
                        selectedColor: Colors.white,
                        selectedTileColor: Color(0xFFFE7C6E),
                        horizontalTitleGap: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/home.svg',
                          color: Colors.white,
                        ),
                        title: Text(
                          'Dashboard',
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () => Get.offAndToNamed(Routes.HOME)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 80),
                            Container(
                              constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height - 135,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Resumo da atividade',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(height: 24.0),
                                  Obx(
                                    () => Row(
                                      children: [
                                        Expanded(
                                          child: FeaturedCard(
                                            icon: Icon(Icons.receipt_long_outlined),
                                            iconColor: Color(0xFFE54594),
                                            title: [
                                              controller.dashboard.value.ordersCount,
                                              Intl.plural(
                                                controller.dashboard.value.ordersCount,
                                                other: 'pedidos',
                                                one: 'pedido',
                                                zero: 'pedidos',
                                              ),
                                            ].join(' '),
                                            subtitle: CurrencyUtils.formatCurrency(
                                              value: controller.dashboard.value.ordersTotal,
                                              locale: 'PT_BR',
                                              symbol: 'R\$',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FeaturedCard(
                                            icon: Icon(Icons.paid_outlined),
                                            iconColor: Color(0xFF07C693),
                                            title: [
                                              controller.dashboard.value.salesCount,
                                              Intl.plural(
                                                controller.dashboard.value.ordersCount,
                                                other: 'vendas',
                                                one: 'venda',
                                                zero: 'vendas',
                                              ),
                                            ].join(' '),
                                            subtitle: CurrencyUtils.formatCurrency(
                                              value: controller.dashboard.value.salesTotal,
                                              locale: 'PT_BR',
                                              symbol: 'R\$',
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FeaturedCard(
                                            icon: Icon(Icons.calculate_outlined),
                                            iconColor: Color(0xFF3CB0D9),
                                            title: 'Ticket médio',
                                            subtitle: CurrencyUtils.formatCurrency(
                                              value: controller.dashboard.value.averageTicket,
                                              locale: 'PT_BR',
                                              symbol: 'R\$',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24.0),
                                  Text(
                                    'Pedidos',
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  SizedBox(height: 24.0),
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: DataTableTheme(
                                      data: DataTableThemeData(
                                        headingRowColor: MaterialStateColor.resolveWith((states) {
                                          return Color(0xFFFE7C6E);
                                        }),
                                        headingTextStyle: TextStyle(color: Colors.white),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        child: Obx(
                                          () => DataTable(
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
                                            rows: controller.dashboard.value.orders.map((order) => DataRow(
                                              cells: [
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
                                                  locale: 'PT_br',
                                                  symbol: 'R\$',
                                                ))),
                                              ],
                                            )).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              color: Color(0xffF5F5F5),
                              height: 56,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 21),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/logo_azape.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    '® Desenvolvido por Azape',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF97A1A8),
                                    ),
                                  ),
                                  SizedBox(width: 48),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 0.5,
                  margin: EdgeInsets.only(top: 0, left: 0.5, right: 0),
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0.0, 0.5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Olá,',
                                    style: TextStyle(
                                      fontFamily: 'NunitoSans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff59666F),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.userName.value
                                          .split(' ')
                                          .first,
                                      style: TextStyle(
                                        fontFamily: 'NunitoSans',
                                        color: Color(0xff59666F),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFE7C6E),
                                ),
                                child: Center(
                                  child: Icon(
                                    FeatherIcons.user,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
