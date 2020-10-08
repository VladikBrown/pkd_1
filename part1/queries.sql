#1.1
SELECT 
    *
FROM
    professors;

#1.2
SELECT 
    *
FROM
    student_group
WHERE
    specialty = 'ЭВМ';

#1.3
SELECT DISTINCT
    professor_id, lecture_hall_num
FROM
    professor_to_group
WHERE
    subject_id = '18П';

#1.4
SELECT DISTINCT
    subjects.subject_id, subjects.subject_name
FROM
    subjects
        JOIN
    professor_to_group ON professor_to_group.subject_id = subjects.subject_id
        JOIN
    professors ON professor_to_group.professor_id = professors.professor_id
WHERE
    professors.surname = 'Костин';

#1.5
SELECT DISTINCT
    professor_to_group.group_id
FROM
    professor_to_group
        JOIN
    professors ON professor_to_group.professor_id = professors.professor_id
WHERE
    professors.surname = 'Фролов';

#1.6
SELECT 
    *
FROM
    subjects
WHERE
    specialty = 'АСОИ';

#1.7
SELECT 
    *
FROM
    professors
WHERE
    specialty LIKE '%АСОИ%';

#1.8
SELECT DISTINCT
    professors.surname
FROM
    professors
        JOIN
    professor_to_group ON professors.professor_id = professor_to_group.professor_id
WHERE
    professor_to_group.lecture_hall_num = '210';

#1.9
SELECT DISTINCT
    subjects.subject_name, student_group.group_name
FROM
    professor_to_group
        JOIN
    student_group ON student_group.group_id = professor_to_group.group_id
        JOIN
    subjects ON subjects.subject_id = professor_to_group.subject_id
WHERE
    professor_to_group.lecture_hall_num >= 100
        AND professor_to_group.lecture_hall_num <= 200;

#1.10
SELECT 
    a.group_id AS code_numgroup_1, b.group_id AS code_numgroup_2
FROM
    student_group a,
    student_group b
WHERE
    a.group_name > b.group_name
        AND a.specialty = b.specialty;

#1.11
SELECT 
    SUM(students_amount)
FROM
    student_group
WHERE
    specialty = 'ЭВМ';

#1.12
SELECT 
    professor_id
FROM
    professors
WHERE
    specialty LIKE '%ЭВМ%';

#1.13
SELECT 
    professor_to_group.subject_id
FROM
    professor_to_group
WHERE
    group_id = ALL (SELECT 
            group_id
        FROM
            student_group);

#1.14
SELECT 
    professors.surname
FROM
    professors
WHERE
    professor_id IN (SELECT 
            professor_to_group.professor_id
        FROM
            professor_to_group
        WHERE
            professor_to_group.subject_id IN (SELECT 
                    professor_to_group.subject_id
                FROM
                    professor_to_group
                WHERE
                    professor_to_group.professor_id IN (SELECT 
                            professor_to_group.professor_id
                        FROM
                            professor_to_group
                        WHERE
                            subject_id = '14П')));

#1.15
SELECT DISTINCT
    subjects.*
FROM
    subjects
        JOIN
    professor_to_group ON subjects.subject_id = professor_to_group.subject_id
WHERE
    professor_to_group.professor_id NOT IN ('221Л');

#1.16
SELECT DISTINCT
    subjects.*
FROM
    subjects
        JOIN
    professor_to_group ON subjects.subject_id = professor_to_group.subject_id
        JOIN
    student_group ON professor_to_group.group_id = student_group.group_id
WHERE
    student_group.group_name <> 'М-6';

#1.17
SELECT DISTINCT
    professors.*
FROM
    professors
        JOIN
    professor_to_group ON professors.professor_id = professor_to_group.professor_id
WHERE
    (professor_to_group.group_id = '3Г'
        OR professor_to_group.group_id = '8Г')
        AND professors.position = 'Доцент';

#1.18
SELECT DISTINCT
    professor_to_group.subject_id,
    professor_to_group.professor_id,
    professor_to_group.group_id
FROM
    professor_to_group
        JOIN
    professors ON professor_to_group.professor_id = professors.professor_id
WHERE
    professors.department = 'ЭВМ'
        AND professors.specialty LIKE '%АСОИ%';

#1.19
SELECT DISTINCT
    student_group.group_id
FROM
    student_group
        JOIN
    professor_to_group ON professor_to_group.group_id = student_group.group_id
        JOIN
    professors ON professor_to_group.professor_id = professors.professor_id
WHERE
    professors.specialty LIKE student_group.specialty;

#1.20
SELECT DISTINCT
    professors.professor_id
FROM
    professors
        JOIN
    professor_to_group ON professor_to_group.professor_id = professors.professor_id
        JOIN
    student_group ON professor_to_group.group_id = student_group.group_id
WHERE
    professors.department = 'ЭВМ'
        AND professors.specialty = student_group.specialty;

#1.21
SELECT DISTINCT
    student_group.specialty
FROM
    student_group
        JOIN
    professor_to_group ON professor_to_group.group_id = student_group.group_id
        JOIN
    professors ON professor_to_group.professor_id = professors.professor_id
WHERE
    professors.department = 'АСУ';

#1.22
SELECT DISTINCT
    subjects.subject_id
FROM
    subjects
        JOIN
    professor_to_group ON subjects.subject_id = professor_to_group.subject_id
        JOIN
    student_group ON professor_to_group.group_id = student_group.group_id
WHERE
    student_group.group_name = 'АС-8';

#1.23
SELECT DISTINCT
    professor_to_group.group_id
FROM
    professor_to_group
WHERE
    professor_to_group.subject_id IN (SELECT DISTINCT
            professor_to_group.subject_id
        FROM
            professor_to_group
                JOIN
            student_group ON student_group.group_id = professor_to_group.group_id
        WHERE
            student_group.group_name = 'АС-8');

#1.24
SELECT DISTINCT
    student_group.group_id
FROM
    student_group
WHERE
    NOT student_group.group_id IN (SELECT DISTINCT
            professor_to_group.group_id
        FROM
            professor_to_group
        WHERE
            professor_to_group.subject_id IN (SELECT DISTINCT
                    professor_to_group.subject_id
                FROM
                    professor_to_group
                        JOIN
                    student_group ON student_group.group_id = professor_to_group.group_id
                WHERE
                    student_group.group_name = 'АС-8'));

#1.25
SELECT DISTINCT
    student_group.group_id
FROM
    student_group
WHERE
    NOT student_group.group_id IN (SELECT DISTINCT
            professor_to_group.group_id
        FROM
            professor_to_group
        WHERE
            professor_to_group.subject_id IN (SELECT DISTINCT
                    professor_to_group.subject_id
                FROM
                    professor_to_group
                        JOIN
                    professors ON professors.professor_id = professor_to_group.professor_id
                WHERE
                    professors.professor_id = '430Л'));

#1.26
SELECT DISTINCT
    professor_to_group.professor_id
FROM
    professor_to_group
        INNER JOIN
    student_group ON student_group.group_id = professor_to_group.group_id
WHERE
    student_group.group_name = 'Э-15'
        AND professor_to_group.professor_id NOT IN (SELECT 
            professor_to_group.professor_id
        FROM
            professor_to_group
        WHERE
            professor_to_group.subject_id = '12П');