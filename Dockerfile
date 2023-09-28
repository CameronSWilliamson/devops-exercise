FROM python:3.11.3-slim
WORKDIR /app

COPY src ./src
COPY Pipfile Pipfile.lock ./
COPY version.json ./

RUN pip3 install pipenv
RUN pipenv install

ENV UVICORN_HOST=0.0.0.0
ENV UVICORN_PORT=8080
ENV BW_MESSAGE="Hi from Bitwarden!"

EXPOSE 8080
ENTRYPOINT [ "pipenv", "run", "uvicorn", "src.app:app" ]
