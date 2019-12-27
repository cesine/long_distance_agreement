<?php
//TBD: get information like floor name from floor ID

//TBD: cant includ inside a class. (doesnt seem to work, even in the functions)
//include_once ('../locations.config.php');
//include_once ('../../QUERY/SelQuery.php');
//include_once ('../../DB/UUIDB.Class.php');
class Locations {
	
	private $LocationID;
	private $DepartmentID;
	private $DepartmentName;
	private $LocationName;
	private $Status;
	private $SquareMeters;
	private $ResponsibleID;
	private $ResponsibleName;
	private $FloorID;
	private $FloorName;
	private $BuildingID;
	private $BuildingName;
	private $FacultyID;
	private $FacultyName;

	function setLocationID($LocationID){
		$this->LocationID = $LocationID;
	}
	function setDepartmentID($DepartmentID){
		$this->DepartmentID = $DepartmentID;
	}
	function setLocationName($LocationName){
		$this->LocationName = $LocationName;
	}
		
	function setStatus($Status){
		$this->Status = $Status;
	}
	
	function setSquareMeters($SquareMeters){
		$this->SquareMeters = $SquareMeters;
	}
	
	function setResponsibleID($ResponsibleID){
		$this->ResponsibleID = $ResponsibleID;
	}
	
	function setFloorID($FloorID){
		$this->FloorID = $FloorID;
	}
		
        function setBuildingID($BuildingID){
                $this->BuildingID = $BuildingID;
        }
        function getBuildingID(){
                return $this->BuildingID;
        }
        function setBuildingName($BuildingName){
                $this->BuildingName = $BuildingName;
        }
        function getBuildingName(){
                return $this->BuildingName;
        }
      function setFacultyID($FacultyID){
                $this->FacultyID = $FacultyID;
        }
        function getFacultyID(){
                return $this->FacultyID;
        }
        function setFacultyName($FacultyName){
                $this->FacultyName = $FacultyName;
        }       
        function getFacultyName(){
                return $this->FacultyName;
        }
	
	function getLocationID(){
		return $this->LocationID;
	}

	function getDepartmentID(){
		return $this->DepartmentID;
	}
        function getDepartmentName(){
                return $this->DepartmentName;
        }
	
	function getLocationName(){
		return $this->LocationName;
	}
	
	function getStatus(){
		return $this->Status;
	}
	
	function getSquareMeters(){
		return $this->SquareMeters;
	}
	
	function getResponsibleID(){
		return $this->ResponsibleID;
	}
	
	function getFloorID(){
		return $this->FloorID;
	}
        function setFloorName($FloorName){
                $this->FloorName = $FloorName;
        }       
        function getFloorName(){
                return $this->FloorName;
        }	

	function convertIDtoName($parameterID,$table){
		include_once ('../../DB/UUIDB.Class.php');
		include_once ('../../QUERY/SelQuery.php');
		require_once('../../DB/config.inc.php');
		$db = new Database(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE);
		$db->connect();
		$qr = new selQuery($table. ' a');
		$parameterName = $qr->selConvertIDtoName($parameterID,$table);	
		$db->close();
		return $parameterName;
	}

	function displayLocationDetails(){
		
	}

	function displayTableHeadingRow(){
		//TBD: figure out why cant include a php config file in a class...
 
	        $display_columns=unserialize($_SESSION['locationPrettyPrintSearchParameters']);
		echo '<tr valign="top">';
		for($i=0; $i< count($display_columns); $i++)
		{	 
			echo "<th bgcolor='lightgray'>$display_columns[$i] </th>";
		}
		echo "<th bgcolor='lightgray'>Status</th>";
                echo "<th bgcolor='lightgray'>Action</th>";
 
		echo '</tr>';

	}//end display tablheaderrow	

	function displayLocation(){
	//TBD non tabular view of a location
	}	
	function displayLocationInRow(){

		$display_rows=unserialize($_SESSION['locationGenericSearchParameters']);
		echo '<tr valign="top">';
		for($i=0; $i< count($display_rows); $i++){
			//doesnt evaluate to the object's variable's values.
			$value=${$display_rows[$i]};
			$value=$display_rows[$i];
			//$value=${$value};
			//$value=$this->'get'=.$display_rows[$i].'()';
			//echo "<td>$value</td>";
			//echo "<td>".$this->getLocationID()."</td>";
		}
		echo "</tr>";
		//this is the hardcoded row view, doesnt allow the headers to match the row.
 		echo '<tr>';
		echo '<td>'.$this->getLocationID().'</td>';
		echo '<td>'.$this->getLocationName().'</td>';
		echo '<td>'.$this->convertIDtoName($this->getFloorID(),'floor').'</td>';

		//echo '<td>'.$this->getFloorID().'</td>';
		echo '<td>'.$this->getBuildingID().'</td>';
		echo '<td>'.$this->getDepartmentID().'</td>';
		echo '<td>'.$this->getSquareMeters().'</td>';
		echo '<td>'.$this->getResponsibleID().'</td>';
		echo '<td>'.$this->getStatus().'</td>';
		echo '<td><a href="../CONTROLLER/LocationDispatcher.php?LocationID='.$this->getLocationId().'&Category='.$this->getLocationName().'">Edit</a></td>';
		echo '</tr>';
	}
	
	
}

?>
