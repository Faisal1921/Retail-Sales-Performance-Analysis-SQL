# Insights - Sales & Revenue Analysis

Ran all 12 queries from queries.sql against the company_practiced database. Notes below are
based on the actual output, not guesses.

1. Electronics brings in the most revenue (~93.5L), Furniture is second (~64L), Groceries is
last (~49.9L). Electronics is basically carrying the business right now.

2. Electronics also sells the most units (287), not just the most money, so it's genuinely our
best category, not just "expensive stuff." Groceries sells almost as many units (234) but way
less revenue - makes sense, groceries are cheap, people buy a lot of them but each one adds
little.

3. Orders per quarter from 2024 Q1 to 2025 Q3: 24, 23, 20, 25, 23, 21, 14. Looks like a drop at
the end but I checked the actual dates and the data only goes up to Aug 21 2025 - so that last
"quarter" isn't even finished yet in the dataset, it's missing like 5-6 weeks of orders. So this
isn't really a sales decline, it just looks like one because the quarter got cut off early.
Ignore that last number for trend purposes.

4. 19 out of 40 employees have been here 5+ years. Almost half the company. Good sign for
retention, assuming these aren't recent hires I'm miscounting somehow.

5. 29 products in the catalog. Small and manageable.

6. Bed Frame is at 0 stock right now, already out. Formal Shirt is next lowest at 43, then
Coffee 200g at 98. Bed Frame is the one that actually needs restocking today, not "soon."

7. Formal Shirt has the best sell-through, 35 sold out of 43 in stock, about 81%. Study Table is
the worst mover at around 5.5%, along with Keyboard and Jacket. (Bed Frame would technically top
this list too since it's sold out, but the ratio breaks because stock is 0 - can't divide by
zero - so it doesn't show up properly in the query.)

8. Top 5 customers by spend: Vinod Nair (₹20,27,127), Zoya Ahmed (₹15,03,787), Rekha Das
(₹13,28,606), Preeti Suri (₹12,23,825), Farah Sheikh (₹10,82,840). Vinod Nair is way ahead of
everyone else on this list, not a close call.

9. Swati Verma closed the most orders (9), Arjun Patel right behind at 8. After that it's a tie
at 7 between Ritu Nair, Ayesha Nair and Rahul Chauhan. Would be worth seeing what Swati's doing
differently if this was a real team.

10. Delivered is 54.7% of all orders (82 out of 150). Rest is split into Pending (14%), Shipped
(12.7%), Cancelled (9.3%) and Returned (9.3%) - five different statuses, not just delivered vs
cancelled. Cancelled and Returned land at the same %, but they're not the same problem -
cancelled means it never went out, returned means it went out and came back. About 27% of
orders are still moving through the pipeline (pending + shipped), which isn't necessarily bad,
just not finished yet.

11. Average order value is around ₹2,10,282. This is average per order, not per customer - if I
wanted lifetime value per customer I'd need to group by customer_id instead of order_id.

12. Nothing is dead stock. All 29 products have sold at least once.

quick recap for myself:
- electronics = biggest revenue driver, protect this category
- bed frame = out of stock right now, fix first
- last quarter dip = data cutoff, not a real trend, don't panic about this in the writeup
- vinod nair = single biggest customer, worth keeping happy
- swati = top performer, worth understanding why
