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
- `analysis.ipynb` — See [analysis.ipynb](analysis.ipynb) for the full Pandas cleaning and cross-validation notebook.

- `README.md` — this file

## How to Regenerate the Data

Run the following in a Python 3 environment (e.g., Google Colab or local Python):

python3 generate_data.py

This uses a fixed random.seed(42) and produces deterministic output: bigbasket_capstone.db, orders_raw.csv, and products.csv.

## SQL Queries

- Foundational queries: 01_foundations.sql
- Aggregation & join queries: 02_aggregation_joins.sql
- Reporting queries (tiering, monthly report, variance): 03_reporting.sql
- Verification queries & results: verify.sql

## Spreadsheet

Cross-check workbook: BigBasket Category Analysis.xlsx

## Tableau Dashboard

Live dashboard: https://public.tableau.com/app/profile/lavanya.rawat3802/viz/BigBasketCategoryPerformanceDiagnostic_17891484626040/BigBasketCategoryPerformanceDashboard

## Data Story

See DATA_STORY.md for the full interpretation and recommendations.

## AI-Assisted Prompting Log

See ai_log.md.

## Python/Pandas Analysis (Part 4)

See analysis.ipynb (to be added).
