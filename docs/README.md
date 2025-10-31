# Service Analytics — ETL → BI (Synthetic Demo)

End-to-end workflow for a service business: **CSV → Python ETL → SQL → KPI views → Power BI**.  
All data is **synthetic/anonymized** 

## Quick start
1) Create a Postgres/MySQL/Azure SQL database.
2) Run ETL:
   - `etl/extract.py` — reads CSVs
   - `etl/transform.py` — light cleaning + DQ checks
   - `etl/load.py` — set your SQLAlchemy engine and load
3) Run `sql/views.sql` to create:
   - `v_revenue_by_model`, `v_warranty_rate_by_model`, `v_avg_tat_by_region`
4) Power BI: connect to the DB, add cards for **Total Revenue**, **Warranty Rate (%)**, **Avg Install Minutes**, and bar charts by **model** and **region**.

## Files
- `sql/ddl.sql` (optional if you load via Pandas)
- `sql/views.sql` (KPI views)
- `etl/load.py` (put your DB engine string)
- `bi/Service_KPI.pbix` (Power BI file placeholder)

## Privacy & Data Handling
- **Synthetic data only**. Never commit PII.
- If you must work with real data: keep the repo private, anonymize before export, store credentials in `.env`.

## Next steps
- Add daily SQL to `sql/practice/`
- Screenshots in `docs/screenshots/`
- Save your report as `bi/Service_KPI.pbix`

**Author:** Marina Yershova · GitHub: https://github.com/MarinaYDA · LinkedIn: https://www.linkedin.com/in/marinayershova · Email: marinayershova77@gmail.com
