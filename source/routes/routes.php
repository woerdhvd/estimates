<?php

$config     = parse_ini_file('config/config.ini', true);
$dbconfig   = $config['database'];
$relative   = $config['server']['relative'];

$klein      = new \Klein\Klein();
$auth       = new Auth($dbconfig);
$estimates  = new Estimates($dbconfig);
$view       = new View (__DIR__ . '/../../views');

require 'admin.php';
require 'customer.php';
require 'redirect.php';
require 'setup.php';



$klein->dispatch();
