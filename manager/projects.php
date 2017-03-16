<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management</h1>

<?php
$_GET['currentPage'] = 'projects';
include_once('../inc/menu.php');
?>


<h3>Projects</h3>

<?php
$dgProj = new C_DataGrid("SELECT id, ClientID, Active, ProjectName, StatusID, ProjectManagerID, HourlyRate, Budget FROM projects", "id", "projects");
$dgProj->set_col_hidden('id');
$dgProj->set_col_edittype('ClientID', 'select', "select id, Name from clients");
$dgProj->set_col_edittype('StatusID', 'select', "select id, Status from proj_status");
$dgProj->set_col_edittype('ProjectManagerID', 'select', "select id, concat(FirstName, ' ', LastName) from users");
$dgProj->set_col_edittype('Active', 'select', '0:InActive;1:Active');
$dgProj->set_col_currency('HourlyRate');
$dgProj->set_col_currency('Budget');
$dgProj-> set_sortname('ClientID');
//$dg->set_group_properties('ClientID');

$dgProj->set_col_dynalink('ProjectName', 'project-details.php', 'id');

$dgProj->enable_edit();
$dgProj -> display();
?>

<?php
include_once('../inc/footer.php');
?>