<?php


class SetupController extends Controller
{
  function showSetup ($req, $res)
  {
    echo "hello";
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
