# transform.py
import pandas as pd
from extract import extract

def clean_strings(df, cols):
    for c in cols:
        df[c] = df[c].astype(str).str.strip()
    return df

def transform(frames: dict):
    customers = frames["customers"].copy()
    orders = frames["orders"].copy()

    customers = clean_strings(customers, ["first_name","last_name","city","state","vehicle_model","email"])
    orders["order_date"] = pd.to_datetime(orders["order_date"], errors="coerce")

    assert customers["customer_id"].is_unique, "Duplicate customer_id"
    assert orders["order_id"].is_unique, "Duplicate order_id"

    return {
        "customers": customers,
        "orders": orders,
        "inventory": frames["inventory"],
        "warranty": frames["warranty"]
    }

if __name__ == "__main__":
    frames = extract()
    cleaned = transform(frames)
    for name, df in cleaned.items():
        print(name, df.dtypes)
