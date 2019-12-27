<?php
session_start();
include_once('../MODEL/PhysicalAssets.Class.php');

$callingForm = $_SESSION['callingForm'];

if ($_SESSION['results']) {
	if ($_SESSION['results'][0]) {
		$resultsArray = $_SESSION['results'];
		$hit= sizeof($resultsArray)/14;	
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
	//convert result array into Physical Assets Objects
	$assetArray = array();
	$tempAsset;
    for ($i = 1; $i <= $hit; $i++){
     	$tempAsset = new PhysicalAssets();
    	$tempAsset->setAssetId($resultsArray[0+(($i-1)*14)]);
		$tempAsset->setBarCode($resultsArray[3+(($i-1)*14)]);
		$tempAsset->setCategory($resultsArray[9+(($i-1)*14)]);
		$tempAsset->setLocationId($resultsArray[1+(($i-1)*14)]);
		$tempAsset->setStatus($resultsArray[10+(($i-1)*14)]);
	    		
    	$assetArray[]= $tempAsset;
		//echo $requestid."<br />";
		//echo $tempRequest ->getRequestId();
		
		
		
	//echo($requestArray[$i-1]->getRequestId());
    }
}

//echo ('Request Array size: '.sizeof($requestArray).'</br>');
//echo ('Session Hits: '.$hit.'</br>');
//echo ('i size: '.($i-1).'</br>');
$_SESSION['physicalAssetsArray'] = serialize($assetArray);
//$tempRequest->displayRequest();
	   	
header('Location: ../VIEW/SearchAssetResults.php');
?>