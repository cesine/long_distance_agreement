<?php
//**************************
//INCOMPLETE
//**************************

session_start();

include_once('../MODEL/Equipment.Class.php');


$callingForm = $_SESSION['callingForm'];

if ($_SESSION['results']) {
	if ($_SESSION['results'][0]) {
		$resultsArray = $_SESSION['results'];
		$hit= sizeof($resultsArray)/5;	
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
	//convert result array into GeneralRequest Objects
	$assetArray = array();
	$tempComputer = new Computer();
	$tempEquipment = new Equipment();
	$tempFurniture = new Furniture();
	
    for ($i = 1; $i <= $hit; $i++){
     	$requestid   = $resultsArray[0+(($i-1)*5)];
		$category    = $resultsArray[1+(($i-1)*5)];
		$description = $resultsArray[2+(($i-1)*5)];
		$status      = $resultsArray[3+(($i-1)*5)];
		$closureNote = $resultsArray[4+(($i-1)*5)];
	  
    	$assetArray[]= $tempRequest;
		//echo $requestid."<br />";
		//echo $tempRequest ->getRequestId();
		
		
		
	//echo($requestArray[$i-1]->getRequestId());
    }
}

//echo ('Request Array size: '.sizeof($requestArray).'</br>');
//echo ('Session Hits: '.$hit.'</br>');
//echo ('i size: '.($i-1).'</br>');
$_SESSION['assetArray'] = serialize($assetArray);
//$tempRequest->displayRequest();
	   	
if ($callingForm == 'SearchRequestResults'){
	header('Location: ../REQUEST/RequestDetailsPage.php');
} 
elseif ($callingForm == 'SearchRequest'){
	header('Location: ../REQUEST/SearchRequestResults.php');
}
?>