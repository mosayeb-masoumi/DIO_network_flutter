class Country {
  String ip;
  String countryCode;
  String countryName;
  String regionCode;
  String regionName;
  String city;
  String zipCode;
  String timeZone;
  double latitude;
  double longitude;
  int metroCode;

  Country.fromJson(Map<String, dynamic> json)
      : ip = json["ip"] ?? "",
        countryCode = json["country_code"] ?? "",
        countryName = json["country_name"] ?? "",
        regionCode = json["region_code"] ?? "",
        regionName = json["region_name"] ?? "",
        city = json["city"] ?? "",
        zipCode = json["zip_code"] ?? "",
        timeZone = json["time_zone"] ?? "",
        latitude = json["latitude"] ?? 0.0,
        longitude = json["longitude"] ?? 0.0,
        metroCode = json["metro_code"] ?? 0;
}
