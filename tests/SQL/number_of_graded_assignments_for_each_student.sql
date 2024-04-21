-- Write query to get number of graded assignments for each student:
from sqlalchemy import text

def get_number_of_graded_assignments_for_each_student():
    """
    Returns the number of graded assignments for each student.
    """
    # Define the SQL query
    sql = text("""
        SELECT s.Student_name, COUNT(a.Student_id) as NumOfGradedAssignments
        FROM student s
        JOIN assignments a ON s.Student_id = a.Student_id
        WHERE a.State = 'GRADED'
        GROUP BY s.Student_name;
    """)

    # Execute the SQL query and fetch the results
    results = db.session.execute(sql).fetchall()

    # Return the number of graded assignments for each student
    return results
