// lib/main.dart

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data_model.dart';
// Note: These imports assume you have placed the files in lib/widgets/
import 'widgets/glass_card.dart';
import 'widgets/animated_section.dart';
import 'widgets/image_gallery.dart';

void main() {
  runApp(const ResumeApp());
}

// --- APP ROOT ---
class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magdelina James - Software Engineer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey,
          ),
          bodyLarge: TextStyle(fontSize: 16),
        ),
      ),
      // The main wrapper class is ResponsiveBreakpoints.builder
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,

        breakpoints: [
          const Breakpoint(start: 0.0, end: 450.0, name: MOBILE),
          const Breakpoint(start: 450.0, end: 800.0, name: TABLET),
          const Breakpoint(start: 800.0, end: 1200.0, name: DESKTOP),
        ],
      ),
      home: const ResumeHomePage(),
    );
  }
}

// --- MAIN PAGE ---
class ResumeHomePage extends StatelessWidget {
  const ResumeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Gradient Background for the Glassmorphism effect
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF8E2DE2),
                  Color(0xFF4A00E0),
                ], // Deep Purple Gradient
              ),
            ),
          ),
          // Scrollable Content
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 250, // Large banner area
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'MAGDELINA J.',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: const HeaderBackground(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  // Container for content, ensuring it's centered and has padding
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const HeaderSection(),
                          const SizedBox(height: 50),
                          AnimatedSection(child: const SkillsSection()),
                          const SizedBox(height: 50),
                          AnimatedSection(
                            delay: const Duration(milliseconds: 150),
                            child: const ProjectsSection(),
                          ),
                          const SizedBox(height: 50),
                          AnimatedSection(
                            delay: const Duration(milliseconds: 300),
                            child: const EducationSection(),
                          ),
                          const SizedBox(height: 50),
                          const CertificationsSection(),
                          const SizedBox(height: 50),
                          const ActivitiesSection(),
                          const SizedBox(height: 50),
                          const FooterSection(),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- 1. Background Widget (SliverAppBar background) ---
class HeaderBackground extends StatelessWidget {
  const HeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset(
            'assets/images/profile.jpg',
            fit: BoxFit.cover,
            width: 150,
            height: 150,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.person, size: 150, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}

// --- 2. HEADER SECTION (Profile & Summary) ---
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Text(
            summary,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// --- 3. SKILLS SECTION ---
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECHNICAL SKILLS',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: technicalSkills.entries.expand((entry) {
              return entry.value.map(
                (skill) => Chip(
                  label: Text(
                    skill,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: const Color(
                    0xFF8E2DE2,
                  ).withOpacity(0.8), // Purple tone
                  elevation: 4,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// --- 4. PROJECTS SECTION ---
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PROJECTS PORTFOLIO',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 15),
          ...projectsList.map((project) => ProjectCard(project: project)),
        ],
      ),
    );
  }
}

// --- ProjectCard (UPDATED with Image Logic) ---
class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the layout based on screen width
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    // The Project Snapshot Image Widget
    final projectImage = InkWell(
      onTap: () {
        // Correctly pass the image path using MediaAsset for the Gallery Viewer
        ImageGalleryViewer.show(
          context,
          [MediaAsset(project.title, project.imagePath)],
          0,
          project.title,
        );
      },
      child: GlassCard(
        margin: EdgeInsets.zero,
        blur: 5,
        opacity: 0.2,
        padding: EdgeInsets.zero,
        borderRadius: 15,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            project.imagePath, // Uses the imagePath from the data model
            fit: BoxFit.cover,
            height: isMobile ? 150 : 200, // Fixed height for visual consistency
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(Icons.broken_image, size: 50, color: Colors.white70),
            ),
          ),
        ),
      ),
    );

    // The Project Description and Text Details
    final projectDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              project.isFeatured ? Icons.star : Icons.code,
              color: project.isFeatured ? Colors.amberAccent : Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Tech Stack: ${project.technology}',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white70,
          ),
        ),
        Text(
          'Role: ${project.role}',
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 12),
        Text(project.description, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () => _showProjectDetails(context, project),
          icon: const Icon(Icons.info_outline, color: Colors.cyanAccent),
          label: const Text(
            'View Full Details',
            style: TextStyle(color: Colors.cyanAccent),
          ),
        ),
      ],
    );

    // Responsive Container that wraps the details and image
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 30),
      blur: 10,
      opacity: 0.15,
      padding: const EdgeInsets.all(20),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                projectImage,
                const SizedBox(height: 20),
                projectDetails,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: projectDetails),
                const SizedBox(width: 30),
                Expanded(flex: 1, child: projectImage),
              ],
            ),
    );
  }

  void _showProjectDetails(BuildContext context, Project project) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF4A00E0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(project.title, style: const TextStyle(color: Colors.white)),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Role: ${project.role}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Text(
                'Technology: ${project.technology}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const Divider(color: Colors.white24),
              Text(
                project.description,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

// --- 5. EDUCATION SECTION ---
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('EDUCATION', style: Theme.of(context).textTheme.headlineLarge),
          const Divider(thickness: 2),
          const SizedBox(height: 15),
          ...educationList.map((edu) => EducationEntry(education: edu)),
        ],
      ),
    );
  }
}

class EducationEntry extends StatelessWidget {
  final Education education;
  const EducationEntry({required this.education, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.only(bottom: 15),
      blur: 5,
      opacity: 0.1,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            education.program,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Text(
            education.institution,
            style: const TextStyle(color: Colors.white70),
          ),
          Text(
            education.date,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 5),
          Text(education.details, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

// --- 6. CERTIFICATIONS SECTION (with Images) ---
class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      child: GlassCard(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CERTIFICATIONS',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
              ),
              itemCount: certificationsList.length,
              itemBuilder: (context, index) {
                final cert = certificationsList[index];
                return InkWell(
                  onTap: () => ImageGalleryViewer.show(
                    context,
                    certificationsList,
                    index,
                    'Certifications',
                  ),
                  child: GlassCard(
                    margin: EdgeInsets.zero,
                    blur: 5,
                    opacity: 0.1,
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: Image.asset(
                              cert.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.receipt,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cert.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- 7. ACTIVITIES SECTION (Photo Gallery) ---
class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: const Duration(milliseconds: 600),
      child: GlassCard(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROGRAM INVOLVEMENT & PHOTOS',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: activitiesList.length,
              itemBuilder: (context, index) {
                final activity = activitiesList[index];
                return InkWell(
                  onTap: () => ImageGalleryViewer.show(
                    context,
                    activitiesList,
                    index,
                    'Activity Photos',
                  ),
                  child: GlassCard(
                    margin: EdgeInsets.zero,
                    blur: 5,
                    opacity: 0.1,
                    padding: EdgeInsets.zero,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            activity.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.photo,
                                  color: Colors.white,
                                  size: 40,
                                ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            color: Colors.black54,
                            child: Text(
                              activity.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- 8. FOOTER SECTION ---
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: EdgeInsets.zero,
      blur: 20,
      opacity: 0.15,
      child: Column(
        children: [
          Text(
            'CONNECT WITH ME',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          const Divider(color: Colors.white30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.email, color: Colors.white, size: 30),
                onPressed: () => launchUrl(Uri.parse('mailto:$email')),
                tooltip: 'Email: $email',
              ),
              IconButton(
                icon: const Icon(Icons.phone, color: Colors.white, size: 30),
                onPressed: () => launchUrl(Uri.parse('tel:$phone')),
                tooltip: 'Phone: $phone',
              ),
              IconButton(
                icon: const Icon(Icons.link, color: Colors.white, size: 30),
                onPressed: () => launchUrl(Uri.parse(linkedInUrl)),
                tooltip: 'LinkedIn Profile',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
