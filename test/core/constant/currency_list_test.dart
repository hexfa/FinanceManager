
import 'package:finance_manager/core/constants/currency.dart';

import 'package:finance_manager/data/models/currency.dart';

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';



void main() {

  group('CurrencyCodeExtension', () {

    test('returns correct Currency for valid code', () {

      expect('EUR'.toCurrency().name, 'Euro');

      expect('JPY'.toCurrency().name, 'Japanese Yen');

    });



    test('returns USD Currency for unknown code', () {

      expect('XYZ'.toCurrency().code, 'USD');

      expect('XYZ'.toCurrency().name, 'US Dollar');

    });

  });



  group('getCurrencyIcon', () {

    test('returns correct icon for known currencies', () {

      expect(


        getCurrencyIcon(Currency(code: 'USD', name: 'US Dollar')),

        Icons.attach_money,

      );

      expect(getCurrencyIcon(Currency(code: 'EUR', name: 'Euro')), Icons.euro);

      expect(

        getCurrencyIcon(Currency(code: 'GBP', name: 'British Pound')),

        Icons.currency_pound,

      );

      expect(

        getCurrencyIcon(Currency(code: 'JPY', name: 'Japanese Yen')),

        Icons.currency_yen,

      );


      expect(

        getCurrencyIcon(Currency(code: 'CHF', name: 'Swiss Franc')),

        Icons.money,

      );

      expect(

        getCurrencyIcon(Currency(code: 'CAD', name: 'Canadian Dollar')),

        Icons.currency_exchange,

      );

      expect(

        getCurrencyIcon(Currency(code: 'AUD', name: 'Australian Dollar')),

        Icons.public,

      );

      expect(

        getCurrencyIcon(Currency(code: 'NZD', name: 'New Zealand Dollar')),

        Icons.south_america,

      );

      expect(

        getCurrencyIcon(Currency(code: 'CNY', name: 'Chinese Yuan')),

        Icons.account_balance_wallet,

      );

      expect(

        getCurrencyIcon(Currency(code: 'SEK', name: 'Swedish Krona')),

        Icons.payments,

      );

      expect(

        getCurrencyIcon(Currency(code: 'INR', name: 'Indian Rupee')),

        Icons.currency_rupee,

      );

      expect(

        getCurrencyIcon(Currency(code: 'RUB', name: 'Russian Ruble')),

        Icons.currency_ruble,

      );

      expect(

        getCurrencyIcon(Currency(code: 'BRL', name: 'Brazilian Real')),

        Icons.forest,

      );

      expect(

        getCurrencyIcon(Currency(code: 'ZAR', name: 'South African Rand')),

        Icons.savings,

      );

      expect(

        getCurrencyIcon(Currency(code: 'MXN', name: 'Mexican Peso')),


        Icons.attach_money,

      );

      expect(

        getCurrencyIcon(Currency(code: 'SGD', name: 'Singapore Dollar')),

        Icons.location_city,

      );

      expect(

        getCurrencyIcon(Currency(code: 'HKD', name: 'Hong Kong Dollar')),

        Icons.location_city,

      );

      expect(

        getCurrencyIcon(Currency(code: 'TRY', name: 'Turkish Lira')),


        Icons.currency_lira,

      );

      expect(

        getCurrencyIcon(Currency(code: 'SAR', name: 'Saudi Riyal')),

        Icons.oil_barrel,

      );

      expect(

        getCurrencyIcon(Currency(code: 'AED', name: 'UAE Dirham')),

        Icons.oil_barrel,

      );

      expect(

        getCurrencyIcon(Currency(code: 'EGP', name: 'Egyptian Pound')),

        Icons.account_balance,

      );

      expect(

        getCurrencyIcon(Currency(code: 'THB', name: 'Thai Baht')),

        Icons.card_giftcard,

      );

      expect(

        getCurrencyIcon(Currency(code: 'PLN', name: 'Polish Zloty')),

        Icons.account_balance_wallet_outlined,

      );

      expect(

        getCurrencyIcon(Currency(code: 'MYR', name: 'Malaysian Ringgit')),

        Icons.money_rounded,

      );

    });



    test('returns default icon for unknown currency', () {

      expect(

        getCurrencyIcon(Currency(code: 'XYZ', name: 'Unknown')),


        Icons.attach_money,

      );

    });

  });

}
