<?php

// Read config
$config      = parse_ini_file('config/config.ini', true);
$dbconfig    = $config['database'];
$relative    = $config['server']['relative'];

// Instantiate view / models
$klein       = new \Klein\Klein();
$formoptions = new FormOptions($dbconfig);
$auth        = new Auth($dbconfig);
$estimates   = new Estimates($dbconfig);
$view        = new View ();

// Subroutes
require 'admin.php';
require 'customer.php';
require 'redirect.php';
require 'setup.php';


$klein->dispatch();
