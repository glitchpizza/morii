import 'package:morii/models/Account.dart';
import 'package:morii/models/Status.dart';

enum NotificationType { // TODO: look up how to index dart enums by string
  mention,
  reblog,
  favourite,
  follow
}

class Notification {
  final String id;
  final String type; // TODO: refactor to NotificationType eventually™
  final DateTime createdAt;
  final Account account;
  final Status status;

  Notification({
    this.id,
    this.type,
    this.createdAt,
    this.account,
    this.status
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return new Notification(
      id: json['id'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
      account: Account.fromJson(json['account']), // TODO: figure out if this call works
      status: Status.fromJson(json['status']) // TODO: figure out if this call works
    );
  }

}