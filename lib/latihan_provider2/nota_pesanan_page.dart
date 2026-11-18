
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'resto_provider.dart';

class NotaPesananPage extends StatelessWidget {
  const NotaPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Pesanan'),

        actions: [
         
          Consumer<RestoProvider>(
            builder: (context, resto, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: FilledButton.tonal(
                  onPressed: resto.pesanan.isEmpty
                      ? null
                      : () {
                          context
                              .read<RestoProvider>()
                              .kosongkanPesanan();
                        },
                  child: const Text('Reset'),
                ),
              );
            },
          ),
        ],
      ),

     
      body: Consumer<RestoProvider>(
        builder: (context, resto, child) {
          final listPesanan = resto.pesanan;

         
          if (listPesanan.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada pesanan yang dipilih',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            );
          }

          return Column(
            children: [
              // Daftar pesanan
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: listPesanan.length,
                  itemBuilder: (context, index) {
                    final p = listPesanan[index];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(
                          'Menu ID: ${p['id']}',
                        ),

                        subtitle: Text(
                          'Jumlah: ${p['jumlah']} '
                          'x Rp ${p['harga']} '
                          '= Rp ${p['subtotal']}',
                        ),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),

                          tooltip: 'Hapus pesanan',

                          onPressed: () {
                           
                            context
                                .read<RestoProvider>()
                                .hapusItemPesanan(
                                  p['id'].toString(),
                                );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

          
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest,
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Bayar:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Rp ${resto.totalBayar}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
