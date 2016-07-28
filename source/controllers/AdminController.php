<?php


class AdminController extends Controller
{
  function showLogin ($req, $res)
  {
    $this->view->render('admin/login');
  }

  function handleLogin($req, $res)
  {
    $form = $req->paramsPost();
    $this->auth->login($form['username'], $form['password']);
    $res->redirect($this->relative . '/admin/estimates');
  }

  function showEstimates ($req, $res)
  {
    $this->view->render('admin/estimates');
  }

  function showForm ($req, $res)
  {
    $this->view->render('admin/form');
  }

  function handleLogout ($req, $res)
  {
    $this->auth->logout();
    $res->redirect($this->relative . '/login');
  }
}
