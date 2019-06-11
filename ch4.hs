:t 5
:t 'a'
:t "abc"
:t False
:t 3 < 2
:t 3.44
:t pi

let x = 1
a = 'x'
:t x
:t a 
:info x
:info a

[1, 2, 3]
:t ['a', 'b']
[1, 'x']
(1, 'x')
:t (1, 'x')
(1,2,3,4,5)


data DateInfo = Date Int Int Int
 myDate = Date 1 10 2018
 :t myDate
myDate :: DateInfo
 :info DateInfo
print myDate

 data DateInfo = Date Int Int Int deriving (Show, Eq)
 myDate1 = Date 1 10 2018
 myDate2 = Date 15 10 2018
 myDate3 = Date 1 10 2018
 myDate2 == myDate1
 myDate3 == myDate1
 data StudentInfo = Student Name Birthdate Specialization deriving (Show, Eq)
 student = Student "Alice Brown" (Date 21 8 1992) "Computer Science"
 :t student

 data FacultyPerson = Teacher String String | Student Name DateInfo Specialization deriving (Show, Eq)
 teacher = Teacher "Emily Brian" "Functional programming"
 student = Student "James Lee" (Date 23 4 1990) "Computer Science"
 print teacher


 data Student = Student String String DateInfo String Int Float deriving (Show, Eq)
 :{
Prelude| data Student = Student { firstName :: String
Prelude|                        , lastName :: String
Prelude|                        , birthDate :: DateInfo
Prelude|                        , specialization :: String
Prelude|                        , studyYear :: Int
Prelude|                        , averageGrade :: Float
Prelude|                        } deriving (Show, Eq)
Prelude| :}
 student = Student "Emily" "Brian" (Date 23 4 1990) "Computer 


 firstName student
 averageGrade student
 :t averageGrade


