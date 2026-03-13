#For local deployment, comment out or remove the Certbot/SSL lines.

#For public hosting, remember to replace example.com and www.example.com with your actual domain name.

#!/bin/bash

# Install extra packages for the Enterprise Linux (EPEL) repository on Red Hat based Linux distributions, such as CentOS, RHEL, Rocky Linux, and Oracle Linux.
sudo yum install epel-release -y

# Install EPEL repository and Nginx
sudo yum install nginx -y

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Allow HTTP and HTTPS through firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# Install Certbot
sudo yum install certbot python3-certbot-nginx -y


# Obtain SSL certificate (replace example.com with your domain)

# Option 1: Use Your Real Domain Name: If you have an actual domain, replace `example.com` with your real domain
```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

# Requirements:
  - Your domain must point to your server's public IP address (DNS A records)
  - Your server must be accessible from the internet on ports 80 and 443
  - The domain must be a valid, registered domain


# Option 2: Use Let's Encrypt Staging Server (For Testing): If you're just testing the setup, use the staging server

```bash
sudo certbot --nginx -d example.com -d www.example.com --staging
```

Note: This will issue a test certificate that browsers won't trust, but it's useful for testing your configuration.

# Option 3: Create a Self Signed Certificate (For Local/Development) If this is for local development or testing:

# Create the directory if it doesn't exist
sudo mkdir -p /etc/ssl/private

# Create self-signed certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -subj "/C=US/ST=State/L=City/O=Organization/CN=example.com"

# Set proper permissions
sudo chmod 600 /etc/ssl/private/nginx-selfsigned.key
sudo chmod 644 /etc/ssl/certs/nginx-selfsigned.crt

# Then manually configure nginx to use it
sudo vi /etc/nginx/nginx.conf

# Add to your server block:
```nginx
listen 443 ssl;
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
```

# Then reload nginx:
sudo nginx -t
sudo systemctl reload nginx

# Set up automatic renewal
echo "0 3 * * * root certbot renew --quiet" | sudo tee -a /etc/crontab

echo "Setup complete! Visit your site to check SSL."
