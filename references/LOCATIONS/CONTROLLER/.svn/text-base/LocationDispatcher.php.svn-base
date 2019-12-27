<?php
//copied from asset dispatcher revision 138

// TBD1: IMPORTANT: Need successive insert (retrieve LocationID and populate foreign tables)
// TBD2: Only location table is implemented
// TBD3: FacultyID and LocationID are hard coded - Change when conversion is added to AdditionalLocationInformation.php and LocationDetailsPage.php
// TBD4: DatePurchased and WarrantyExpiration are varchar(10) rather than timestamp
// TBD5: Implement return to appropriate page


require_once ('../../DB/UUIDB.Class.php');
require_once ('../../QUERY/SqlQuery.php');


$CallingForm	= $_POST["CallingForm"];

$data['DepartmentID']                   = $_POST["DepartmentID"];
$data['Status']                 = $_POST["Status"];
$data['SquareMeters']                   = $_POST["SquareMeters"];
$data['Responsible']                    = $_POST["Responsible"];
$data['FloorID']                = $_POST["FloorID"];
$data['LocationID']                = $_POST["LocationID"];
$data['LocationName']                = $_POST["LocationName"];


$db->connect();

$qr = new SQL(TABLE_LOCATION);

if ($CallingForm == "AdditionalLocationInformationEquipment")
{
	$data['Category']	= "Equipment";

	$result = $qr -> query_insert($data);
}
elseif ($CallingForm == "AdditionalLocationInformationFurniture")
{
	$data['Category']	= "Furniture";

	$result = $qr -> query_insert($data);
}
elseif ($CallingForm == "LocationDetailsPage")
{
	//$data['FacultyID']			= "2";
	//$data['LegacyCode']			= $_POST["LegacyCode"];
	//$data['WarrantyExpiration']	= $_POST["WarrantyExpiration"];
	$data['LocationID']			= "4";
	$data['Status']				= $_POST["Status"];

	$where = 'LocationID = '.$_POST["LocationID"];
	$result = $qr -> query_update($data,$where);
}

$db->close();


if ($CallingForm == 'AdditionalLocationInformationEquipment' || $CallingForm == 'AdditionalLocationInformationFurniture')
{
	header('Location: ../VIEW/AddLocation.php');
}
elseif ($CallingForm == 'LocationDetailsPage')
{
	header('Location: ../VIEW/SearchLocation.php');
}


?>
