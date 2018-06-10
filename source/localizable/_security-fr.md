### 01/10/2017 - Faille de sécurité « Partage de texte » (PrivateBin)


Dimanche 1er octobre 2017 à 16h58 (GMT +02:00) nous avons été notifié sur notre adresse e-mail de contact de la découverte d'une importante faille de sécurité sur notre instance publique de PrivateBin. Voici le détail de ce signalement, de l'impact possible pour nos utilisateur-ice-s et des opérations réalisées suite à cette information.

#### Erreur humaine lors de la migration du serveur web de notre serveur php-fpm01

Lors de la migration de Nginx vers Caddy, jeudi 28 septembre 2017 à 20h30 (GMT +02:00), mauvaise configuration de l'hôte virtuel permettant la configuration de PrivateBin au niveau de notre serveur web Caddy.

L'ensemble des répertoires normalement privés de PrivateBin (cfg, doc, data, lib, tpl, tst et vendor) se retrouvent exposés sur internet. Les données étant stockées en base de donnée, le plus problématique étant donc le fichier de configuration `/cfg/conf.ini` contenant les accès à cette dernière.

Base de donnée MySQL hébergée sur un serveur dédié à MariaDB, joignable depuis un utilisateur dédié avec les droits d'accès uniquement à la base de donnée `upaste`. Ce serveur non joignable depuis l'internet reste accessible depuis le réseau local de notre hébergeur DigitalOcean dans son centre de données à Francfort (Allemagne).

#### Découverte de la faille de sécurité

Simon Rupf, mainteneur de PrivateBin, nous informe par e-mail à 16h58 (GMT +02:00) de la découverte de cette faille de sécurité par un tiers (non connu à ce jour). Voici l'e-mail reçu, [le lire sur notre instance PrivateBin](https://paste.unixcorn.org/?9ea5f2974461a849#jCvPhx1lPvkRLpm0qe4hfF3ymK08zSKiIinm9sJN6rk=).

#### Application de correctifs

Dès réception de l'e-mail de Simon, applications des correctifs appropriés pour colmater la brèche. Opérations suivantes terminées dès 17h05 (GMT +02:00) : mise en place d'une règle dans l'hôte virtuel de Caddy concerné pour interdir l'accès aux répertoires incriminés et changement des identifiants et mot-de-passes de l'utilisateur de la base de donnée.

#### Réponse à Simon Rupf

Envoi à 17h09 (GMT +02:00) de [la réponse suivante](https://paste.unixcorn.org/?f1ba8f04d2389f52#XhjPeDC+bkU3KUgvEcnomYQsuU7vSSP08AWo1M2jE4Q=) informant Simon de la résolution du problème, le remerciant pour l'information. Suivi d'[une nouvelle réponse de sa part](https://paste.unixcorn.org/?829f8b92ff1ee32f#AoatcjnBmeB96E2wGdPlUwjIYO2LqiyckVNFvyrkC7o=) reçue à 17h21 (GMT +02:00).

#### Conclusion

Les investigations menées à ce jour (analyse approfondie des *logs* du serveur MariaDB) montrent qu'il n'y a pas eu intrusion dans la base de donnée de notre instance PrivateBin. Les données de nos utilisateur-ice-s n'ont donc pas été compromises.

Pour réaliser à pénétrer notre base de donnée les attaquant-e-s auraient dû avoir accès à nos serveurs *php-fpm01* ou *gitea01* puis se connecter à notre serveur *mariadb01* avec un client MySQL à la base de donnée `upaste` avec les identifiants trouvés dans le fichier de configuration. L'opération précédemment citée est rendue impossible par l'utilisation d'une authentification forte avec *OpenSSH*, réservant l'accès aux serveur aux clés SSH autorisées. Un pare-feu efficace isolant notre machine *mariadb01* du réseau local où elle est connectée en autorisant uniqement les connexions vers les bases de données MySQL depuis l'adresse IP locale des serveurs nécessitants l'accès aux bases de données (deux à ce jour). 

Veuillez accepter nos excuses pour cette erreur regretable, nous nous efforçons de fournir des services Libres de qualité, nous devons donc nous assurer de la parfaite configuration de notre infrastructure matérielle et logicielle afin de permettre le respect de votre vie privée.

---

Page modifiée la dernière fois le 1er octobre 2017.
