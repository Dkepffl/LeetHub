import pandas as pd

def meltTable(report: pd.DataFrame) -> pd.DataFrame:
    longer = report.melt(id_vars='product', 
    value_vars=['quarter_1', 'quarter_2', 'quarter_3', 'quarter_4'],
    var_name='quarter',
    value_name='sales' # 이름 지정 안 해서 1차 틀림
    )
    return longer