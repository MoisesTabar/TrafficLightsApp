import 'dart:convert';

Semaphore semaphoreFromJson(String str) => Semaphore.fromJson(json.decode(str));

class Semaphore {
  Semaphore({
    this.go,
    this.stop,
    this.warning,
  });

  Status? go;
  Status? stop;
  Status? warning;

  factory Semaphore.fromJson(Map<String, dynamic> json) => Semaphore(
    go: Status.fromJson(json["go"]),
    stop: Status.fromJson(json["stop"]),
    warning: Status.fromJson(json["warning"]),
  );
}

class Status {
  Status({
    this.color,
    this.image,
    this.value,
  });

  String? color;
  String? image;
  String? value;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    color: json["color"],
    image: json["image"],
    value: json["value"],
  );
}
