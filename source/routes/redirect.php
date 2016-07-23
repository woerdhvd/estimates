<?php


/**
 * For every route...
 */
$klein->respond(function ($req, $res) use ($relative, $auth) {

  /**
   * When no user exists and the requested uri isn't /setup,
   * redirect to setup.
   */
  if (!$auth->userExists() && $req->uri() != $relative . '/setup')
    $res->redirect($relative . '/setup');


  /**
   * When a user exists and the current uri is setup,
   * redirect to customer form.
   */
  if ($auth->userExists() && $req->uri() == $relative . '/setup')
    $res->redirect($relative . '/');

  /**
   * When requesting an admin route and the user is not logged in,
   * redirect to login.
   */
  if (!$auth->isLoggedIn() && strpos($req->uri(), 'admin'))
    $res->redirect($relative . '/login');

});
