// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison, sort_child_properties_last, implementation_imports, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/utils/routes.dart';
import 'package:project1/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/themes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "rachit";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogjson = await rootBundle.loadString('assets/files/catalog.json');
    var decodedata = jsonDecode(catalogjson);
    var productdata = decodedata["products"];
    CatalogModel.products =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    // print(decodedata);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.products != null &&
                    CatalogModel.products.isNotEmpty)
                  CatalogList().py32().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}
