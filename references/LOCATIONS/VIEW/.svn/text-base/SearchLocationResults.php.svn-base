<?php
session_start();
//copied from searchlocationresults.php revision 149
//Version 2: 
//  created display locations object functions in the locations class that allow the application to display locations in a table format
//  refactored the code to use those functions

include_once('../MODEL/Office.Class.php');
include_once('../MODEL/Lab.Class.php');
include_once('../MODEL/Room.Class.php');
include_once('../MODEL/Floor.Class.php');
include_once('../MODEL/Building.Class.php');
include_once('../MODEL/Locations.Class.php');


//Check to see if there is a locationsarray in the sessions variable, if there is it is because the mapper put one there. the locations array is the serialzed version of a location object., if it is set, it means that there is some results to display. 
if ($_SESSION['LocationsArray']){
	if ($_SESSION['LocationsArray'][0]){
		//put the result objects into the results array
		$resultsArray = unserialize($_SESSION['LocationsArray']);
		//put the number of results into hit
		$hit= count($resultsArray);
	}
	else{
		$hit=0;
	}
}

/* for debugging this will print out all the information in the session
echo'<hr><p>/n';
print_r($_SESSION);
echo '<hr><p>';
*/

echo '<h1> Location Search - Results</h1>';

// Display search results
// For each hit - Displays locations in a tabular format

if ($hit == 0)
{
    echo ('No results found.');
    echo '<br>';
}
else
{
	echo '<table border="1" width="80%" cellpadding="1" cellspacing="1">';
	//to display heading from Locations class, called off of any object, in this case the first
    	echo "<th colspan=9 bgcolor='cornflowerblue'> SEARCH RESULT </th>";
   echo '</th>';
	$resultsArray[0]->displayTableHeadingRow();
	$resultsParameters=unserialize($_SESSION['locationGenericSearchParameters']);
	for ($i = 0; $i < $hit; $i++)
	{    		
	
		// Display search results
		$resultsArray[$i]->displayLocationInRow();
	}
 
	echo '</table>';
	echo '<br>';   
}

?>


<form action="SearchLocation.php" method="post">
<fieldset>
<legend> <font color=gray><b>New Search</b></font> </legend>
	<input type="submit" name="submit" value="Return" />
</fieldset>

</form>

<br>
