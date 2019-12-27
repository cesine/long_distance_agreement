<?php
session_start();
//copied from SelectPhyscialAssetDispatcher.php 149
//added condition logic from Selectphysicalassetdispatcher 183

require_once ('../../DB/UUIDB.Class.php');
require_once ('../../QUERY/SelQuery.php');
include_once ('../locations.config.php');

if (isset($_GET['LocationID']) && isset($_GET['Category'])){
	$LocationID = $_GET['LocationID'];
	$category = $_GET['Category'];
	$CallingForm = 'SearchLocationResults';

	if($category== 'Lab'){
		header('Location: ../CONTROLLER/SelectLabDispatcher.php?CallingForm='.$CallingForm.'&LocationID='.$LocationID);
	}
	elseif($category== 'Room'){
		header('Location: ../CONTROLLER/SelectRoomDispatcher.php?CallingForm='.$CallingForm.'&LocationID='.$LocationID);
	}
	elseif($category== 'Office'){
		header('Location: ../CONTROLLER/SelectOfficeDispatcher.php?CallingForm='.$CallingForm.'&LocationID='.$LocationID);
	}
}
else{
	$CallingForm	= $_POST['CallingForm'];
	$LocationID		= $_POST['LocationID'];
	$locationType		= $_POST['Category'];
	
	if ($CallingForm == 'SearchLocation')
	{
                $conditions = '';
		$conditionOperator = " LIKE '%"; //=, ILIKE
                $and = ' AND ';
                $table = ' a.';

		//locationGenericSearchParameters comes from location.config.php
		foreach($locationGenericSearchParameters as &$value)
		{
			if(!empty($_POST[$value])){
                        	if(!empty($conditions)){
                                	$conditions.=$and;
                        	}
                        // cant use LIKE with value% or value_ for some reason. is the DB classes cleaning the condition?
			$conditions.=$table.$value.$conditionOperator.$_POST[$value]."%'";
                        //echo $conditions.'<br/>';
                	}
	
		}
                if(!empty($_POST['Status'])){
                        if(!empty($conditions)){
                                $conditions.=$and;
                        }
                        $conditions.=$table.'Status'.$conditionOperator.$_POST['Status']."%'";
                        //echo $conditions.'<br/>';
                }
		
                if(empty($conditions)){
                        $conditions = 1;
                }

                if($locationType==''){
                        $db->connect();
                        $qr  = new selQuery(TABLE_LOCATION. ' a');
	
			//echo $conditions;
                        $result= $qr->selectcon($conditions);		
			//$result= $qr->selectall();
			$column_names =  $qr->getcolumns($conditions);
			$arr_results = $qr ->getrowdata($conditions);
		
			$db->close();
			
			if (!$result){
				$message = 'ERROR:' . mysql_error();
				echo $message;
				//TBD: need to send a message rather htan printing because kills page"header already sent" etc
			}
			else{
				mysql_free_result($result);
				$_SESSION['column_names'] = $column_names;
				//$_SESSION['column_names'] = $arr_column_names;
				$_SESSION['results'] = $arr_results;
		
				header('Location: ../MAPPER/LocationMapper.php');
			}
		}
	
		elseif($LocationType != ''){
                        //echo $conditions;
                        header('Location: ../CONTROLLER/SelectLocationTypeDispatcher.php?CallingForm='.$CallingForm.'&Category='.$assetType.'&Conditions='.$conditions);
		}
	}
}
?>
