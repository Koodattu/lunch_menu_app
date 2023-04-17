// To parse this JSON data, do
//
//     final menuWeek = menuWeekFromJson(jsonString);

import 'dart:convert';

List<MenuWeek> menuWeekListFromJson(String str) =>
    List<MenuWeek>.from(json.decode(str).map((x) => MenuWeek.fromJson(x)));
String menuWeekListToJson(List<MenuWeek> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

MenuWeek menuWeekFromJson(String str) => MenuWeek.fromJson(json.decode(str));
String menuWeekToJson(MenuWeek data) => json.encode(data.toJson());

class MenuWeek {
  MenuWeek({
    required this.id,
    required this.weekName,
    required this.saladCoursePrice,
    required this.soupCoursePrice,
    required this.mainCoursePrice,
    required this.menuDays,
  });

  final int id;
  final String weekName;
  final String saladCoursePrice;
  final String soupCoursePrice;
  final String mainCoursePrice;
  final List<MenuDay> menuDays;

  factory MenuWeek.fromJson(Map<String, dynamic> json) => MenuWeek(
        id: json["id"],
        weekName: json["weekName"],
        saladCoursePrice: json["saladCoursePrice"],
        soupCoursePrice: json["soupCoursePrice"],
        mainCoursePrice: json["mainCoursePrice"],
        menuDays: List<MenuDay>.from(json["menuDays"].map((x) => MenuDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weekName": weekName,
        "saladCoursePrice": saladCoursePrice,
        "soupCoursePrice": soupCoursePrice,
        "mainCoursePrice": mainCoursePrice,
        "menuDays": List<dynamic>.from(menuDays.map((x) => x.toJson())),
      };
}

class MenuDay {
  MenuDay({
    required this.id,
    required this.dayName,
    required this.menuCourses,
  });

  final int id;
  final String dayName;
  final List<MenuCourse> menuCourses;

  factory MenuDay.fromJson(Map<String, dynamic> json) => MenuDay(
        id: json["id"],
        dayName: json["dayName"],
        menuCourses: List<MenuCourse>.from(json["menuCourses"].map((x) => MenuCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dayName": dayName,
        "menuCourses": List<dynamic>.from(menuCourses.map((x) => x.toJson())),
      };
}

class MenuCourse {
  MenuCourse({
    required this.id,
    required this.courseName,
    required this.courseType,
    required this.allergens,
  });

  final int id;
  final String courseName;
  final String courseType;
  final List<Allergen> allergens;

  factory MenuCourse.fromJson(Map<String, dynamic> json) => MenuCourse(
        id: json["id"],
        courseName: json["courseName"],
        courseType: json["courseType"],
        allergens: List<Allergen>.from(json["allergens"].map((x) => Allergen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courseName": courseName,
        "courseType": courseType,
        "allergens": List<dynamic>.from(allergens.map((x) => x.toJson())),
      };
}

class Allergen {
  Allergen({
    required this.id,
    required this.allergenSymbol,
  });

  final int id;
  final String allergenSymbol;

  factory Allergen.fromJson(Map<String, dynamic> json) => Allergen(
        id: json["id"],
        allergenSymbol: json["allergenSymbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "allergenSymbol": allergenSymbol,
      };
}
