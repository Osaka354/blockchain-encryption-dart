import 'dart:io';

import 'package:blockchian/controller/text_controller.dart';

void runApp() async {
  String option = "-1";
  while (option != "0") {
    print("\n0. Close Program.");
    print("1. Show All Text.");
    print("2. Add a Text.");

    stdout.write("Enter an option: ");

    option = stdin.readLineSync() ?? "";

    switch (option) {
      case "0":
        break;
      case "1":
        await TextController().showAllText();
        break;
      case "2":
        await TextController().uploadData();
        break;
      default:
        print("Wrong option please enter again.");
        break;
    }
  }
}
