<?php
include_once('Locations.Class.php');

class Building extends Locations {
	
	
	private $buildingName;
	private $address;
	private $city;
	private $province;
	private $country;
	private $zipCode;	
	
	function setBuildingName($buildingName){
		$this->buildingName = $buildingName;
	}
	
	function setAddress($address){
		$this->address = $address;
	}

	function setCity($city){
		$this->city = $city;
	}
	
	function setProvince($province){
		$this->province = $province;
	}
	function setCountry($country){
		$this->country = $country;
	}
	
	function setZipCode($zipCode){
		$this->zipCode = $zipCode;
	}

	function getBuildingName(){
		return $this->buildingName;
	}
	
	function getAddress(){
		return $this->address;
	}

	function getCity($city){
		return $this->city;
	}
	
	function getProvince(){
		return $this->province;
	}
	function getCountry(){
		return $this->country;
	}
	
	function getZipCode(){
		return $this->zipCode;
	}
	
	function displayAssetDetails(){
		;
	}
	
}


?>