import 'package:fluency/Features/teachers/data/models/teachers_data_linker.dart';
import 'package:hive/hive.dart';

class HiveDB
{
  static const String boxName = "teachersBox";

  static Future<void> saveTeacher(TeacherInfo teacherInfo) async
  {
    try
    {
      var box = await Hive.openBox<TeacherInfo>(boxName);

      // ✅ Check if teacher already exists before saving
      if (box.containsKey(teacherInfo.teacherName))
      {
        print("⚠️ Teacher '${teacherInfo.teacherName}' already exists in DB.");
        return;
      }

      await box.put(teacherInfo.teacherName, teacherInfo);
      print("✅ Teacher '${teacherInfo.teacherName}' saved successfully!");
    }

    catch (e)
    {
      print("❌ Error saving teacher: $e");
    }
  }

  static Future<void> printTeachersDB() async
  {
    try
    {
      var box = await Hive.openBox<TeacherInfo>(boxName);
      print("📂 Teachers DB:\n${box.values.toList()}");
    }

    catch (e)
    {
      print("❌ Error printing database: $e");
    }
  }

  static Future<void> allDBRemover() async
  {
    var box = await Hive.openBox<TeacherInfo>("teachersBox");
    await box.clear();
    print("🔥 Database cleared!");
  }
}
