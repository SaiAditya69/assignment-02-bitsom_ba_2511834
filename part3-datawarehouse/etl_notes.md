## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset had inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY, which made grouping and filtering difficult.

Resolution: All dates were converted into a standard ISO format (YYYY-MM-DD) before loading into the dim_date table. This ensured consistency and allowed easy aggregation by month and year.

---

### Decision 2 — Handling NULL Values
Problem: Some rows had missing values for product category or store information, which could break joins and aggregation queries.

Resolution: Missing values were either removed or replaced with appropriate default values (e.g., "Unknown"). Only clean and complete records were inserted into dimension tables to maintain referential integrity.

---

### Decision 3 — Category Normalization
Problem: Product categories were inconsistent (e.g., "electronics", "ELECTRONICS", "Electronics"), leading to incorrect grouping in analysis.

Resolution: All category values were standardized to proper casing (e.g., "Electronics", "Clothing", "Groceries") before inserting into the dim_product table. This ensured accurate aggregation in analytical queries.