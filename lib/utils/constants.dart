import 'package:flutter/material.dart';

// Colores ++++

const primaryLightColor = Color(0xFF14C6A4);

const backgroundColorLight = Color(0xFFF8F8F8);

const secondaryLightColor = Color(0xFFF8F8F8);

const version_app = "1.0.0";

// URL's =====

// Texto ======

double textLoginTittle = 22;
double textLoginfigerPrintTittle = 19;
double textTermConditionsTittle = 10;
double textTermConditionsSubTittle = 24;
double textTermConditionsDescription = 28;
double textPagoClaveTittle = 20;
double textRecargaOperadoraTittle = 20;
double textTranferenciasPagosRecargasTittle = 20;
double textCoordenadasTittle = 22;
double textComprobanteTittle = 22;
double textComprobanteDescription = 26;
double textConfirmacionTittle = 22;
double textConfirmacionDescription = 26;
double textConfigPage = 26;
double textAccountBalanceSaldo = 18.0;
double textAccountBalanceAccount = 25;
double textAccountBalanceCuenta = 26;

String maskAccountNumber(String account) =>
    //account.substring(0, 4) + '************' + account.substring(16);
    account.substring(0, 4) + '****' + account.substring(16);

String maskUserAccount(String user) {
  var n = user.length;
  var first = user[0];
  var last = user[n - 1];
  return first + '*****' + last;
}

String formatToCurrency(String currency, String amount) {
  switch (currency) {
    case 'VES':
      return formatToVES(amount);
    case 'EUR':
      return formatToEUR(amount);
    case 'USD':
      return formatToUsDollars(amount);
    default:
      return formatToVES(amount);
  }
}

String formatToVES(String amount) => 'Bs. $amount';
String formatToUsDollars(String amount) => 'USD $amount';
String formatToEUR(String amount) => 'EUR $amount';

String convertToUsDollars(String vesAmount, int exchangeRate) =>
    throw UnimplementedError;

Map weekDayMap = {
  1: "Lunes",
  2: "Martes",
  3: "Miercoles",
  4: "Jueves",
  5: "Viernes",
  6: "Sabado",
  7: "Domingo"
};

Map months = {
  1: "Enero",
  2: "Febrero",
  3: "Marzo",
  4: "Abril",
  5: "Mayo",
  6: "Junio",
  7: "Julio",
  8: "Agosto",
  9: "Septiembre",
  10: "Octubre",
  11: "Noviembre",
  12: "Diciembre"
};

Map<int, String> producto = {
  1: "PagoClave a terceros BDV",
  2: "PagoClave a otros bancos",
  3: "Recargas",
  4: "Transferencias a terceros BDV",
  5: "Transferencias a otros bancos",
  6: "Transferencias a cuentas propias"
};
