-- Deliverable 1 --------------
-------------------------------

-- Create retirement_titles.csv
    SELECT e.emp_no,
           e.first_name,
	       e.last_name,
	       ti.title,
	       ti.from_date,
	       ti.to_date
      INTO title_info
      FROM employees AS e
INNER JOIN titles AS ti
        ON (e.emp_no = ti.emp_no)
     WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
  ORDER BY e.emp_no;


-- Create Unique Titles table
    SELECT DISTINCT ON (ti.emp_no)
           ti.emp_no,
           ti.first_name,
	       ti.last_name,
	       ti.title
      INTO unique_title
      FROM title_info AS ti
     WHERE (ti.to_date = '9999-01-01')
  ORDER BY ti.emp_no, ti.to_date DESC;


-- Create Retiring Titles table
  SELECT COUNT(u.title),
         u.title
    INTO retiring_titles
    FROM unique_title AS u
GROUP BY u.title
ORDER BY u.count DESC;
