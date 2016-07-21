<?php

/**
 * View
 */
class View
{

  private $path;
  private $engine;

  function __construct($path)
  {
    $this->path = $path;
    $this->engine = new Mustache_Engine;
  }

  function render ($view, $model = [])
  {
    $template = file_get_contents("$this->path/$view.hbs");
    echo $this->engine->render($template, $model);
  }
}
