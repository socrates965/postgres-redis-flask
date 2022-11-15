from dotenv import find_dotenv, load_dotenv
from sqlalchemy import create_engine
import os

def get_db_engine():
    load_dotenv(find_dotenv())
    username = os.getenv("POSTGRES_USERNAME")
    password = os.getenv("POSTGRES_PASSWORD")
    host = os.getenv("POSTGRES_HOST")
    port = os.getenv("POSTGRES_PORT")

    connection_str = "postgresql+psycopg2://{0}:{1}@{2}:{3}/case_db".format(username, password, host, port)

    db_engine = create_engine(connection_str)

    return db_engine

