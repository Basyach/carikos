class Space {
  int id;
  String name;
  String imageUrl;
  String city;
  String country;
  int price;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  Space(
      {this.city,
      this.country,
      this.imageUrl,
      this.name,
      this.price,
      this.rating,
      this.id,
      this.address,
      this.mapUrl,
      this.numberOfBedrooms,
      this.numberOfCupboards,
      this.numberOfKitchens,
      this.phone,

      this.photos});

      Space.fromJson(json){
        id = json['id'];
        name = json['name'];
        city =json['city'];
        country = json['country'];
        imageUrl =json['image_url'];
        price = json['price'];
        rating =json['rating'];
        address =json['address'];
        phone =json['phone'];
        mapUrl =json['map_url'];
        photos =json['photos'];
        numberOfBedrooms =json['number_of_bedrooms'];
        numberOfCupboards =json['number_of_cupboards'];
        numberOfKitchens =json['number_of_kitchens'];

      }
}
