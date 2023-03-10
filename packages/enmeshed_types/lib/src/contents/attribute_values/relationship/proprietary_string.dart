import '../../value_hints.dart';
import 'proprietary_attribute_value.dart';

class ProprietaryString extends ProprietaryAttributeValue {
  final String value;

  ProprietaryString({
    required super.title,
    super.description,
    super.valueHintsOverride,
    required this.value,
  });

  factory ProprietaryString.fromJson(Map<String, dynamic> json) => ProprietaryString(
        title: json['title'],
        description: json['description'],
        valueHintsOverride: json['valueHintsOverride'] != null ? ValueHints.fromJson(json['valueHintsOverride']) : null,
        value: json['value'],
      );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        '@type': 'ProprietaryString',
        'value': value,
      };

  @override
  String toString() => 'ProprietaryString(value: $value)';
}
