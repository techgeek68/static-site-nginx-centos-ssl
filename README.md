# static-site-nginx-centos-ssl

A practical tutorial and deployment tools for static website hosting on CentOS with Nginx and SSL certificates.

---

## Deployment Instructions

### Local Deployment (localhost)

Use these steps to set up your static website locally for testing or development:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/techgeek68/static-site-nginx-centos-ssl.git
   cd static-site-nginx-centos-ssl
   ```

2. **Run the setup script:**
   ```bash
   chmod +x setup.sh
   sudo ./setup.sh
   ```
   *Note: The script installs and starts Nginx. SSL setup is skipped for localhost.*

3. **Place your static site files in:**
   ```
   /usr/share/nginx/html
   ```

4. **Open your browser and visit:**
   ```
   http://localhost
   ```
   or  
   ```
   http://127.0.0.1
   ```

---

### Public Hosting (Production with SSL)

For deploying on a public server with a custom domain and SSL certificate:

1. **Edit `setup.sh`, replacing `example.com` with your actual domain:**
   ```bash
   sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
   ```

2. **Run the setup script:**
   ```bash
   chmod +x setup.sh
   sudo ./setup.sh
   ```

3. **Ensure your DNS records point your domain to your server’s IP.**

4. **Place your static site files in:**
   ```
   /usr/share/nginx/html
   ```

5. **Visit your site securely at:**
   ```
   https://yourdomain.com
   ```

**Note:**  
Certbot requires a public domain name and working DNS for SSL setup and renewal.

---

## Features

- Automated Nginx installation on CentOS
- Easy setup for static site hosting
- Optional SSL certificate provisioning (Let’s Encrypt)
- Simple instructions for local and public deployment

---

## License

MIT
