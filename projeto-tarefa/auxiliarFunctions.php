<?php
function selectCategory($age)
{
    if ($age >= 7 && $age <= 11)
        return 1;
    else if ($age >= 12 && $age <= 17)
        return 2;
    else if ($age >= 18 && $age <= 29)
        return 3;
    else
        return -1;
}
function teamAlocation($municipe)
{
    global $con;
    $query = $con->prepare("select * from clubes");
    $query->execute();
    $teams = $query->fetchAll(PDO::FETCH_ASSOC);

    $query = $con->prepare("select * from municipios");
    $query->execute();
    $municipes = $query->fetch(PDO::FETCH_ASSOC);

    $limit = 3;

    $team_size = $con->prepare("select count(*) from atletas join clubes on clubes.id=id_clube where atletas.id_municipio=? and clubes.id_municipio=?");
    $team_size->execute([$municipe, $municipe]);
    $team_size=$team_size->fetchColumn();

    $team_selector = $con->prepare("select clubes.id from clubes where not exists (select 1 from atletas where clubes.id=atletas.id_clube)");
    $team_selector->execute();
    $team_selector = $team_selector->fetchColumn();

    $team_id=$con->prepare("select count(clubes.id) from clubes join atletas on clubes.id=atletas.id_clube where clubes.id_municipio!=atletas.id_municipio");
    $team_id->execute();
    $team_id=$team_id->fetchColumn();

    $team_selector_size = $con->prepare("select count(*) from atletas where id_clube=?");
    $team_selector_size->execute([$team_selector]);
    $team_selector_size = $team_selector_size->fetchColumn();

    if ($team_size < $limit)
        return $municipe;

    else if ($team_selector_size < $limit) {
        return $team_selector;
        
    } else
        return -1;
}