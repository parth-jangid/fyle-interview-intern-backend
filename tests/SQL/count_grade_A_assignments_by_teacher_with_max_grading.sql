-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
from sqlalchemy import text

def get_grade_a_count_for_teacher_with_max_grading():
    """
    Returns the number of grade A's given by the teacher who has graded the most assignments.
    """
    # Define the SQL query
    sql = text("""
        SELECT t.Teacher_name, COUNT(m.Student_id) as NumOfAs
        FROM teacher t
        JOIN marks m ON t.Course = m.Course
        WHERE m.Marks = 'A'
        GROUP BY t.Teacher_name
        ORDER BY NumOfAs DESC
        LIMIT 1;
    """)

    # Execute the SQL query and fetch the results
    result = db.session.execute(sql).fetchone()

    # Return the number of grade A's given by the teacher
    return result.NumOfAs if result else 0
