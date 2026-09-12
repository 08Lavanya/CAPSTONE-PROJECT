# BigBasket Category Performance Diagnostic

## Overview

This project builds a single, deterministic BigBasket-style dataset and verifies that the same category-level revenue numbers hold consistent across four different tools: SQL (SQLite), a spreadsheet (Google Sheets), a Tableau Public dashboard, and an independent Python/Pandas cleaning pipeline on a separately generated, deliberately messy raw data export. The goal is to diagnose which product categories are meeting their monthly revenue targets and which are falling behind, and to recommend action for BigBasket's category management team.

## File Structure

- `generate_data.py` — script that generates the SQLite database and raw CSV exports (run with `python3 generate_data.py`)
- `bigbasket_capstone.db` — the generated SQLite database (Parts 1–3)
- `orders_raw.csv`, `products.csv` — deliberately messy raw exports (Part 4 only)
- `verify.sql` — data verification queries and results
- `01_foundations.sql` — foundational SQL queries (WHERE, DISTINCT, ORDER BY, Alias, IN, BETWEEN, IS NULL)
- `02_aggregation_joins.sql` — aggregation, join, and HAVING queries
- `03_reporting.sql` — CASE WHEN tiering, monthly reporting, and variance queries
- `monthly_category_revenue.csv` — exported monthly-by-category revenue report (fixed input for Parts 2–3)
- `BigBasket Category Analysis.xlsx` — spreadsheet cross-check workbook (Part 2)
- `DATA_STORY.md` — written interpretation of the Tableau dashboard and recommendations
- `ai_log.md` — AI-assisted prompting log (RCTCF format)
- `analysis.ipynb` — Python/Pandas cleaning and cross-validation notebook (Part 4) — *to be added*
- `README.md` — this file

## How to Regenerate the Data

Run the following in a Python 3 environment (e.g., Google Colab or local Python):