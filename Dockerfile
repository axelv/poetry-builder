ARG PYTHON_VERSION=3.13
FROM python:${PYTHON_VERSION}-alpine3.19
ARG POETRY_VERSION=1.8.1
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV POETRY_HOME /workspace/poetry
RUN python3 -m venv $POETRY_HOME
RUN $POETRY_HOME/bin/pip install poetry==$POETRY_VERSION
RUN $POETRY_HOME/bin/poetry config virtualenvs.in-project true
RUN $POETRY_HOME/bin/poetry config virtualenvs.create false
RUN $POETRY_HOME/bin/poetry config repositories.google https://europe-west1-python.pkg.dev/tiroapp-4cb17/atticus

RUN $POETRY_HOME/bin/poetry self add keyring==24 keyrings.google-artifactregistry-auth
RUN $POETRY_HOME/bin/poetry self add poetry-plugin-export==1.8

ENTRYPOINT ["/opt/poetry/bin/poetry"]
