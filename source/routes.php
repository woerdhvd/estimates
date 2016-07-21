<?php

/**
 * Setup
 */
require_once 'source/model.php';
require_once 'source/accounts.php';
require_once 'source/estimates.php';
require_once 'source/controller.php';
require_once 'source/view.php';

// Config
$config = parse_ini_file('config/config.ini', true);
$dbconfig = $config['database'];
$relative = $config['server']['relative'];

$klein = new \Klein\Klein();
$accounts = new Accounts($dbconfig);
$estimates = new Estimates($dbconfig);
$view = new View ('views');
$controller = new Controller($accounts, $estimates, $view);

/**
 * Routes
 */
// GET '/' -> form
// GET '/admin' -> login
// GET '/admin/estimates' -> logged in ? -> estimates : -> redirect
// GET '/admin/form' -> logged in ? -> admin/form : -> redirect

$klein->respond('GET', $relative . '/[:id]', function ($request) {
  echo "Hello";
  echo $request->id;
});



$klein->dispatch();
