FROM python:3.12-slim-bookworm

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000
ENV API_PATH="/"

CMD [ \
    "uvicorn", \
    "main:app", \
    "--port", "8000", \
    "--root-path", "${API_PATH}", \
    "--proxy-headers" \
]
