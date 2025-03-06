/*
Answer: What are the most optimal skills to learn (high demand and high-paying skills)
- Identyfy skills in high demand and associate with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills,
        COUNT(job_postings_fact.job_id) AS demand_count
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Poland'
        AND salary_year_avg IS NOT NULL
    GROUP BY skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        skills,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
    FROM job_postings_fact 
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Poland'
    GROUP BY skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 0
ORDER BY 
    average_salary DESC,
    demand_count DESC


--- simplified query
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS demand_count, 
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS average_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Poland'
    AND salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skill_id
HAVING COUNT(job_postings_fact.job_id) > 0
ORDER BY 
    average_salary DESC,
    demand_count DESC