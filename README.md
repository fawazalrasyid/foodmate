
# FoodMate - Accompany Your Healthy Journey.

FoodMate dapat membantu memenuhi kebutuhan nutrisi harian dan menjalankan hidup sehat. Dengan menyarankan makanan yang memenuhi kebutuhan harian bahkan hanya dengan bahan-bahan yang ada dirumah/kulkas. Selain itu, dengan menyediakan informasi nutrisi pada suatu makanan dilengkapi dengan komposisi dan waktu yang baik untuk mengkonsumsi makanan tersebut.

Dalam mengembangkan aplikasi ini, kami menggunakan pendekatan teknologi kecerdasan buatan (Artificial Intelligence/AI), pembelajaran mesin (Machine Learning/ML), dan data besar (Big Data) untuk menghasilkan rekomendasi makanan yang tepat bagi pengguna berdasarkan profil nutrisi, kebutuhan kalori, dan preferensi makanan.

## Getting Started

All that you need is flutter installation, see here: https://docs.flutter.dev/

## Prerequisites

There are several things that you need to do to run this project perfectly:
- Prepare you Google Maps API with this following API service enabled : `Directions API, Distance Matrix API, Geocoding API, Geolocation API,
Maps SDK for Android, Maps SDK for iOS, Places API`. [See More](https://developers.google.com/maps/apis-by-platform)
- prepare you favorite code editor (Android Studio, Visual Studio Code)
- phone emulator

## Installation

1. cloning this project
2. rename `constants.example` to `constants.dart`
3. rename `AndroidManifest.example` to `AndroidManifest.xml`
4. fill `constants.dart` with this following value:
```
static const String baseUrl = 'http://86.48.23.118:5000'; //foodmate image detection API
static const String mapsApiKey = 'Fill with your Google Maps API Key';
```
5. `flutter pub get`
6. run

## Deployment

to build this project to .apk run  `flutter build apk`

# Documentation
1. install file apk yang sudah di sediakan
2. login dengan akun testing
```
email: nafidinara@gmail.com
password: Afara123
```
atau register dan lakukan verifikasi email.

3. aktifkan permission `lokasi` dan `kamera`

4. Nikmati pengalaman menggunakan FoodMate.

## NOTES
Karena keterbatasan dataset, mungkin tidak semua gambar atau foto dapat terdeteksi, gunakan sampel gambar dibawah ini untuk hasil yang lebih maksimal:

![nasi goreng](https://i.ibb.co/kmwz0jD/Nasi-Goreng-3-1939146249.jpg)

![sate](https://i.ibb.co/yh2xbC4/the-origins-of-sate-the-history-behind-its-delicacy-170623y.jpg)

![ayam tulang lunak](https://i.ibb.co/c2DpTWP/Resep-Ayam-goreng-tulang-lunak.webp)

## APK

klik link ini untuk mendapatkan file apk: [klik disini.](https://drive.google.com/drive/folders/1FwG7YArpprzu71JbjNfKz_TkbvAza8WW?usp=sharing)

## Authors

  - **Fawaz Al Rasyid** - *From Distancing Reborn* for Find-IT