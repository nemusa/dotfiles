CREATE USER conrad_test;
ALTER ROLE conrad_test WITH SUPERUSER;
CREATE DATABASE template_postgis;
\c template_postgis;
CREATE EXTENSION postgis;

CREATE DATABASE ipcontent;