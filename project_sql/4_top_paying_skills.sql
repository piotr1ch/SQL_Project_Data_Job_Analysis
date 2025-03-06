/*
Answer: What are the top skills based on salary
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Poland'
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25

/*
ChatGPT:
Key Takeaways:
    Cloud specialization (BigQuery, GCP, Looker) and big data tools (Airflow, Spark, Hadoop) offer the highest salaries.
    Python and SQL are essential but don’t guarantee top earnings on their own.
    Excel and PowerPoint remain useful but are not high-paying skills.
    Legal compliance (GDPR) and office tools (SAP, PowerPoint) have the lowest salaries.
To maximize earnings, focus on big data, cloud (GCP, BigQuery), data engineering (Airflow, Spark, Hadoop), and BI (Tableau, Looker).


[
  {
    "skills": "bigquery",
    "average_salary": "111175"
  },
  {
    "skills": "airflow",
    "average_salary": "111175"
  },
  {
    "skills": "tableau",
    "average_salary": "109006"
  },
  {
    "skills": "windows",
    "average_salary": "108283"
  },
  {
    "skills": "spark",
    "average_salary": "102500"
  },
  {
    "skills": "hadoop",
    "average_salary": "102500"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "102500"
  },
  {
    "skills": "flow",
    "average_salary": "102500"
  },
  {
    "skills": "git",
    "average_salary": "102500"
  },
  {
    "skills": "looker",
    "average_salary": "99979"
  },
  {
    "skills": "python",
    "average_salary": "96073"
  },
  {
    "skills": "sql",
    "average_salary": "86347"
  },
  {
    "skills": "gcp",
    "average_salary": "80492"
  },
  {
    "skills": "pyspark",
    "average_salary": "77757"
  },
  {
    "skills": "excel",
    "average_salary": "74239"
  },
  {
    "skills": "sap",
    "average_salary": "60109"
  },
  {
    "skills": "powerpoint",
    "average_salary": "60109"
  },
  {
    "skills": "gdpr",
    "average_salary": "43200"
  }
]

*/