# id,name,address

# Test Regex SerDe
select regexp_replace('002,michael,57-D,costa rica','^(.*?),(.*?),(.*?)$','$1|$2|$3');

# Create Table
CREATE TABLE table my_table (
    id       string,
    name     string,
    address  string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES ('input.regex'='^(.*?),(.*?),(.*?)$')
TBLPROPERTIES("skip.header.line.count"="1")
location 'put location here' 
;


# id,name,address,city

# Test Regex SerDe
select regexp_replace('001,adam,1-A102, mont vert,sydney','^(.*?),(.*?),(.*?),([^,]*?)$','$1|$2|$3|$4');

# Create Table
CREATE TABLE table my_table (
    id       string,
    name     string,
    address  string,
    city     string
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
WITH SERDEPROPERTIES ('input.regex'='^(.*?),(.*?),(.*?),([^,]*?)$')
TBLPROPERTIES("skip.header.line.count"="1")
location 'put location here' 
;

