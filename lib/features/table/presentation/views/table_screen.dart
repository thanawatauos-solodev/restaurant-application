import 'package:flutter/material.dart';
import 'package:restaurant_application/core/theme/app_colors.dart';
import 'package:restaurant_application/features/table/presentation/widgets/table_item.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tables = List.generate(10, (index) => index + 1);

    return Scaffold(
      backgroundColor: AppColors.softWhite,
      appBar: AppBar(title: const Text('จองโต๊ะ'), centerTitle: true),
      body: GridView.builder(
        itemCount: tables.length,
        padding: const EdgeInsets.all(10),
        scrollDirection: .vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final tableNumber = tables[index];
          final isReserved = index % 3 == 0;
          final statusText = isReserved ? 'จองแล้ว' : 'ว่าง';
          final statusColor = isReserved
              ? Colors.redAccent
              : Colors.greenAccent.shade400;
      
          return TableItem(
            number: tableNumber,
            statusText: statusText,
            statusColor: statusColor,
            capacity: 4,
          );
        },
      ),
    );
  }
}
