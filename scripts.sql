#Specify which schema is in use
USE devcamp_mysql_project_schema;

#Allow for updates
SET SQL_SAFE_UPDATES = 0;

# See all from given table
SELECT * 
FROM students;

# Setting average course score in course table
UPDATE courses
SET average_score = (
	SELECT AVG(score)
    FROM grades
    WHERE course_id = 11
) WHERE course_id = 11;

# To see the average course score in course table:
SELECT course_name AS "Course:", average_score AS "Average score:"
FROM courses;

# Updating the teachers table to have an average grade given column
# N = the teachers id we are calculating the average score from the grades table
UPDATE teachers
SET average_grade_given = (
	SELECT AVG(score)
    FROM grades
    WHERE teachers_id = n
)
WHERE teachers_id = n;

# Average grade given by proffessor 
SELECT first_name, middle_name, last_name, average_grade_given
FROM teachers;

# Updating the students table to have a highest score column calculated from grades table
# n = variable given for a students id
UPDATE students
SET high_score = (
	SELECT MAX(score)
    FROM grades
    WHERE students_id = n
)
WHERE students_id = n;

# Highest grade for each student
SELECT first_name, last_name, high_score AS "Highest grade:"
FROM students
ORDER BY high_score DESC;

# Group students by the courses that they are enrolled in
#For N type in the course id number to get the appropriate response
SELECT course_name AS "Student's ID group for course:"
FROM courses
WHERE course_id = n
UNION
SELECT students_id
FROM enrollment
WHERE course_id = n;

# Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course
SELECT course_name AS "Courses, hardest to easiest:", average_score AS "Average Score:"
FROM courses
ORDER BY average_score ASC;

# Setting sql safe mode back to on
# SET SQL_SAFE_UPDATES = 1;

