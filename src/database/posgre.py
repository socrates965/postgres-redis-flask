from dotenv import find_dotenv, load_dotenv
from sqlalchemy import create_engine
import os

def get_db_engine():
    load_dotenv(find_dotenv())
    username = os.environ.get("postgres-username")
    password = os.environ.get("postgres-password")
    host = os.environ.get("postgres-host")

    connection_str = "postgresql+psycopg2://{0}:{1}@{2}/case_db".format(username, password, host)

    db_engine = create_engine(connection_str)

    return db_engine

