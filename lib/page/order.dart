import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String nama;
  final int harga;
  final String imgUrl;

  const OrderPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.imgUrl,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _jumlahController = TextEditingController();
  int totalHarga = 0;
   bool showTotal = false;

  void _hitungTotal() {
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    setState(() {
      totalHarga = jumlah * widget.harga;
      showTotal = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
        backgroundColor: const Color(0xFFFFE6E1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //gambar menu
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.imgUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            //nama & harga
            Text(
              widget.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Harga: Rp ${widget.harga}",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            //input jumlah
            TextField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Masukkan Jumlah",
              ),
            ),
            const SizedBox(height: 16),

            //tombol Submit
           ElevatedButton(
              onPressed: _hitungTotal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            //total Harga
            Text(
              "Total Harga: Rp $totalHarga",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
