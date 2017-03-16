<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management</h1>

<?php
$_GET['currentPage'] = 'projects';
include_once('../inc/menu.php');

$projectId = (isset($_GET['id'])) ? intval($_GET['id']) : 0;
?>

<h3>Project Details</h3>


<h4>Milestones</h4>
<?php
$dgMS = new C_DataGrid("SELECT id, ProjectID, Name, StatusID, DueDate, Deliverables, TotalHours FROM milestones", "id", "milestones");
$dgMS->set_query_filter(" ProjectID = $projectId ");
$dgMS->set_col_hidden('id, ProjectID');
$dgMS->set_col_edittype('StatusID', 'select', "select id, status from proj_status");
$dgMS->enable_edit();
$dgMS->display();
?>

<h4>Tasks</h4>
<?php
$dgTask = new C_DataGrid("SELECT id, ProjectID, EmployeeID, TaskName, Instructions, StatusID, MilestoneID, TotalHours FROM tasks", "id", "tasks");
$dgTask->set_query_filter(" ProjectID = $projectId ");
$dgTask->set_col_hidden('id, ProjectID');
$dgTask->set_col_edittype('StatusID', 'select', "select id, status from task_status");
$dgTask->set_col_edittype('EmployeeID', 'select', "select id, concat(FirstName, ' ', LastName) from users");
$dgTask->set_col_edittype('MilestoneID', 'select', "select id, Name from milestones");
$dgTask->enable_edit();
$dgTask->display();
?>

<h4>Hours</h4>
<?php
$dgHour = new C_DataGrid("SELECT id, ProjectID, `Date`, `Time`, WorkCompleted, TaskID, EmployeeID FROM hours", "id", "hours");
$dgHour->set_query_filter(" ProjectID = $projectId ");
$dgHour->set_col_hidden('id, ProjectID');
$dgHour->set_col_edittype('TaskID', 'select', "select id, status from task_status");
$dgHour->set_col_edittype('EmployeeID', 'select', "select id, concat(FirstName, ' ', LastName) from users");
$dgHour->enable_edit();
$dgHour->display();
?>

<h4>Costs</h4>
<?php
$dgCost = new C_DataGrid("SELECT id, ProjectID, Name, Description, Quantity, PricePer FROM costs", "id", "costs");
$dgCost->set_query_filter(" ProjectID = $projectId ");
$dgCost->set_col_hidden('id, ProjectID');
$dgCost->set_col_currency('PricePer');
$dgCost->enable_edit();
$dgCost->display();
?>

<?php
include_once('../inc/footer.php');
?>