class RestoRecommendationResponseModel {
  RestoRecommendationResponseModel({
    this.htmlAttributions,
    this.nextPageToken,
    this.results,
    this.status,
  });

  List<dynamic>? htmlAttributions;
  String? nextPageToken;
  List<Result>? results;
  String? status;

  factory RestoRecommendationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RestoRecommendationResponseModel(
        htmlAttributions: json["html_attributions"] == null
            ? []
            : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
        nextPageToken: json["next_page_token"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions == null
            ? []
            : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "next_page_token": nextPageToken,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
      };
}

class Result {
  Result({
    this.businessStatus,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.openingHours,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.userRatingsTotal,
    this.vicinity,
    this.photos,
  });

  BusinessStatus? businessStatus;
  Geometry? geometry;
  String? icon;
  IconBackgroundColor? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  String? placeId;
  PlusCode? plusCode;
  double? rating;
  String? reference;
  Scope? scope;
  List<Type>? types;
  int? userRatingsTotal;
  String? vicinity;
  List<Photo>? photos;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus: businessStatusValues.map[json["business_status"]]!,
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        name: json["name"],
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromJson(json["opening_hours"]),
        placeId: json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        rating: json["rating"]?.toDouble(),
        reference: json["reference"],
        scope: scopeValues.map[json["scope"]]!,
        types: json["types"] == null
            ? []
            : List<Type>.from(json["types"]!.map((x) => typeValues.map[x]!)),
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "business_status": businessStatusValues.reverse[businessStatus],
        "geometry": geometry?.toJson(),
        "icon": icon,
        "icon_background_color":
            iconBackgroundColorValues.reverse[iconBackgroundColor],
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "opening_hours": openingHours?.toJson(),
        "place_id": placeId,
        "plus_code": plusCode?.toJson(),
        "rating": rating,
        "reference": reference,
        "scope": scopeValues.reverse[scope],
        "types": types == null
            ? []
            : List<dynamic>.from(types!.map((x) => typeValues.reverse[x])),
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
      };
}

enum BusinessStatus { OPERATIONAL }

final businessStatusValues =
    EnumValues({"OPERATIONAL": BusinessStatus.OPERATIONAL});

class Geometry {
  Geometry({
    this.location,
    this.viewport,
  });

  Location? location;
  Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        viewport: json["viewport"] == null
            ? null
            : Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "viewport": viewport?.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double? lat;
  double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  Viewport({
    this.northeast,
    this.southwest,
  });

  Location? northeast;
  Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null
            ? null
            : Location.fromJson(json["northeast"]),
        southwest: json["southwest"] == null
            ? null
            : Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast?.toJson(),
        "southwest": southwest?.toJson(),
      };
}

enum IconBackgroundColor { THE_4_B96_F3 }

final iconBackgroundColorValues =
    EnumValues({"#4B96F3": IconBackgroundColor.THE_4_B96_F3});

class OpeningHours {
  OpeningHours({
    this.openNow,
  });

  bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };
}

class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions: json["html_attributions"] == null
            ? []
            : List<String>.from(json["html_attributions"]!.map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions == null
            ? []
            : List<dynamic>.from(htmlAttributions!.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}

class PlusCode {
  PlusCode({
    this.compoundCode,
    this.globalCode,
  });

  String? compoundCode;
  String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}

enum Scope { GOOGLE }

final scopeValues = EnumValues({"GOOGLE": Scope.GOOGLE});

enum Type {
  HEALTH,
  STORE,
  FOOD,
  POINT_OF_INTEREST,
  ESTABLISHMENT,
  GROCERY_OR_SUPERMARKET,
  RESTAURANT,
  CONVENIENCE_STORE
}

final typeValues = EnumValues({
  "convenience_store": Type.CONVENIENCE_STORE,
  "establishment": Type.ESTABLISHMENT,
  "food": Type.FOOD,
  "grocery_or_supermarket": Type.GROCERY_OR_SUPERMARKET,
  "health": Type.HEALTH,
  "point_of_interest": Type.POINT_OF_INTEREST,
  "restaurant": Type.RESTAURANT,
  "store": Type.STORE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
