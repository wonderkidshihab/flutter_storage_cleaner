# Flutter Storage Cleaner

A powerful CLI tool to recursively scan directories and clean multiple Flutter projects at once. Reclaim disk space by removing build artifacts from all your Flutter projects in a single command.

## 🚀 Features

- **Recursive Scanning**: Automatically finds all Flutter projects in subdirectories.
- **Bulk Cleaning**: Runs `flutter clean` on every detected project.
- **Detailed Summary**: Provides a report of successful and failed cleaning operations.
- **Space Saver**: Frees up significant storage space occupied by `build/` and `.dart_tool/` directories.

## 📦 Installation

Install the package globally using Dart:

```bash
dart pub global activate flutter_storage_cleaner
```

## 🛠 Usage

### Clean All Projects

Navigate to your workspace folder (or any folder containing Flutter projects) and run:

```bash
flutter_storage_cleaner clean
```

This command will:
1. Scan the current directory and all subdirectories for `pubspec.lock` files.
2. Identify Flutter projects.
3. Execute `flutter clean` in each project found.
4. Display a progress report and final summary.

### Help Command

To see available commands:

```bash
flutter_storage_cleaner help
```

## 📝 Example Output

```text
🔍 Searching for Flutter projects from: /Users/username/Workspace

📁 Found 3 Flutter project(s)

🧹 Cleaning: /Users/username/Workspace/project_a
   ✔ Cleaned successfully!

🧹 Cleaning: /Users/username/Workspace/project_b
   ✔ Cleaned successfully!

🧹 Cleaning: /Users/username/Workspace/project_c
   ✔ Cleaned successfully!

===============================
✨ Summary
-------------------------------
Total Projects: 3
Successfully Cleaned: 3
Failed: 0
===============================
```

## 🤝 Contributing

Contributions are welcome! If you have ideas for new features (like parallel cleaning, ignore patterns, or dry-run mode), feel free to open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License.
