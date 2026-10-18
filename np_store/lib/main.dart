import 'package:flutter/material.dart';

void main() {
  runApp(const NPStoreApp());
}

const Color bgColor = Color(0xFF101114);
const Color cardColor = Color(0xFF1B1D22);
const Color orangeColor = Color(0xFFFF8A00);
const Color mutedColor = Color(0xFF92949D);

class NPStoreApp extends StatelessWidget {
  const NPStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NP Store',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: orangeColor,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.storefront_rounded,
                      color: Colors.black,
                      size: 29,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NP STORE',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.3,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Management System',
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Selamat datang kembali, bro!',
                style: TextStyle(color: mutedColor, fontSize: 14),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFA126), Color(0xFFFF7900)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.black87,
                      size: 30,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'TOTAL PENJUALAN HARI INI',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Belum ada transaksi tercatat',
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Ringkasan',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Transaksi',
                      value: '0',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.inventory_2_outlined,
                      title: 'Stok Barang',
                      value: '0',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.payments_outlined,
                      title: 'Modal',
                      value: 'Rp0',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SummaryCard(
                      icon: Icons.trending_up_rounded,
                      title: 'Keuntungan',
                      value: 'Rp0',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                'Menu Utama',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const FeatureTile(
                icon: Icons.point_of_sale_rounded,
                title: 'Penjualan',
                subtitle: 'Catat transaksi penjualan HP',
              ),
              const FeatureTile(
                icon: Icons.inventory_2_rounded,
                title: 'Persediaan',
                subtitle: 'Kelola stok dan barang masuk',
              ),
              const FeatureTile(
                icon: Icons.price_change_rounded,
                title: 'Daftar Harga',
                subtitle: 'Atur harga modal dan harga jual',
              ),
              const FeatureTile(
                icon: Icons.receipt_long_rounded,
                title: 'Nota & Garansi',
                subtitle: 'Buat nota dan kartu garansi',
              ),
              const FeatureTile(
                icon: Icons.bar_chart_rounded,
                title: 'Laporan',
                subtitle: 'Lihat riwayat dan laporan transaksi',
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'NP Store • Versi 1.0.0',
                  style: TextStyle(color: mutedColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withAlpha(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: orangeColor, size: 25),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(color: mutedColor, fontSize: 12),
          ),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: orangeColor.withAlpha(25),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(icon, color: orangeColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: const TextStyle(color: mutedColor, fontSize: 11),
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: mutedColor,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title akan kita bangun berikutnya.'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
