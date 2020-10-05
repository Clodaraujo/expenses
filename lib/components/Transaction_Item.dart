import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';


class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onRemove,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black
  ];

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor : _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(child: Text('R\$${widget.tr.value}')),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? FlatButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: Icon(Icons.delete_sweep),
                label: Text('Excluir'),
                textColor: Theme.of(context).primaryColor,
              )
            : IconButton(
                icon: Icon(Icons.delete_sweep),
                color: Theme.of(context).primaryColor,
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
