import pandas as pd
if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(df, *args, **kwargs):
    df.rename(columns={df.columns[0]:'Date_reported'}, inplace=True)
    df.Date_reported=pd.to_datetime(df.Date_reported)    

    return df



