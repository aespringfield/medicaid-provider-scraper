from database.db import Database
db = Database()

def upsert_subtype(params):
    sql_params = [params['subtype'], params['subtype']]
    sql_stmt = '''insert into subtypes (subtype) values (%s)
        ON CONFLICT (subtype) DO UPDATE
        SET subtype = %s RETURNING id'''
    return db.run_query(sql_stmt, sql_params, 'one')
