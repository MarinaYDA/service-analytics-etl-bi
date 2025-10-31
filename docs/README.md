# BelYer ETL → BI (Synthetic Demo)

End-to-end demo for a service business (hybrid-battery installs):
**CSV → Python ETL → SQL → KPI views → Power BI**.  
All data is **synthetic/anonymized**.

## Quick start
1) Create a Postgres/MySQL/Azure SQL database.
2) Run ETL:
   - `etl/01_extract.py` (reads CSVs)
   - `etl/02_transform.py` (light cleaning + DQ checks)
   - `etl/03_load.py` (set your SQLAlchemy engine, then load)
3) Run `sql/views.sql` to create:
   - `v_revenue_by_model`, `v_warranty_rate_by_model`, `v_avg_tat_by_region`
4) Power BI: connect to the DB, add cards for **Total Revenue**, **Warranty Rate (%)**, **Avg Install Minutes**, and bar charts by **vehicle model** and **region**.

## Files
- `sql/ddl.sql` (optional if you load via Pandas)
- `sql/views.sql` (KPI views)
- `etl/03_load.py` (put your DB engine string)

## Privacy & Data Handling
- This repo uses **synthetic/anonymized data only**.
- Never commit PII (names, emails, phone numbers, VINs, addresses).
- If you must work with real company data:
  - Keep the repo **private**.
  - **Anonymize before export**: replace IDs with hashes, shift dates consistently, bucket prices/locations, remove free-text notes.
  - Store credentials in a `.env` file (don’t hard-code keys).

## Next steps
- Add daily SQL to `sql/practice/`
- Screenshots in `docs/screenshots/`
- Save report as `bi/BelYer_KPI.pbix`

**Author:** Marina Yershova · GitHub: https://github.com/MarinaYDA · LinkedIn: https://www.linkedin.com/in/marinayershova · Email: marinayershova77@gmail.com
