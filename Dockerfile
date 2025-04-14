FROM debian:bookworm-slim

# Install rsync and cron
RUN apt-get update && \
    apt-get install -y rsync cron && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy sync script and crontab file
COPY sync.sh /app/sync.sh
COPY crontab.txt /app/crontab.txt

# Make the script executable
RUN chmod +x /app/sync.sh && crontab /app/crontab.txt

# # Run cron in foreground
# CMD ["cron", "-f"]
# Run the sync script directly
CMD ["/bin/bash", "-c", "/app/sync.sh"]
