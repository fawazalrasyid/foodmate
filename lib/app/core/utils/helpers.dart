import '../configs/constants.dart';

getPhotoFromGmap(String? ref) {
  final url =
      "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$ref&sensor=false&key=${Constants.mapsApiKey}";

  return url;
}
