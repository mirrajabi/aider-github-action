FROM python:3.10-slim

RUN apt update && apt install -y git
RUN pip install aider-chat

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
