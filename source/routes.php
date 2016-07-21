<?php

/**
 * Setup
 */
require_once 'source/model.php';
require_once 'source/auth.php';
require_once 'source/estimates.php';
require_once 'source/controller.php';
require_once 'source/view.php';

// Config
$config     = parse_ini_file('config/config.ini', true);
$dbconfig   = $config['database'];
$relative   = $config['server']['relative'];

$klein      = new \Klein\Klein();
$auth       = new Auth($dbconfig);
$estimates  = new Estimates($dbconfig);
$view       = new View (__DIR__ . '/../views');
$controller = new Controller($auth, $estimates, $view);

/**
 * Routes
 */
// GET '/' -> form
// GET '/admin' -> login
// GET '/admin/estimates' -> logged in ? -> estimates : -> redirect
// GET '/admin/form' -> logged in ? -> admin/form : -> redirect

$klein->respond('GET', $relative . '/', function ($request) use ($controller) {
  $controller->showForm();
});

$klein->respond('GET', $relative . '/admin', function ($request) use ($controller) {
  $controller->showLogin();
});


$klein->dispatch();
