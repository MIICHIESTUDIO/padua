#!/bin/sh
set -e

# Fix permissions for the /data directory
if [ -d "/data" ]; then
    echo "Fixing permissions for /data..."
    chown -R node:node /data
fi

# Set the listen address to 0.0.0.0 to ensure external accessibility
export N8N_LISTEN_ADDRESS=0.0.0.0

# Execute the passed command (default: n8n start)
exec "$@"
