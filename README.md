# Post-Role-Permission Application

## Features

-   User authentication with roles and permissions (Admin, Author)
-   CRUD operations for posts
-   File uploads for post images
-   Notifications for new posts
-   Role based authentication and authorization

## Requirements

-   PHP >= 8.3.11
-   Laravel >= ^10.10
-   MySQL
-   Composer
-   Git

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/tofikpardeshi/role_permission.git
    ```

2. Navigate to the project directory:

    ```bash
    cd post-role-permission
    ```

3. Command to run project:

    ```bash
      php artisan serve
      npm run dev
    ```

## Credentials

### Admin

1. Email: admin@yopmail.com
2. Password: Pass@123

### Author

1. Email: author@yopmail.com
2. Password: Pass@123

## Deployment on DigitalOcean

### Step 1: Create a Droplet

1. Log in to [DigitalOcean](https://www.digitalocean.com/) and create a Droplet with Ubuntu (recommended version).
2. Choose a plan based on your needs and set up your SSH keys.

### Step 2: Connect to Your Droplet

Open your terminal and connect to your Droplet:

```bash
ssh root@your_droplet_ip
```

### Step 3: Install Required Software

1. Update the package index:

    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. Install Nginx:

    ```bash
    sudo apt install nginx -y
    ```

3. Install PHP and required extensions:

    ```bash
    sudo apt install php-fpm php-mysql php-xml php-mbstring php-curl php-zip php-cli unzip -y
    ```

4. Install Composer:

    ```bash
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    ```

5. Install MySQL Server (optional):
    ```bash
    sudo apt install mysql-server -y
    ```

### Step 4: Set Up Your Laravel Application

1. Install Git:

    ```bash
    sudo apt install git -y
    ```

2. Clone your repository:

    ```bash
    cd /var/www
    sudo git clone post-role-permission
    cd post-role-permission
    ```

3. Install Laravel dependencies:

    ```bash
    composer install
    ```

4. Create a copy of the .env file:

    ```bash
    cp .env.example .env
    ```

5. Generate the application key:

    ```bash
    php artisan key:generate
    ```

6. Set up your database:

    ```bash
    sudo mysql -u root -p
    ```

    ```sql
    CREATE DATABASE your_database_name;
    CREATE USER 'root'@'localhost' IDENTIFIED BY 'Pass@123';
    GRANT ALL PRIVILEGES ON your_database_name.* TO 'root'@'localhost';
    FLUSH PRIVILEGES;
    EXIT;
    ```

7. Configure the .env file with database settings:

    ```plaintext
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel_role_permission
    DB_USERNAME=root
    DB_PASSWORD=""
    ```

### Step 5: Configure Nginx

1. Create an Nginx configuration file:

    ```bash
    sudo nano /etc/nginx/sites-availablepost-role-permission
    ```

    Add the following configuration:

    ```nginx
    server {
        listen 80;
        server_name your_domain.com; # Your domain or IP

        root /var/wwwpost-role-permission/public;
        index index.php index.html index.htm;

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php7.4-fpm.sock; # Adjust for your PHP version
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

        location ~ /\.ht {
            deny all;
        }
    }
    ```

2. Enable the configuration:

    ```bash
    sudo ln -s /etc/nginx/sites-available/post-role-permission/etc/nginx/sites-enabled/
    ```

3. Test Nginx configuration:

    ```bash
    sudo nginx -t
    ```

4. Restart Nginx:
    ```bash
    sudo systemctl restart nginx
    ```

### Step 6: Set Permissions

1. Set proper permissions:
    ```bash
    sudo chown -R www-data:www-data /var/www/post-role-permission
    sudo chmod -R 755 /var/www/post-role-permission/storage
    ```
