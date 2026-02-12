# Imagen base oficial de n8n
FROM n8nio/n8n:latest

USER root

# Create directory and set permissions (though running as root usually bypasses issues, 
# explicit creation is good practice)
RUN mkdir -p /data/.n8n && chmod -R 777 /data

# Set working directory
WORKDIR /home/node

# Expose the port
EXPOSE 5678

# Entrypoint is already defined in the base image, but we can be explicit if needed.
# We bypass the default entrypoint script to prevent it from switching back to the 'node' user,
# ensuring we run as root to avoid permission issues.
ENTRYPOINT ["tini", "--", "n8n"]
CMD ["start"]
