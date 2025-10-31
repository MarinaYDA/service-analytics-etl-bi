# load.py
import sqlalchemy as sa
from extract import extract
from transform import transform

# Example engines:
# Postgres: sa.create_engine("postgresql+psycopg2://user:password@localhost:5432/service_analytics")
# Azure SQL: sa.create_engine("mssql+pyodbc://USER:PASSWORD@SERVER.database.windows.net:1433/DBNAME?driver=ODBC+Driver+18+for+SQL+Server")
# MySQL: sa.create_engine("mysql+pymysql://user:password@localhost:3306/service_analytics")

def load_to_sql(engine, tables: dict):
    with engine.begin() as conn:
        for name, df in tables.items():
            df.to_sql(name, conn, if_exists="replace", index=False)

def main(engine):
    frames = extract()
    cleaned = transform(frames)
    load_to_sql(engine, cleaned)

if __name__ == "__main__":
    print("Configure your SQLAlchemy engine and call main(engine).")
