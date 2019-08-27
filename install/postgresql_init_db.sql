drop database micro_party_quiz_db;
drop USER micro_party_quiz_user;
create database micro_party_quiz_db WITH ENCODING 'UTF8' LC_COLLATE='en_US.UTF8' LC_CTYPE='en_US.UTF8' TEMPLATE=template0;
CREATE USER micro_party_quiz_user WITH ENCRYPTED PASSWORD '111';
GRANT USAGE ON SCHEMA public to micro_party_quiz_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO micro_party_quiz_user;

GRANT CONNECT ON DATABASE micro_party_quiz_db to micro_party_quiz_user;
GRANT ALL PRIVILEGES ON DATABASE micro_party_quiz_db TO micro_party_quiz_user;
\c micro_party_quiz_db
GRANT USAGE ON SCHEMA public to micro_party_quiz_user; 
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO micro_party_quiz_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO micro_party_quiz_user;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO micro_party_quiz_user;

ALTER DEFAULT PRIVILEGES GRANT ALL PRIVILEGES ON TABLES TO micro_party_quiz_user;
ALTER DEFAULT PRIVILEGES GRANT ALL PRIVILEGES ON SEQUENCES TO micro_party_quiz_user;
ALTER DEFAULT PRIVILEGES GRANT ALL PRIVILEGES ON FUNCTIONS TO micro_party_quiz_user;
ALTER DEFAULT PRIVILEGES GRANT ALL PRIVILEGES ON TYPES TO micro_party_quiz_user;
