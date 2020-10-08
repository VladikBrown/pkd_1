CREATE DATABASE IF NOT EXISTS pkd ;
USE pkd;

CREATE TABLE IF NOT EXISTS professors (
                                          professor_id VARCHAR(4),
                                          surname VARCHAR(30),
                                          position VARCHAR(30),
                                          department VARCHAR(30),
                                          specialty VARCHAR(30),
                                          phone_number INT
);

CREATE TABLE IF NOT EXISTS subjects(
                                       subject_id VARCHAR(3),
                                       subject_name VARCHAR(30),
                                       hours INT,
                                       specialty VARCHAR(30),
                                       term INT
);

CREATE TABLE IF NOT EXISTS student_group(
                                            group_id VARCHAR(3),
                                            group_name VARCHAR(30),
                                            students_amount INT,
                                            specialty VARCHAR(30),
                                            headman_surname VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS professor_to_group(
                                                 group_id VARCHAR(3),
                                                 subject_id VARCHAR(30),
                                                 professor_id VARCHAR(30),
                                                 lecture_hall_num INT
);


#DROP TABLE professors;
#DROP TABLE subjects;
#DROP TABLE student_group;
#DROP TABLE professor_to_group;

#DROP DATABASE pkd;