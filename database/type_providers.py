from database.db import Database
db = Database()

def upsert_type_provider(type_id, provider_id):
    sql_params = [type_id, provider_id]
    sql_stmt = '''insert into type_providers (type_id, provider_id) values (%s, %s)
        ON CONFLICT (type_id, provider_id) DO NOTHING
        returning *'''
    return db.run_query(sql_stmt, sql_params)
