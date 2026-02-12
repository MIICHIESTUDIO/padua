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
# The base image CMD is "start"
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["n8n"]
