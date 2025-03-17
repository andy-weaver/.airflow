#!/bin/bash

export AIRFLOW_VERSION=2.10.5
export PYTHON_VERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
export CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

python -m venv ../.venv
source ../.venv/bin/activate
pip install --upgrade pip
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

airflow standalone # Initialize the database, create the admin user, and start all the components