import streamlit as st
import pandas as pd
from sqlalchemy import create_engine, text, URL
from dotenv import load_dotenv
import os

load_dotenv()

st.set_page_config(page_title="Overview", layout="wide")
st.title("overview")

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

query = """
    SELECT 
        a.first_name,
        a.last_name,
        b.title, 
        b.published_at, 
        b.rating, 
        b.created_at
    FROM books b
    INNER JOIN authors a ON b.author_id = a.author_id 
"""

df = pd.read_sql(text(query), engine)

df = df.rename(columns={
    "first_name": "First Name",
    "last_name": "Last Name",
    "title": "Title",
    "published_at": "Published",
    "rating": "Rating",
    "created_at": "Created At"
})

df["Rating"] = df["Rating"].apply(lambda x: "⭐" * int(x))

st.dataframe(df)