<?php

$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db = mysql_connect($db_host, $db_user, $db_pass) or die('Could not connect to the DB');


$db_name = 'my_ride_db01';
mysql_select_db($db_name) or die('Could not select the DB');

if (isset($_GET)) {
	
	var_dump($_GET);
	
	// Get the format of the get request, this defaults to XML 
	$format = strtolower($_GET['format']) == 'json' ? 'json' : 'xml';
	
	$request = $_GET['type'];
	$post = array();
	
	if ($request == 'getDealerInfo') {
		$dealerId = $_GET['dealerId'];
		$post['dealerInfo'] = getDealerInfo($dealerId, $db);
		var_dump($post['dealerInfo']);
	}
	if ($request == 'getSpecialInfo') {
		$dealerId = $_GET['dealerId'];
		$post['specialInfo'] = getSpecialInfo($dealerId, $db);
		var_dump($post['specialInfo']);
	}
	if ($request == 'getVehicleInfo') {
		$vehicleId = $_GET['vehicleId'];
		$post['vehicleInfo'] = getVehicleInfo($vehicleId, $db);
		var_dump($post['vehicleInfo']);
	}
	if ($request == 'getEvents') {
		$dealerId = $_GET['dealerId'];
		$post['events'] = getEvents($dealerId, $db);
		var_dump($post['events']);
	}
	if ($request == 'getEventDetails') {
		$eventId = $_GET['eventId'];
		$post['eventDetails'] = getEventDetails($eventId, $db);
		var_dump($post['eventDetails']);
	}
}

function getDealerInfo($dealerId, $db) {
	
	$sql = <<<EOQ
	SELECT * FROM dealer WHERE id = $dealerId;
EOQ;

	$results = mysql_query($sql, $db);
	$dealerInfo = mysql_fetch_assoc($results);
	
	$dealerInfo = json_encode($dealerInfo);

	// @TODO FORMAT IN XML
	return $dealerInfo;
	
}

function getSpecialInfo($dealerId, $db) {
	
	$sql = <<<EOQ
	SELECT * FROM special WHERE dealer_id = $dealerId;
EOQ;
	
	$results = mysql_query($sql, $db);
	while ($row = mysql_fetch_assoc($results)) {
		$specialInfo[] = $row;
	}	
	
	$specialInfo = json_encode($specialInfo);

	// @TODO FORMAT IN XML
	return $specialInfo;	
}

function getVehicleInfo($vehicleId, $db) {
	
	$sql = <<<EOQ
	SELECT * FROM vehicle WHERE id = $vehicleId;
EOQ;

	$results = mysql_query($sql, $db);
	$vehicleInfo = mysql_fetch_assoc($results);
	
	$vehicleInfo = json_encode($vehicleInfo);
	
	// @TODO FORMAT IN XML
	return $vehicleInfo;	
}

function getEvents($dealerId = NULL, $db) {
	
	if (!$dealerId) {
		$sql = <<<EOQ
		SELECT id, name, location FROM event WHERE dealer_id IS NULL;
EOQ;
	}
	else 
	{
		$sql = <<<EOQ
		SELECT id, name, location FROM event WHERE dealer_id = $dealerId;
EOQ;
		
	}
	
	$results = mysql_query($sql);
	$events = array();
	
	while ($row = mysql_fetch_assoc($results)) {
		$events[] = $row;
	}

	
	$events = json_encode($events);
	
	// @TODO FORMAT IN XML
	return $events;	
}

function getEventDetails($eventId, $db) {
	
	$sql = <<<EOQ
	SELECT * FROM event WHERE id = $eventId;
EOQ;

	$results = mysql_query($sql, $db);
	$eventDetails = mysql_fetch_assoc($results);
	
	$eventDetails = json_encode($eventDetails);
	
	// @TODO FORMAT IN XML
	return $eventDetails;	
}





