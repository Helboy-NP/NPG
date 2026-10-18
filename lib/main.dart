import 'package:flutter/material.dart';

void main() {
  runApp(const NPStoreApp());
}

class NPStoreApp extends StatelessWidget {
  const NPStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NP Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF315C9B)),
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NP Store', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Pengaturan',
            onPressed: () => _showMessage(context, 'Pengaturan akan dibuat pada tahap berikutnya.'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Beranda', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Ringkasan pengelolaan toko', style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 18),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ringkasan Hari Ini', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(child: _SummaryItem(label: 'Penjualan', value: 'Rp 0', icon: Icons.point_of_sale_outlined)),
                      SizedBox(width: 12),
                      Expanded(child: _SummaryItem(label: 'Transaksi', value: '0', icon: Icons.receipt_long_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          const Text('Menu Utama', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _MenuCard(
            icon: Icons.point_of_sale_outlined,
            title: 'Penjualan',
            subtitle: 'Catat transaksi penjualan',
            onTap: () => _showMessage(context, 'Fitur Penjualan belum diaktifkan.'),
          ),
          _MenuCard(
            icon: Icons.inventory_2_outlined,
            title: 'Persediaan',
            subtitle: 'Kelola barang dan stok',
            onTap: () => _showMessage(context, 'Fitur Persediaan belum diaktifkan.'),
          ),
          _MenuCard(
            icon: Icons.price_change_outlined,
            title: 'Daftar Harga',
            subtitle: 'Kelola daftar harga barang',
            onTap: () => _showMessage(context, 'Fitur Daftar Harga belum diaktifkan.'),
          ),
          _MenuCard(
            icon: Icons.receipt_outlined,
            title: 'Nota & Kartu Garansi',
            subtitle: 'Nota transaksi dan data garansi',
            onTap: () => _showMessage(context, 'Fitur Nota & Kartu Garansi belum diaktifkan.'),
          ),
          _MenuCard(
            icon: Icons.bar_chart_outlined,
            title: 'Laporan',
            subtitle: 'Lihat laporan penjualan dan keuntungan',
            onTap: () => _showMessage(context, 'Fitur Laporan belum diaktifkan.'),
          ),
          const SizedBox(height: 16),
          Text(
            'Master awal NP Store • Data saat ini masih contoh',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon, color: Theme.of(context).colorScheme.onPrimaryContainer),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
