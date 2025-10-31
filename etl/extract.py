# extract.py
import pandas as pd
from pathlib import Path

DATA_DIR = Path(__file__).resolve().parents[1] / "data"

def extract():
    return {
        "customers": pd.read_csv(DATA_DIR / "customers.csv"),
        "orders": pd.read_csv(DATA_DIR / "orders.csv"),
        "inventory": pd.read_csv(DATA_DIR / "inventory.csv"),
        "warranty": pd.read_csv(DATA_DIR / "warranty.csv"),
    }

if __name__ == "__main__":
    frames = extract()
    for name, df in frames.items():
        print(name, df.shape)
