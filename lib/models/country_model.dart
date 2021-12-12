import 'dart:ffi';

class CountryModel {

  final String ip;
  final String countryCode;
  final String countryName;
  final String regionCode;
  final String regionName;
  final String city;
  final String zipCode;
  final String timeZone;
  final Float latitude;
  final Float longitude;
  final int metroCode;


  CountryModel(this.ip, this.countryCode, this.countryName, this.regionCode,
      this.regionName, this.city, this.zipCode, this.timeZone, this.latitude,
      this.longitude, this.metroCode);


  CountryModel.fromJson(Map<String, dynamic> json)
      : ip = json["ip"],
        countryCode = json["country_code"],
        countryName = json["country_name"],
        regionCode = json["region_code"],
        regionName = json["region_name"],
        city = json["city"],
        zipCode = json["zip_code"],
        timeZone = json["time_zone"],
        latitude = json["latitude"],
        longitude = json["longitude"],
        metroCode = json["metro_code"];


}