import 'package:isar/isar.dart';
//used to generate a file
//then run: dart run build_runner build
part 'note.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
