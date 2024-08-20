# Project Stone

**Project Stone** aims to provide a more intuitive and productive experience when working with SQL databases. It is built on the philosophy that your database should be embedded seamlessly within your business logic. While ORMs (Object-Relational Mappers) address this to some extent, they are often limited and scoped by the language in use. **Stone** allows you to write SQL statements directly in SQL files or within any file using multiline comments. Additionally, the SQL statements should always reflect the current state of your database.

## Key Features

- **Write SQL Anywhere**: SQL statements can be written in `.sql` files or embedded in other files using multiline comments.
- **Reflection of Database State**: Ensures that the current SQL statements reflect the actual state of the database.
- **Future Development with Sto Lang**: We are developing `sto lang`, a more intuitive language similar to SQL, which will simplify the syntax even further.

## Example

In traditional SQL:

``` sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,                 -- Auto-incrementing primary key
    username VARCHAR(50) NOT NULL UNIQUE,  -- Username must be unique and not null
    email VARCHAR(100) NOT NULL UNIQUE,    -- Email must be unique and not null
    password_hash VARCHAR(255) NOT NULL,   -- Store the hashed password
    first_name VARCHAR(50),                -- User's first name
    last_name VARCHAR(50),                 -- User's last name
    created_at TIMESTAMP DEFAULT NOW(),    -- Timestamp of creation, defaulting to current time
    updated_at TIMESTAMP DEFAULT NOW(),    -- Timestamp of last update, defaulting to current time
    last_login TIMESTAMP                   -- Timestamp of last login
);
```

```sto
create.table users:
    id: serial.primary.key
    username: varchar[50].not.null.unique
    email: varchar[100].not.null.unique
    password_hash: varchar[255].not.null
    first_name: varchar[50]
    last_name: varchar[50]
    created_at: timestamp = now()
    last_login: timestamp
```

## Challenges and Solutions
- **Database State Reflection**: To ensure the SQL reflects what's in the database, we handle migrations separately. This is managed by the Stone CLI, which creates a .stone directory in the current working directory. Inside, there is a migrations folder that handles all migrations. These files are what get executed against the database.

- **Sto Lang Development**: sto lang is still under development and will take time to be ready for use. During this time, challenges will arise, and appropriate solutions will be provided. The goal of sto lang is to make SQL more intuitive.

- **Multiple SQL Files and Statements**: To handle dependencies between SQL statements across multiple files, Stone scans all SQL statements, whether in .sql or other files, and organizes them to ensure that objects are created in the correct order. You can place SQL statements anywhere in your code, and Stone will take care of collecting, organizing, and creating a final snapshot in the correct order.

