from fastapi import FastAPI
from fastapi.responses import JSONResponse, Response

app = FastAPI()


@app.get("/")
async def root() -> Response:
    data = {"message": "Hello, World!"}
    return JSONResponse(content=data)
