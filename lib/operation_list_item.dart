import 'operation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationListItem extends StatelessWidget {
  final String idOperacion;
  final double importe;
  final double saldo;
  final NaturalezaOperacion naturalezaOperacion;
  final MONEDA moneda;
  final DateTime date;
  final TipoOperacion tipoOperacion;

  const OperationListItem({this.idOperacion,
    this.importe,
    this.saldo,
    this.naturalezaOperacion,
    this.moneda,
    this.date,
    this.tipoOperacion});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Icon(getIconData(tipoOperacion),
          color: Colors.grey, size: 40.0),
      title: new Text(getOperationTitle(tipoOperacion)),
      subtitle: new Text(new DateFormat('EEE, d MMM yyyy').format(date)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          new Text(
            (naturalezaOperacion == NaturalezaOperacion.DEBITO ? '-' : '+') +
                importe.toString() +
                " " +
                getMonedaStr(moneda),
            style: TextStyle(
              color: getIconColor(naturalezaOperacion),
              fontSize: 15.0,
            ),
          ),
          new Text(saldo.toString(),style: TextStyle(color: Colors.black38),),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return new Dialog(
                  child: new ListTile(
                    leading: new Stack(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          getIconData(tipoOperacion),
                          color: getIconColor(naturalezaOperacion),
                          size: 40.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 38.0),
                        child: new Text(
                          importe.toString() + " " + getMonedaStr(moneda),
                        ),
                      ),
                    ]),
                    title: Row(
                      children: [
                        new Text(idOperacion),
//                        idOperacion + '\n' + GetOperationTitle(tipoOperacion)),
                      ],
                    ),
                    subtitle: new Row(
                      children: [
                        Row(
                          children: [
                            new Text(
                              new DateFormat('EEE, d MMM yyyy').format(date),
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
            });
      },
    );
  }
}
