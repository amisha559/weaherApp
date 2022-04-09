class WeatherModel {
  String main;
  String description;
  int pressure;
  int humidity;
  double temp;
  int visibility;
  dynamic speed;
  int degree;
  String country;
  String name;
  double feels_like;

  WeatherModel({
    required this.main,
    required this.description,
    required this.pressure,
    required this.humidity,
    required this.temp,
    required this.visibility,
    required this.speed,
    required this.degree,
    required this.country,
    required this.name,
    required this.feels_like,
  });

  factory WeatherModel.getData(Map<String, dynamic> data) {
    return WeatherModel(
      main: data['weather'][0]['main'],
      description: data['weather'][0]['description'],
      pressure: data['main']['pressure'],
      humidity: data['main']['humidity'],
      temp: data['main']['temp'],
      visibility: data['visibility'],
      speed: data['wind']['speed'],
      degree: data['wind']['deg'],
      country: data['sys']['country'],
      name: data['name'],
      feels_like: data['main']['feels_like'],
    );
  }
}
