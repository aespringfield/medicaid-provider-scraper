#!/usr/bin/python
import os
import psycopg2.extras
import urllib.parse

class Database:

    def __init__(self):
        urllib.parse.uses_netloc.append("postgres")
        self._db_url = urllib.parse.urlparse(os.environ["DATABASE_URL"])
        self._conn = self.init_db_conn()
        self._cur = self._conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    def init_db_conn(self):
        try:
            conn = psycopg2.connect(
                database=self._db_url.path[1:],
                user=self._db_url.username,
                password=self._db_url.password,
                host=self._db_url.hostname,
                port=self._db_url.port
            )
            conn.autocommit = True
            return conn
        except:
            print ("I am unable to connect to the database.")

    def run_query(self, sql, params, qrm=None):
        self._cur.execute(sql, params)
        if qrm == 'one':
            res = self._cur.fetchone()
        else:
            res = self._cur.fetchall()
        return res
