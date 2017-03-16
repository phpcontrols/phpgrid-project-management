<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management</h1>

<?php
$_GET['currentPage'] = 'clients';
include_once('../inc/menu.php');
?>

<h3>Clients</h3>

<?php
$dgClient = new C_DataGrid("SELECT id, Name, Website, Industry, Phone FROM clients", "id", "clients");
$dgClient->set_col_hidden('id');
$dgClient->set_col_link('Website');
$dgClient->set_col_dynalink('Name', 'client-details.php', 'id');
$dgClient->enable_edit();
$dgClient -> display();
?>

<?php
include_once('../inc/footer.php');
?>