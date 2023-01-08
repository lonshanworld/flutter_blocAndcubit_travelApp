class DataModel{
  final String name;
  final String img;
  final int price;
  final int people;
  final int stars;
  final String description;
  final String location;

  DataModel({
    required this.name,
    required this.img,
    required this.people,
    required this.price,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> jsData){
    return DataModel(
      name: jsData["name"],
      img: jsData["img"],
      people: jsData["people"],
      price: jsData["price"],
      stars: jsData["stars"],
      description: jsData["description"],
      location: jsData["location"],
    );
  }
}