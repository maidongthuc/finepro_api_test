import os
from dotenv import load_dotenv
from langchain_google_genai import ChatGoogleGenerativeAI

# Load environment variables from .env file
load_dotenv()
llm = ChatGoogleGenerativeAI(
    model="gemini-2.5-flash",
    convert_system_message_to_human=True,
    temperature=0,
    max_tokens=None,
    timeout=None,
    max_retries=2,
)
