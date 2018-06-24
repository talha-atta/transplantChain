<?php
/* Database connection settings */
$host = 'rakeeb123.ipagemysql.com';
$user = 'rakeeb123';
$pass = '@myCryptoHippo123';
$db = 'accounts';
$mysqli = new mysqli($host,$user,$pass,$db) or die($mysqli->error);
