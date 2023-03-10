import 'abstract_attribute.dart';
import 'attribute_values/attribute_values.dart';

class IdentityAttribute extends AbstractAttribute {
  final IdentityAttributeValue value;
  final List<String>? tags;

  IdentityAttribute({
    required super.owner,
    super.validFrom,
    super.validTo,
    required this.value,
    this.tags,
  });

  @override
  String toString() {
    return 'IdentityAttribute(owner: $owner, validFrom: $validFrom, validTo: $validTo, value: $value, tags: $tags)';
  }

  factory IdentityAttribute.fromJson(Map<String, dynamic> json) => IdentityAttribute(
        owner: json['owner'],
        validFrom: json['validFrom'],
        validTo: json['validTo'],
        value: IdentityAttributeValue.fromJson(json['value']),
        tags: json['tags'],
      );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        '@type': 'IdentityAttribute',
        'value': value.toJson(),
        if (tags != null) 'tags': tags,
      };
}
