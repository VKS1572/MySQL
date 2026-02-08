You are given 3 tables:

Students

| student_id | student_name |

Subjects

| subject_name |

Examinations

| student_id | subject_name |

Each row in Examinations means a student attended an exam for that subject.

You must return:

Every student × every subject combination

Count of exams attended by that student for that subject

Include 0 if not attended

✅ Correct SQL Solution
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY 
    s.student_id,
    sub.subject_name;

✅ Why This Works
🔹 CROSS JOIN

Creates all possible student–subject combinations.

Students × Subjects


So even if a student never attended a subject exam — row still appears.

🔹 LEFT JOIN with Examinations

Matches actual exam records.

If no match → NULL → counted as 0.

🔹 COUNT()

Counts only matched exam rows per student per subject.

🔹 GROUP BY

Groups results correctly per student + subject.
