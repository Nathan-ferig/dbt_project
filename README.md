# 🧠 Marketing Mix Modeling with dbt + BigQuery + Colab

[![Built with dbt](https://img.shields.io/badge/Built%20With-dbt-FF694B?style=flat&logo=dbt)](https://www.getdbt.com/)
[![BigQuery](https://img.shields.io/badge/Google-BigQuery-4285F4?style=flat&logo=googlecloud)](https://cloud.google.com/bigquery)
[![Google Colab](https://img.shields.io/badge/Google-Colab-F9AB00?style=flat&logo=googlecolab)](https://colab.research.google.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This project demonstrates a full-stack data transformation pipeline for **Marketing Mix Modeling (MMM)** using **Google BigQuery**, **dbt**, and **Google Colab**. It includes raw data ingestion, layered transformations, data validation, and security checks.

---

## 📂 Project Structure

The project consists of **five core notebooks**:

### 1. 🟡 Upload Raw Data to BigQuery

- Uploads the base dataset into BigQuery using `pandas-gbq`.
- Ensures proper data types and formatting.

### 2. 🟠 Transformations with dbt

Implements a layered dbt project:

- **Bronze**: Removes exact duplicate rows.
- **Silver**: Filters duplicate dates, keeping rows with fewer nulls.
- **Gold**: Final preprocessing for modeling:
  - Interpolates missing `sales` values.
  - Fills missing values in media investment columns (`coalesce`).
  - Ensures `holiday` is binary.

Also includes:
- Reusable **macros**
- Dynamic column handling
- Tests for value ranges and data types

### 3. 🔷 dbt Dependency Graph

- Builds a directed graph of dbt model dependencies using `networkx` and `matplotlib`.
- Visualizes the data flow of the transformation pipeline.

### 4. 🔎 Data Validation & Exploration

- Reads the final **gold** tables from BigQuery.
- Validates:
  - All investment and KPI values are ≥ 0
  - `holiday` column is binary
- Joins all three `gold` tables into a single dataframe for MMM modeling.

### 5. 🔐 Notebook Security Checker

- Accepts uploaded notebooks.
- Scans for:
  - API tokens
  - GCP project IDs
  - Sensitive keywords (`token`, `auth`, `key`, etc.)
- Displays the file and cell number for each match.

---

## 🔧 Requirements

- Python 3.x
- Google Colab
- `dbt` (v1.9+)
- `dbt-bigquery`
- `pandas-gbq`
- `google-auth`
- `networkx`
- Google Cloud project with BigQuery enabled

---

## 🚀 Getting Started

1. Open each notebook in Google Colab.
2. Authenticate with your GCP account.
3. Run the notebooks in order: 1 → 5.
4. Explore and validate your transformed data!

---

## ✅ Key Features

- 🧱 Modular data engineering structure (bronze/silver/gold)
- 🔁 Reusable macros
- 🛡️ Built-in testing and security layers
- 💸 Compatible with BigQuery Free Tier
- 🔗 Ready to connect with any MMM modeling pipeline

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

## 🤝 Contributing

Feel free to open issues, submit pull requests, or fork the project. Contributions are welcome!

---

## 📬 Contact

Questions or ideas? Message the author on [LinkedIn](https://linkedin.com) or open an issue in the repository.
