import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Ürün listesi
  List<Map<String, dynamic>> urunler = [
    {"ad": "Kahve ☕", "fiyat": 50},
    {"ad": "Magnolya 🍰", "fiyat": 70},
    {"ad": "Çilekli Pasta 🍓", "fiyat": 90},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mini Katalog"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const Text(
                "Ürünlerimiz:",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // ✅ Liste kısmı
              Expanded(
                child: ListView.builder(
                  itemCount: urunler.length,
                  itemBuilder: (context, index) {
                    final urun = urunler[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 10),

                      
                      child: ListTile(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetaySayfasi(urun: urun),
      ),
    );
  },

  title: Text(
    urun["ad"],
    style: const TextStyle(fontSize: 18),
  ),


                        subtitle: Text(
                          "${urun["fiyat"]} TL",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.pink,
                          ),
                        ),

                        // ❌ Silme butonu
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              urunler.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ✅ Ürün ekle butonu
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    urunler.add({"ad": "Yeni Ürün 🛒", "fiyat": 100});
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("Ürün Ekle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DetaySayfasi extends StatelessWidget {
  final Map<String, dynamic> urun;

  const DetaySayfasi({super.key, required this.urun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(urun["ad"]),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  urun["ad"],
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "${urun["fiyat"]} TL",
                  style: const TextStyle(fontSize: 22, color: Colors.pink),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Geri Dön"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}