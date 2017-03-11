# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Program.create( :name => "Master of Computer Science", :acronym => "MCS", :is_thesis => false)
Program.create( :name => "Master of Engineering in Computer Science", :acronym => "MEN", :is_thesis => false)
Program.create( :name => "Master of Science in Computer Science", :acronym => "MSCS", :is_thesis => true)
Program.create( :name => "Master of Science in Computer Engineering", :acronym => "MSCE", :is_thesis => true)
Course.create( :department => "CSCE", :number => 601, :name => "Programming with C and Java", :credit => 3, :description => "Survey of the C and Java programming languages, including principles of procedural and object-oriented languages; multi-disciplinary applications including business, Internet and engineering problems. Prerequisite: Graduate classification.")
Course.create( :department => "CSCE", :number => 602, :name => "Object-Oriented Programming, Development and Software Engineering", :credit => 3, :description => "Teaches Object-Oriented Programming in C++; software engineering techniques presented to teach how to build high quality software; semester project gives quasi-real-world experience with issues such as requirements capture and object-orient development. Prerequisites: CSCE 601 or approval of instructor; graduate classification.")
Course.create( :department => "CSCE", :number => 603, :name => "Database Systems and Applications", :credit => 3, :description => "Introduction to the concepts and design methodologies of database systems for non-computer science majors; emphasis on E. F. Codd's relational model with hands-on design application. No credit will be given for both CSCE 310 and CSCE 603. Prerequisites: CSCE 601; graduate classification.")
Course.create( :department => "CSCE", :number => 604, :name => "Programming Languages", :credit => 3, :description => "Study in the design space of programming languages, covering language processing, formalisms to describe semantics of programming languages, important concepts found in current programming languages, and programming paradigms. Prerequisite: Graduate classification.")
Course.create( :department => "CSCE", :number => 605, :name => "Compiler Design", :credit => 3, :description => "Advanced topics in compiler writing; parser generators and compiler-compilers; dynamic storage and scope resolution; data flow analysis and code optimization. Prerequisite: CSCE 434.")
Course.create( :department => "CSCE", :number => 606, :name => "Software Engineering", :credit => 3, :description => "Development of advanced concepts in software engineering; software development environments as a mechanism for enhancing productivity and software quality; the classification, evaluation and selection of methodologies for environments; rapid prototyping and reusability concepts; artificial intelligence techniques applied to software engineering. Prerequisite: CSCE 431 or approval of instructor.")
Course.create( :department => "CSCE", :number => 608, :name => "Database Systems", :credit => 3, :description => "Database modeling techniques; expressiveness in query languages including knowledge representation; manipulation languages data models; physical data organization; relational database design theory; query processing; transaction management and recovery; distributed data management. Prerequisite: CSCE 310 or CSCE 603.")
Course.create( :department => "CSCE", :number => 610, :name => "Hypertext/Hypermedia Systems", :credit => 3, :description => "Comprehensive coverage of Hypertext/Hypermedia; basic concepts and definitions; fundamental components, architectures and models; problems and current solutions; design and implementation issues; and research issues. Prerequisites: CSCE 310 or CSCE 603; CSCE 313.")
Course.create( :department => "CSCE", :number => 611, :name => "Operating Systems and Applications", :credit => 3, :description => "Review of computer architecture hardware/software evolution leading to contemporary operating systems; basic operating systems concepts; methods of operating systems design and construction; algorithms for CPU scheduling memory and general resource allocation; process coordination and management; case studies of several operating systems; quality-of-services of operating systems and their impact on applications. No credit will be given for both CSCE 410 and CSCE 611. Prerequisites: CSCE 313; graduate classification.")
Course.create( :department => "CSCE", :number => 612, :name => "Applied Networks and Distributed Processing", :credit => 3, :description => "Fundamentals, including network design and protocol analysis, in the context of computer communications; mixes fundamentals with both programming and pragmatic views of engineering issues; it includes network architecture as well as principles of network engineering; focus is on applying principles of layered architecture to analyzing real networks; lab exercises focus on protocol understanding and programming; knowledge of UNIX and C programming helpful, but not required. No credit will be given for both CSCE 463 and CSCE 612. Prerequisite: Graduate classification.")
Package.create( :number => 1)
Package.create( :number => 2)
Package.create( :number => 3)
Package.create( :number => 4)
Package.create( :number => 5)
Semester.create( :term => "Spring", :year => 2017)
Semester.create( :term => "Fall", :year => 2017)
Semester.create( :term => "Spring", :year => 2018)
Student.create( :firstname => "Johana", :lastname => "Rueda", :email => "xxx@tamu.edu", :password => "xxx", :is_f1 => false, :program_id => 1)
Student.create( :firstname => "Yining", :lastname => "Bao", :email => "yyy@tamu.edu", :password => "yyy", :is_f1 => true, :program_id => 2)
Student.create( :firstname => "Andres", :lastname => "Gonzalez", :email => "xxx@tamu.edu", :password => "xxx", :is_f1 => true, :program_id => 3)
Student.create( :firstname => "Shijin", :lastname => "Tang", :email => "yyy@tamu.edu", :password => "yyy", :is_f1 => true, :program_id => 4)
Student.create( :firstname => "Jingjia", :lastname => "Li", :email => "xxx@tamu.edu", :password => "xxx", :is_f1 => false, :program_id => 1)
ProgramCoursePackageship.create( :program_id => 1, :course_id => 1, :package_id => 1)
ProgramCoursePackageship.create( :program_id => 1, :course_id => 2, :package_id => 1)
ProgramCoursePackageship.create( :program_id => 1, :course_id => 3, :package_id => 2)
ProgramCoursePackageship.create( :program_id => 1, :course_id => 4, :package_id => 2)
ProgramCoursePackageship.create( :program_id => 1, :course_id => 5, :package_id => 2)
ProgramCoursePackageship.create( :program_id => 2, :course_id => 1, :package_id => 1)
ProgramCoursePackageship.create( :program_id => 2, :course_id => 6, :package_id => 1)
ProgramCoursePackageship.create( :program_id => 2, :course_id => 2, :package_id => 2)
ProgramCoursePackageship.create( :program_id => 3, :course_id => 1, :package_id => 1)
ProgramCoursePackageship.create( :program_id => 4, :course_id => 3, :package_id => 1)
StudentCourseSemestership.create( :student_id => 1, :course_id => 6, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 1, :course_id => 4, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 1, :course_id => 1, :semester_id => 2)
StudentCourseSemestership.create( :student_id => 2, :course_id => 6, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 3, :course_id => 4, :semester_id => 1)
StudentCourseSemestership.create( :student_id => 4, :course_id => 1, :semester_id => 2)
StudentCourseSemestership.create( :student_id => 5, :course_id => 1, :semester_id => 2)

