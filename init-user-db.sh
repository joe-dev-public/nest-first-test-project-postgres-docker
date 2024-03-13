#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER nestjs WITH PASSWORD 'topsecret';
	CREATE DATABASE nestjs_first_project;
	GRANT ALL PRIVILEGES ON DATABASE nestjs_first_project TO nestjs;
	ALTER DATABASE nestjs_first_project OWNER TO nestjs;
EOSQL
