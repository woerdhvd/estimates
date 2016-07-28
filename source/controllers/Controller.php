<?php

/**
 * Controller
 */
 class Controller
 {
   function __construct($options)
   {
     $this->relative    = $options['relative'];
     $this->auth        = $options['auth'];
     $this->estimates   = $options['estimates'];
     $this->formoptions = $options['formoptions'];
     $this->view        = $options['view'];
   }
}
