CREATE DATABASE IF NOT EXISTS workers;
use workers;
CREATE TABLE IF NOT EXISTS workers_info (
id INT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
workers_position VARCHAR(30) NOT NULL,
workers_salary VARCHAR(30) NOT NULL
);
replace INTO workers_info ( id, first_name, last_name, workers_position, workers_salary ) VALUES ( 1, 'Boris', 'Blade', 'Manager', '25000');
replace INTO workers_info ( id, first_name, last_name, workers_position, workers_salary ) VALUES ( 2, 'Mr',
'Yellow', 'HR', '20000');
replace INTO workers_info ( id, first_name, last_name, workers_position, workers_salary ) VALUES ( 3,
'Mark', 'Durov', 'JS Senior', '70000');
replace INTO workers_info ( id, first_name, last_name, workers_position, workers_salary ) VALUES ( 4, 'Corvus',
'Corax', 'Primarch', '10000');

UPDATE workers_info
SET workers_position='DevOps'
WHERE id=1;

UPDATE workers_info
SET workers_position='ProjectManager'
WHERE id=2;

UPDATE workers_info
SET workers_salary='40000'
WHERE id=1;

UPDATE workers_info
SET workers_salary='45000'
WHERE id=2;

SELECT first_name, last_name FROM workers_info WHERE workers_salary < 30000;
SELECT first_name, last_name FROM workers_info WHERE workers_position = 'Primarch' and workers_salary < 30000;

CREATE TABLE IF NOT EXISTS workers_links (
id INT UNSIGNED AUTO_INCREMENT primary key,
master_id INT UNSIGNED,
slave_id INT UNSIGNED
);

insert into workers_links (master_id, slave_id) values (3,4);
insert into workers_links (master_id, slave_id) values (3,1);
insert into workers_links (master_id, slave_id) values (2,3);
insert into workers_links (master_id, slave_id) values (2,1);


select worker.*
from workers_info as worker
	left join workers_links as links on worker.id=links.slave_id
where links.master_id=(
	select id 
    from workers_info 
    where first_name='Mark'
)    
;