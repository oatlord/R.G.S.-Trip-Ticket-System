This is a trip ticket management system that allows users (drivers) to create trip tickets and for administrators to quickly approve them. 

To run the web application, first download all the files including the .sql and Node.js. 

**Installing Node.js**

Skip this section if you already have Node.js!
If your device does not have Node.js yet, install it here: https://nodejs.org/en.
Afterwards, run the installation wizard. Then you're set!

**Installing XAMPP**

XAMPP is needed to run the database. To install XAMPP, go here: https://www.apachefriends.org/download.html.
You're good to go!

**Importing the Database**

Now that you have XAMPP, you can start with importing the database. To be safe, move your .sql file to xampp/bin/mysql. 
Run your XAMPP and click Start on Apache and MySQL. To have the database locally, you need to create a database to store the data. You can do this either through phpMyAdmin or XAMPP's command line.

_**Oh phpMyAdmin:**_
 
  1. On XAMPP, click Admin on MySQL to open phpMyAdmin.
  2. Click "New" and create your database. Name it however you see fit.
  3. On the management screen, click the "Import" tab.
  4. Click "Choose File" and upload the .sql file.

**_On XAMPP Command Line:_**
 
  1. On XAMPP, click "Shell".
  2. Enter "mysql -u root -p" as your first command. This logs you in with no password and the standard username, which is root.
  3. Create a new database by running the SQL Command "CREATE DATABASE [db_name]".

When creating the database on XAMPP Command Line, you can either Import it through the steps in the _"on phpMyAdmin"_ section, but simply exclude Step 2 since the database is already created.
If you would like to do it through Windows command line, do the following steps:
  1. Open Windows command line and redirect the directory to xampp/bin/mysql. Type "cd [drive]\xampp\bin\mysql".
  2. Type the command "mysql -u root -p [your created database] < db_rg_salanatin-lite.sql". This should import all the data into your local database.

Now that you have the database, it's time to connect it to the web application through Node.js.
  1. Open the project through your chosen code editor.
  2. Go to Server\server\server.js. On lines 13 to 14, change the "database" and "port" values to the name of your local database and the port on your MySQL. You can see your port in the XAMPP interface. Save your changes.
  3. Open a terminal.
  4. In the terminal, type "node server.js". This should connect the web application with your local database.
