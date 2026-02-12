# Imagen base oficial de n8n
FROM n8nio/n8n:latest

USER root

# Create directory and set permissions (though running as root usually bypasses issues, 
# explicit creation is good practice)
RUN mkdir -p /data/.n8n && chmod -R 777 /data

# Define environment variables directly in Dockerfile to ensure they are present
# even if Render Blueprint sync fails or is not used.
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://padua.onrender.com
ENV N8N_EDITOR_BASE_URL=https://padua.onrender.com
ENV N8N_PROTOCOL=https
ENV N8N_HOST=padua.onrender.com
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_EXPRESS_TRUST_PROXY=true
# Note: Password should ideally be a secret, but properly set in Render dashboard. 
# We leave a default here or rely on Render env var.

# Set working directory
WORKDIR /home/node

# Expose the port
EXPOSE 5678

# Entrypoint is already defined in the base image, but we can be explicit if needed.
# We bypass the default entrypoint script to prevent it from switching back to the 'node' user,
# ensuring we run as root to avoid permission issues.
ENTRYPOINT ["tini", "--", "n8n"]
CMD ["start"]
