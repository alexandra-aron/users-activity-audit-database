-- ========================================
-- Exemplu final de interogări JOIN pentru proiectul sts_project
-- Tabele implicate: 
--   1. users        -> stochează informații despre utilizatori (id, nume, email)
--   2. roles        -> stochează rolurile disponibile (Admin, User, Manager)
--   3. users_roles  -> tabel de legătură many-to-many între users și roles
--   4. logs         -> stochează acțiunile utilizatorilor în sistem (Login, Logout, Password changed, etc.)
-- Scop: demonstrarea cunoștințelor SQL și analiza activității utilizatorilor
-- ========================================

-- ----------------------------------------
-- 1. Afișează fiecare utilizator și rolul său
-- JOIN folosit: INNER JOIN între users, users_roles și roles
-- Explicație: 
--   - users_roles face legătura între un utilizator și rolul său
--   - INNER JOIN va afișa doar utilizatorii care au cel puțin un rol
-- Interpretare rezultat: 
--   - Dacă un utilizator are mai multe roluri, va apărea pe mai multe rânduri
--   - Permite verificarea rapidă a drepturilor utilizatorilor
-- ----------------------------------------
SELECT u.name AS user_name, r.role_name
FROM users u
JOIN users_roles ur ON u.user_id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
ORDER BY u.name;

-- ----------------------------------------
-- 2. Afișează primele 10 loguri cu numele utilizatorului
-- JOIN folosit: INNER JOIN între logs și users
-- Explicație: asociem fiecare log cu numele utilizatorului care l-a generat
-- LIMIT: 10 -> afișează doar primele 10 intrări
-- ORDER BY: ordonare cronologică ascendentă după data log-ului
-- Interpretare rezultat: oferă o privire rapidă asupra celor mai recente acțiuni
-- ----------------------------------------
SELECT l.log_id, u.name AS user_name, l.action, l.log_date
FROM logs l
JOIN users u ON l.user_id = u.user_id
ORDER BY l.log_date ASC
LIMIT 10;

-- ----------------------------------------
-- 3. Afișează utilizatorii care au rolul 'Admin'
-- JOIN folosit: INNER JOIN între users, users_roles și roles
-- WHERE: filtrăm doar rolul 'Admin'
-- Interpretare rezultat:
--   - Permite identificarea conturilor cu privilegii ridicate
--   - Important pentru securitate și audit intern
-- ----------------------------------------
SELECT u.name AS user_name, r.role_name
FROM users u
JOIN users_roles ur ON u.user_id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
WHERE r.role_name = 'Admin'
ORDER BY u.name;

-- ----------------------------------------
-- 4. Numărul total de loguri pentru fiecare utilizator
-- JOIN folosit: LEFT JOIN între users și logs
-- Explicație:
--   - LEFT JOIN păstrează toți utilizatorii, chiar dacă nu au loguri
--   - COUNT(l.log_id) numără logurile asociate fiecărui utilizator
-- Interpretare rezultat:
--   - Identifică utilizatorii activi și inactivi
--   - Poate fi folosit pentru statistici de utilizare a sistemului
-- ----------------------------------------
SELECT u.name AS user_name, COUNT(l.log_id) AS total_logs
FROM users u
LEFT JOIN logs l ON u.user_id = l.user_id
GROUP BY u.name
ORDER BY total_logs DESC, u.name ASC;

-- ----------------------------------------
-- 5. Afișează logurile împreună cu rolul utilizatorului
-- JOIN folosit: INNER JOIN între logs, users, users_roles și roles
-- Explicație:
--   - Combinația tuturor tabelelor principale permite analiza completă
--   - Asociem fiecare log cu utilizatorul și rolul său
-- Interpretare rezultat:
--   - Poate fi folosit pentru statistici pe rol și tip de acțiune
--   - Ajută la monitorizarea comportamentului utilizatorilor pe roluri
-- ----------------------------------------
SELECT u.name AS user_name, r.role_name, l.action, l.log_date
FROM logs l
JOIN users u ON l.user_id = u.user_id
JOIN users_roles ur ON u.user_id = ur.user_id
JOIN roles r ON ur.role_id = r.role_id
ORDER BY l.log_date ASC, u.name;

-- ----------------------------------------
-- 6. Identifică utilizatorii cu încercări multiple eșuate de login
-- JOIN folosit: INNER JOIN între logs și users
-- WHERE: filtrăm doar acțiunile 'Login failed'
-- GROUP BY + HAVING: grupăm după utilizator și selectăm doar cei cu 2+ eșecuri
-- Interpretare rezultat:
--   - Afișează utilizatorii cu probleme la autentificare
--   - Poate fi folosit pentru alertă de securitate și detectarea tentativei de acces neautorizat
-- ----------------------------------------
SELECT u.name AS user_name, COUNT(*) AS failed_logins
FROM logs l
JOIN users u ON l.user_id = u.user_id
WHERE l.action = 'Login failed'
GROUP BY u.name
HAVING COUNT(*) >= 2
ORDER BY failed_logins DESC;
