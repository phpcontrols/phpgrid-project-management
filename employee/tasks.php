<?php
// use phpGrid\C_DataGrid;

include_once("../phpGrid/conf.php");
include_once('../inc/head.php');
?>

<h1>My Simple Project Management - Employee</h1>

<div id="menu">
    <ul>
        <li><a href="" class="active">Tasks</a></li>
    </ul>
</div>
<br />

<div style="color:red">
Hello, employee! 
</div>

<h3>My Active Tasks</h3>

<?php
$empId = intval(2); // hard code for demo. In real world, the id should be retrieved in PHP SESSION 

// active (StatusID = 2) tasks datagrid for the current employee
$dgTask = new C_DataGrid("SELECT id, EmployeeID, TaskName, Instructions, StatusID, MilestoneID, ProjectID FROM tasks", "id", "tasks");
$dgTask->set_query_filter(" EmployeeID = $empId AND StatusID = 2 "); // Active = 2
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


<h3>My Hours History</h3>

<?php
$dgHourHist = new C_DataGrid("SELECT id, `Date`, `Time`, WorkCompleted, TaskID, ProjectID, EmployeeID FROM hours", "id", "hours");
$dgHourHist->set_jq_gridName('myHoursHistory'); // the grid name must be unique
$dgHourHist->set_query_filter(" EmployeeID = $empId ");
$dgHourHist->set_col_hidden('id, TaskID, EmployeeID');
$dgHourHist->set_col_edittype('ProjectID', 'select', "select id, ProjectName from projects");
$dgHourHist->display();
?>

<?php
include_once('../inc/footer.php');
?>