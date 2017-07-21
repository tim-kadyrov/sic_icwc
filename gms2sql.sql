use gams;
load data infile 'outputcompdata.csv' into table temp
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n';
TRUNCATE outputcompdata;
INSERT INTO outputcompdata SELECT * FROM temp;
TRUNCATE TABLE temp;
load data infile 'calibrationcoefs.csv' into table temp
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n';
TRUNCATE calibrationcoefs;
INSERT INTO calibrationcoefs SELECT * FROM temp;
TRUNCATE TABLE temp;
load data infile 'outputfactdata.csv' into table temp
fields terminated by ','
optionally enclosed by '"'
lines terminated by '\n';
TRUNCATE outputfactdata;
INSERT INTO outputfactdata SELECT * FROM temp;
TRUNCATE TABLE temp;