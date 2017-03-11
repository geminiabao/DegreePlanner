# README


## TSJ 0309


- [x] Initial set up
- [x] Create five models (Student, Course, Semester, StudentCourseSemestership and Program)
- [x] Test the relationship between models


To do:  


1. add other 2 models
2. input proper test dataset in db:seed
3. implement Yining's user model


### initial setup


```bash
$ mkdir projects
$ cd projects
$ rails new degreePlanner --skip-test-unit
$ cd degreePlanner
$ bundle install
$ bin/rails server
# ctrl+c to close server if it works well
$ r db:create
```


### create 5 models


```bash
$ rg model student firstname:string lastname:string email:string password:string f1status:string program_id:integer
$ rg model course department:string number:integer name:string credit:integer prerequisite:text
$ rg model semester term:string year:integer
$ rg model student_course_semestership student_id:integer course_id:integer semester_id:integer
$ rg model program name:string acronym:string is_thesis:boolean
$ bin/rake db:migrate
```


### modify models


Then add relationship to models


### test in rails console


#### test program, student; one to many


```ruby
p1 = Program.new(:name => 'Master of Computer Science', :acronym => 'MCS',:is_thesis => false)
p1.save

st1 = Student.new(:firstname=> 'Skin',:lastname=>'Melon',:program => p1)
st1.save
st2 = Student.create(:firstname=> 'Shawn',:lastname=>'Tang',:program_id => p1.id)
p1.students.all
st2.program
## multi program
p2 = Program.create(:name => 'Master of Engineering in Computer Science', :acronym => 'MEN',:is_thesis => false)
```


#### test 3 many to many


```ruby
# set up semeter and course
se1 = Semester.create(:term=>'Fall',:year=>'2016')
se2 = Semester.create(:term=>'Spring',:year=>'2017')
c1 = Course.create(:department => 'CSCE', :number=>'606')
c2 = Course.create(:department => 'MEEN', :number=>'636')
c3 = Course.create(:department => 'CVEN', :number=>'686')

# set up ship
StudentCourseSemestership.create(:student=>st1, :course=>c1, :semester=>se1)
StudentCourseSemestership.create(:student=>st1, :course=>c2, :semester=>se1)
StudentCourseSemestership.create(:student=>st1, :course=>c3, :semester=>se2)
StudentCourseSemestership.create(:student=>st2, :course=>c3, :semester=>se1)
StudentCourseSemestership.create(:student=>st2, :course=>c1, :semester=>se2)
StudentCourseSemestership.create(:student=>st2, :course=>c2, :semester=>se2)

# test
st1.courses
st2.courses
c1.students
se1.courses
StudentCourseSemestership.where(:student=>st1,:semester=>se1).all
```


***


## TSJ 0310


- [x] add other 2 models
- [x] input proper test dataset in db:seed  
- [ ] create controller and views


### Create 2 models


#### bash cmd


```bash
rg model package number:integer
rg model program_course_packageship program_id:integer course_id:integer package_id:integer
```


#### modify models


Then add relationship to models


#### apply migration


```bash
bin/rake db:migrate
```


### create test dataset  


Based on the excel file we have.  


#### Clean db


Change f1status to `is_f1:boolean` in Student  
Change prerequisite to `description:string` in Course  


In Bash


```bash
$ rg migration remove_f1status_from_students f1status:string
$ rg migration add_is_f1_to_students is_f1:boolean
rg migration remove_prerequisite_from_courses prerequisite:text
rg migration add_description_to_courses description:string
```


```bash
rake db:migrate
rake db:migrate:reset
```


#### test models


##### Student


|firstname| lastname|   email|  password|   is_f1|  program_id|  
|:---:|:---:|:---:|:---:|:---:|:---:|
|Johana|    Rueda|  xxx@tamu.edu|   xxx|    false|  1|  
|Yining|    Bao|    yyy@tamu.edu|   yyy|    true|   2|
|Andres|    Gonzalez|   xxx@tamu.edu|   xxx|    true|   3|
|Shijin|    Tang|   yyy@tamu.edu|   yyy|    true|   4|
|Jingjia|   Li| xxx@tamu.edu|   xxx|    false|  1|


##### course  


|department|    number| name|   credit| description|
|:---:|:---:|:---:|:---:|:---:|
CSCE|   601|    Programming with C and Java|    3|a|
CSCE|   602|    Object-Oriented Programming, Development and Software Engineering|  3|b|
CSCE|   603|    Database Systems and Applications|  3|c|
CSCE|   604|    Programming Languages|  3|d|
CSCE|   605 |Compiler Design    |3|e|
CSCE|   606|    Software Engineering    |3|f|
CSCE|   608|    Database Systems    |3|j|
CSCE|   610|    Hypertext/Hypermedia Systems    |3|g|
CSCE|   611|    Operating Systems and Applications  |3|h|
CSCE|   612 |Applied Networks and Distributed Processing    |3|i|


##### semester


term|   year|
|:---:|:---:|
|Spring|    2017|
|Fall|  2017|
|Spring|    2018|


##### student_course_semestership


|Student_ID|    Course_ID|  Semester_ID|  
|:---:|:---:|:---:|
1|  6|  1|
1|  4|  1|
1|  1|  2|
2|  6|  1|
3|  4|  1|
4|  1|  2|
5|  1|  2|


##### program


|name|  acronym|    is_thesis|
|:---:|:---:|:---:|
|Master of Computer Science|    MCS|    false|
|Master of Engineering in Computer Science| MEN|    false|
|Master of Science in Computer Science| MSCS|   true|
|Master of Science in Computer Engineering| MSCE|   true|


##### package


|number|
|:---:|
|1|
|2|
|3|
|4|
|5|


##### program_course_packageship


|program_id|    course_id|  package_id|
|:---:|:---:|:---:|
|1| 1   |1|
|1| 2|  1|
|1| 3   |2|
|1| 4   |2|
|1  |5  |2|
|2| 1   |1|
|2| 6   |1|
|2| 2   |2|
|3| 1   |1|


#### Add to `db/seed.rb`


Inside ruby code was generated with some python.  


#### Apply changes in database  


In bash  


```bash
$ rake db:seed
```


Check in rails console  


```ruby
Student.first
Program.first.students.first.courses
```


## TSJ 0311  


- [x] add another model coursesection to store grades, instructors...  
- [x] add columns (is_fall:boolean, is_spring, is_summer) to course model  
- [x] modify the test cases in TSJ 0310  


### coursesection model


In bash  


```bash
rg model coursesection department:string number:integer section:integer instructor:string term:string year:integer gpa:float student:integer a:string b:string c:string d:string f:string q:string course_id:integer
# fix typo
rg migration remove_e_from_coursesections e:string
rg migration add_q_to_coursesections q:string
```


Modify models to create one to many relationship between course and coursesection.  


### add columns to course model


```bash
rg migration add_is_fall_to_courses is_fall:boolean
rg migration add_is_spring_to_courses is_spring:boolean
rg migration add_is_summer_to_courses is_summer:boolean
```


Apply changes to db  


```bash
rake db:migrate
```


### Test cases


#### course


|department |number |name |credit |description |is_fall |is_spring |is_summer |
|:---|:---|:---|:---|:---|:---|:---|:---|
|CSCE |603 |Database Systems and Applications |3 |Introduction to the concepts and design methodologies of database systems for non-computer science majors; emphasis on E. F. Codd's relational model with hands-on design application. No credit will be given for both CSCE 310 and CSCE 603. Prerequisites: CSCE 601; graduate classification. |false |true |false |
|CSCE |604 |Programming Languages |3 |Study in the design space of programming languages, covering language processing, formalisms to describe semantics of programming languages, important concepts found in current programming languages, and programming paradigms. Prerequisite: Graduate classification. |true |false |false |
|CSCE |605 |Compiler Design |3 |Advanced topics in compiler writing; parser generators and compiler-compilers; dynamic storage and scope resolution; data flow analysis and code optimization. Prerequisite: CSCE 434. |false |true |false |
|CSCE |606 |Software Engineering |3 |Development of advanced concepts in software engineering; software development environments as a mechanism for enhancing productivity and software quality; the classification, evaluation and selection of methodologies for environments; rapid prototyping and reusability concepts; artificial intelligence techniques applied to software engineering. Prerequisite: CSCE 431 or approval of instructor. |true |true |false |
|CSCE |608 |Database Systems |3 |Database modeling techniques; expressiveness in query languages including knowledge representation; manipulation languages data models; physical data organization; relational database design theory; query processing; transaction management and recovery; distributed data management. Prerequisite: CSCE 310 or CSCE 603. |true |false |false |
|CSCE |611 |Operating Systems and Applications |3 |Review of computer architecture hardware/software evolution leading to contemporary operating systems; basic operating systems concepts; methods of operating systems design and construction; algorithms for CPU scheduling memory and general resource allocation; process coordination and management; case studies of several operating systems; quality-of-services of operating systems and their impact on applications. No credit will be given for both CSCE 410 and CSCE 611. Prerequisites: CSCE 313; graduate classification. |true |true |false |


#### coursesection


|Department |number |Section |Instructor |term |Year |GPA |student |A |B |C |D |F |Q |course_id |
|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|:---|
|CSCE |603 |600 |JIANG A |Spring |2013 |4 |17 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |1 |
|CSCE |603 |600 |JIANG A |Spring |2014 |4 |29 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |1 |
|CSCE |604 |600 |JARVI J |Fall |2014 |3.542 |24 |54.17% |45.83% |0.00% |0.00% |0.00% |4.17% |2 |
|CSCE |604 |600 |JARVI J |Fall |2015 |3.714 |7 |85.71% |0.00% |14.29% |0.00% |0.00% |0.00% |2 |
|CSCE |605 |600 |RAUCHWERGER L |Spring |2013 |3.667 |6 |66.67% |33.33% |0.00% |0.00% |0.00% |0.00% |3 |
|CSCE |605 |600 |RAUCHWERGER L |Spring |2015 |3.556 |9 |66.67% |22.22% |11.11% |0.00% |0.00% |11.11% |3 |
|CSCE |606 |600 |WALKER D |Fall |2013 |3.951 |102 |98.04% |0.98% |0.00% |0.00% |0.98% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Fall |2014 |3.83 |100 |84.00% |15.00% |1.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |HUANG S |Fall |2015 |3.953 |85 |95.29% |4.71% |0.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Spring |2015 |4 |57 |100.00% |0.00% |0.00% |0.00% |0.00% |0.00% |4 |
|CSCE |606 |600 |WALKER D |Spring |2016 |3.603 |73 |61.64% |36.99% |1.37% |0.00% |0.00% |0.00% |4 |
|CSCE |608 |600 |JIANG A |Fall |2013 |3.986 |74 |98.65% |1.35% |0.00% |0.00% |0.00% |0.00% |5 |
|CSCE |608 |600 |JIANG A |Fall |2014 |3.429 |98 |42.86% |57.14% |0.00% |0.00% |0.00% |1.02% |5 |
|CSCE |608 |600 |CHEN J |Fall |2015 |3.259 |58 |31.03% |63.79% |5.17% |0.00% |0.00% |0.00% |5 |
|CSCE |611 |600 |LEYK T |Fall |2014 |3.81 |21 |85.71% |9.52% |4.76% |0.00% |0.00% |0.00% |6 |
|CSCE |611 |500 |BETTATI R |Spring |2014 |3.556 |18 |55.56% |44.44% |0.00% |0.00% |0.00% |11.11% |6 |
|CSCE |611 |600 |DA S |Fall |2015 |3.956 |23 |95.65% |4.35% |0.00% |0.00% |0.00% |4.35% |6 |


### change codes in `db/seed.rb`



***


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...