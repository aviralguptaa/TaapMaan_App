class TempModel {
  late String temperature1 ;
  late String humidity1;
  late String temperature2;
  late String humidity2;
  late String temperature3;
  late String humidity3;
  late String temperature4;
  late String humidity4;

  TempModel({
    this.temperature1 = "",
    this.humidity1 = "",
    this.temperature2 = "",
    this.humidity2 = "",
    this.temperature3 = "",
    this.humidity3 = "",
    this.temperature4 = "",
    this.humidity4 = "",
  });

  factory TempModel.fromJson(dynamic json) {
    return TempModel(
        temperature1: "${json['temperature1']}",
        humidity1: "${json['humidity1']}",
        temperature2: "${json['temperature2']}",
        humidity2: "${json['humidity2']}",
        temperature3: "${json['temperature3']}",
        humidity3: "${json['humidity3']}",
        temperature4: "${json['temperature4']}",
        humidity4: "${json['humidity4']}");
  }

  Map toJson() =>
  {
    "temperature1":temperature1,
    "humidity1":humidity1,
    "temperature2":temperature2,
    "humidity2":humidity2,
    "temperature3":temperature3,
    "humidity3":humidity3,
    "temperature4":temperature4,
    "humidity4":humidity4,
  };

}
