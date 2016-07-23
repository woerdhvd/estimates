<?php

$klein->respond('GET', $relative . '/', function ($request, $response) use ($view) {
  $view->render('form/form');
});

$klein->respond('POST', $relative . '/', function ($request, $response) use ($view) {
  // to be implemented...
});
