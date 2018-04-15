### 01/10/2017 - Security Breach « Text sharing » (PrivateBin)

Sunday, October 1st 2017, at 4:58 PM (GMT +02:00), we have been notified on our email adress that an important security breach was discovered on our public PrivateBin instance. Here is the detail of this discussion, of the possible impact on our users and of the actions taken after because of this information.

#### An human error during the migration of the web server of our php-fpm01 server

During the migration from Nginx to Caddy, Thursday September 28th 2017 at 8:30 PM (GMT +02:00), a mistake in the configuration of the virtual host to configure PrivateBin was made.

All of the normally private directories (cfg, doc, data, lib, tpl, tst and vendor) have been exposed to the Internet. The data is stored in our database, and the `/cfg/conf.ini` was containing authentication information to this database.

It was a MySQL database hosted on a server dedicated to MariaDB, which can be reached from a dedicate user, who only had the rigths to access the `upstate` database. This server, reachable from the Internet, is accessible from the local network of our hosting provider DigitalOcean in its data center at Frankfort (Germany).

#### Discovering the security breach

Simon Rupf, PrivateBin maintainer, informed us by email at 4:58 PM (GMT +02:00) that he discovered this security breach thanks to a tier (still anonymous today). Here is the email we received, [on our PrivateBin instance](https://paste.unixcorn.org/?9ea5f2974461a849#jCvPhx1lPvkRLpm0qe4hfF3ymK08zSKiIinm9sJN6rk=).

#### Fixing the issue

We immediatly applied the necessary patches. The issue was fixed at 5:05 PM (GMT +02:00), by adding a rule in the Caddy virtual host to forbid the access to the concerned directories, and by changing the authentication information of the database.

#### Response to Simon Rupf

We sent at 5:09 PM (GMT +02:00) [the following email](https://paste.unixcorn.org/?f1ba8f04d2389f52#XhjPeDC+bkU3KUgvEcnomYQsuU7vSSP08AWo1M2jE4Q=) saying to Simon that the problem was solved, and thanking him for informing us. We then received [another response from him](https://paste.unixcorn.org/?829f8b92ff1ee32f#AoatcjnBmeB96E2wGdPlUwjIYO2LqiyckVNFvyrkC7o=) at 5:21 (GMT +02:00).

#### Conclusion

The investigations we did so far (deep *log* analysis of the MariaDB server) show that nobody tried to connect to the database of our PrivateBin instance. The data of our users have not been compromised.

To log in to our database, the attackers would have needed access to our *php-fpm01* or *gitea01* servers, then connect to our *mariadb01* server with a MySQL client, log in to the `upstate` database with the username and password found in the configuration file. But this operation is impossible, thanks to the use of a string authentication with *OpenSSH*, restricting access to the known SSH keys. An efficient firewall isolating our *mariadb01* server of the local network where it was connected was setup, only allowing connections from the local IP address of the servers needing access to the database (two of them).

Please accept our excuses for this regretable error. We make our best to provide quality libre services, and that's why we must make sure our hardware and software infrastructures are perfectly configured, to fully respect your privacy.

---

Last edition on October 1st 2017.
