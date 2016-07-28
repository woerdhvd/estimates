<?php

/**
 * FormOptions
 * 	- Model class responsible for managing current-
 * 		and past form fields
 */

class FormOptions extends Model
{
  function migrate ()
  {
    $this->db->query(
      "CREATE TABLE IF NOT EXISTS FormOptions (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255),
        description TEXT,
        orderIndex INT,
        active BOOLEAN,
        parentId INT,
        cost FLOAT
      )"
    );
  }
}
