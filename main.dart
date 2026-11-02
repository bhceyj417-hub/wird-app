import 'package:flutter/material.dart';

void main() => runApp(const WirdApp());

const gold = Color(0xFFB88735);
const ink = Color(0xFF30291F);
const cream = Color(0xFFFFFBF4);

class WirdApp extends StatelessWidget {
  const WirdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'وِرد | WIRD',
      theme: ThemeData(
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: gold),
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int selected = 0;

  final pages = const [
    HomePage(),
    SimplePage(title: 'القرآن الكريم', subtitle: 'القرآن الكريم كاملاً — قريباً'),
    SimplePage(title: 'الخلفيات الإيمانية', subtitle: 'آيات قرآنية وأدعية وعبارات إيمانية'),
    SimplePage(title: 'التسبيح والأذكار', subtitle: 'مسبحة إلكترونية وأذكار يومية'),
    SimplePage(title: 'المزيد', subtitle: 'مواقيت الصلاة • القبلة • المساجد القريبة • الإعدادات'),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child: pages[selected]),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: gold.withOpacity(.15),
          selectedIndex: selected,
          onDestinationSelected: (i) => setState(() => selected = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'القرآن'),
            NavigationDestination(icon: Icon(Icons.wallpaper_outlined), label: 'الخلفيات'),
            NavigationDestination(icon: Icon(Icons.fingerprint), label: 'التسبيح'),
            NavigationDestination(icon: Icon(Icons.apps), label: 'المزيد'),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
      children: [
        const SizedBox(height: 8),
        const Center(child: Text('وِرد', style: TextStyle(fontSize: 42, color: gold, fontWeight: FontWeight.bold))),
        const Center(child: Text('W I R D', style: TextStyle(letterSpacing: 5, color: gold, fontSize: 13))),
        const SizedBox(height: 5),
        const Center(child: Text('كل يوم أقرب إلى الله', style: TextStyle(color: ink, fontSize: 16))),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFFD8B56F), Color(0xFFAA762B)]),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('الصلاة القادمة', style: TextStyle(color: Colors.white70, fontSize: 15)),
            SizedBox(height: 8),
            Text('المغرب', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            Text('سيتم عرض الوقت حسب موقعك بعد تفعيل الموقع', style: TextStyle(color: Colors.white, fontSize: 13)),
          ]),
        ),
        const SizedBox(height: 18),
        const SectionTitle('آية اليوم'),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text('﴿ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ ﴾',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 22, height: 1.8, color: ink)),
              SizedBox(height: 8),
              Text('سورة الرعد • 28', style: TextStyle(color: gold)),
            ]),
          ),
        ),
        const SizedBox(height: 18),
        const SectionTitle('أقسام وِرد'),
        GridView.count(
          crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.8,
          children: const [
            FeatureTile(icon: Icons.menu_book, title: 'القرآن الكريم'),
            FeatureTile(icon: Icons.auto_awesome, title: 'الأذكار'),
            FeatureTile(icon: Icons.wallpaper, title: 'الخلفيات الإيمانية'),
            FeatureTile(icon: Icons.fingerprint, title: 'المسبحة الإلكترونية'),
            FeatureTile(icon: Icons.explore, title: 'اتجاه القبلة'),
            FeatureTile(icon: Icons.mosque, title: 'المساجد القريبة'),
          ],
        ),
        const SizedBox(height: 18),
        const Card(child: ListTile(
          leading: Icon(Icons.notifications_active_outlined, color: gold),
          title: Text('تذكير بذكر الله'),
          subtitle: Text('إعداد التذكير كل ساعة سيكون متاحاً في الإعدادات'),
          trailing: Icon(Icons.chevron_left),
        )),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(text, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: ink)),
  );
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const FeatureTile({required this.icon, required this.title, super.key});
  @override
  Widget build(BuildContext context) => Card(
    elevation: 0.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: BorderSide(color: gold.withOpacity(.18))),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(children: [
        Icon(icon, color: gold, size: 27),
        const SizedBox(width: 10),
        Expanded(child: Text(title, style: const TextStyle(color: ink, fontWeight: FontWeight.w600))),
      ]),
    ),
  );
}

class SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  const SimplePage({required this.title, required this.subtitle, super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.auto_awesome, size: 48, color: gold),
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: ink)),
        const SizedBox(height: 8),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
      ]),
    ),
  );
}
