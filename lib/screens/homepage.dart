// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/models/catalog.dart';
import 'package:project1/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';

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
    // final dummylist = List.generate(50, (index) => CatalogModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            (CatalogModel.products != null && CatalogModel.products.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModel.products.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        item: CatalogModel.products[index],
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
