<?php

/**
 * Show setup. Redirects done by routes/redirects.php
 */
$klein->respond('GET', $relative . '/setup', function ($request) {
  $view->render('admin/setup');
});

/**
 * Setup user with posetd form data
 */
$klein->respond('POST', $relative . '/setup', function ($request) use ($auth) {
  $formData = $request->paramsPost();

  $auth->setUser(
    $formData['username'],
    $formData['password'],
    $formData['email']
  );
});
