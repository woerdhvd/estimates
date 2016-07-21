<?php

/**
 * Controller
 */
class Controller
{
  private $auth;
  private $estimates;
  private $view;

  function __construct($auth, $estimates, $view)
  {
    $this->auth = $auth;
    $this->estimates = $estimates;
    $this->view = $view;
  }

  function showSetup ()
  {

  }

  function showForm ()
  {
    $this->view->render('form/form', ['greeting' => 'hello']);
  }

  function handleSubmit ()
  {

  }

  function showLogin ()
  {

  }

  function showEstimates ()
  {

  }
}
