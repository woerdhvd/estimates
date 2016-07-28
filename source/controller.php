<?php

/**
 * Controller
 */
class Controller
{
  private $auth;
  private $estimates;
  private $formoptions;
  private $view;

  function __construct($options)
  {
    $this->auth        = $options['auth'];
    $this->estimates   = $options['estimates'];
    $this->formoptions = $options['formoptions'];
    $this->view        = $options['view'];
  }

  /**
   * Redirects
   */
  function redirectUnlessSetup($req, $res)
  {
    if (!$this->auth->userExists() && !strpos($req->uri(), 'setup'))
      $res->redirect('setup');
  }

  function redirectWhenAlreadySetup($req, $res)
  {
    if ($this->auth->userExists() && strpos($req->uri(), 'setup'))
      $res->redirect('/');
  }

  function redirectWhenNotAuthenticated ($req, $res)
  {
    if (!$this->auth->isLoggedIn() && strpos($req->uri(), 'admin'))
      $res->redirect('login');
  }
}
