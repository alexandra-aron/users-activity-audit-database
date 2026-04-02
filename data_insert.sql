-- -------------------------------
-- Inserare utilizatori
-- -------------------------------
INSERT INTO users(user_id, name, email) VALUES
(1, 'Ana Popescu', 'ana.popescu@email.com'),
(2, 'Andrei Ionescu', 'andrei.ionescu@email.com'),
(3, 'Ioana Georgescu', 'ioana.georgescu@email.com'),
(4, 'Mihai Vasilescu', 'mihai.vasilescu@email.com'),
(5, 'Elena Dumitrescu', 'elena.dumitrescu@email.com'),
(6, 'Radu Marinescu', 'radu.marinescu@email.com');

-- -------------------------------
-- Inserare roluri
-- -------------------------------

INSERT INTO roles(role_id, role_name) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Manager'),
(4, 'Developer'),
(5, 'Analyst');


-- -------------------------------
-- Inserare legaturi users_roles
-- -------------------------------


INSERT INTO users_roles (user_id, role_id) VALUES
(1,1), (1,5), -- Ana = Admin + Analyst
(2,2), -- Andrei = User
(3,3), -- Ioana = Manager
(4,4), -- Mihai = Developer
(5,2), (5,5), -- Elena = User + Analyst
(6,4); -- Radu = Developer


-- -------------------------------
-- Inserare logs (20 intrari)
-- -------------------------------

INSERT INTO logs (log_id, user_id, action, log_date) VALUES
(1,1, 'Login', '2026-04-01 09:00:00'),
(2,2, 'Login failed', '2026-04-01 09:05:00'),
(3,3, 'Password changed', '2026-04-01 09:10:00'),
(4,4, 'Viewed dashboard', '2026-04-01 09:12:00'),
(5,5, 'Created report', '2026-04-01 09:15:00'),
(6,1, 'Logout', '2026-04-01 09:20:00'),
(7,2, 'Login', '2026-04-01 09:25:00'),
(8,3, 'Login failed', '2026-04-01 09:30:00'),
(9,4, 'Updated settings', '2026-04-01 09:35:00'),
(10,5, 'Deleted record', '2026-04-01 09:40:00'),
(11,1, 'Password changed', '2026-04-01 09:45:00'),
(12,2, 'Viewed dashboard', '2026-04-01 09:50:00'),
(13,3, 'Login', '2026-04-01 09:55:00'),
(14,4, 'Login failed', '2026-04-01 10:00:00'),
(15,5, 'Created report', '2026-04-01 10:05:00'),
(16,1, 'Deleted record', '2026-04-01 10:10:00'),
(17,2, 'Updated settings', '2026-04-01 10:15:00'),
(18,3, 'Logout', '2026-04-01 10:20:00'),
(19,4, 'Login', '2026-04-01 10:25:00'),
(20,5, 'Login failed', '2026-04-01 10:30:00'),
(21,6, 'Login', '2026-04-01 10:35:00'),
(22,6, 'Viewed dashboard', '2026-04-01 10:40:00');

