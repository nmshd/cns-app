import '../contents/contents.dart';
import '../dtos/dtos.dart';

class LocalRequestSourceDTO {
  final String type;
  final String reference;

  LocalRequestSourceDTO({
    required this.type,
    required this.reference,
  });

  factory LocalRequestSourceDTO.fromJson(Map<String, dynamic> json) {
    return LocalRequestSourceDTO(
      type: json['type'],
      reference: json['reference'],
    );
  }

  static LocalRequestSourceDTO? fromJsonNullable(Map<String, dynamic>? json) => json != null ? LocalRequestSourceDTO.fromJson(json) : null;

  Map<String, dynamic> toJson() => {
        'type': type,
        'reference': reference,
      };

  @override
  String toString() => 'LocalRequestSourceDTO(type: $type, reference: $reference)';
}

enum LocalRequestStatus { Draft, Open, DecisionRequired, ManualDecisionRequired, Decided, Completed, Expired }

class LocalRequestDTO {
  final String id;
  final bool isOwn;
  final String peer;
  final String createdAt;
  final LocalRequestStatus status;
  final Request content;
  final LocalRequestSourceDTO? source;
  final LocalResponseDTO? response;

  LocalRequestDTO({
    required this.id,
    required this.isOwn,
    required this.peer,
    required this.createdAt,
    required this.status,
    required this.content,
    this.source,
    this.response,
  });

  factory LocalRequestDTO.fromJson(Map<String, dynamic> json) {
    return LocalRequestDTO(
      id: json['id'],
      isOwn: json['isOwn'],
      peer: json['peer'],
      createdAt: json['createdAt'],
      status: LocalRequestStatus.values.byName(json['status']),
      content: Request.fromJson(json['content']),
      source: LocalRequestSourceDTO.fromJsonNullable(json['source']),
      response: LocalResponseDTO.fromJsonNullable(json['response']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'isOwn': isOwn,
        'peer': peer,
        'createdAt': createdAt,
        'status': status.name,
        'content': content.toJson(),
        if (source != null) 'source': source?.toJson(),
        if (response != null) 'response': response?.toJson(),
      };

  @override
  String toString() {
    return 'LocalRequestDTO(id: $id, isOwn: $isOwn, peer: $peer, createdAt: $createdAt, status: $status, content: $content, source: $source, response: $response)';
  }
}
