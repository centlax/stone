# Project Centlax Stone

**Centlax Stone** aims to provide a more intuitive and productive experience when working with SQL databases. It is built on the philosophy that your database should be embedded seamlessly within your business logic. While ORMs (Object-Relational Mappers) address this to some extent, they are often limited by the programming language in use. **Centlax Stone** allows you to write SQL statements directly in SQL files or embed them in other files using multiline comments. The SQL statements will always reflect the current state of your database, ensuring synchronization.

## Key Features

- **Write SQL Anywhere**: SQL statements can be written in `.sql` files or embedded in other files using multiline comments for flexibility.
- **Reflection of Database State**: Ensures that SQL statements match the actual structure and state of your PostgreSQL database.
- **Future Development with Structured Query Type (SQT)**: We are developing `SQT`, a more intuitive language that simplifies SQL syntax, making database interactions even more seamless.

### Challenges and Solutions
- **Database State Reflection**: To ensure SQL reflects the current state of the database, Centlax Stone handles migrations separately. This is managed through the Stone CLI, which creates a .stone directory in your project. Inside, the migrations folder organizes and tracks all migrations that get executed against your database.

- **SQT Development**: SQT is still in development and will take time to become fully usable. During this period, new challenges will arise, and solutions will be developed. The goal of SQT is to make SQL more intuitive and adaptable to modern use cases.

- **Multiple SQL Files and Statements**: Centlax Stone organizes dependencies between SQL statements, whether spread across multiple .sql files or embedded in other files. It scans and reorders them to ensure objects are created in the correct sequence. No matter where your SQL is located, Centlax Stone will collect, organize, and create a properly ordered snapshot of your database schema.