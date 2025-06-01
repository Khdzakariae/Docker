#!/bin/bash

# Variables
WP_PATH="/var/www/html"         # Path to WordPress files
DB_NAME="wordpress"
DB_USER="zakariae"
DB_PASSWORD="password1"
DB_HOST="localhost"             # Or the container name if using Docker Compose

# Copy the sample config if not already configured
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    cp "$WP_PATH/wp-config-sample.php" "$WP_PATH/wp-config.php"

    # Update database settings
    sed -i "s/database_name_here/$DB_NAME/" "$WP_PATH/wp-config.php"
    sed -i "s/username_here/$DB_USER/" "$WP_PATH/wp-config.php"
    sed -i "s/password_here/$DB_PASSWORD/" "$WP_PATH/wp-config.php"
    sed -i "s/localhost/$DB_HOST/" "$WP_PATH/wp-config.php"

    echo "✅ wp-config.php configured successfully."
else
    echo "⚠️ wp-config.php already exists. Skipping configuration."
fi
