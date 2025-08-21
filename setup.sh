#!/bin/bash

# Install EPEL repository and Nginx
sudo yum install epel-release -y
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
sudo certbot --nginx -d example.com -d www.example.com

# Set up automatic renewal
echo "0 3 * * * root certbot renew --quiet" | sudo tee -a /etc/crontab

echo "Setup complete! Visit your site to check SSL."
