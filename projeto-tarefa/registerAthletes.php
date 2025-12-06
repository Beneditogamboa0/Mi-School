<?php
include_once "config.php";
include_once "auxiliarFunctions.php";

$athlete = json_decode(file_get_contents("php://input"), true);
$data_atual = new DateTime();
$age=new DateTime();
$age=$age->setTimestamp(strtotime($athlete["data"]));
$age=$data_atual->diff($age)->y;

$category = selectCategory($age);
$team_id=teamAlocation($athlete["municipio"]);

if ($category == -1) {

    echo json_encode(["status" => false, "message" => "A idade deve estar entre os 7 e os 29 anos"]);
    die();
}
else if($team_id==-1){
    echo json_encode(["status"=>false,"message"=>"Já não há times disponíveis"]);
    die();
}

$query = $con->prepare("insert into atletas (nome,data_nascimento,id_municipio,id_categoria,id_clube) values (?,?,?,?,?)");
$query->execute([$athlete["nome"], $athlete["data"], $athlete["municipio"], $category,$team_id]);