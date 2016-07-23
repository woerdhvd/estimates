<?php

/**
 * Auth
 * 	- Model class responsible for authentication
 */
class Auth extends Model
{
  function migrate()
  {
    $this->db->query(
      "CREATE TABLE IF NOT EXISTS auth (
        username varchar(255),
        hash varchar(255),
        email varchar(255)
      )"
    );
  }

  function setUser ($username, $password, $email)
  {
    $hash = password_hash($password, PASSWORD_DEFAULT);
    $query = $this->db->prepare(
      "INSERT INTO auth (username, hash, email)
       SELECT ?, ?, ? FROM DUAL
       WHERE NOT EXISTS (SELECT * FROM auth)
      "
    );
    $query->execute([$username, $hash, $email]);
  }

  function isAuthorized ($username, $password)
  {
    $user = $this->db->query(
      "SELE"
    );
  }

  function userExists ()
  {
    $result = $this->db->query(
      "SELECT count(*) FROM auth LIMIT 1"
    );
    return intval($result->fetchAll()[0][0]);
  }
}
