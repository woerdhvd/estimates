<?php

/**
 * Show setup. Redirects done by routes/redirects.php
 */
$klein->respond('GET', $relative . '/setup', function () use ($view){
  $view->render('admin/setup');
});

/**
 * Setup user with posted form data
 */
$klein->respond('POST', $relative . '/setup', function ($req, $res) use ($auth, $relative) {
  $formData = $req->paramsPost();

  $auth->setUser(
    $formData['username'],
    $formData['password'],
    $formData['email']
  );

  $res->redirect($relative . '/login');
});
