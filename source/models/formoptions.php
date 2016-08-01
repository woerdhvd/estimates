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

  /**
   * Get all currently active form options.
   */
  function getActive ()
  {
    $result = $this->db->query(
      "SELECT * FROM FormOptions WHERE active=true"
    );
    return $result->fetchAll();
  }

  function disableOld ($newFormOptions)
  {
    function getId ($formOption)
    {
      return $formOption['id'];
    }

    $previousActive   = $this->getActive();
    $previousIds      = array_map("getId", $previousActive);
    $newIds           = array_map("getId", $newFormOptions);
    $shouldBeDisabled = array_diff($previousIds, $newIds);

    foreach ($shouldBeDisabled as $key => $id)
    {
      $this->db->query("UPDATE FormOptions SET active=false WHERE id=$id");
    }
  }

  function insert ($formOptions)
  {
    $previousActive = $this->getActive();
    $new = array_diff($formOptions, $previousActive);
    $statement = $this->db->prepare(
      "INSERT INTO FormOptions ( title, description, orderIndex, active, cost)
       VALUES (title, description, orderIndex, TRUE, cost)
    ");

    foreach ($new as $key => $formOption)
      $statement->execute($formOption);

    $this->disableOld($formOptions);
  }
}
