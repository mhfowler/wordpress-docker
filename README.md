Wordpress-Docker installation, designed to edit Wordpress sites locally 

## Prerequisites
1. Install Docker https://www.docker.com/products/docker-desktop
2. If you don't have mysql installed, install `brew install mysql-client` to get the command-line tools only (for commands like `mysqldump`).
3. Get all of your MySQL & SSH user logins (if you're using Dreamhost, make sure that your user has SSH, not just SFTP credentials!)

## Setup
1. Clone this repo https://github.com/dantaeyoung/wordpress-docker
2. Copy `.env.example` to `.env` and edit to fill in with remote Wordpress installation credentials.
3. In the directory, run `docker-compose up -d`

