SELECT * 
FROM Users
WHERE mail REGEXP '^(?![-\._0-9])([a-z0-9A-Z\-\._]+)@leetcode.com'

/*
The regex uses a negative look ahead first.

1. ^(?![-\._0-9]): It disallows those prefixes that start with '.', '0-9', '_' or '-'
2. [a-z0-9A-Z\-\._]+: It then tries to match the actual prefix with uppercase/lowercase characters, digits, periods, underscores and hyphens
3. @leetcode.com

*/