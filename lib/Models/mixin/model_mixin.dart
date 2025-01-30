import 'package:decimal/decimal.dart';

mixin Codable<T> {
  //JsonMap? toJson();
  T fromJson(JsonMap json);
}

/// The type definition for a JSON-serializable [Map].
typedef JsonMap = Map<String, dynamic>;

/// Converts YesNo Enum to bool.
bool yesNoToBool(String value) => value == 'Y';

/// Converts bool to YesNo Enum
String boolToYesNo(bool value) => value ? 'Y' : 'N';

int toIntSafe(dynamic jsonVal, {int missingValue = -1}) =>
    jsonVal == null || jsonVal.toString().isEmpty
        ? missingValue
        : int.parse(jsonVal.toString());

/// Converts int to String
String intToStringSafe(dynamic jsonVal) => jsonVal?.toString() ?? '';

/// Converts String to int
int stringToIntSafe(String? number, {int missingValue = -1}) =>
    number == null || number.isEmpty ? missingValue : int.parse(number);

/// Converts String int to bool
bool stringIntToBool(String number) => int.parse(number) != 0;

/// Converts bool to String int
String boolToStringInt(bool value) => value ? '1' : '';

/// Converts String or double to Decimal
Decimal stringOrNumberToDecimal(dynamic jsonVal, {Decimal? missingValue}) =>
    jsonVal == null
        ? (missingValue ?? Decimal.zero)
        : Decimal.parse(jsonVal.toString());

/// Converts String or double to Decimal
bool stringOrBooleanToBool(dynamic jsonVal, {bool? missingValue}) =>
    jsonVal == null
        ? (missingValue ?? false)
        : jsonVal is bool
            ? jsonVal
            : jsonVal is String
                ? jsonVal.isEmpty
                    ? false
                    : jsonVal == 'Y' || jsonVal == 'A'
                        ? true
                        : false
                : false;

int stringOrNumberDecimalToFloorInt(dynamic jsonVal, {int? missingValue}) =>
    jsonVal == null
        ? (missingValue ?? 0)
        : jsonVal.toString().trim().isNotEmpty
            ? Decimal.parse(jsonVal.toString()).floor().toBigInt().toInt()
            : (missingValue ?? 0);

int stringOrNumberDecimalToCeilInt(dynamic jsonVal, {int? missingValue}) =>
    jsonVal == null
        ? (missingValue ?? 0)
        : jsonVal.toString().trim().isNotEmpty
            ? Decimal.parse(jsonVal.toString()).ceil().toBigInt().toInt()
            : (missingValue ?? 0);

/// Converts Decimal to string
String decimalToString(Decimal value) => value.toString();
