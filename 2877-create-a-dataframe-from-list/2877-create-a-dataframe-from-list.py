import pandas as pd

# Type Hint
def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    column_names = ["student_id", "age"]
    df = pd.DataFrame(student_data, columns=column_names)
    return df