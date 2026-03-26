import streamlit as st
from sqlalchemy import create_engine, URL
from dotenv import load_dotenv
import os

load_dotenv()

@st.cache_resource
def get_connection():
    connection_url = URL.create(
        drivername="mysql+pymysql",
        username=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME")
    )

    engine = create_engine(connection_url)