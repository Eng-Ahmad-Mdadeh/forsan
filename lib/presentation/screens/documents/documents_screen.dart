import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('المستندات', style: TextStyle(fontWeight: FontWeight.w800)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        _DocumentSummary(),
        SizedBox(height: 24),
        Text('ملفاتي', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
        SizedBox(height: 14),
        _DocumentTile(icon: Icons.badge_outlined, title: 'الهوية الوطنية', subtitle: 'أضف نسخة محدثة من هويتك'),
        SizedBox(height: 10),
        _DocumentTile(icon: Icons.description_outlined, title: 'مستندات أخرى', subtitle: 'احفظ مستنداتك للوصول السريع'),
      ],
    ),
  );
}

class _DocumentSummary extends StatelessWidget {
  const _DocumentSummary();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: const Color(0xFFEFECF5), borderRadius: BorderRadius.circular(20)),
    child: const Row(children: [
      Icon(Icons.shield_outlined, size: 36, color: Color(0xFF5C3F9C)),
      SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('مستنداتك بأمان', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        SizedBox(height: 4),
        Text('ارفع ملفاتك وأدرها من مكان واحد.', style: TextStyle(color: Color(0xFF665F6F))),
      ])),
    ]),
  );
}

class _DocumentTile extends StatelessWidget {
  const _DocumentTile({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_left_rounded),
    ),
  );
}
