<?php

/**
 * View
 */
class View
{

  private $path;
  private $engine;

  function __construct($path = '/../views')
  {
    $this->path = $path;
    $this->engine = new Mustache_Engine([
      'loader'          => new Mustache_Loader_FilesystemLoader(__DIR__ . $path),
      'partials_loader' => new Mustache_Loader_FilesystemLoader(__DIR__ . $path . '/partials'),
    ]);
  }

  function render ($view, $model = [])
  {
    echo $this->engine->render($view, $model);
  }
}
