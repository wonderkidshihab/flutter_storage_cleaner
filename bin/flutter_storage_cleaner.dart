import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty || args.first == 'help') {
    _printHelp();
    return;
  }

  switch (args.first) {
    case 'clean':
      final startDir = Directory.current;
      print('🔍 Searching for Flutter projects from: ${startDir.path}');
      await _cleanFlutterProjects(startDir);
      break;

    default:
      print('❌ Unknown command: ${args.first}');
      _printHelp();
  }
}

void _printHelp() {
  print('''
flutter_storage_cleaner - A tool to clean multiple Flutter project folders

Commands:
  flutter_storage_cleaner clean     Clean all Flutter projects under this directory
  flutter_storage_cleaner help      Show help
''');
}

Future<void> _cleanFlutterProjects(Directory root) async {
  int totalFound = 0;
  int cleanSuccess = 0;
  int cleanFailed = 0;

  final dirs = await _findFlutterProjects(root);

  if (dirs.isEmpty) {
    print('⚠️ No Flutter projects found.');
    return;
  }

  totalFound = dirs.length;

  print('\n📁 Found $totalFound Flutter project(s)\n');

  for (final dir in dirs) {
    print('🧹 Cleaning: ${dir.path}');

    final result = await Process.run(
      'flutter',
      ['clean'],
      workingDirectory: dir.path,
    );

    if (result.exitCode == 0) {
      print('   ✔ Cleaned successfully!\n');
      cleanSuccess++;
    } else {
      print('   ❌ Failed to clean.\n');
      cleanFailed++;
    }
  }

  print('''
===============================
✨ Summary
-------------------------------
Total Projects: $totalFound
Successfully Cleaned: $cleanSuccess
Failed: $cleanFailed
===============================
''');
}

Future<List<Directory>> _findFlutterProjects(Directory root) async {
  final List<Directory> projects = [];

  await for (final entity in root.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('pubspec.lock')) {
      projects.add(entity.parent);
    }
  }

  return projects;
}
