## Live Demo
[Project Link](https://hellobuddy-render.onrender.com)

> **It will take 50 seconds or more to start for the first time.**
>
> It's hosted in a free server. The instance doesn't stay live for long. it will spin up its instance when it receives the first request to the server.

Deployed by using the command `python -m gunicorn HelloBuddy.asgi:application -k uvicorn.workers.UvicornWorker`



# HelloBuddy
Final project -university.

###### This project uses django channels for websocket <br> Redis for message caching

# Running The App
```bash
git clone https://github.com/halim4989/HelloBuddy.git
```
```bash
cd HelloBuddy
```
```bash
docker compose up -d
```
This will run all the needed Containers in docker and expose the app on 8000 port.

By default this will restore some data of the database from `DATABASE_dumpdata.json` file, to view/test chat messages with users. The backup also contains some Normal Users account and Volunteer accounts, some messages, some blogs etc. 

All account password is `4989`. Users in the database:
```
halim   **
zubair  **
user01
user10
user5
rohim
```
To do a fresh start, from file `docker-entrypoint.sh` comment-out the line `python -Xutf8 ./manage.py loaddata DATABASE_dumpdata.json`

To support spacial characters and to Solve error 'CommandError: Unable to serialize database: 'charmap' codec can't encode characters in position 1-3: character maps to <undefined>' have to used `-Xutf8` in with command.
Backup created using:

```bash
python -Xutf8 ./manage.py dumpdata --natural-foreign --natural-primary --indent=2 admin, ask, auth, blog, chat -o DATABASE_dumpdata.json
```
add `.gz` at the end of file namme for automatic compression without affecting `loaddata`.

# Manual Installation
### Required Softwares
Built on `python-3.7.9`

If you want to go with `XAMPP` Install version `7.4.29` it's error free.

we will need `redis` for in memory cache for messaging and tracking online users. we'll use `Docker` to run `redis`.

NOw Install Docker and if needed Install `WSL-2`.



### Installing Python Dependencies
`cd` into the project folder
```bash
pip install -r requirements.txt
```
This will install Django-3.2.13, mysqlclient, django-redis, channels-redis



### Setting up Database
In MySQL create a new Database named `hellobuddy` and create a new user named `hellobuddy` with password `4989@4989`

If you wish to use different user, pass, or db name then change these in `HelloBuddy/settings.py` at line `114` DATABASES Dictionary.

***We only need to create the database and all the tables will be created automatically by Python codes written in all the `models.py` files***

Now run `redis` with
```bash
docker container run --name redis -d -p 6379:6379 redis
```
This will run redis server in Docker in Detached Mode and bind port 6379 in local computer with docker internal 6379 port.

Check in Docker Desktop if it's running or not



# Running The Project
In project folder in cli (foy windows use `py` And for linux use `python` or `python3` or `python37` whichever works)

```bash
py manage.py makemigrations chat blog ask
```
```bash
py manage.py migrate
```
This will check all `models.py` files and create tables in Database and more additional tables for Users data

Now we'll need to have a User account to access the admin panel in the djanto project.

To create a user account with admin rights
```bash
py manage.py createsuperuser
```
Then input username email and password to finish the creation of account. email is optional here.

To start the application
```bash
py manage.py runserver
```
this will start the server in  `127.0. 0.1` or `localhost` in port 8000 by default.

*OR* if you want to connect multiple device in the same server, then find your private ip address with `ipconfig` or `ifconfig` then 
```bash
py manage.py runserver <your private ip address>:<any port number>
```
For example:
```bash
py manage.py runserver 192.168.1.105:9000
```



# Database Import (`Optional`)
Import the Database Backup file to view test chat messages with users. the backup also contains some Normal Users account and Volunteer accounts

To import go to your database in phpMyadmin and drop all `tables` in the database. Make sure there is no table present in the database, since even after selecting all tables and droping it still `keeps 1 or 2 taables` in the database.

After ensuring no table present go to Import tab, then Drag and Drop the `DATABASE_Backup.sql` file on the page or `Choose File` from your computer and click `Go`  on the bottom of the page and wait for it to finish.

Now in CLI do
```bash
py manage.py makemigrations
```
```bash
py manage.py migrate
```
Then Run the project. It should display previous chats.

Now use Username `halim` and pass `4989` to login in as a Superuser Account OR create a new SuperUser.

for a Normal User account, create a new account in the website.




# Note
Only a ***Normal User account*** and ***SuperUser/admin or Volunteer account*** can chat with each other. so to chat one Normal User account and one Admin account is needed.




# GitHub Link
[GitHub project URL](https://github.com/halim4989/HelloBuddy)
