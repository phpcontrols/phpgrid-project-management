<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management</h1>

<?php
$_GET['currentPage'] = 'clients';
include_once('../inc/menu.php');

$clientId = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
?>

<h3>Client Details</h3>


<h4>Projects</h4>
<?php
$dgProj = new C_DataGrid("SELECT id, ClientID, ProjectName, ProjectManagerID, HourlyRate, Budget FROM projects", "id", "projects");
$dgProj->set_query_filter(" ClientID = $clientId ");
$dgProj->set_col_hidden('id, ClientID');
$dgProj->set_col_edittype('ProjectManagerID', 'select', "select id, concat(FirstName, ' ', LastName) from users");
$dgProj->set_col_dynalink('ProjectName', 'project-details.php', 'id');
$dgProj->enable_edit();
$dgProj->display();
?>

<h4>Contacts</h4>
<?php
$dgCont = new C_DataGrid("SELECT id, FirstName, LastName, Email, Occupation, Phone, ClientID FROM contacts", "id", "contacts");
$dgCont->set_query_filter(" ClientID = $clientId ");
$dgCont->set_col_hidden('id, ClientID');
$dgCont->enable_edit();
$dgCont->display();
?>

<?php
include_once('../inc/footer.php');
?>