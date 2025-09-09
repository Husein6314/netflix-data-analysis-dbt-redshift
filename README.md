# 🍿 Netflix Data Warehouse  

## 📌 Overview  
This project builds a **Netflix Data Warehouse** using **Amazon Redshift** as the data warehouse and **dbt** for transformation, testing, and documentation.  
It demonstrates how a **modern data stack** can handle raw Netflix-style datasets (movies, users, ratings, tags) to enable analytics such as user engagement, movie popularity, and recommendation patterns.  

---

## 🛠️ Tech Stack  
- **Data Warehouse**: Amazon Redshift  
- **Transformation**: dbt (models, snapshots, tests)  
- **Languages**: SQL + Jinja (for dbt macros)  
- **Version Control**: GitHub  

---

## 📂 Project Structure  
netflix-dwh/
├── models/
│ ├── staging/ -- Raw tables (src_movies, src_ratings, src_tags, src_users)
│ ├── dim/ -- Dimension models (dim_movies, dim_users, dim_tags)
│ ├── fact/ -- Fact tables (fact_ratings, fact_tags)
│ └── snapshots/ -- Snapshots for slowly changing data
├── tests/ -- Data quality tests
├── macros/ -- Custom macros (e.g., null/duplicate checks)
├── seeds/ -- Optional seed CSVs for reference data
└── dbt_project.yml -- dbt configuration

yaml
Copy code

---

## 🧩 Schema Design  

### ⭐ Star Schema  
- **Fact Tables**  
  - 🎥 `fact_ratings` → user ratings for movies  
  - 🏷️ `fact_tags` → user tags for movies  

- **Dimension Tables**  
  - 🎬 `dim_movies` → movie metadata (title, genres, release year)  
  - 👥 `dim_users` → Netflix users  
  - 🏷️ `dim_tags` → descriptive tags applied to movies  

---

## ⚡ Key Features  
- ✅ **Incremental Models** – only load new ratings/tags instead of full reloads  
- 📸 **Snapshots** – track changes in tags over time (`snap_tags`)  
- 🔍 **Data Tests** – ensure no nulls, duplicates, or invalid keys  
- 🏗️ **Schema Separation** – `stage`, `dev`, `prod` schemas in Redshift  
- 📊 **Analytics Ready** – queries optimized for BI/reporting  

---

## 📝 Example Queries  

### 1️⃣ Most Popular Movies  
```sql
SELECT m.title,
       COUNT(r.rating) AS num_ratings,
       ROUND(AVG(r.rating), 2) AS avg_rating
FROM fact_ratings r
JOIN dim_movies m ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY num_ratings DESC
LIMIT 10;
2️⃣ Active Users (Top Raters)
sql
Copy code
SELECT u.user_id,
       COUNT(r.rating) AS total_ratings
FROM fact_ratings r
JOIN dim_users u ON r.user_id = u.user_id
GROUP BY u.user_id
ORDER BY total_ratings DESC
LIMIT 10;
3️⃣ Tags Over Time (Snapshot Example)
sql
Copy code
SELECT movie_id,
       tag_value,
       tag_timestamp
FROM snap_tags
WHERE movie_id = 64497
ORDER BY tag_timestamp;
📈 Example Use Cases
🎬 Movie recommendation system

📊 User engagement tracking

🕒 Trend analysis of tags and genres over time

🧹 Data quality validation using dbt tests

🚀 How to Run Locally
Clone the repo

bash
Copy code
git clone https://github.com/yourusername/netflix-dwh.git
cd netflix-dwh
Set up profiles.yml with Redshift credentials

Run models:

bash
Copy code
dbt run
Run tests:

bash
Copy code
dbt test
Generate docs:

bash
Copy code
dbt docs generate && dbt docs serve
📌 Summary
This project highlights how to build a scalable data warehouse on Redshift using dbt, with focus on incremental modeling, snapshots, and data quality for a Netflix-style dataset.

yaml
Copy code

---

👉 You can save this as `README.md` inside your **Netflix dbt project root folder**.  

Do you also want me to add **badges/icons** at the very top (like Python, Redshift, dbt, MIT License, Status) the same way we did for your other README?







Ask ChatGPT
