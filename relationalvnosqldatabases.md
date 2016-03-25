# Relational vs NoSQL Databases and flat files

## Relational Databases

Relational databases organise data in tables and are primarily accessed through SQL (structured query language).

Each table is responsible for one category of data, and each row contains a unique instance of data for that category. Columns contain different categories for each instance.

### Advantages

* Easy to create
* Easy to accessed
* Easy to extend. New database categories can be added without affecting existing data structures.
* Data is clear-cut and uncluttered
* Data is only stored once
* Complex queries can be made
* Most developers are familiar with relational databases

### Disadvantages
* Reduces machine performance
* Inflexible
* Developer expertise required
* Broken keys and records
* Data complexity

## NoSQL Databases

There are several types of NoSQL databases, but key-value stores are the simplest type. It is simply blob of data and doesn't konw/care what is inside.

### Advantages
* Good for nested data
* Flexible and easy to change
* Allows semi-structured and unstructured data
* Aligns well with object-oriented programming
* Inexpensive

### Disadvantages
* Less mature
* Less support
* Requires significant developer expertise (even though it was intended not to)
