<?php

/**
 * Estimates
 */
class Estimates extends Model
{

  function migrate ()
  {
    $this->db->query(
      "CREATE TABLE IF NOT EXISTS estimates (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        fullName VARCHAR(255),
        email VARCHAR(255),
        notes TEXT,
        costOnCreation FLOAT,
        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )"
    );
  }

  function new_template ()
  {

  }

  function find ()
  {

  }

  function insert ()
  {

  }

  function delete ()
  {

  }
}
