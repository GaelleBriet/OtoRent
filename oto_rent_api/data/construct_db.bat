psql -U oto-rent -d oto-rent -f scripts/01_import_tables.sql
psql -U oto-rent -d oto-rent -f scripts/02_remove_data.sql
psql -U oto-rent -d oto-rent -f scripts/03_import_agencies.sql
psql -U oto-rent -d oto-rent -f scripts/04_import_vehicles.sql
psql -U oto-rent -d oto-rent -f scripts/05_import_users.sql