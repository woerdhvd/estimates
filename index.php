<?php

/**
 * Setup
 */

require_once 'vendor/autoload.php';

// Models
require_once 'source/models/model.php';
require_once 'source/models/auth.php';
require_once 'source/models/estimates.php';
require_once 'source/models/formoptions.php';
require_once 'source/models/joins.php';

// View
require_once 'source/view.php';

// Controller
require_once 'source/controllers/Controller.php';
require_once 'source/controllers/RedirectController.php';
require_once 'source/controllers/SetupController.php';
require_once 'source/controllers/CustomerController.php';
require_once 'source/controllers/AdminController.php';

// Routes
require_once 'source/routes.php';
