import 'package:flutter_test/flutter_test.dart';
import 'package:qutils/qutils.dart';

void main() {
  group('QCountry Tests', () {
    test('country object creation and properties', () {
      const country = QCountry(
        name: 'United States',
        iso2: 'US',
        iso3: 'USA',
        phoneCode: '+1',
        emoji: '🇺🇸',
      );

      expect(country.name, equals('United States'));
      expect(country.iso2, equals('US'));
      expect(country.iso3, equals('USA'));
      expect(country.phoneCode, equals('+1'));
      expect(country.emoji, equals('🇺🇸'));
    });

    test('country equality and hashCode', () {
      const country1 = QCountry(
        name: 'United States',
        iso2: 'US',
        iso3: 'USA',
        phoneCode: '+1',
        emoji: '🇺🇸',
      );

      const country2 = QCountry(
        name: 'United States',
        iso2: 'US',
        iso3: 'USA',
        phoneCode: '+1',
        emoji: '🇺🇸',
      );

      const country3 = QCountry(
        name: 'Canada',
        iso2: 'CA',
        iso3: 'CAN',
        phoneCode: '+1',
        emoji: '🇨🇦',
      );

      expect(country1, equals(country2));
      expect(country1.hashCode, equals(country2.hashCode));
      expect(country1, isNot(equals(country3)));
    });

    test('country toString', () {
      const country = QCountry(
        name: 'United States',
        iso2: 'US',
        iso3: 'USA',
        phoneCode: '+1',
        emoji: '🇺🇸',
      );

      expect(country.toString(), equals('United States (US)'));
    });
  });

  group('QCountries Collection Tests', () {
    test('countries list is not empty', () {
      expect(QCountries.all, isNotEmpty);
      expect(QCountries.all.length, greaterThan(190)); // At least 190+ countries
    });

    test('all countries have required data', () {
      for (final country in QCountries.all) {
        expect(country.name, isNotEmpty);
        expect(country.iso2, hasLength(2));
        expect(country.iso3, hasLength(3));
        expect(country.phoneCode, startsWith('+'));
        expect(country.emoji, isNotEmpty);
      }
    });

    test('ISO2 codes are unique', () {
      final iso2Codes = QCountries.all.map((c) => c.iso2).toList();
      final uniqueIso2Codes = iso2Codes.toSet();
      expect(iso2Codes.length, equals(uniqueIso2Codes.length));
    });

    test('ISO3 codes are unique', () {
      final iso3Codes = QCountries.all.map((c) => c.iso3).toList();
      final uniqueIso3Codes = iso3Codes.toSet();
      expect(iso3Codes.length, equals(uniqueIso3Codes.length));
    });
  });

  group('QCountries Lookup Tests', () {
    test('byIso2 - valid codes', () {
      final us = QCountries.byIso2('US');
      expect(us, isNotNull);
      expect(us!.name, equals('United States'));
      expect(us.iso2, equals('US'));

      // Test case insensitive
      final uk = QCountries.byIso2('gb');
      expect(uk, isNotNull);
      expect(uk!.name, equals('United Kingdom'));
    });

    test('byIso2 - invalid codes', () {
      expect(QCountries.byIso2('XX'), isNull);
      expect(QCountries.byIso2(''), isNull);
    });

    test('byIso3 - valid codes', () {
      final us = QCountries.byIso3('USA');
      expect(us, isNotNull);
      expect(us!.name, equals('United States'));
      expect(us.iso3, equals('USA'));

      // Test case insensitive
      final uk = QCountries.byIso3('gbr');
      expect(uk, isNotNull);
      expect(uk!.name, equals('United Kingdom'));
    });

    test('byIso3 - invalid codes', () {
      expect(QCountries.byIso3('XXX'), isNull);
      expect(QCountries.byIso3(''), isNull);
    });

    test('byPhoneCode - valid codes', () {
      final us = QCountries.byPhoneCode('+1');
      expect(us, isNotNull);
      expect(us!.phoneCode, equals('+1'));

      // Test without + prefix
      final uk = QCountries.byPhoneCode('44');
      expect(uk, isNotNull);
      expect(uk!.phoneCode, equals('+44'));
    });

    test('byPhoneCode - invalid codes', () {
      expect(QCountries.byPhoneCode('+999999'), isNull);
      expect(QCountries.byPhoneCode(''), isNull);
    });

    test('byName - valid names', () {
      final us = QCountries.byName('United States');
      expect(us, isNotNull);
      expect(us!.name, equals('United States'));

      // Test case insensitive
      final uk = QCountries.byName('united kingdom');
      expect(uk, isNotNull);
      expect(uk!.name, equals('United Kingdom'));
    });

    test('byName - invalid names', () {
      expect(QCountries.byName('Invalid Country'), isNull);
      expect(QCountries.byName(''), isNull);
    });
  });

  group('QCountries Search Tests', () {
    test('search by partial name', () {
      final results = QCountries.search('United');
      expect(results, isNotEmpty);
      expect(results.any((c) => c.name == 'United States'), isTrue);
      expect(results.any((c) => c.name == 'United Kingdom'), isTrue);
      expect(results.any((c) => c.name == 'United Arab Emirates'), isTrue);
    });

    test('search case insensitive', () {
      final results1 = QCountries.search('CANADA');
      final results2 = QCountries.search('canada');
      final results3 = QCountries.search('Canada');

      expect(results1.length, equals(results2.length));
      expect(results2.length, equals(results3.length));
      expect(results1.first.name, equals('Canada'));
    });

    test('search no results', () {
      final results = QCountries.search('Nonexistent Country');
      expect(results, isEmpty);
    });

    test('search empty query', () {
      final results = QCountries.search('');
      expect(results, equals(QCountries.all));
    });
  });

  group('QCountries Utility Lists Tests', () {
    test('names list', () {
      final names = QCountries.names;
      expect(names, isNotEmpty);
      expect(names.length, equals(QCountries.all.length));
      expect(names, contains('United States'));
      expect(names, contains('Canada'));
      expect(names, contains('United Kingdom'));
    });

    test('iso2Codes list', () {
      final iso2Codes = QCountries.iso2Codes;
      expect(iso2Codes, isNotEmpty);
      expect(iso2Codes.length, equals(QCountries.all.length));
      expect(iso2Codes, contains('US'));
      expect(iso2Codes, contains('CA'));
      expect(iso2Codes, contains('GB'));
    });

    test('iso3Codes list', () {
      final iso3Codes = QCountries.iso3Codes;
      expect(iso3Codes, isNotEmpty);
      expect(iso3Codes.length, equals(QCountries.all.length));
      expect(iso3Codes, contains('USA'));
      expect(iso3Codes, contains('CAN'));
      expect(iso3Codes, contains('GBR'));
    });

    test('phoneCodes list', () {
      final phoneCodes = QCountries.phoneCodes;
      expect(phoneCodes, isNotEmpty);
      expect(phoneCodes.length, equals(QCountries.all.length));
      expect(phoneCodes, contains('+1'));
      expect(phoneCodes, contains('+44'));
      expect(phoneCodes, contains('+33'));
      
      // All phone codes should start with +
      for (final phoneCode in phoneCodes) {
        expect(phoneCode, startsWith('+'));
      }
    });

    test('emojis list', () {
      final emojis = QCountries.emojis;
      expect(emojis, isNotEmpty);
      expect(emojis.length, equals(QCountries.all.length));
      expect(emojis, contains('🇺🇸'));
      expect(emojis, contains('🇨🇦'));
      expect(emojis, contains('🇬🇧'));
    });
  });

  group('QCountries Specific Country Tests', () {
    test('major countries exist', () {
      final majorCountries = [
        'United States', 'Canada', 'United Kingdom', 'Germany',
        'France', 'Japan', 'China', 'India', 'Australia', 'Brazil'
      ];

      for (final countryName in majorCountries) {
        final country = QCountries.byName(countryName);
        expect(country, isNotNull, reason: '$countryName should exist');
      }
    });

    test('specific country data accuracy', () {
      final us = QCountries.byIso2('US')!;
      expect(us.name, equals('United States'));
      expect(us.iso2, equals('US'));
      expect(us.iso3, equals('USA'));
      expect(us.phoneCode, equals('+1'));
      expect(us.emoji, equals('🇺🇸'));

      final uk = QCountries.byIso2('GB')!;
      expect(uk.name, equals('United Kingdom'));
      expect(uk.iso2, equals('GB'));
      expect(uk.iso3, equals('GBR'));
      expect(uk.phoneCode, equals('+44'));
      expect(uk.emoji, equals('🇬🇧'));

      final india = QCountries.byIso2('IN')!;
      expect(india.name, equals('India'));
      expect(india.iso2, equals('IN'));
      expect(india.iso3, equals('IND'));
      expect(india.phoneCode, equals('+91'));
      expect(india.emoji, equals('🇮🇳'));
    });
  });

  group('QCountries Edge Cases Tests', () {
    test('countries with same phone code', () {
      final usaCanada = QCountries.all.where((c) => c.phoneCode == '+1').toList();
      expect(usaCanada.length, greaterThan(1));
      expect(usaCanada.any((c) => c.name == 'United States'), isTrue);
      expect(usaCanada.any((c) => c.name == 'Canada'), isTrue);
    });

    test('countries with long names', () {
      final longNames = QCountries.all.where((c) => c.name.length > 20).toList();
      expect(longNames, isNotEmpty);
      expect(longNames.any((c) => c.name.contains('South Georgia')), isTrue);
    });

    test('countries with complex phone codes', () {
      final complexCodes = QCountries.all.where((c) => c.phoneCode.length > 4).toList();
      expect(complexCodes, isNotEmpty);
    });
  });
} 