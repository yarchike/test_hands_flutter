import 'package:flutter/material.dart';

class Cell{
  late TypeCell typeCell;
  late String  title;
  late String  subTitle;
  late Image image;

     Cell(this.typeCell, this.title, this.subTitle, this.image);

  static Cell getCell(int index){
    switch(index) {
      case 0:
        return Cell(TypeCell.DEAD, "Мёртвая", "или прикидывается", Image(image: AssetImage('asset/dead.png')));
      case 1:
        return Cell(TypeCell.LIVE, "Живая", "и шевелится!", Image(image: AssetImage('asset/live.png')));
      default:
        return Cell(TypeCell.LIFE, "Жизнь", "Ку-ку", Image(image: AssetImage('asset/aLife.png')));
    }
  }


}



enum TypeCell{
  LIFE,
  DEAD,
  LIVE
}