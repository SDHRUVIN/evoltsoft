class CarResponseEntity {
  String? id;
  String? make;
  String? model;
  String? year;
  String? color;
  String? price;

  CarResponseEntity(
      {this.id, this.make, this.model, this.year, this.color, this.price});

  CarResponseEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    color = json['color'];
    price = json['price'];
  }

  static List<CarResponseEntity> fromJsonArray(List<dynamic> tags) {
    List<CarResponseEntity> list = tags
        .map<CarResponseEntity>((a) => CarResponseEntity.fromJson(a))
        .toList();
    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['make'] = this.make;
    data['model'] = this.model;
    data['year'] = this.year;
    data['color'] = this.color;
    data['price'] = this.price;
    return data;
  }
}
