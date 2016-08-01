<?php

class RedirectController extends Controller
{
  function redirectUnlessSetup($req, $res)
  {
    if (!$this->auth->userExists() && !strpos($req->uri(), 'setup'))
      $res->redirect('/estimates' . '/setup');
  }

  function redirectWhenAlreadySetup($req, $res)
  {
    if ($this->auth->userExists() && strpos($req->uri(), 'setup'))
      $res->redirect($this->relative . '/');
  }

  function redirectWhenNotAuthenticated ($req, $res)
  {
    if (!$this->auth->isLoggedIn() && strpos($req->uri(), 'admin'))
      $res->redirect($this->relative . '/login');
  }
}
