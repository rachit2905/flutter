// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/themes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999.".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: "Buy".text.xl4.color(Colors.white).make())
              .wh(100, 50)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.done_outline_outlined),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle_outline_rounded),
            ),
            title: "Item 1".text.make(),
          )),
      itemCount: 5,
    );
  }
}
