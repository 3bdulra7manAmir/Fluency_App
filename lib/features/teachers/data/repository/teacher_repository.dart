import 'package:fluency/features/teachers/domain/entities/teacher_entity.dart';

abstract class TeacherRepository
{
  Future<List<TeacherEntity>> getTeachersList();
  Future<TeacherEntity> getTeacherDetails(String id);
}

class MockTeacherRepository implements TeacherRepository
{
  @override
  Future<List<TeacherEntity>> getTeachersList() async
  {
    // ShadowCompany: Mock data for teachers list
    return
    [
      TeacherEntity(
        id: "98247969240911872",
        photo: "https://api.fluency.live/storage/teachers/98247969240911872/photo/Byk6MRaAPEevby4Q9kqRc6wUB4UBnX2nVZLav0Z6.webp",
        name: "Sheila Mazza",
        headline: "Experienced, patient teacher",
        bio: "I am a qualified TEFL teacher with a degree in teaching English. I'm very patient and committed to helping students make progress.",
      ),
      // ShadowCompany: Add more data if needed
    ];
  }

  @override
  Future<TeacherEntity> getTeacherDetails(String id) async
  {
    // ShadowCompany: Mock data for teacher details
    return TeacherEntity(
      id: "98247969240911872",
      photo: "https://api.fluency.live/storage/teachers/98247969240911872/photo/Byk6MRaAPEevby4Q9kqRc6wUB4UBnX2nVZLav0Z6.webp",
      name: "Sheila Mazza",
      headline: "Experienced, patient teacher",
      bio: "I am a qualified TEFL teacher with a degree in teaching English. I'm very patient and committed to helping students make progress.",
      accent: "American",
      nationality: "Brazilian",
      video: "storage/teachers/98247969240911872/video/ukBybSqyKP8ql8GXD3OZgN9FIRoEK5wa0YdHypqy.mp4",
    );
  }
}