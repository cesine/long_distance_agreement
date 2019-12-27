<?php


//default language is english
$language="English";
if (isset($_SESSION['Language'])){
	$language=$_SESSION['Language'];
}

$locationObjectParameters=array("LocationID","LocationName","FloorName","BuildingName","DepartmentName","SquareMeters","ResponsibleName","Status");
$_SESSION['locationObjectParameters']=serialize($locationObjectParameters);

//use the same parameters in POST search as the objects parameters
//TBD: use nice search items instead of just numbers
//$locationGenericSearchParameters=array("LocationID","LocationName","FloorName","BuildingName","DepartmentName","SquareMeters","ResponsibleName");
$locationGenericSearchParameters=array("LocationID","LocationName","FloorID","BuildingID","DepartmentID","SquareMeters","ResponsibleID");
$_SESSION['locationGenericSearchParameters']=serialize($locationGenericSearchParameters);

//parameters to display to the user
$LocationIDPrettyPrintEnglish="Location ID #";
$DepartmentIDPrettyPrintEnglish= "Department ID # (system internal)";
$DepartmentNamePrettyPrintEnglish="Department";
$LocationNamePrettyPrintEnglish="Location Name";
$StatusPrettyPrintEnglish="Status";
$SquareMetersPrettyPrintEnglish="Size (sq meters)";
$ResponsibleIDPrettyPrintEnglish="Responsible's ID #";
$ResponsibleNamePrettyPrintEnglish="Person Responsible";
$FloorIDPrettyPrintEnglish="Floor ID #(system internal)";
$FloorNamePrettyPrintEnglish="Floor # (ex: 2)";
$BuildingIDPrettyPrintEnglish="Building ID #(system internal)";
$BuildingNamePrettyPrintEnglish="Building Code (ex: EV)";


$LocationIDPrettyPrintFrancais="No. Emplacement";
$DepartmentIDPrettyPrintFrancais= "No. Département (numérotation interne)";
$DepartmentNamePrettyPrintFrancais="Département";
$LocationNamePrettyPrintFrancais="Titre de l'emplacement";
$StatusPrettyPrintFrancais="Status";
$SquareMetersPrettyPrintFrancais="Superficie mètres carrées";
$ResponsibleIDPrettyPrintFrancais="No. de l'Utilisateur de la personne responsable";
$ResponsibleNamePrettyPrintFrancais="Personne Responsable";
$FloorIDPrettyPrintFrancais="No. Étage (numérotation interne)";
$FloorNamePrettyPrintFrancais="Étage (ex: 2)";
$BuildingIDPrettyPrintFrancais="No. Bâtiment (numérotation internal)";
$BuildingNamePrettyPrintFrancais="Bâtiment (ex: EV)";



for($i=0; $i< count($locationGenericSearchParameters); $i++)
{
	//causes the string to be evaluated to the value of the built variable
	$locationPrettyPrintSearchParameters[$i]=${$locationGenericSearchParameters[$i].'PrettyPrint'.$language};
}
//explodes the string into an array using , as a delimiter http://www.php.net/manual/en/function.explode.php
//$locationPrettyPrintSearchParameters= explode(",",$locationPrettyPrintSearchParametersString);
$_SESSION['locationPrettyPrintSearchParameters']=serialize($locationPrettyPrintSearchParameters);


$locationObjectParametersInternalExternalMapping=array
("ID" ,"Name")
//ID is the internal parameter from the database, name is the human friendly value,Name should be the displayed rather than ID so that users cannot send query information to learn the database structure.

?>
