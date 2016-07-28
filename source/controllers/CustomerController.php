<?php

/**
 *
 */
class CustomerController extends Controller
{
  function showForm ($req, $res)
  {
    $this->view->render('form/form');
  }

  function handleFormSubmit ($req, $res)
  {

  }
}
