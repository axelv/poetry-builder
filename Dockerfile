FROM python:3.10-slim-buster
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV POETRY_HOME /opt/poetry
RUN python3 -m venv $POETRY_HOME
RUN $POETRY_HOME/bin/pip install poetry==1.3.1
RUN $POETRY_HOME/bin/poetry config virtualenvs.create false
RUN $POETRY_HOME/bin/poetry self add keyring keyrings.google-artifactregistry-auth
RUN $POETRY_HOME/bin/poetry config repositories.google https://europe-west1-python.pkg.dev/tiroapp-4cb17/atticus
ENTRYPOINT ["/opt/poetry/bin/poetry"]