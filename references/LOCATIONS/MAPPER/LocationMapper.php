<?php
session_start();
//copied from locationmapper  149

//The mapper takes information from the session variable, and converts it into an object, then serialzes the object back into the session variable

include_once('../MODEL/Locations.Class.php');

$callingForm = $_SESSION['callingForm'];

$numberOfColumns = 7;

if ($_SESSION['results']) {
	if ($_SESSION['results'][0]) {
		$resultsArray = $_SESSION['results'];
		//$_SESSION['hit']= sizeof($resultsArray);
		$hit= sizeof($resultsArray)/$numberOfColumns;//divide by the number of columns, or else wont display all info	
	}
	else{
		$hit=0;		
	}
}

// For each hit - 
if ($hit == 0)
{
    echo ('No results found.');
    echo '<br>';
}
else{
	//convert result array into  Locations Objects
	$locationArray = array();
	$tempLocation;
    for ($i = 1; $i <= $hit; $i++){
     	$tempLocation = new Locations();
    	$tempLocation->setLocationID($resultsArray[0+(($i-1)*$numberOfColumns)]);
        $tempLocation->setDepartmentID($resultsArray[1+(($i-1)*$numberOfColumns)]);
        $tempLocation->setLocationName($resultsArray[2+(($i-1)*$numberOfColumns)]);
        $tempLocation->setSquareMeters($resultsArray[4+(($i-1)*$numberOfColumns)]);
        $tempLocation->setStatus($resultsArray[3+(($i-1)*$numberOfColumns)]);
        $tempLocation->setResponsibleID($resultsArray[5+(($i-1)*$numberOfColumns)]);
        $tempLocation->setFloorID($resultsArray[6+(($i-1)*$numberOfColumns)]);
 
		//add object to array
    	$locationArray[]= $tempLocation;
    }
}
//searializes array of objects to store it in session
$_SESSION['LocationsArray'] = serialize($locationArray);

//go to search results
header('Location: ../VIEW/SearchLocationResults.php');
?>
