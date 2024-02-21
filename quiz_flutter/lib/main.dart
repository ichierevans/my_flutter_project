import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung Rata-rata Nilai', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.red, // Tema aplikasi
      ),
      home: const MyHomePage(), // Halaman utama aplikasi
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState(); // Perhatikan bahwa kelas _MyHomePageState tidak dinyatakan sebagai private.
}


class _MyHomePageState extends State<MyHomePage> {
  // Controller untuk nilai masing-masing mata pelajaran
  TextEditingController nilaiMtkController = TextEditingController();
  TextEditingController nilaiInggrisController = TextEditingController();
  TextEditingController nilaiBindoController = TextEditingController();
  TextEditingController bobotMtkController = TextEditingController();
  TextEditingController bobotInggrisController = TextEditingController();
  TextEditingController bobotBindoController = TextEditingController();

  // Variabel untuk menyimpan nilai masing-masing mata pelajaran dan rata-rata
  double nilaiMtk = 0.0;
  double nilaiInggris = 0.0;
  double nilaiBindo = 0.0;
  double rataRata = 0.0;

  // Bobot untuk setiap mata pelajaran
  double bobotMtk = 0.0;
  double bobotInggris = 0.0;
  double bobotBindo = 0.0;

  // Fungsi untuk menghitung rata-rata
  void _hitungRataRata() {
    setState(() {
      nilaiMtk = double.tryParse(nilaiMtkController.text) ?? 0.0;
      nilaiInggris = double.tryParse(nilaiInggrisController.text) ?? 0.0;
      nilaiBindo = double.tryParse(nilaiBindoController.text) ?? 0.0;
      bobotMtk = double.tryParse(bobotMtkController.text) ?? 0.0;
      bobotInggris = double.tryParse(bobotInggrisController.text) ?? 0.0;
      bobotBindo = double.tryParse(bobotBindoController.text) ?? 0.0;

      // Menghitung rata-rata berdasarkan bobot
      double totalBobot = bobotMtk + bobotInggris + bobotBindo;
      if (totalBobot > 0) {
        rataRata = (nilaiMtk * bobotMtk + nilaiInggris * bobotInggris + nilaiBindo * bobotBindo) / totalBobot;
      } else {
        rataRata = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Rata-rata Nilai'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input untuk nilai masing-masing mata pelajaran
            TextField(
              controller: nilaiMtkController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Matematika',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: nilaiInggrisController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Bahasa Inggris',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: nilaiBindoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Bahasa Indonesia',
              ),
            ),
            const SizedBox(height: 12.0),
            // Input untuk bobot masing-masing mata pelajaran
            TextField(
              controller: bobotMtkController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Matematika',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: bobotInggrisController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Bahasa Inggris',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: bobotBindoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Bahasa Indonesia',
              ),
            ),
            const SizedBox(height: 24.0),
            // Tombol untuk menghitung rata-rata
            ElevatedButton(
              onPressed: _hitungRataRata,
              child: const Text('Hitung Rata-rata'),
            ),
            const SizedBox(height: 24.0),
            // Menampilkan hasil rata-rata
            Text(
              'Rata-rata Nilai: $rataRata',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
