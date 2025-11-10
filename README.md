# DBT Mini Project - Customers & Leads Analytics

## Project Overview

This DBT mini-project demonstrates a simple data transformation workflow from raw source tables to analytics-ready marts. It includes staging, intermediate, and mart layers using DBT models.

The project uses three main source tables:

1. **Customers** – contains customer information.
2. **Leads** – contains lead interactions and deal information.
3. **Products** – contains product details.

The transformations standardize, clean, and aggregate the data to make it ready for reporting.

## Project Structure

```
models/
├─ staging/
│   ├─ stg_customers.sql     # Clean and standardize customers data
│   ├─ stg_leads.sql         # Clean and standardize leads data
│   └─ stg_products.sql      # Clean and standardize products data
├─ intermediate/
│   ├─ customer_leads.sql    # Aggregate leads per customer
│   └─ product_leads.sql     # Count interested customers per product
└─ marts/
    └─ customer_mart.sql     # Final table ready for reporting
```

## How it Works

1. **Staging Layer** – Rename columns, clean raw data, create views.
2. **Intermediate Layer** – Aggregate and join data to generate metrics.
3. **Mart Layer** – Create final tables ready for analytics dashboards.

**Key DBT concepts used:**

* `{{ source() }}` – Reference raw source tables.
* `{{ ref() }}` – Reference other DBT models for dependency management.
* `materialized='view'` – Create virtual tables.
* `materialized='table'` – Persist data as tables for re-use and performance.

## Example Outputs

**Customer Leads Table**

| customer_id | first_name | last_name | total_leads |
| ----------- | ---------- | --------- | ----------- |
| 1           | Alice      | Smith     | 2           |
| 2           | Bob        | Jones     | 0           |

**Product Leads Table**

| product_id | product_name | interested_customers |
| ---------- | ------------ | -------------------- |
| 101        | Widget       | 1                    |
| 102        | Gadget       | 0                    |

## How to Run

1. Install DBT and set up your connection to the data warehouse.
2. Run DBT commands:

```bash
dbt deps       # Install dependencies
dbt seed       # Load seed data if any
dbt run        # Execute models
dbt test       # Optional: run tests
```

3. Query the resulting tables for reporting.

## Notes

* This project is **educational**, demonstrating a typical DBT workflow.
* You can extend it to include **sales metrics, product performance**, or other analytics.
