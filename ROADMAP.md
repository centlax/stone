# Roadmap for Centlax Stone: A Better Way to Work with PostgreSQL

### Version 0
Centlax Stone will be provided with a directory containing ordered SQL files, which it will compile into a single SQL file wrapped in a transaction. If any syntax errors occur, the entire file will be rejected. The final file will be named based on the current timestamp `[time].sql`.  
- **Note**: This version will not handle formatting or linting. It will only collect and combine SQL files in order—processing files first, then directories recursively—before wrapping everything in a transaction.

### Version 1
Support for handling migrations will be introduced.

### Version 2
Centlax Stone will scan the contents of SQL files to offer features like formatting, linting, and syntax highlighting.

### Version 3
SQL files can be written in any order. Centlax Stone will automatically reorder them based on dependencies, object types, and other conditions.

### Version 4
SQL can be embedded inside other files using `=*=` tokens, similar to the following Go example:
```go
/*
=*= SQL
CREATE TABLE users(name TEXT);
=*=
*/
```
### Version 5
Structured Query Type (SQT), a new language being developed at Centlax, will be introduced. SQT will provide a more intuitive way to interact with PostgreSQL, and will compile into efficient SQL.

## NOTICE
Each major version of Centlax Stone introduces significant new features, which may result in breaking changes to the API. Additionally, new features not currently listed may be added for the betterment of the tool.