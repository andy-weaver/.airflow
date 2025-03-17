# Dockerfile
# =============================================================================
# This Dockerfile creates a batteries-included Apache Airflow development
# container based on andyandyandyandy2023:nvim-dev. It installs Airflow,
# creates necessary directories, and uses an entrypoint script to ensure that
# the Airflow DB is initialized.
# =============================================================================

FROM andyandyandyandy2023/nvim-dev:latest

# Set Airflow environment variables
ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Install a specific version of Apache Airflow
RUN pip install apache-airflow==2.10.5

# Create necessary Airflow directories for DAGs, logs, and plugins
RUN mkdir -p $AIRFLOW_HOME/dags $AIRFLOW_HOME/logs $AIRFLOW_HOME/plugins

# Copy the entrypoint script into the image and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entrypoint script to initialize the Airflow DB (if not already present)
ENTRYPOINT ["/entrypoint.sh"]

# Default command (will be overridden by docker-compose for specific services)
CMD ["bash"]