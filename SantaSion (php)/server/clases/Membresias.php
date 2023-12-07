<?php
    class Cliente extends Orm{
        public function __construct(PDO $connectio){
            parent::__construct('id', 'Membresias', $connectio);
        }
    }
?>