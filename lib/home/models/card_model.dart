import 'package:flutter/material.dart';

class CardData {
  final String name;
  final String date;
  final String number;
  final Color color;
  final Icon image;

  CardData(
      {required this.name,
      required this.date,
      required this.number,
      required this.color,
      required this.image});
}

List<CardData> cards = [
  CardData(
      name: 'Pago Móvil',
      date: '12/26',
      number: '5262',
      color: Colors.white,
      image: Icon(Icons.payment)),
  CardData(
      name: 'Chinchin',
      date: '01/23',
      number: '5737',
      color: Colors.white,
      image: Icon(Icons.smart_display_outlined)),
  CardData(
      name: 'Cierre de lote',
      date: '07/24',
      number: '6315',
      color: Colors.white,
      image: Icon(Icons.local_activity))
];

class LastInvestmentData {
  final int? value;
  final String? name;
  LastInvestmentData({this.value, this.name});
}

List<LastInvestmentData> lastInvestment = [
  LastInvestmentData(value: 33624, name: "Twitter, Inc. ao"),
  LastInvestmentData(value: 23864, name: "Tesla, Inc. ao"),
  LastInvestmentData(value: 20724, name: "Volkswagon, Inc.ao")
];

class Recommended {
  final String? name;
  final String? subtitle;
  final String? icon;
  final String? value;
  Recommended({this.name, this.subtitle, this.icon, this.value});
}

List<Recommended> recommendedList = [
  Recommended(
      name: "Netflix, Inc. ao",
      subtitle: "Blu-ray Disk, DVD",
      value: "+189%",
      icon: "assets/netflix.jpg"),
  Recommended(
      name: "Ozon, Inc. ao",
      subtitle: "Online store",
      value: "+173%",
      icon: "assets/ozon.jpg"),
  Recommended(
      name: "Tesla, Inc. ao",
      subtitle: "Automotive industry",
      value: "+189%",
      icon: "assets/tesla.jpg"),
];
