
<!-- 
Version 1: copied from  SearchPhysicalAsset (version138) did find replace
removed physcial Physical
changed asset location
changed Asset Location
adjusted search fields to be appropraite for the location module
-->

<html>
<head><title>Search  location | Unified Universtity Inventory System</title></head>

<body>
<?php
	include ('../../FORMAT/Header.php');
?>

<h2>Search  location</h2>

<form action="../CONTROLLER/SelectLocationDispatcher.php" method="post">

<!-- Hidden element: Calling form -->

<input type="hidden" name="CallingForm" value="SearchLocation"/>

<fieldset>
<legend><font color=cornflowerblue><b>Choose an Location Type</b></font></legend>
Category:
	<select name="Category">
		<option value="">All</option>
		<option value=Room>Room</option>
		<option value=Office>Office</option>
		<option value=Lab>Lab</option>
		<option value=Building>Building</option>
		<option value=Floor>Floor</option>
		
	</select>
</fieldset>
<br/>


<fieldset>
<legend><font color=cornflowerblue><b>Generic location information</b></font></legend>

<?php

//print out fields using the locations config file
$_SESSION['Language']="English";

include_once ('../locations.config.php');

for($i=0; $i< count($locationGenericSearchParameters); $i++)
{
	$displayText=$locationPrettyPrintSearchParameters[$i];
	$parameter=$locationGenericSearchParameters[$i];
	echo "<p>$displayText: <input type='text' name='$parameter' size ='32' maxlength='64'  class='inputtext'/></p>";
}

?>

Status:
	<select name="Status">
		<option></option>
		<option value="">All</option>
		<option value=Available>Available</option>
		<option value=Reserved>Reserved</option>
                <option value=Schedulable>Schedulable</option>
		<option value=Removed>Removed</option>
	</select>
<br>

</fieldset>
<br>

<fieldset>
<legend> <font color=gray><b>Submit/Clear</b></font> </legend>
    <input type="submit" name="submit" value="Submit search" />
    <input type="reset"  name="reset"  value="Clear" />
</fieldset>

</form>

<!-- Return link -->

<form action="LocationMenu.php" method="post">
<fieldset>
<legend> <font color=gray><b>Return</b></font> </legend>
    <input type="submit" name="submit" value="Return" />
</fieldset>
</form>

<?php
	include ('../../FORMAT/Footer.php');
?>
</body>
</html>
