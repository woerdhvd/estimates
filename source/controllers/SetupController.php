<?php


class setupController extends Controller
{
  function showSetup ($req, $res)
  {
    $this->view->render('admin/setup');
  }

  function handleSetup ($req, $res)
  {
    $formData = $req->paramsPost();
    $this->auth->setUser(
      $formData['username'],
      $formData['password'],
      $formData['email']
    );

    $res->redirect($this->relative . '/login');
  }
}
