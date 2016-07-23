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
    if (!$this->auth->userExists())
      $this->view->render('admin/setup');
  }

  function handleSetup ($formValues)
  {
    $this->auth->setUser(
      $formValues['username'],
      $formValues['password'],
      $formValues['email']
    );
  }

  function showForm ($response)
  {
    if (!$this->auth->userExists())
      $response->redirect('setup');
    else
    {
      echo "user looks like existing";
    }
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
