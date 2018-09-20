# postgresql-on-ubuntu
Problem solving on initial setup (Dev Bootcamp version)

*Note: I have Ubuntu v. 14.04. These references/instructions seemed to work equally well for users with Ubuntu 16.x*

## Install postgres (if you haven't already)
First, if it's been a while, do this: `sudo apt-get update`to ensure that you get the latest version available. Assuming you want the latest version available.
Then try `sudo apt-get install postgresql-contrib`
https://help.ubuntu.com/community/PostgreSQL
https://www.postgresql.org/download/linux/ubuntu/

## Make yourself a superuser
*If you get an error that says you don't exist*
`sudo -u postgres createuser --superuser $USER` You do **not** need to change the `$USER` to your own user name.
The ubuntu.com site above references this. Also see https://www.postgresql.org/docs/9.1/static/app-createuser.html for more details about user options.

## Get into postgres to confirm what you've set up
`psql` gets you in.
`\du` *should* present you with a list of users and roles. You should see yourself listed on there as a superuser

## Change/set your password
If you're not already in postgres: `psql` to get in.
`ALTER USER username WITH ENCRYPTED PASSWORD 'new_password' VALID UNTIL 'expiration;'`
"Expiration" could be either a specific date (formatted as `'Jan 1, 2015'`) or `'infinity'`.
http://www.techonthenet.com/postgresql/change_password.php
https://www.postgresql.org/docs/9.5/static/sql-alterrole.html

## Exit postgres
`\d` or Ctrl-d or `\q`

## Change password in DBC-Sinatra challenges
Go to the database.rb file & change the password at the bottom of the file to the password you've set in postgres (not your primary/admin password, the one you just set for pg).

# Miscellaneous Issues
## Ruby gems not installing correctly
If you get an error on bundle install that says "failed to build native extensions"...try `sudo apt-get install libpq-dev`

# Updating/Upgrading Postgresql
*I updated my Ubuntu version from 14.04 to 16.04 and got a warning that my postgresql version was out of date. It looked like the OS update had given me a later postgres version but parts were still old. Specificaly, when I went into psql on my terminal, it said I had "psql (9.5.3, server 9.3.13)" which matched the warning I'd gotten while I was upgrading Ubuntu.*
   - Update packages available with `sudo apt-get update`
   - Upgrade packages with `sudo apt-get upgrade`
   - Remove the postgres 9.5 main cluster `sudo pg_dropcluster 9.5 main --stop`
   - Upgrade the old postgres 9.3 main cluster `sudo pg_upgradecluster 9.3 main` After this is done, my terminal suggested I should make sure that the upgraded cluster works. I went into one of my apps that used a postgres database and it seemed to be fine. I dropped the db, migrated and seeded and had no problems.
   - Remove the postgres 9.3 main cluster `sudo pg_dropcluster 9.3 main` to clean things up.
   - This reference includes instructions for upgrading if you use Docker with postgres. https://gist.github.com/johanndt/6436bfad28c86b28f794

*If you find errors here or find (and solve!) other problems getting postgres to work on your Linux machine, please edit this file and submit a pull request.*
