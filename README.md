My Fun Static Website
A vibrant, interactive static website deployed on Nginx with CentOS, featuring a gradient background animation, a random joke generator, and a party mode with falling emojis. This project is version-controlled using Git and hosted on GitHub for easy collaboration and deployment.
Features

Animated Background: Smooth gradient transitions using CSS animations.
Random Joke Generator: Displays tech-themed jokes on button click.
Party Mode: Toggles falling emoji confetti for an engaging user experience.
Responsive Design: Optimized for various screen sizes.
Version Control: Integrated with Git and GitHub for seamless updates.

Technologies Used

HTML5: Structure and content.
CSS3: Animations, gradients, and styling.
JavaScript: DOM manipulation for interactivity.
Nginx: High-performance web server.
Git: Version control system.
CentOS: Server operating system.

Prerequisites

A CentOS server (version 7 or later) with internet access.
A non-root user with sudo privileges.
A GitHub account for version control.
Basic familiarity with command-line operations and text editors (e.g., vim).

Installation and Setup
Step 1: Install and Configure Nginx

Install Nginx:
sudo dnf -y install nginx


Start and Enable Nginx:Ensure Nginx starts automatically on boot:
sudo systemctl start nginx
sudo systemctl enable nginx


Verify Nginx Status:Confirm Nginx is running:
systemctl status nginx

Look for active (running) in the output.

Configure Firewall:Allow HTTP and HTTPS traffic:
firewall-cmd --list-all
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload


Test Nginx Installation:Open a browser and navigate to http://<server-ip>, http://127.0.0.1, or http://localhost. You should see the default Nginx welcome page.


Step 2: Set Up the Website

Create Project Folder:Create a directory for the website in Nginx’s document root:
sudo mkdir -p /usr/share/nginx/html/myfunwebsite
cd /usr/share/nginx/html/myfunwebsite


Create index.html:Create the main website file:
sudo vim index.html

Add your HTML, CSS, and JavaScript content. For an example, see the provided index.html with animations and interactivity (available in the repository).

Adjust Permissions:Allow your user to edit files without sudo:
sudo chown -R $USER:$USER /usr/share/nginx/html/myfunwebsite
sudo chmod -R 755 /usr/share/nginx/html/myfunwebsite


(Optional) Create a Soft Link:For easier access, link the project to your home directory:
sudo ln -s /usr/share/nginx/html/myfunwebsite ~

Access the project via ~/myfunwebsite.


Step 3: Set Up Version Control with Git

Install Git:
sudo yum install -y git


Initialize Git Repository:
cd ~/myfunwebsite
git init
git branch -M main
git add .
git commit -m "Initial commit of static website"


Configure SSH for GitHub:

Generate an SSH key if not already present:ssh-keygen

Press Enter to accept defaults.
Configure SSH settings:cd ~/.ssh
vim config

Add:Host github.com
    ServerAliveInterval 60
    ServerAliveCountMax 5
    TCPKeepAlive yes
    IPQoS=throughput

Set permissions:chmod 440 config


Start the SSH agent and add the key:eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa


Copy the public key:cat ~/.ssh/id_rsa.pub


Add it to GitHub under Settings > SSH and GPG keys > New SSH key.
Verify the connection:ssh -T git@github.com




Create a GitHub Repository:

Go to GitHub and create a new repository named myfunwebsite. Do not initialize it with a README, .gitignore, or license.


Link and Push to GitHub:
git remote add origin git@github.com:<your-username>/myfunwebsite.git
git push -u origin main



Step 4: Access the Website

Local Access:Open a browser and navigate to:
http://localhost/myfunwebsite/


Remote Access:On a remote server, use the server’s IP:
http://<server-ip>/myfunwebsite/



Usage

View the Website: Navigate to the URL above to see the interactive website.
Interact with Features:
Click "Tell Me a Joke" to display a random tech-themed joke.
Click "Party Mode" to toggle falling emoji confetti.
Enjoy the animated gradient background.



Updating the Website
To update the website:

Edit files in ~/myfunwebsite.
Commit changes:git add .
git commit -m "Describe your changes"


Push to GitHub:git push

Nginx serves static files directly, so no restart is required for updates.

Customization

Add Jokes: Edit the jokes array in index.html to include new jokes.
Modify Colors: Update the CSS gradientBG animation in index.html for different colors.
Change Emojis: Adjust the emojis array in index.html for different confetti symbols.

Troubleshooting

403 Forbidden Error: Verify file permissions (chmod 644 index.html, chmod 755 myfunwebsite) and SELinux settings (sudo setenforce 0 temporarily to test).
Nginx Not Starting: Check logs with sudo journalctl -u nginx.
Website Not Loading: Ensure the URL includes /myfunwebsite/ and firewall ports are open.

Best Practices

Secure with HTTPS: For production, use Let’s Encrypt to enable HTTPS (see Nginx SSL Guide).
Regular Backups: Use Git commits to track changes and maintain backups on GitHub.
Monitor Nginx: Check logs (/var/log/nginx/error.log) for issues.

Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch (git checkout -b feature/YourFeature).
Commit changes (git commit -m "Add YourFeature").
Push to the branch (git push origin feature/YourFeature).
Open a pull request.

For major changes, please open an issue first to discuss proposed changes.
License
This project is licensed under the MIT License. See the LICENSE file for details.
