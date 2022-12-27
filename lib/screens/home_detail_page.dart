// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import, unnecessary_null_comparison, prefer_const_constructors
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:project1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item Catalog;
  const HomeDetailPage({
    Key? key,
    required this.Catalog,
  })  : assert(Catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${Catalog.price}".text.bold.xl4.red800.make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyTheme.darkBluishColor,
                ),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: "Add to Cart".text.xl2.make(),
          ).wh(150, 65)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(Catalog.id.toString()),
                  child: Image.network(Catalog.image))
              .h32(context)
              .p16(),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(children: [
                Catalog.name.text.xl4
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                Catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                10.heightBox,
              ]).py64(),
            ),
          ))
        ]),
      ),
    );
  }
}
