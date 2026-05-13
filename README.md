note_app_sqlite
Deskripsi Project
note_app_sqlite adalah aplikasi catatan sederhana berbasis Flutter yang terinspirasi dari Google Keep.
Aplikasi ini memungkinkan pengguna untuk:

Menambahkan catatan
Menyimpan data secara lokal menggunakan SQLite
Mengedit catatan
Menghapus catatan
Menggunakan mode terang dan gelap (Light/Dark Mode)
Aplikasi dibuat menggunakan Flutter dan database lokal SQLite melalui package sqflite.

Tampilan Aplikasi
Halaman Home (Light Mode)
Pada halaman utama:

Menampilkan daftar catatan
Tombol tambah catatan (FloatingActionButton)
Tombol ganti tema
Card catatan seperti Google Keep
Halaman Home (Dark Mode)
Fitur:

Background hitam
Card biru
Tema otomatis berubah sesuai tombol mode
Halaman Tambah Catatan
Halaman ini digunakan untuk:

Menulis judul catatan
Menulis isi catatan
Menyimpan data ke SQLite
Tujuan Project
Tujuan dibuatnya aplikasi ini adalah:

Mempelajari Flutter Layout
Memahami Stateful Widget
Belajar navigasi antar halaman
Memahami database lokal SQLite
Belajar CRUD (Create, Read, Update, Delete)
Menggunakan package Flutter
Teknologi yang Digunakan
Teknologi	Fungsi
Flutter	Framework aplikasi
Dart	Bahasa pemrograman
SQLite	Database lokal
sqflite	Package SQLite Flutter
path	Mengatur lokasi database
path_provider	Mengambil folder penyimpanan
Material Design	Desain UI aplikasi

lib/
│
├── models/
│   └── note_model.dart
│
├── pages/
│   ├── note_page.dart
│   └── home_page.dart
│
├── services/
│   └── database_helper.dart
│
├── theme/
│   └── app_theme.dart
│
├── widgets/
│   ├── confirm_dialog.dart
│   └── note_card.dart
│
└── main.dart
<img width="382" height="478" alt="Screenshot 2026-05-13 103520" src="https://github.com/user-attachments/assets/dbba213f-f4b8-4139-91fa-0ff2d93b9928" />
<img width="381" height="476" alt="Screenshot 2026-05-13 103454" src="https://github.com/user-attachments/assets/db3c33b3-2673-4f0e-98bb-c3bdb7abbb79" />
<img width="384" height="474" alt="Screenshot 2026-05-13 103439" src="https://github.com/user-attachments/assets/bff9e1f4-c1ff-4a74-b72d-28c13f99c280" />
