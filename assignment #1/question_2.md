## Q1
 Please provide the sql to fetch homepage content. As the users and
templates grow, the sql that's fetching the homepage content is very slow.
How would you improve the sql query? (i.e. you may tune the query or adding
indices)


` SELECT templates.id, templates.name, COUNT(template_sections.id) AS template_sections_count, COUNT(comments.id) AS comments_count FROM templates LEFT JOIN template_sections ON templates.id = template_sections.template_id LEFT JOIN comments ON template_sections.id = comments.commentable_id WHERE template_sections.id IS NOT NULL GROUP BY templates.id`

Indcies should be added to the columns where we use to join the tables `template_section_id` in table Templates and on `commentable_id` in Comments table.
If we were to improve the performance of getting the homepage data, there is an approach where we save these section and comments count in a memory store data strucure such as Redis and Memcache and get these values super fast since it is a nosql database that stores keys and values.
