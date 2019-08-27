#!/bin/bash

/usr/bin/pg_dump --file "dump.sql" --host "localhost" --port "5432" --username "micro_party_quiz_user" --verbose --format=p --section=pre-data --section=data --section=post-data --inserts --encoding "UTF8" "micro_party_quiz_db"
#sudo -u postgres -i psql <postgresql_init_db.sql
#sudo -u postgres -i psql <dump.sql
#pg_restore -U postgres -h 127.0.0.1 -d micro_party_quiz_db -C dump.dump

