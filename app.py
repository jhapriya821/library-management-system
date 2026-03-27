import streamlit as st
import pandas as pd
from sqlalchemy import create_engine, text, URL
from dotenv import load_dotenv
import os

load_dotenv()

@st.cache_resource
def get_engine():
    connection_url = URL.create(
        drivername="mysql+pymysql",
        username=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME")
    )
    return create_engine(connection_url)

engine = get_engine()
st.set_page_config(page_title="Library Management System", layout="wide")

st.title("Overview")
