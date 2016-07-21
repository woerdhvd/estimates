<?php

/**
 * Model
 */
class Model
{
  private $db;

  function __construct($config)
  {
    $this->db = new PDO("mysql:host=$config[host];dbname=$config[dbname]",
                                    $config['username'], $config['password']);
    $this->migrate();
  }

  function migrate ()
  {
    throw new Exception("Not Implemented: migrate()", 1);
  }
}
