from dotenv import find_dotenv, load_dotenv
from sqlalchemy import create_engine
import os

def get_db_engine():
    load_dotenv(find_dotenv())
    username = "admin"
    password = "admin"

    connection_str = "postgresql+psycopg2://{0}:{1}@postgres_db/case_db".format(username, password)

    db_engine = create_engine(connection_str)

    return db_engine

