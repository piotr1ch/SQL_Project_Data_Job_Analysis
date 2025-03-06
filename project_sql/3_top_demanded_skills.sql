/*
Question: Wtah are the most in-demand skills for data analysts?
- join job postings to inner join table similar to querry 2
- identify the top 5 in-demand skills for data analyst
- focus on all job postings
- Why? the top 5 skills = most valuable skills for job seekers
*/

SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Poland'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5