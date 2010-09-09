# Ruby on Rails Tutorial: sample application

This is the sample application for
[*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

Tip for creating obfuscated heroku servers:
('a'..'z').to_a.shuffle[0..7].join

# User schema

+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| user_id       | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| email         | varchar(255)     | NO   | UNI | NULL    |                |
| email_old     | varchar(255)     | NO   |     | NULL    |                |
| first_name    | varchar(255)     | NO   |     | NULL    |                |
| last_name     | varchar(255)     | NO   |     | NULL    |                |
| password      | char(41)         | NO   |     | NULL    |                |
| salt          | varchar(255)     | NO   |     | NULL    |                |
| mobile        | varchar(50)      | NO   |     | NULL    |                |
| gender        | char(1)          | NO   |     | NULL    |                |
| status        | varchar(24)      | NO   |     | NULL    |                |
| country       | varchar(3)       | NO   |     | NULL    |                |
| language      | varchar(3)       | NO   |     | NULL    |                |
| time_zone     | tinyint(11)      | NO   |     | NULL    |                |
| terms_agreed  | tinyint(4)       | NO   |     | NULL    |                |
| sent_reg_mail | tinyint(4)       | NO   |     | NULL    |                |
| last_login    | int(11)          | NO   |     | NULL    |                |
| login_count   | int(11)          | NO   |     | NULL    |                |
| created_at    | int(11)          | NO   |     | NULL    |                |
| modified_at   | int(11)          | NO   |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+