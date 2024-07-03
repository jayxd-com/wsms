# Use the official PHP-FPM image as a base image
FROM php:8.1-fpm

# Install necessary PHP extensions and tools
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the PHP source code to the working directory
COPY . /var/www/html

# Set appropriate permissions for the working directory
RUN chown -R www-data:www-data /var/www/html

# Expose port 9001
EXPOSE 9001

# Configure PHP-FPM to listen on port 9001
RUN sed -i 's/listen = \/run\/php\/php-fpm.sock/listen = 9001/' /usr/local/etc/php-fpm.d/zz-docker.conf

# Start PHP-FPM server
CMD ["php-fpm"]