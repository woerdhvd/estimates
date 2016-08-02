<?php

/**
 * API Controller
 */
class APIController extends Controller
{
  function sendFormOptions ($req, $res)
  {
    $res->json([
      [
      'orderIndex' => 1,
      'title' => 'Hello',
      'description' => 'description',
      'subOptions' => [],
      'cost' => 100,
      'uid' => 0
      ]
    ]);
  }

  function handleFormOptions ($req, $res)
  {
    echo "TODO";
  }
}
