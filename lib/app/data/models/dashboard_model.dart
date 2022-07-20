class DashboardModel {
  num averageTicket;
  List<Order> orders;
  num ordersTotal;
  int ordersCount;
  num salesTotal;
  int salesCount;

  DashboardModel({
    this.averageTicket = 0,
    orders,
    this.ordersCount = 0,
    this.ordersTotal = 0,
    this.salesCount = 0,
    this.salesTotal = 0,
  }): orders = orders ?? [];

  DashboardModel.fromJson(Map<String, dynamic> json) :
    orders = json['orders'] != null ? json['orders'].map<Order>((order) => Order.fromJson(order)).toList() : [],
    averageTicket = json['average_ticket'],
    ordersTotal = json['orders_total'],
    ordersCount = json['orders_count'],
    salesTotal = json['sales_total'],
    salesCount = json['sales_count'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['orders'] = orders.map((order) => order.toJson());
    _data['average_ticket'] = averageTicket;
    _data['orders_total'] = ordersTotal;
    _data['orders_count'] = ordersCount;
    _data['sales_total'] = salesTotal;
    _data['sales_count'] = salesCount;

    return _data;
  }
}

class Order {
  DateTime createdAt;
  String sellerId;
  OrderStatus status;
  Payment payment;
  Customer customer;
  String id;

  Order({
    required this.createdAt,
    required this.sellerId,
    required this.status,
    required this.payment,
    required this.customer,
    required this.id,
  });

  Order.fromJson(Map<String, dynamic> json) :
    createdAt = DateTime.parse(json['createdAt']),
    sellerId = json['order_seller_id'],
    status = OrderStatus.named(json['status']),
    payment = Payment.fromJson(json['payment']),
    customer = Customer.fromJson(json['customer']),
    id = json['_id'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['createdAt'] = createdAt.toIso8601String();
    _data['order_seller_id'] = sellerId;
    _data['status'] = status.name;
    _data['payment'] = payment.toJson();
    _data['customer'] = customer.toJson();
    _data['_id'] = id;

    return _data;
  }
}

class Payment {
  num amount;
  PaymentMethod method;
  PaymentStatus status;

  Payment({
    required this.amount,
    required this.method,
    required this.status,
  });

  Payment.fromJson(Map<String, dynamic> json) :
    amount = json['amount'],
    method = PaymentMethod.named(json['method']),
    status = PaymentStatus.named(json['status']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['amount'] = amount;
    _data['method'] = method.name;
    _data['status'] = status.name;

    return _data;
  }
}

class Customer {
  String doc;
  String name;

  Customer({
    required this.doc,
    required this.name,
  });

  Customer.fromJson(Map<String, dynamic> json) :
    doc = json['doc'],
    name = json['name'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['doc'] = doc;
    _data['name'] = name;

    return _data;
  }
}

class PaymentStatus {
  final String name;
  final String formatted;

  PaymentStatus._(this.name, this.formatted);

  String toString() => 'PaymentStatus.$name';

  static PaymentStatus succeeded = PaymentStatus._(
    'succeeded',
    'Aprovado',
  );
  static PaymentStatus pending = PaymentStatus._(
    'pending',
    'Pendente',
  );

  // WORKAROUND
  // Some items have status as 'Aprovada' and not 'succeeded'
  static PaymentStatus expired = PaymentStatus._(
    'Aprovada',
    'Aprovado',
  );

  static List<PaymentStatus> values = [
    succeeded,
    pending,
    expired,
  ];

  static PaymentStatus named(String name) =>
    values.firstWhere((brand) => brand.name == name);
}

class PaymentMethod {
  final String name;
  final String formatted;

  PaymentMethod._(this.name, this.formatted);

  String toString() => 'PaymentMethod.$name';

  static PaymentMethod boleto = PaymentMethod._(
    'boleto',
    'Boleto',
  );
  static PaymentMethod credit = PaymentMethod._(
    'credit',
    'Crédito a vista',
  );
  static PaymentMethod creditInstallments = PaymentMethod._(
    'credit_installments',
    'Crédito a prazo',
  );
  static PaymentMethod pix = PaymentMethod._(
    'pix',
    'PIX',
  );

  static List<PaymentMethod> values = [
    boleto,
    credit,
    creditInstallments,
    pix,
  ];

  static PaymentMethod named(String name) =>
    values.firstWhere((brand) => brand.name.toLowerCase() == name.toLowerCase());
}

class OrderStatus {
  final String name;
  final String formatted;

  OrderStatus._(this.name, this.formatted);

  String toString() => 'OrderStatus.$name';

  static OrderStatus canceled = OrderStatus._(
    'canceled',
    'Cancelado',
  );
  static OrderStatus delivered = OrderStatus._(
    'delivered',
    'Entregue',
  );
  static OrderStatus paid = OrderStatus._(
    'paid',
    'Pagamento aprovado',
  );
  static OrderStatus pending = OrderStatus._(
    'pending',
    'Criado',
  );

  static List<OrderStatus> values = [
    canceled,
    delivered,
    paid,
    pending,
  ];

  static OrderStatus named(String name) =>
    values.firstWhere((brand) => brand.name == name);
}