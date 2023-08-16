class CarModel {
  List<CarType> carList;
  CarType carObject;
  String title;
  String description;

  CarModel(
      {required this.carList,
      required this.carObject,
      required this.title,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      'carList': carList.map((car) => car.toJson()).toList(),
      'carObject': carObject.toJson(),
      'title': title,
      'description': description,
    };
  }


  CarModel.fromJson(Map<String, dynamic> json)
      : carList = List<CarType>.from(json['carList'].map((carJson) => CarType.fromJson(carJson))),
        carObject = CarType.fromJson(json['carObject']),
        title = json["title"],
        description = json["description"];

}

class CarType {
  String name;
  String mfYear;

  CarType({required this.name, required this.mfYear});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mfYear': mfYear,
    };
  }

  CarType.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        mfYear = json["mfYear"];
}
