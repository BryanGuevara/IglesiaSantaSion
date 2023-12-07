<?php
    class Usuario extends Orm{
        public function __construct(PDO $connectio){
            parent::__construct('id', 'Votaciones', $connectio);
        }
    }
?>