<?php


class Joins extends Model
{
  function migrate ()
  {
    $this->db->query(
      "CREATE TABLE IF NOT EXISTS FormOptionsByEstimate (
        estimateId INT NOT NULL,
        formOptionId INT NOT NULL
      )"
    );
  }

  function insertFormOptionsByEstimate ()
  {

  }

  function findFormOptionsByEstimate ()
  {

  }
}
