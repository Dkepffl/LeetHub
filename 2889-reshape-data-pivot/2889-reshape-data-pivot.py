import pandas as pd

def pivotTable(weather: pd.DataFrame) -> pd.DataFrame:
    longer = weather.pivot(index='month', columns='city', values='temperature')
    return longer