<?php
include_once('Locations.Class.php');

class Room extends Locations {
	
	
	private $roomNo;
	
	function setRoomNo($roomNo){
		$this->roomNo = $roomNo;
	}
	
	function getRoomNo(){
		return $this->roomNo;
	}
	
	function displayAssetDetails(){
		;
	}
	
}


?>