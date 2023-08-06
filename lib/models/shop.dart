class Shop {
  String? key;
  String? name;
  String? url;
  Shop({this.key, this.name, this.url});

  Shop.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['url'] = url;

    return data;
  }
}
