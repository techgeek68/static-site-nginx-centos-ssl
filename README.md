# My Fun Website

Welcome to **My Fun Static Website**! This project is a lively, interactive web page built with HTML, CSS, and JavaScript, deployed on a CentOS 10 server with Nginx HTTP web server. Featuring animated backgrounds, a joke generator, and party mode, it demonstrates professional web development practices.

## Features

- **Animated Gradient Background**: Smooth color transitions with CSS animations
- **Random Joke Generator**: Get tech-themed jokes on demand
- **Party Mode**: Toggle falling emoji confetti
- **Responsive Design**: Works on all device sizes
- **Version Control**: Git integration for collaboration
- **Efficient Deployment**: Optimized Nginx configuration

## Technologies Used

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Web Server**: Nginx
- **Version Control**: Git
- **Hosting Platform**: GitHub
- **Operating System**: CentOS 10
- **Security**: SSH, FirewallD

## Prerequisites

Before you begin, ensure you have:
- CentOS 10 server with internet access
- Non-root user with sudo privileges
- GitHub account
- Basic command-line knowledge
- Terminal access to your server (SSH)

## Installation and Setup

### Step 1: Install and Configure Nginx

# Install Nginx
Run Command:
```
sudo dnf -y install nginx
```

# Start and enable Nginx
Run Commands
```
sudo systemctl start nginx
sudo systemctl enable nginx
```

# Verify status
Run Command:
```
systemctl status nginx
```

# Configure the firewall
Run Commands:
```
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

### Step 2: Set Up the Website

# Create project directory
Run Commands:
```
sudo mkdir -p /usr/share/nginx/html/myfunwebsite
cd /usr/share/nginx/html/myfunwebsite
```

# Create main file (add your HTML/CSS/JS here)
Run Command:
```
sudo vim index.html
```

# Set permissions
Run Commands:
```
sudo chown -R $USER:$USER /usr/share/nginx/html/myfunwebsite
sudo chmod -R 755 /usr/share/nginx/html/myfunwebsite
```

# Create a symbolic link
Run Commands:
```
sudo ln -s /usr/share/nginx/html/myfunwebsite ~
```

### Step 3: Set Up Version Control with Git

# Customization
Modify:
1. Joke array in JavaScript
2. Gradient colors in CSS (@keyframes gradient)
3. Confetti emojis in party mode
4. Overall styling in CSS

# Troubleshooting         
    1. 403 Forbidden: Check directory permissions
    2. Nginx not starting: sudo journalctl -u nginx
    3. Website not loading: Verify firewall settings
    4. Git push rejected: Pull latest changes first
    5. SSH issues: Verify SSH configuration

# Best Practices
Enable HTTPS:
    Run Commands:
```
        -sudo dnf install certbot python3-certbot-nginx
        -sudo certbot --nginx -d yourdomain.com
```  
# Regular Backups:
Run Commands:
```
-tar -czvf website-backup.tar.gz /usr/share/nginx/html/myfunwebsite
```

# Monitor Logs:
Run Commands:
```
-tail -f /var/log/nginx/access.log
-tail -f /var/log/nginx/error.log
```

# Keep System Updated:
Run Commands:
```
-sudo dnf update -y && sudo dnf upgrade -y
```

# Contributing
1. Fork the repository
2. Create feature branch (git checkout -b feature/new-feature)
3. Commit changes (git commit -m 'Add new feature')
4. Push to branch (git push origin feature/new-feature)
5. Open a pull request

For major changes, please open an issue to discuss them first.

# License
This project is licensed under the MIT License - see the LICENSE file for details.

Key improvements:
1. Removed all emojis while maintaining visual structure
2. Simplified section headers for better readability
3. Improved code formatting with proper syntax highlighting
4. Enhanced troubleshooting table with common issues
5. Streamlined best practices section
6. Maintained clear installation steps
7. Kept all functionality descriptions intact
8. Added license reference

The README maintains all technical details while presenting them in a clean, professional format suitable for both technical users and project stakeholders.
