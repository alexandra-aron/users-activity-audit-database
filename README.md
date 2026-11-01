# User Activity Audit Database

A small PostgreSQL database that keeps track of users, their roles, and what they do in a system (log in, log out, change their password and so on). It's the kind of audit trail most applications need somewhere, which is why I wanted to model one myself.

## Tables

- `users`: id, name and email
- `roles`: e.g. Admin, User, Manager
- `users_roles`: many-to-many link, since one user can have several roles
- `logs`: every action a user performs, with a timestamp

## Files

- `create_tables.sql`: creates the four tables and the foreign keys between them
- `data_insert.sql`: sample users, roles and log entries
- `queries.sql`: queries to analyse the activity, such as each user with their roles or the latest actions in the system. Each query has a comment explaining what it does and how to read the result.

## Running it

Create a database and run the three files in the order above.
