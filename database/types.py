from database.db import Database
db = Database()

def upsert_type(params):
    sql_params = [params['type'], params['type']]
    sql_stmt = '''insert into types (type) values (%s)
        ON CONFLICT (type) DO UPDATE
        SET type = %s RETURNING id'''
    return db.run_query(sql_stmt, sql_params, 'one')
