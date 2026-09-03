import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('طلباتي', style: TextStyle(fontWeight: FontWeight.w800))),
    body: const _EmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'لا توجد طلبات بعد',
      message: 'ستظهر هنا جميع طلباتك وحالتها عند إضافتها.',
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add_rounded),
      label: const Text('طلب جديد'),
    ),
  );
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.title, required this.message});
  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          radius: 42,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF77727F), height: 1.5)),
      ]),
    ),
  );
}
