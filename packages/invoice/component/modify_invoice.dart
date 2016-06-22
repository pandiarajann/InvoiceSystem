library view_recipe_component;

import 'dart:async';

import 'package:invoice/service/Invoice.dart';
import 'package:angular/angular.dart';
import 'package:invoice/service/QueryService.dart';

@Component(
    selector: 'modify-invoice',
    templateUrl: 'modify_invoice.html',
    useShadowDom: false
    )
class ModifyInvoiceComponent {

  final QueryService queryService;

  Future _loaded;

  @NgOneWay('invoice-map')
  Map<String, Invoice> _modifyInvoiceMap = new Map();

  String _invoice_itemCode;

  Invoice selectedInvoice;
//  Invoice get selectedInvoice => modifyInvoiceMap == null ? null : modifyInvoiceMap[_invoice_itemCode];

  ModifyInvoiceComponent(RouteProvider routeProvider, this.queryService) {

    _invoice_itemCode = routeProvider.parameters['itemCode'];
    print('Calling load method : ' + _invoice_itemCode);
    _loadData();
  }

  Future _loadData() {
    print('inside load method');
    queryService.getAllInvoice()
        .then((Map<String, Invoice> allInvoices) {
      _modifyInvoiceMap = allInvoices;
    })
        .catchError((e) {
      print(e);
    });

    selectedInvoice = _modifyInvoiceMap == null ? null : _modifyInvoiceMap[_invoice_itemCode];
  }

  void save() {

    _loadData();
//    selectedInvoice.quantity = selectedInvoice.quantity + 10;
//    selectedInvoice.itemCode = selectedInvoice.itemCode+'1';
    //queryService.addInvoice(selectedInvoice);

  }
}
