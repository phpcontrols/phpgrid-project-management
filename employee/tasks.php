<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management</h1>

<?php
//$_GET['currentPage'] = 'projects';
//include_once('../inc/menu.php');
?>

<div style="color:red">
Hello, employee! The editing is disabled for security reasons in the demo.
</div>

<h3>My Active Tasks</h3>

<?php
$empId = intval(2);

$dgTask = new C_DataGrid("SELECT id, EmployeeID, TaskName, Instructions, StatusID, MilestoneID, ProjectID FROM tasks", "id", "tasks");
$dgTask->set_query_filter(" EmployeeID = $empId AND StatusID = 2 ");
$dgTask->set_col_hidden('id, EmployeeID')->set_sortname('TaskName');
$dgTask->set_col_edittype('StatusID', 'select', "select id, status from task_status");
$dgTask->set_col_edittype('EmployeeID', 'select', "select id, concat(FirstName, ' ', LastName) from users");
$dgTask->set_col_edittype('MilestoneID', 'select', "select id, Name from milestones");
$dgTask->set_col_edittype('ProjectID', 'select', "select id, ProjectName from projects");

$dgHour = new C_DataGrid("SELECT id, `Date`, `Time`, WorkCompleted, TaskID, EmployeeID FROM hours", "id", "hours");
$dgHour->set_query_filter(" EmployeeID = $empId ");
$dgHour->set_col_hidden('id, TaskID, EmployeeID');
$dgHour->enable_edit();

$dgTask->set_subgrid($dgHour, 'TaskID', 'id');
$dgTask->display();
?>


<h3>My Hours</h3>

<?php
$dgHour = new C_DataGrid("SELECT id, `Date`, `Time`, WorkCompleted, TaskID, ProjectID, EmployeeID FROM hours", "id", "hours");
$dgHour->set_query_filter(" EmployeeID = $empId ");
$dgHour->set_col_hidden('id, TaskID, EmployeeID');
$dgHour->set_col_edittype('ProjectID', 'select', "select id, ProjectName from projects");
$dgHour->display();
?>

<?php
include_once('../inc/footer.php');
?>