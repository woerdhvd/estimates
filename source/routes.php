<?php

// Read config
$config             = parse_ini_file('config.ini', true);
$dbconfig           = $config['database'];
$relative           = $config['server']['relative'];

$controllerConfig = [
  'relative'        => $relative,
  'auth'            => new Auth($dbconfig),
  'estimates'       => new Estimates($dbconfig),
  'formoptions'     => new FormOptions($dbconfig),
  'joins'           => new Joins($dbconfig),
  'view'            => new View()
];

// Controllers
$redirectController = new RedirectController($controllerConfig);
$setupController    = new SetupController($controllerConfig);
$customerController = new CustomerController($controllerConfig);
$adminController    = new AdminController($controllerConfig);
$apiController      = new APIController($controllerConfig);


// Router
$klein              = new \Klein\Klein();

/**
 * Redirects
 */
 $klein->respond([$redirectController, 'redirectUnlessSetup']);
 $klein->respond([$redirectController, 'redirectWhenAlreadySetup']);
 $klein->respond([$redirectController, 'redirectWhenNotAuthenticated']);


/**
 * Setup
 */
$klein->respond('GET',  $relative . '/setup', [$setupController, 'showSetup']);
$klein->respond('POST', $relative . '/setup', [$setupController, 'handleSetup']);

/**
 * Admin
 */
$klein->respond('GET',  $relative . '/login', [$adminController, 'showLogin']);
$klein->respond('POST', $relative . '/login', [$adminController, 'handleLogin']);
$klein->respond('GET',  $relative . '/admin/estimates', [$adminController, 'showEstimates']);
$klein->respond('GET',  $relative . '/admin/form', [$adminController, 'showForm']);
$klein->respond('GET',  $relative . '/admin/logout', [$adminController, 'handleLogout']);


/**
 * Customer
 */
$klein->respond('GET',  $relative . '/', [$customerController, 'showForm']);
$klein->respond('POST', $relative . '/', [$customerController, 'handleFormSubmit']);

/**
 * API
 */
 $klein->respond('GET',  $relative . '/api/formoptions', [$apiController, 'sendFormOptions']);
 $klein->respond('POST', $relative . '/api/formoptions', [$apiController, 'handleFormOptions']);

$klein->dispatch();
