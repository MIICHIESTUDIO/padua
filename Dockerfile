# Imagen base oficial de n8n
FROM n8nio/n8n:latest

USER root
RUN mkdir -p /data/.n8n && chmod -R 777 /data

ENV N8N_USER_FOLDER=/data
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=password
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://padua.onrender.com/
ENV N8N_EDITOR_BASE_URL=https://padua.onrender.com
ENV N8N_PROTOCOL=https
ENV N8N_HOST=padua.onrender.com
ENV DB_SQLITE_POOL_SIZE=2
ENV N8N_RUNNERS_ENABLED=true
ENV N8N_BLOCK_ENV_ACCESS_IN_NODE=false
ENV N8N_GIT_NODE_DISABLE_BARE_REPOS=true

WORKDIR /home/node
USER node
EXPOSE 5678

ENTRYPOINT ["tini", "--", "n8n"]
CMD ["start"]
