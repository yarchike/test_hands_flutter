import 'package:flutter/material.dart';
import 'package:test_hands_flutter/model/cell.dart';
import 'dart:math';

class CellularFilling extends StatefulWidget {
  const CellularFilling({Key? key}) : super(key: key);

  @override
  State<CellularFilling> createState() => _CellularFillingState();
}

class _CellularFillingState extends State<CellularFilling> {
  List<Cell> items = [];
  List<int> indexLife = [];
  int countIsLive = 0;
  int countIsDead = 0;

  ScrollController listViewScrollController = new ScrollController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff310050), Color(0xff000000)])),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Клеточное наполнение",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: Color(0xff310050),
          body: ListView.builder(
              itemCount: items.length,
              controller: listViewScrollController,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: ListTile(
                    title: Text(items[index].title),
                    subtitle: Text(items[index].subTitle),
                    leading: items[index].image,
                  ),
                );
              }),
          bottomNavigationBar:
          Container(
            margin: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  "Cотворить",
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff5A3472)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 18.0)),

                ),
              ),
          )
      ),
    );
  }

  void onPressed() {
    var rng = Random();
    var cell = Cell.getCell(rng.nextInt(2));
    setState(() {
      items.add(cell);
    });
    if (cell.typeCell == TypeCell.LIVE) {
      countIsLive++;
      countIsDead = 0;
    } else {
      countIsLive = 0;
      countIsDead++;
    }
    if (countIsLive >= 3) {
      countIsLive = 0;
      setState(() {
        indexLife.add(items.length);
        items.add(Cell.getCell(3));
      });
    }
    if (indexLife.isNotEmpty) {
      if (countIsDead >= 3) {
        countIsDead = 0;
        setState(() {
          items.removeAt(indexLife.last);
        });
      }
    }

    listViewScrollController.animateTo(
        listViewScrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
