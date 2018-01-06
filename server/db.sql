

CREATE TABLE users (
  id serial primary key not null,
  name varchar (300) not null,
  password varchar (200), -- authentication?
  email varchar (500),
  bio varchar (400) not null,
  compensation varchar (100), -- 3 options
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  open boolean default TRUE,--boolean true false
  token varchar (100) default '',
  expires timestamp default now(),
);

CREATE TABLE users_levels (
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  level_id INT REFERENCES levels(id) ON DELETE CASCADE
)


CREATE TABLE levels (
  id serial primary key not null,
  level int not null,
  descript varchar (100)
)

CREATE TABLE skills (
  id serial primary key not null,
  skill varchar (100) not null,
)

CREATE TABLE projects (
  id serial primary key not null,
  name varchar (100),
  description varchar (500) not null, -- make this 140
  numteam int not null,
  currentnumteam int not null default 0,
  projectTime int,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  compensation varchar (100)
)

CREATE TABLE projects_skills(
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  project_id INT REFERENCES projects(id) ON DELETE CASCADE,
  proficiency int not null default 0 --(1-5)
)

CREATE TABLE user_skills(
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  skill_id INT REFERENCES skills(id) ON DELETE CASCADE,
  proficiency int not null default 0 --(1-5)
)

--adding skill data
INSERT INTO skills (skill) VALUES ('Design');
INSERT INTO skills (skill) VALUES ('Illustration');
INSERT INTO skills (skill) VALUES ('Development');
INSERT INTO skills (skill) VALUES ('QA');
INSERT INTO skills (skill) VALUES ('Photography');
INSERT INTO skills (skill) VALUES ('Music');
INSERT INTO skills (skill) VALUES ('Painting');

--adding level data
INSERT INTO levels (level, descript) VALUES (1, '1-5 hours');
INSERT INTO levels (level, descript) VALUES (2, '5-10 hours');
INSERT INTO levels (level, descript) VALUES (3, '10-20 hours');
INSERT INTO levels (level, descript) VALUES (4, '20+ hours');

-- adding user database
--INSERT INTO users (name, password, email, bio, compensation, created, open, token, expires) VALUES
--('Suzanna Altman', 'I am a front end developer with loads of experience in JavaScript. I love learning about the IOT and would love to work on a project where I can expand this skillset.', '')

--Suzanna	Altman	I am a front end developer with loads of experience in JavaScript. I love learing about the IoT and would love to work on a project where I can expand this skillset. 	Design, Development	3,5	Either	1-5
-- select concat('(''', name, ''',', ''',', password, ''',', ''',', email, ''',', ''',', bio, ',', compensation, ',', ')') from users;
--
-- (name, password, email, bio, compensation, created, open, token, expires
--
-- select * from users
