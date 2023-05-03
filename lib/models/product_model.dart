class ProductModel {
  String id;
  String catid;
  String subid;
  String name;
  String name_ar;
  List<dynamic> details;
  List<dynamic> details_ar;
  Map<String, dynamic> size;
  Map<String, dynamic> colors;
  Map<String, dynamic> colors_ar;
  List<dynamic> imgs;
  bool offer;
  int old_price;
  int new_price;
  int discount;

  ProductModel({
    required this.id,
    required this.catid,
    required this.subid,
    required this.name,
    required this.name_ar,
    required this.details,
    required this.details_ar,
    required this.size,
    required this.colors,
    required this.colors_ar,
    required this.imgs,
    required this.offer,
    required this.old_price,
    required this.new_price,
    required this.discount,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "catid": catid,
        "subid": subid,
        "name": name,
        "name_ar": name_ar,
        "details": details,
        "details_ar": details_ar,
        "size": size,
        "colors": colors,
        "colors_ar": colors_ar,
        "imgs": imgs,
        "offer": offer,
        "old_price": old_price,
        "new_price": new_price,
        "discount": discount
      };

  static ProductModel fromJson(
          Map<String, dynamic> json, Map<String, dynamic> id) =>
      ProductModel(
        // id: json["id"],
        // id: id,
        id: id["id"],
        catid: json["catid"],
        subid: json["subid"],
        name: json["name"],
        name_ar: json["name_ar"],
        details: json["details"],
        details_ar: json["details_ar"],
        size: json["size"],
        colors: json["colors"],
        colors_ar: json["colors_ar"],
        imgs: json["imgs"],
        offer: json["offer"],
        old_price: json["old_price"],
        new_price: json["new_price"],
        discount: json["discount"],
      );
}
