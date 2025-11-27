from typing import Dict

from fastapi import FastAPI

app = FastAPI()


@app.get("/")  # type: ignore[misc]
def read_root() -> Dict[str, str]:
    return {"status": "ok"}
