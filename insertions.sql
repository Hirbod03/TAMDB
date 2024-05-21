-- ---------
-- Part 1 SQL Updates
USE assign2db;
SELECT * FROM course;

UPDATE course
SET coursename = 'Multimedia and Communications'
WHERE coursename = 'Multimedia';

SELECT * FROM hasworkedon;

UPDATE hasworkedon
SET hasworkedon.hours = 200
WHERE tauserid IN (
    SELECT tauserid
    FROM ta
    WHERE firstname LIKE 'R%'
);

SELECT * FROM course;
SELECT * FROM hasworkedon;

-- ---------
-- Part 2 SQL Inserts
INSERT INTO course VALUES('CS3331','CS FOUNDATIONS', 3, 2023);

INSERT INTO courseoffer VALUES('RD69', 'Winter', '2023', 'CS3331');
INSERT INTO courseoffer VALUES('RD70', 'Fall', '2022', 'CS3331');
INSERT INTO courseoffer VALUES('RD79', 'Winter', '2022', 'CS3331');

INSERT INTO ta VALUES('rpatt', 'Robert', 'Pattinson', '251234419', 'PhD','');

INSERT INTO loves VALUES('rpatt', 'CS3331');

SELECT * FROM course WHERE coursenum = 'CS3331';
SELECT * FROM courseoffer WHERE whichcourse = 'CS3331';
SELECT * FROM ta WHERE tauserid = 'rpatt';
SELECT * FROM loves WHERE ltauserid = 'rpatt' AND lcoursenum = 'CS3331';

-- ---------
-- Part 3 SQL Queries

-- Query 1
SELECT  lastname FROM ta;
-- Query 2
SELECT DISTINCT lastname FROM ta;
-- Query 3
SELECT * FROM ta ORDER BY firstname ASC;
-- Query 4
SELECT firstname, lastname, tauserid FROM ta WHERE degreetype = 'Masters';
-- Query 5
SELECT coid, term, courseoffer.year, course.coursenum FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE coursename = 'Database';
-- Query 6
SELECT * FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE courseoffer.year < course.year;
-- Query 7
SELECT course.coursename, course.coursenum FROM course
JOIN loves ON course.coursenum = loves.lcoursenum
JOIN ta ON loves.ltauserid = ta.tauserid
WHERE ta.lastname = 'Geller';
-- Query 8
SELECT course.coursename, course.coursenum, SUM(courseoffer.numstudent) AS total_students
FROM course
JOIN courseoffer ON course.coursenum = courseoffer.whichcourse
WHERE course.coursenum = 'CS1033'
GROUP BY course.coursename, course.coursenum;
-- Query 9
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE course.level = 1;
-- Query 10
SELECT ta.firstname, ta.lastname, hasworkedon.hours, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE hasworkedon.hours = (
    SELECT MAX(hours)
    FROM hasworkedon
);
-- Query 11
SELECT coursename, coursenum
FROM course
WHERE coursenum NOT IN (
    SELECT lcoursenum FROM loves
    UNION
    SELECT hcoursenum FROM hates
);
-- Query 12
SELECT ta.lastname, ta.firstname, COUNT(hasworkedon.coid) AS num_course_offerings
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
GROUP BY ta.lastname, ta.firstname
HAVING COUNT(hasworkedon.coid) > 1;
-- Query 13
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum, course.coursename
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
JOIN loves ON ta.tauserid = loves.ltauserid AND course.coursenum = loves.lcoursenum;
-- Query 14
CREATE VIEW FallCourseCounts AS
SELECT courseoffer.whichcourse, course.coursename, COUNT(*) AS offering_count
FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE term = 'Fall'
GROUP BY whichcourse, coursename;

SELECT whichcourse, coursename, offering_count
FROM FallCourseCounts
WHERE offering_count = (
    SELECT MAX(offering_count)
    FROM FallCourseCounts
);
-- Query 15
-- SQL command to find TAs who have worked on a course offering in the Spring term
SELECT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE term = 'Spring';

-- ---------
-- Part 4 Views/Deletes
CREATE VIEW HatedCoursesView AS
SELECT ta.firstname, ta.lastname, ta.tauserid, course.coursenum, course.coursename
FROM ta
JOIN hates ON ta.tauserid = hates.htauserid
JOIN course ON hates.hcoursenum = course.coursenum
ORDER BY course.level ASC;

SELECT * FROM HatedCoursesView;

SELECT DISTINCT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN hates ON ta.tauserid = hates.htauserid AND courseoffer.whichcourse = hates.hcoursenum;

SELECT * FROM ta;

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'pbing';

SELECT * FROM ta WHERE tauserid = 'pbing';

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'mgeller';

ALTER TABLE ta ADD image VARCHAR(200);

SELECT * FROM ta;

UPDATE ta SET image = 'https://i.pinimg.com/originals/bf/85/8d/bf858d262ce992754e2b78042c9e0fe8.gif' WHERE firstname = 'mgeller';

SELECT * FROM ta WHERE firstname = 'mgeller';
-- ---------
-- Part 1 SQL Updates
USE assign2db;
SELECT * FROM course;

UPDATE course
SET coursename = 'Multimedia and Communications'
WHERE coursename = 'Multimedia';

SELECT * FROM hasworkedon;

UPDATE hasworkedon
SET hasworkedon.hours = 200
WHERE tauserid IN (
    SELECT tauserid
    FROM ta
    WHERE firstname LIKE 'R%'
);

SELECT * FROM course;
SELECT * FROM hasworkedon;

-- ---------
-- Part 2 SQL Inserts
INSERT INTO course VALUES('CS3331','CS FOUNDATIONS', 3, 2023);

INSERT INTO courseoffer VALUES('RD69'. 69, 'Winter', '2023', 'CS3331');
INSERT INTO courseoffer VALUES('RD70'. 69, 'Fall', '2022', 'CS3331');
INSERT INTO courseoffer VALUES('RD79'. 69, 'Winter', '2022', 'CS3331');

INSERT INTO ta VALUES('rpatt', 'Robert', 'Pattinson', '251234419', 'PhD');

INSERT INTO loves VALUES('rpatt', 'CS3331');

SELECT * FROM course WHERE course_id = 'CS3331';
SELECT * FROM courseoffer WHERE course_id = 'CS3331';
SELECT * FROM ta WHERE ta_id = 'rpatt';
SELECT * FROM loves WHERE ta_id = 'rpatt' AND course_id = 'CS3331';

-- ---------
-- Part 3 SQL Queries

-- Query 1
SELECT  lastname FROM ta;
-- Query 2
SELECT DISTINCT lastname FROM ta;
-- Query 3
SELECT * FROM ta ORDER BY firstname ASC;
-- Query 4
SELECT firstname, lastname, tauserid FROM ta WHERE degreetype = 'Masters';
-- Query 5
SELECT coid, term, courseoffer.year, course.coursenum FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE coursename = 'Database';
-- Query 6
SELECT * FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE courseoffer.year < course.year;
-- Query 7
SELECT course.coursename, course.coursenum FROM course
JOIN loves ON course.coursenum = loves.lcoursenum
JOIN ta ON loves.ltauserid = ta.tauserid
WHERE ta.lastname = 'Geller';
-- Query 8
SELECT course.coursename, course.coursenum, SUM(courseoffer.numstudent) AS total_students
FROM course
JOIN courseoffer ON course.coursenum = courseoffer.whichcourse
WHERE course.coursenum = 'CS1033'
GROUP BY course.coursename, course.coursenum;
-- Query 9
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE course.level = 1;
-- Query 10
SELECT ta.firstname, ta.lastname, hasworkedon.hours, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE hasworkedon.hours = (
    SELECT MAX(hours)
    FROM hasworkedon
);
-- Query 11
SELECT coursename, coursenum
FROM course
WHERE coursenum NOT IN (
    SELECT lcoursenum FROM loves
    UNION
    SELECT hcoursenum FROM hates
);
-- Query 12
SELECT ta.lastname, ta.firstname, COUNT(hasworkedon.coid) AS num_course_offerings
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
GROUP BY ta.lastname, ta.firstname
HAVING COUNT(hasworkedon.coid) > 1;
-- Query 13
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum, course.coursename
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
JOIN loves ON ta.tauserid = loves.ltauserid AND course.coursenum = loves.lcoursenum;
-- Query 14
CREATE VIEW FallCourseCounts AS
SELECT courseoffer.whichcourse, course.coursename, COUNT(*) AS offering_count
FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE term = 'Fall'
GROUP BY whichcourse, coursename;

SELECT whichcourse, coursename, offering_count
FROM FallCourseCounts
WHERE offering_count = (
    SELECT MAX(offering_count)
    FROM FallCourseCounts
);
-- Query 15
-- SQL command to find TAs who have worked on a course offering in the Spring term
SELECT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE term = 'Spring';

-- ---------
-- Part 4 Views/Deletes
CREATE VIEW HatedCoursesView AS
SELECT ta.firstname, ta.lastname, ta.tauserid, course.coursenum, course.coursename
FROM ta
JOIN hates ON ta.tauserid = hates.htauserid
JOIN course ON hates.hcoursenum = course.coursenum
ORDER BY course.level ASC;

SELECT * FROM HatedCoursesView;

SELECT DISTINCT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN hates ON ta.tauserid = hates.htauserid AND courseoffer.whichcourse = hates.hcoursenum;

SELECT * FROM ta;

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'pbing';

SELECT * FROM ta WHERE tauserid = 'pbing';

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'mgeller';

ALTER TABLE ta ADD image VARCHAR(200);

SELECT * FROM ta;

UPDATE ta SET image = 'https://i.pinimg.com/originals/bf/85/8d/bf858d262ce992754e2b78042c9e0fe8.gif' WHERE firstname = 'mgeller';

SELECT * FROM ta WHERE firstname = 'mgeller';
-- ---------
-- Part 1 SQL Updates
SELECT * FROM course;

UPDATE course
SET coursename = 'Multimedia and Communications'
WHERE coursename = 'Multimedia';

SELECT * FROM hasworkedon;

UPDATE hasworkedon
SET hasworkedon.hours = 200
WHERE tauserid IN (
    SELECT tauserid
    FROM ta
    WHERE firstname LIKE 'R%'
);

SELECT * FROM course;
SELECT * FROM hasworkedon;

-- ---------
-- Part 2 SQL Inserts
INSERT INTO course VALUES('CS3331','CS FOUNDATIONS', 3, 2023);

INSERT INTO courseoffer VALUES('RD69'. 69, 'Winter', '2023', 'CS3331');
INSERT INTO courseoffer VALUES('RD70'. 69, 'Fall', '2022', 'CS3331');
INSERT INTO courseoffer VALUES('RD79'. 69, 'Winter', '2022', 'CS3331');

INSERT INTO ta VALUES('rpatt', 'Robert', 'Pattinson', '251234419', 'PhD');

INSERT INTO loves VALUES('rpatt', 'CS3331');

SELECT * FROM course WHERE course_id = 'CS3331';
SELECT * FROM courseoffer WHERE course_id = 'CS3331';
SELECT * FROM ta WHERE ta_id = 'rpatt';
SELECT * FROM loves WHERE ta_id = 'rpatt' AND course_id = 'CS3331';

-- ---------
-- Part 3 SQL Queries

-- Query 1
SELECT  lastname FROM ta;
-- Query 2
SELECT DISTINCT lastname FROM ta;
-- Query 3
SELECT * FROM ta ORDER BY firstname ASC;
-- Query 4
SELECT firstname, lastname, tauserid FROM ta WHERE degreetype = 'Masters';
-- Query 5
SELECT coid, term, courseoffer.year, course.coursenum FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE coursename = 'Database';
-- Query 6
SELECT * FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE courseoffer.year < course.year;
-- Query 7
SELECT course.coursename, course.coursenum FROM course
JOIN loves ON course.coursenum = loves.lcoursenum
JOIN ta ON loves.ltauserid = ta.tauserid
WHERE ta.lastname = 'Geller';
-- Query 8
SELECT course.coursename, course.coursenum, SUM(courseoffer.numstudent) AS total_students
FROM course
JOIN courseoffer ON course.coursenum = courseoffer.whichcourse
WHERE course.coursenum = 'CS1033'
GROUP BY course.coursename, course.coursenum;
-- Query 9
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE course.level = 1;
-- Query 10
SELECT ta.firstname, ta.lastname, hasworkedon.hours, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE hasworkedon.hours = (
    SELECT MAX(hours)
    FROM hasworkedon
);
-- Query 11
SELECT coursename, coursenum
FROM course
WHERE coursenum NOT IN (
    SELECT lcoursenum FROM loves
    UNION
    SELECT hcoursenum FROM hates
);
-- Query 12
SELECT ta.lastname, ta.firstname, COUNT(hasworkedon.coid) AS num_course_offerings
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
GROUP BY ta.lastname, ta.firstname
HAVING COUNT(hasworkedon.coid) > 1;
-- Query 13
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum, course.coursename
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
JOIN loves ON ta.tauserid = loves.ltauserid AND course.coursenum = loves.lcoursenum;
-- Query 14
CREATE VIEW FallCourseCounts AS
SELECT courseoffer.whichcourse, course.coursename, COUNT(*) AS offering_count
FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE term = 'Fall'
GROUP BY whichcourse, coursename;

SELECT whichcourse, coursename, offering_count
FROM FallCourseCounts
WHERE offering_count = (
    SELECT MAX(offering_count)
    FROM FallCourseCounts
);
-- Query 15
-- SQL command to find TAs who have worked on a course offering in the Spring term
SELECT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE term = 'Spring';

-- ---------
-- Part 4 Views/Deletes
CREATE VIEW HatedCoursesView AS
SELECT ta.firstname, ta.lastname, ta.tauserid, course.coursenum, course.coursename
FROM ta
JOIN hates ON ta.tauserid = hates.htauserid
JOIN course ON hates.hcoursenum = course.coursenum
ORDER BY course.level ASC;

SELECT * FROM HatedCoursesView;

SELECT DISTINCT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN hates ON ta.tauserid = hates.htauserid AND courseoffer.whichcourse = hates.hcoursenum;

SELECT * FROM ta;

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'pbing';

SELECT * FROM ta WHERE tauserid = 'pbing';

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'mgeller';

ALTER TABLE ta ADD image VARCHAR(200);

SELECT * FROM ta;

UPDATE ta SET image = 'https://i.pinimg.com/originals/bf/85/8d/bf858d262ce992754e2b78042c9e0fe8.gif' WHERE firstname = 'mgeller';

SELECT * FROM ta WHERE firstname = 'mgeller';
-- ---------
-- Part 1 SQL Updates
USE assign2db;

SELECT * FROM course;

UPDATE course
SET title = 'Multimedia and Communications'
WHERE title = 'Multimedia';

SELECT * FROM hasworkedon;

UPDATE hasworkedon
SET hours = 200
WHERE ta_id IN (
    SELECT id
    FROM ta
    WHERE first_name LIKE 'R%'
);

SELECT * FROM course;
SELECT * FROM hasworkedon;

-- ---------
-- Part 2 SQL Inserts
INSERT INTO couse VALUES('CS3331','CS FOUNDATIONS', 3, 2023);

INSERT INTO courseoffer VALUES('RD69'. 69, 'Winter', '2023', 'CS3331');
INSERT INTO courseoffer VALUES('RD70'. 69, 'Fall', '2022', 'CS3331');
INSERT INTO courseoffer VALUES('RD79'. 69, 'Winter', '2022', 'CS3331');

INSERT INTO ta VALUES('rpatt', 'Robert', 'Pattinson', '251234419', 'PhD');

INSERT INTO loves VALUES('rpatt', 'CS3331');

SELECT * FROM course WHERE course_id = 'CS3331';
SELECT * FROM courseoffer WHERE course_id = 'CS3331';
SELECT * FROM ta WHERE ta_id = 'rpatt';
SELECT * FROM loves WHERE ta_id = 'rpatt' AND course_id = 'CS3331';

-- ---------
-- Part 3 SQL Queries

-- Query 1
SELECT  lastname FROM ta;
-- Query 2
SELECT DISTINCT lastname FROM ta;
-- Query 3
SELECT * FROM ta ORDER BY firstname ASC;
-- Query 4
SELECT firstname, lastname, tauserid FROM ta WHERE degreetype = 'Masters';
-- Query 5
SELECT coid, term, courseoffer.year, course.coursenum FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE coursename = 'Database';
-- Query 6
SELECT * FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE courseoffer.year < course.year;
-- Query 7
SELECT course.coursename, course.coursenum FROM course
JOIN loves ON course.coursenum = loves.lcoursenum
JOIN ta ON loves.ltauserid = ta.tauserid
WHERE ta.lastname = 'Geller';
-- Query 8
SELECT course.coursename, course.coursenum, SUM(courseoffer.numstudent) AS total_students
FROM course
JOIN courseoffer ON course.coursenum = courseoffer.whichcourse
WHERE course.coursenum = 'CS1033'
GROUP BY course.coursename, course.coursenum;
-- Query 9
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE course.level = 1;
-- Query 10
SELECT ta.firstname, ta.lastname, hasworkedon.hours, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE hasworkedon.hours = (
    SELECT MAX(hours)
    FROM hasworkedon
);
-- Query 11
SELECT coursename, coursenum
FROM course
WHERE coursenum NOT IN (
    SELECT lcoursenum FROM loves
    UNION
    SELECT hcoursenum FROM hates
);
-- Query 12
SELECT ta.lastname, ta.firstname, COUNT(hasworkedon.coid) AS num_course_offerings
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
GROUP BY ta.lastname, ta.firstname
HAVING COUNT(hasworkedon.coid) > 1;
-- Query 13
SELECT DISTINCT ta.firstname, ta.lastname, course.coursenum, course.coursename
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN course ON courseoffer.whichcourse = course.coursenum
JOIN loves ON ta.tauserid = loves.ltauserid AND course.coursenum = loves.lcoursenum;
-- Query 14
CREATE VIEW FallCourseCounts AS
SELECT courseoffer.whichcourse, course.coursename, COUNT(*) AS offering_count
FROM courseoffer
JOIN course ON courseoffer.whichcourse = course.coursenum
WHERE term = 'Fall'
GROUP BY whichcourse, coursename;

SELECT whichcourse, coursename, offering_count
FROM FallCourseCounts
WHERE offering_count = (
    SELECT MAX(offering_count)
    FROM FallCourseCounts
);
-- Query 15
-- SQL command to find TAs who have worked on a course offering in the Spring term
SELECT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
WHERE term = 'Spring';

-- ---------
-- Part 4 Views/Deletes
CREATE VIEW HatedCoursesView AS
SELECT ta.firstname, ta.lastname, ta.tauserid, course.coursenum, course.coursename
FROM ta
JOIN hates ON ta.tauserid = hates.htauserid
JOIN course ON hates.hcoursenum = course.coursenum
ORDER BY course.level ASC;

SELECT * FROM HatedCoursesView;

SELECT DISTINCT ta.firstname, ta.lastname, courseoffer.whichcourse
FROM ta
JOIN hasworkedon ON ta.tauserid = hasworkedon.tauserid
JOIN courseoffer ON hasworkedon.coid = courseoffer.coid
JOIN hates ON ta.tauserid = hates.htauserid AND courseoffer.whichcourse = hates.hcoursenum;

SELECT * FROM ta;

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'pbing';

SELECT * FROM ta WHERE tauserid = 'pbing';

SELECT * FROM hates;

DELETE FROM ta WHERE tauserid = 'mgeller';

ALTER TABLE ta ADD image VARCHAR(200);

SELECT * FROM ta;

UPDATE ta SET image = 'https://i.pinimg.com/originals/bf/85/8d/bf858d262ce992754e2b78042c9e0fe8.gif' WHERE firstname = 'mgeller';

SELECT * FROM ta WHERE firstname = 'mgeller';
