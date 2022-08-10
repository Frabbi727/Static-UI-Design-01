import 'dart:convert';
MakeUpDetails makeUpDetailsFromJson(String str) => MakeUpDetails.fromJson(json.decode(str));
String makeUpDetailsToJson(MakeUpDetails data) => json.encode(data.toJson());
class MakeUpDetails {
  MakeUpDetails({
      this.id, 
      this.brand, 
      this.name, 
      this.price, 
      this.priceSign, 
      this.currency, 
      this.imageLink, 
      this.productLink, 
      this.websiteLink, 
      this.description, 
      this.rating, 
      this.category, 
      this.productType, 
      this.tagList, 
      this.createdAt, 
      this.updatedAt, 
      this.productApiUrl, 
      this.apiFeaturedImage, 
      this.productColors,});

  MakeUpDetails.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    priceSign = json['price_sign'];
    currency = json['currency'];
    imageLink = json['image_link'];
    productLink = json['product_link'];
    websiteLink = json['website_link'];
    description = json['description'];
    rating = json['rating'];
    category = json['category'];
    productType = json['product_type'];
    tagList = json['tag_list'] != null ? json['tag_list'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productApiUrl = json['product_api_url'];
    apiFeaturedImage = json['api_featured_image'];
    if (json['product_colors'] != null) {
      productColors = [];
      json['product_colors'].forEach((v) {
        productColors?.add(ProductColors.fromJson(v));
      });
    }
  }
  int? id;
  String? brand;
  String? name;
  String? price;
  String? priceSign;
  String? currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  dynamic rating;
  String? category;
  String? productType;
  List<String>? tagList;
  String? createdAt;
  String? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProductColors>? productColors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand'] = brand;
    map['name'] = name;
    map['price'] = price;
    map['price_sign'] = priceSign;
    map['currency'] = currency;
    map['image_link'] = imageLink;
    map['product_link'] = productLink;
    map['website_link'] = websiteLink;
    map['description'] = description;
    map['rating'] = rating;
    map['category'] = category;
    map['product_type'] = productType;
    map['tag_list'] = tagList;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['product_api_url'] = productApiUrl;
    map['api_featured_image'] = apiFeaturedImage;
    if (productColors != null) {
      map['product_colors'] = productColors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ProductColors productColorsFromJson(String str) => ProductColors.fromJson(json.decode(str));
String productColorsToJson(ProductColors data) => json.encode(data.toJson());
class ProductColors {
  ProductColors({
      this.hexValue, 
      this.colourName,});

  ProductColors.fromJson(dynamic json) {
    hexValue = json['hex_value'];
    colourName = json['colour_name'];
  }
  String? hexValue;
  String? colourName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hex_value'] = hexValue;
    map['colour_name'] = colourName;
    return map;
  }

}