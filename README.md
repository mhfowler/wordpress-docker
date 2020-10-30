Wordpress-Docker installation, designed to edit Wordpress sites locally

## Prerequisites
1. Install Docker https://www.docker.com/products/docker-desktop
2. If you don't have mysql installed, install `brew install mysql-client` to get the command-line tools only (for commands like `mysqldump`).
3. Get all of your MySQL & SSH user logins (if you're using Dreamhost, make sure that your user has SSH, not just SFTP credentials!)

## Setup
1. Clone this repo https://github.com/dantaeyoung/wordpress-docker
2. Copy `.env.example` to `.env` and edit to fill in with remote installation credentials.
3. In the directory, run `load_remote_site_to_docker.sh`
4. Enter in the SSH password when prompted




## Troubleshooting

If you are having trouble with database connection,
you can try renaming the data volume in docker-compose.yml,
by changing db_data to db_data_newnewname.

You can also use `docker volume prune` to delete old data volumes.

The docker database stores its data persistently in a data volume.