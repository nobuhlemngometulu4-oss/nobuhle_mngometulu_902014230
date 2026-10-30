import 'package:flutter/material.dart';


void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mngometulu Nobuhles CV',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
    );
  }
}

// MAIN APP WITH FIVE PAGES
class CVHomePage extends StatefulWidget {
  const CVHomePage({super.key});

  @override
  State<CVHomePage> createState() => _CVHomePageState();
}

class _CVHomePageState extends State<CVHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    InformationPage(),
    EducationPage(),
    ExperiencePage(),
    CertificationsPage(),
  ];

  final List<String> titles = [
    'Home',
    'Information',
    'Education',
    'Experience',
    'Certificates',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        labelBehavior:
        NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Information',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Education',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Experience',
          ),
          NavigationDestination(
            icon: Icon(Icons.workspace_premium_outlined),
            selectedIcon: Icon(Icons.workspace_premium),
            label: 'Certificates',
          ),
        ],
      ),
    );
  }
}

// REUSABLE SECTION TITLE
Widget sectionTitle(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        Icon(icon, color: Colors.pink, size: 26),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

// REUSABLE CARD
Widget infoCard(Widget child) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: child,
    ),
  );
}

// REUSABLE CLICKABLE LINK
Widget professionalLink({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  required String url,
}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.pink,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.open_in_new),



    ),
  );
}

// PAGE 1: HOME
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 65,
              backgroundColor: Colors.pink,
              backgroundImage:AssetImage('images/buhle.jpg'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Mngometulu Senamile Nobuhle',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Bachelor of Science in Information Technology Student',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.pink,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'ABOUT ME',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'I am just a BSCIT student who is interested in Web Development.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            const Icon(
              Icons.waving_hand,
              color: Colors.pink,
              size: 35,
            ),

            const SizedBox(height: 10),

            const Text(
              'Welcome to my digital CV!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PAGE 2: INFORMATION
class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Personal Information',
            Icons.person,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.badge,
                    color: Colors.pink,
                  ),
                  title: Text('Full Name'),
                  subtitle: Text('Mngometulu Nobuhle'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.pink,
                  ),
                  title: Text('Location'),
                  subtitle: Text('Eswatini'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.pink,
                  ),
                  title: Text('Occupation'),
                  subtitle: Text(
                    'Bachelor of Science in Information Technology Student',
                  ),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Contact Details',
            Icons.contact_mail,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  title: Text('Email Address'),
                  subtitle: Text('nobuhlemngometulu4@gmail.com'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  title: Text('Phone Number'),
                  subtitle: Text('78883276'),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Professional Links',
            Icons.link,
          ),

          professionalLink(
            context: context,
            icon: Icons.work,
            title: 'LinkedIn',
            subtitle: 'View my LinkedIn profile',
            url: 'https://www.linkedin.com/',
          ),

          professionalLink(
            context: context,
            icon: Icons.code,
            title: 'GitHub',
            subtitle: 'View my coding projects',
            url: 'https://github.com/',
          ),

          professionalLink(
            context: context,
            icon: Icons.language,
            title: 'Personal Portfolio',
            subtitle: 'View my portfolio website',
            url: 'https://example.com/',
          ),

          sectionTitle(
            'Career Objective',
            Icons.flag,
          ),

          infoCard(
            const Text(
              'To develop my knowledge and practical skills '
                  'in Information Technology, gain experience in '
                  'software development, and contribute to '
                  'technology-based solutions.',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

// PAGE 3: EDUCATION
class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      'Flutter',
      'Dart',
      'C++',
      'HTML',
      'CSS',
      'JavaScript',
      'Communication',
      'Teamwork',
      'Problem Solving',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'My Education',
            Icons.school,
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance,
                  size: 35,
                  color: Colors.pink,
                ),
                SizedBox(height: 12),
                Text(
                  'Bachelor of Science in Information Technology',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Limkokwing University of Creative Technology',
                ),
                SizedBox(height: 8),
                Text(
                  'Status: Currently studying',
                  style: TextStyle(color: Colors.pink),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Technical and Personal Skills',
            Icons.code,
          ),

          infoCard(
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) {
                return Chip(
                  avatar: const Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Colors.pink,
                  ),
                  label: Text(skill),
                  backgroundColor: Colors.pink.shade50,
                );
              }).toList(),
            ),
          ),

          sectionTitle(
            'Personal Strengths',
            Icons.star,
          ),

          infoCard(
            const Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.pink,
                  ),
                  title: Text('Eager to learn'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.pink,
                  ),
                  title: Text('Strong relationship-building skill'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.pink,
                  ),
                  title: Text('Technical troubleshooting'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// PAGE 4: EXPERIENCE AND PROJECTS
class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Projects and Experience',
            Icons.work,
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.phone_android,
                  color: Colors.pink,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'Mobile Application Development',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Developing Flutter applications and practising '
                      'user interface design, navigation, and '
                      'Dart.',
                ),
              ],
            ),
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.local_hospital,
                  color: Colors.pink,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'Patient Appointment System',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'An academic software project focused on '
                      'patient registration, appointment booking, '
                      'and appointment scheduling.',
                ),
              ],
            ),
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.pink,
                  size: 35,
                ),
                SizedBox(height: 12),
                Text(
                  'File Manager Project',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Learning to develop a graphical application '
                      'for browsing directories and managing files '
                      'and folders.',
                ),
              ],
            ),
          ),

          sectionTitle(
            'Experience Summary',
            Icons.assignment,
          ),

          infoCard(
            const Text(
              'My academic projects help me practise '
                  'programming, application design, debugging, '
                  'and problem-solving. Add any relevant work '
                  'experience or internship details here.',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

// PAGE 5: CERTIFICATIONS
class CertificationsPage extends StatelessWidget {
  const CertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(
            'Certifications and Training',
            Icons.workspace_premium,
          ),

          infoCard(
            const Column(
              children: [
                Icon(
                  Icons.workspace_premium,
                  size: 55,
                  color: Colors.pink,
                ),
                SizedBox(height: 12),
                Text(
                  'My Certificates',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Use this page to showcase certificates, '
                      'completed online courses, workshops, and '
                      'professional training.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Certificate Details',
            Icons.verified,
          ),

          infoCard(
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.pink,
                  ),
                  title: Text('Certificate Name'),
                  subtitle: Text(
                    'Introduction to computer Science',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.business,
                    color: Colors.pink,
                  ),
                  title: Text('Issuing Institution'),
                  subtitle: Text(
                    'Computer Networking Science',
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: Colors.pink,
                  ),
                  title: Text('Completion Date'),
                  subtitle: Text('20/09/2026'),
                ),
              ],
            ),
          ),

          sectionTitle(
            'Professional Development',
            Icons.trending_up,
          ),

          infoCard(
            const Text(
              'I am committed to improving my knowledge '
                  'of Information Technology through continuous '
                  'learning, practical projects, and relevant '
                  'professional training.',
              style: TextStyle(fontSize: 15),
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              'Keep learning and growing!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pink,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}