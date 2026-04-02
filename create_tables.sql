--- Tabel utilizatori

CREATE TABLE users (
	user_id int8 PRIMARY KEY,
	name varchar(100),
	email varchar(100)

);


------ Tabel roluri

CREATE TABLE roles(
	role_id int8 PRIMARY KEY,
	role_name varchar(50)
	
);

------- Join table users_roles

CREATE TABLE users_roles (
	user_id int8,
	role_id int8,
	CONSTRAINT users_roles_pk PRIMARY KEY(user_id, role_id),
	CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(user_id),
	CONSTRAINT fk_role FOREIGN KEY(role_id) REFERENCES roles(role_id)
	
);


----- Tabel logs 

CREATE TABLE logs (
	log_id int8 PRIMARY KEY,
	user_id int8,
	action varchar(100),
	log_date TIMESTAMP,
	CONSTRAINT fk_user_logs FOREIGN KEY(user_id) REFERENCES users(user_id)
	
);
