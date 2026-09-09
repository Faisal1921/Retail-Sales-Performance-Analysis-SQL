# Sales & Revenue Analysis (SQL)

Answering 12 real business questions about revenue, inventory, customers and sales staff using
SQL, on a 6-table relational dataset I built for practice.

## Dataset

Synthetic company/e-commerce dataset I built myself (not a public dataset) - modeled after a
small retail business.

- employees (40 rows)
- departments (6 rows)
- customers (60 rows)
- products (29 rows)
- orders (150 rows)
- order_items (369 rows)

## What's in this repo

- `schema.sql` - table structure (6 tables, primary/foreign keys)
- `queries.sql` - the 12 business questions, written as SQL
- `insights.md` - plain-English findings from actually running those queries

## Headline insights

- Electronics is the strongest category by far - highest revenue AND highest units sold, not
  just expensive stuff selling in small amounts.
- Bed Frame is currently out of stock (0 units) - needs restocking immediately.
- Vinod Nair is the single biggest customer by spend, well ahead of everyone else on the list.
- 54.7% of orders are Delivered; Cancelled and Returned combined are under 19% of all orders.

## Tools / SQL used

MySQL - inner joins, self joins, subqueries, GROUP BY / HAVING, aggregate functions
(SUM, COUNT, AVG), and basic date functions (YEAR, QUARTER) for the quarterly trend query.