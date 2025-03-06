/*
Question: What skills are required for the top paying data analyst jobs 
-- Use the top 10 highest paying Data Analyst jobs from first query
-- Add the specific skills required for these roles
-- Why? Helps identify skills to develop that align with top salaries.
*/
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        job_location = 'Poland' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY   
    salary_year_avg DESC

/* CSV analysed by ChatGPT
The most popular skills among the highest-paying job offers are:

    SQL (9 offers)
    Google Cloud Platform (GCP) (7 offers)
    Python (5 offers)
    Tableau & Looker (4 offers)
    Excel and PySpark (2 offers)

[
  {
    "job_id": 367763,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 367763,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "python"
  },
  {
    "job_id": 367763,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "bigquery"
  },
  {
    "job_id": 367763,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "tableau"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "python"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "airflow"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "windows"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "tableau"
  },
  {
    "job_id": 369283,
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "looker"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "windows"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "tableau"
  },
  {
    "job_id": 876513,
    "job_title": "Data Analyst - Financial Services",
    "salary_year_avg": "111175.00",
    "company_name": "Allegro",
    "skills": "looker"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "sql"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "python"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "gcp"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "spark"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "pyspark"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "hadoop"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "excel"
  },
  {
    "job_id": 1240464,
    "job_title": "Data Analyst",
    "salary_year_avg": "102500.00",
    "company_name": "Capco",
    "skills": "flow"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "python"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "windows"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "tableau"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "looker"
  },
  {
    "job_id": 1281562,
    "job_title": "Data Analyst (CX Tech)",
    "salary_year_avg": "102500.00",
    "company_name": "Allegro",
    "skills": "git"
  },
  {
    "job_id": 470832,
    "job_title": "SAP Finance Data Analyst",
    "salary_year_avg": "77017.50",
    "company_name": "Westinghouse Electric Company",
    "skills": "excel"
  },
  {
    "job_id": 470832,
    "job_title": "SAP Finance Data Analyst",
    "salary_year_avg": "77017.50",
    "company_name": "Westinghouse Electric Company",
    "skills": "sap"
  },
  {
    "job_id": 470832,
    "job_title": "SAP Finance Data Analyst",
    "salary_year_avg": "77017.50",
    "company_name": "Westinghouse Electric Company",
    "skills": "powerpoint"
  },
  {
    "job_id": 189127,
    "job_title": "Junior Data Analyst (Campaign Team)",
    "salary_year_avg": "75067.50",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 189127,
    "job_title": "Junior Data Analyst (Campaign Team)",
    "salary_year_avg": "75067.50",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 189127,
    "job_title": "Junior Data Analyst (Campaign Team)",
    "salary_year_avg": "75067.50",
    "company_name": "Allegro",
    "skills": "looker"
  },
  {
    "job_id": 705215,
    "job_title": "Data Analyst (Pricing)",
    "salary_year_avg": "57500.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 705215,
    "job_title": "Data Analyst (Pricing)",
    "salary_year_avg": "57500.00",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 67765,
    "job_title": "Junior/Mid/Senior Data Analyst (Pricing)",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 67765,
    "job_title": "Junior/Mid/Senior Data Analyst (Pricing)",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 282943,
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "sql"
  },
  {
    "job_id": 282943,
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "python"
  },
  {
    "job_id": 282943,
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "gcp"
  },
  {
    "job_id": 282943,
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "salary_year_avg": "53014.00",
    "company_name": "Allegro",
    "skills": "pyspark"
  }
]
*/