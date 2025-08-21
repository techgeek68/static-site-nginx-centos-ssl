## Automated Deployment Script

To quickly set up Nginx static hosting with SSL on CentOS, use the provided `setup.sh` script.

### Steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/techgeek68/static-site-nginx-centos-ssl.git
   cd static-site-nginx-centos-ssl
   ```

2. Edit `setup.sh` to add your domain name instead of `example.com`.

3. Run the setup script:
   ```bash
   chmod +x setup.sh
   sudo ./setup.sh
   ```

4. Place your static website files in `/usr/share/nginx/html`.

5. Verify HTTPS by visiting your domain in a browser.

**Note:** Make sure your DNS points to this server before running Certbot.
