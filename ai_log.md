# AI-Assisted Prompting Log

## Prompt #1 (Part 1 — SQL)

**Role:** You are a SQL expert helping me debug a SQLite query for a data analytics project.

**Context:** I'm working with a SQLite database (bigbasket_capstone.db) containing orders, products, and category_targets tables. I need to compute the percentage variance between actual category revenue and target revenue.

**Task:** Help me write a query that joins category-level total Delivered revenue against category_targets, and computes variance and percentage_variance for each category.

**Constraints:** total_revenue and target_revenue_inr are both INTEGER columns in SQLite, so integer division truncates the result. The percentage_variance formula must avoid this truncation and return an accurate decimal percentage.


## Prompt #2 (Part 4 — Pandas)

**Role:** You are a data cleaning expert helping me debug a Pandas outlier-detection pipeline.

**Context:** I'm cleaning a raw orders dataset (orders_raw.csv) in a Jupyter/Colab notebook. I need to detect and cap outliers in the amount_inr column using the IQR method, applied only to Delivered, non-null values.

**Task:** Help me write Pandas code to compute Q1, Q3, IQR, and the upper fence, then cap (not drop) any amount_inr values above that fence using .clip().

**Constraints:** The capping must use .clip(), not row deletion, and must be computed only on Delivered orders with non-null amount_inr — not the full dataset.

**Format:** Return runnable Pandas code with print statements showing Q1, Q3, IQR, and the upper fence value.

**Verification performed:** I ran the suggested code in Colab and manually checked that the computed upper fence (552.5) matched a manual recalculation using .quantile(0.25) and .quantile(0.75) directly. I also confirmed exactly 16 rows were capped by re-running a count of rows equal to the upper fence value after applying .clip(), and cross-checked that this count was higher than the 5 synthetically-injected outliers mentioned in the raw data generation script, which was expected per the brief.

**Format:** Return a single runnable SQLite query with a CASE WHEN tagging each category as 'Above Target', 'Below Target - Watch' (within 15% shortfall), or 'Below Target - Critical'.

**Verification performed:** I ran the suggested query against bigbasket_capstone.db in a Google Colab notebook and manually checked the output against the known reference totals for each category (e.g., Household Essentials: 21715 revenue vs 17000 target). I confirmed the percentage_variance values were non-zero decimals (not truncated to 0), and that all six categories were correctly tagged based on their known revenue-vs-target relationship.
