import streamlit as st
from dotenv import load_dotenv
import os
import mysql.connector

load_dotenv()

@st.cache_resource
def get_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

conn = get_connection()

st.title("Library Management System")