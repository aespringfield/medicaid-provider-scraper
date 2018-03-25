from database.db import Database
db = Database()

def upsert_subtype_type(subtype, type_id):
    sql_params = [subtype, type_id]
    sql_stmt = '''insert into subtype_types (subtype_id, type_id) values (%s, %s)
        ON CONFLICT (subtype_id, type_id) DO NOTHING
        returning *'''
    return db.run_query(sql_stmt, sql_params, 'one')
