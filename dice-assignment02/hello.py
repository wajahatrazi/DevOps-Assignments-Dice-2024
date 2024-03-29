import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def get_home():
    return ("Hello World this is Assignment 02!")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)