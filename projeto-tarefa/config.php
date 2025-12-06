<?php
    $con=new PDO("mysql:host=localhost;dbname=clubpicker","root","");
    if(!$con){
        die();
    }