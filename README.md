Deploying a Static Website with Nginx on CentOS
This guide provides step-by-step instructions to deploy a static website using Nginx on a CentOS server, with version control using Git and GitHub.
Prerequisites

A CentOS server with internet access.
A non-root user with sudo privileges.
A GitHub account.

Step 1: Install and Configure Nginx

Install Nginx:
sudo dnf -y install nginx


Start and Enable Nginx:
sudo systemctl start nginx
sudo systemctl enable nginx


Check Nginx Status:
systemctl status nginx


Configure Firewall:

Check current firewall settings:firewall-cmd --list-all


Open HTTP and HTTPS ports:sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload




Test Nginx Installation:Open a browser and navigate to http://<server-ip>, http://127.0.0.1, or http://localhost to see the default Nginx page.


Step 2: Set Up the Website

Create Project Folder:
sudo mkdir -p /usr/share/nginx/html/myfunwebsite
cd /usr/share/nginx/html/myfunwebsite


Create index.html:
sudo vim index.html

Add your HTML content (e.g., a simple "Hello, World!" page) and save.

Adjust Permissions:
sudo chown -R $USER:$USER /usr/share/nginx/html/myfunwebsite
sudo chmod -R 755 /usr/share/nginx/html/myfunwebsite


(Optional) Create a Soft Link:For easier access:
sudo ln -s /usr/share/nginx/html/myfunwebsite ~

Now you can access the project via ~/myfunwebsite.


Step 3: Set Up Version Control with Git

Install Git:
sudo yum install -y git


Initialize Git Repository:
cd ~/myfunwebsite
git init
git branch -M master
git add .
git commit -m "Initial commit of static website"


Set Up SSH for GitHub:

Generate an SSH key if you don’t have one:ssh-keygen

Press Enter to accept defaults.
Start the SSH agent and add the key:eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa


Copy the public key:cat ~/.ssh/id_rsa.pub


Add it to your GitHub account under Settings > SSH and GPG keys > New SSH key.
Verify the connection:ssh -T git@github.com




Create a GitHub Repository:

Go to GitHub and create a new repository named myfunwebsite (do not initialize it with a README, .gitignore, or license).


Link Local Repository to GitHub:
git remote add origin git@github.com:<your-username>/myfunwebsite.git


Push to GitHub:
git push -u origin master



Accessing the Website

Local Access:Open a browser and navigate to:
http://localhost/myfunwebsite/


Remote Access:If on a remote server, use the server’s IP:
http://<server-ip>/myfunwebsite/



Updating the Website
To update the website in the future:

Make changes to the files in ~/myfunwebsite.
Commit the changes:git add .
git commit -m "Describe your changes"


Push to GitHub:git push



Since Nginx serves the files directly, no restart is needed for static file changes.
Notes

Ensure the Nginx service is running and enabled to start on boot.
If you encounter permission issues, double-check the ownership and permissions of the project directory.
For production environments, consider securing the site with HTTPS using Let’s Encrypt.

