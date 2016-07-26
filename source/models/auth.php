<?php

/**
 * Auth
 * 	- Model class responsible for authentication
 * 	TODO: className, formOptionsByEstimate
 */
class Auth extends Model
{
  function __construct ($config)
  {
    parent::__construct($config);
    session_start();
  }

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
    $result = $this->db->query("SELECT * FROM auth LIMIT 1");
    $user = $result->fetch();

    $usernameCorrect = $user['username'] == $username;
    $passwordCorrect = password_verify($password, $user['hash']);

    return $usernameCorrect && $passwordCorrect;
  }

  function userExists ()
  {
    $result = $this->db->query(
      "SELECT count(*) FROM auth LIMIT 1"
    );
    return intval($result->fetchAll()[0][0]);
  }

  function isLoggedIn ()
  {
    return isset($_SESSION['logged_in']);
  }

  function login ($username, $password)
  {
    $isAuthorized = $this->isAuthorized($username, $password);
    $_SESSION['logged_in'] = $isAuthorized;
    return $isAuthorized;
  }

  function logout ()
  {
    session_destroy();
  }
}
