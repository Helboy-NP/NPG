# NP Store — Master Awal

Ini adalah bahan awal proyek aplikasi Android NP Store.

## Struktur
- `lib/main.dart` — kode aplikasi dan halaman beranda awal.
- `pubspec.yaml` — konfigurasi proyek Flutter.
- `assets/images/` — tempat menyimpan gambar/logo yang nanti ditentukan.
- `docs/RENCANA_FITUR.md` — daftar fitur awal proyek.
- `.gitignore` — file yang tidak perlu dimasukkan ke Git.

## Status saat ini
Halaman beranda adalah kerangka awal. Menu Penjualan, Persediaan, Daftar Harga, Nota & Kartu Garansi, dan Laporan masih berupa placeholder; belum menyimpan data.

## Menyiapkan proyek Flutter lengkap
Folder ini berisi file sumber awal, bukan seluruh file platform Android. Di komputer atau Codespaces dengan Flutter terpasang, masuk ke folder proyek ini dan jalankan:

```bash
flutter create .
flutter pub get
flutter run
```

Periksa perubahan file sebelum menjalankan `flutter create .` jika folder sudah berisi pekerjaan lain.
Untuk APK release:

```bash
flutter build apk --release
```
