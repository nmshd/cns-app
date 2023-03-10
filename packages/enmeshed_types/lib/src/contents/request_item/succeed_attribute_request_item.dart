part of 'request_item.dart';

class SucceedAttributeRequestItem extends RequestItemDerivation {
  final String succeededId;
  final AbstractAttribute succeededAttribute;
  final AbstractAttribute newAttribute;

  SucceedAttributeRequestItem({
    super.title,
    super.description,
    super.metadata,
    required super.mustBeAccepted,
    super.requireManualDecision,
    required this.succeededId,
    required this.succeededAttribute,
    required this.newAttribute,
  });

  factory SucceedAttributeRequestItem.fromJson(Map<String, dynamic> json) {
    return SucceedAttributeRequestItem(
      title: json['title'],
      description: json['description'],
      metadata: json['metadata'],
      mustBeAccepted: json['mustBeAccepted'],
      requireManualDecision: json['requireManualDecision'],
      succeededId: json['succeededId'],
      succeededAttribute: AbstractAttribute.fromJson(json['succeededAttribute']),
      newAttribute: AbstractAttribute.fromJson(json['newAttribute']),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        '@type': 'SucceedAttributeRequestItem',
        'succeededId': succeededId,
        'succeededAttribute': succeededAttribute.toJson(),
        'newAttribute': newAttribute.toJson(),
      };

  @override
  String toString() => 'SucceedAttributeRequestItem(succeededId: $succeededId, succeededAttribute: $succeededAttribute, newAttribute: $newAttribute)';
}
