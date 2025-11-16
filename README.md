
## Data Relationships

### Current Relationships in the Project:
- **Customers ↔ Products** (via `stg_ventes`) - Many-to-many relationship through sales
- **Leads ↔ Products** (via `stg_lead_products`) - Many-to-many relationship through lead interests
- **People ↔ Organizations** (via `stg_people_organizations`) - Many-to-many relationship through employment



## How it Works

1. **Staging Layer** – Rename columns, clean raw data, create views and tables with synthetic data generation.
2. **Intermediate Layer** – Join and enrich data from multiple staging models.
3. **Mart Layer** – Create final aggregated tables ready for analytics dashboards.


## Data Generation

The project includes synthetic data generation for:
- **Sales data** (`stg_ventes.sql`) - Random customer-product relationships with 10% probability
- **Lead-Product relationships** (`stg_lead_products.sql`) - Random assignments with 20% probability
- **People-Organization relationships** (`stg_people_organizations.sql`) - Random assignments with 30% probability

## Example Outputs

### Sales Mart (mart_ventes.sql)
| customer_id | first_name | last_name | product_name | total_orders | total_spent | sale_month |
|-------------|------------|-----------|--------------|--------------|-------------|------------|
| 1           | Alice      | Smith     | Widget       | 2            | 500.00      | 2024-01-01 |

### Leads Products Mart (mart_leads_products.sql)
| lead_id | first_name | last_name | product_name | assigned_date |
|---------|------------|-----------|--------------|---------------|
| L001    | John       | Doe       | Gadget       | 2024-01-15    |

### Organizations People Mart (mart_organizations_people.sql)
| organization_id | user_id | organization_name |
|-----------------|---------|-------------------|
| ORG001          | USR001  | Tech Corp         |

## How to Run

1. Install DBT and set up your connection to the data warehouse.
2. Run DBT commands:

```bash
dbt deps       # Install dependencies
dbt seed       # Load seed data if any
dbt run        # Execute models
dbt test       # Optional: run tests
