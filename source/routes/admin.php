<?php

/**
 * Log in
 */
$klein->respond('GET', $relative . '/login', function () use ($auth, $view) {
  $view->render('admin/login');
});

$klein->respond('POST', $relative . '/login', function ($req, $res) use ($auth, $relative) {
  $auth->login(
    $formData['username'],
    $formData['password']
  );
  $res->redirect($relative . '/admin/estimates');
});


/**
 * Admin views - TODO: remove duplication
 */
$klein->respond('GET', $relative . '/admin/estimates', function ($req, $res) use ($view, $relative, $auth) {
  // if (!$auth->isLoggedIn())
  //   $res->redirect($relative . '/login');
  // else
    $view->render('admin/estimates');
});

$klein->respond('GET', $relative . '/admin/form', function ($req, $res) use ($view, $relative, $auth) {
  // if (!$auth->isLoggedIn())
  //   $res->redirect($relative . '/login');
  //   else
    $view->render('admin/form');
});


/**
 * Log out
 */
$klein->respond('GET', $relative . '/admin/logout', function ($req, $res) use ($auth, $relative) {
  $auth->logout();
  $res->redirect($relative . '/login');
});

$klein->respond('GET', $relative . '/admin/**', function ($req, $res) use ($relative, $auth) {
  echo "here";
  if (!$auth->isLoggedIn())
    $res->redirect($relative . '/login');
});
