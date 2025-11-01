// lib/data_model.dart

// --- 1. Core Profile Data ---
const String name = 'MAGDELINA ANAK JAMES';
const String title = 'SOFTWARE ENGINEER';
const String summary =
    'A highly motivated final-year Software Engineering student specializing in full-stack web and mobile development. Proven expertise in modern frameworks including Laravel, Flutter, and React, with a strong focus on integrating advanced technologies like Artificial Intelligence (AI). I possess a solid understanding of Agile (Scrum) methodologies, ensuring robust project configuration, management, and seamless deployment. Dedicated to delivering scalable, user-centric software solutions from conceptualization through testing.';

// --- 2. Contact Information ---
const String phone = '+6 011-16235876';
const String email = 'magdelinajames26@gmail.com';
const String linkedInUrl =
    'https://www.linkedin.com/in/magdelina-james-166955256/';

// --- 3. Education Model ---
class Education {
  final String institution;
  final String program;
  final String date;
  final String details;

  Education(this.institution, this.program, this.date, this.details);
}

final List<Education> educationList = [
  Education(
    'Sultan Idris Education University (UPSI), Tanjung Malim, Perak',
    'Bachelor of Software Engineering (Education Software) with Honors',
    '2022 - 2026 (Expected)',
    'CGPA: 3.71. Dean\'s List: 5 semesters. Key focus areas include full-stack development, AI integration, Machine Learning, and UI/UX prototyping.',
  ),
  Education(
    'Labuan Matriculation College, Labuan',
    'MATRICULATION PROGRAMME COMPUTER SCIENCE (SCIENCE MODULE 3)',
    'Completion: August 2022',
    'CGPA: 3.67. Focused on core computer science and science fundamentals.',
  ),
];

// --- 4. Technical Skills ---
const Map<String, List<String>> technicalSkills = {
  'Languages': [
    'Dart',
    'JavaScript',
    'PHP',
    'Python',
    'Java',
    'C++',
    'HTML',
    'CSS',
  ],
  'Frameworks': ['Flutter', 'Laravel', 'React', 'Node.js', 'Express.js'],
  'Databases': ['MySQL', 'MongoDB', 'Firebase'],
  'Concepts': [
    'Scrum/Agile Development',
    'OOP',
    'REST APIs',
    'AI Integration',
    'UI/UX Prototyping',
    'Software Testing',
  ],
  'DevOps/Tools': [
    'Git/GitHub',
    'Visual Studio',
    'Figma',
    'Postman',
    'Android Studio',
  ],
};

// --- 5. Projects Model (FIXED & POPULATED) ---
class Project {
  final String title;
  final String role;
  final String technology;
  final String description;
  final String imagePath; // <-- CORRECT: This is the final field
  final bool isFeatured; // Highlight top projects

  Project(
    this.title,
    this.role,
    this.technology,
    this.description,
    this.imagePath, { // <-- CORRECT: Image path is required in the constructor
    this.isFeatured = false,
  });
  // NOTE: I removed the redundant and incorrect 'String? get imagePath => null;'
  // which caused the bug.
}

final List<Project> projectsList = [
  Project(
    'InterPrep: Your Personal Job Interview Coach (FYP)',
    'Lead Developer/AI Integrator',
    'Python (Backend), React (Frontend), OpenAI GPT, Microsoft Azure AI',
    'A state-of-the-art AI-powered application designed to provide comprehensive, real-time interview preparation. Integrated resume screening, real-time mock interviews, and NLP-based question prediction using advanced AI models. Key demonstration of full-stack, AI integration, and project management skills.',
    'assets/projects/interprep_screen.jpg', // Placeholder
    isFeatured: true,
  ),
  Project(
    'Student Recipe Book App (Flutter Mobile)',
    'Mobile Developer',
    'Flutter, Firebase (Authentication, Firestore Database)',
    'Built a fully functional mobile recipe management application. Focused on implementing clean architecture, intuitive UI/UX, and leveraging Firebase for real-time data storage and user authentication.',
    'assets/projects/recipe_home.jpg', // Placeholder
    isFeatured: true,
  ),
  Project(
    'UPSI Adventure Park RAMS Form',
    'Business Analyst / Developer',
    'Laravel, MySQL, Bootstrap',
    'Developed a robust, secure web application for the digitalized Risk Assessment and Management System (RAMS) forms. The project adhered strictly to structured project configuration and SCRUM methodology, enhancing data integrity and compliance procedures.',
    'assets/projects/rams_form.jpg', // Placeholder
  ),
  Project(
    'Kanji Tracing App',
    'Concept Designer & Developer',
    'Vite + React.js',
    'Designed and developed an interactive learning application for tracing and studying Japanese Kanji characters, incorporating gamification elements to improve user retention and engagement.',
    'assets/projects/kanji_app.jpg', // Placeholder
  ),

  Project(
    'Human Anatomy 3D Learning App',
    'UI Developer',
    'Flutter, Dart, 3D Rendering Libraries',
    'Created a responsive and interactive mobile application that visualizes human anatomy in 3D for learning purposes. Optimized graphics rendering for various mobile screen sizes and performance.',
    'assets/projects/anatomy_3d.jpg', // Placeholder
  ),
];

// --- 6. Certifications & Activities ---
class MediaAsset {
  final String title;
  final String imagePath;
  MediaAsset(this.title, this.imagePath);
}

final List<MediaAsset> certificationsList = [
  MediaAsset('Microsoft Azure AI Fundamentals', 'assets/certs/azure_ai.jpeg'),
  MediaAsset('Laravel Mastery 1.0 & 2.0', 'assets/certs/laravel_mastery.jpeg'),
  MediaAsset('AI Workshop - Pepper Labs', 'assets/certs/ai_workshop.jpg'),
  MediaAsset('Coding Kick-Start', 'assets/certs/codingkickstart.jpg'),
];

final List<MediaAsset> activitiesList = [
  MediaAsset(
    'Emcee, for Faculty and Association-organized programmes',
    'assets/activities/emcee.jpg',
  ),
  MediaAsset(
    'Vice Secretary, DICRATHON 2024',
    'assets/activities/dicrathon.jpg',
  ),
  MediaAsset(
    'Exco of Public & International Relations',
    'assets/activities/exco_pr.png',
  ),
  MediaAsset(
    'Volunteer, Sentuhan Kasih Bitara',
    'assets/activities/sentuhan_kasih.jpg',
  ),
];
