# AI-Assisted Prompting Log

## Prompt #1 (Part 1 — SQL)

**Role:** You are a SQL expert helping me debug a SQLite query for a data analytics project.

**Context:** I'm working with a SQLite database (bigbasket_capstone.db) containing orders, products, and category_targets tables. I need to compute the percentage variance between actual category revenue and target revenue.

**Task:** Help me write a query that joins category-level total Delivered revenue against category_targets, and computes variance and percentage_variance for each category.

**Constraints:** total_revenue and target_revenue_inr are both INTEGER columns in SQLite, so integer division truncates the result. The percentage_variance formula must avoid this truncation and return an accurate decimal percentage.

**Format:** Return a single runnable SQLite query with a CASE WHEN tagging each category as 'Above Target', 'Below Target - Watch' (within 15% shortfall), or 'Below Target - Critical'.

**Verification performed:** I ran the suggested query against bigbasket_capstone.db in a Google Colab notebook and manually checked the output against the known reference totals for each category (e.g., Household Essentials: 21715 revenue vs 17000 target). I confirmed the percentage_variance values were non-zero decimals (not truncated to 0), and that all six categories were correctly tagged based on their known revenue-vs-target relationship.