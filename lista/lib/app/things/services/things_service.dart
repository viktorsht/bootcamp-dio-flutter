import 'package:shared_preferences/shared_preferences.dart';

class ThingsService{

  void saveTasks(List<String> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', tasks);
  }

  Future<List<String>> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tasks = prefs.getStringList('tasks');
    return tasks ?? [];
  }


}