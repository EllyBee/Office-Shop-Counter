<?php

$fromFlashOffice= $_POST["fromFlashOffice"];
$fromFlashShop= $_POST["fromFlashShop"];
$valToFlash = "get ".$fromFlashOffice;
echo "fromPhp=".$valToFlash;	//return to flash


require_once( 'pachube_functions.php' );

$api_key = "A_yYg7jpIHQJqego-rMinaBoSO2dZIh3xFaQYX4QbDY";

echo "<hr>";
echo "<li><b>Create a Pachube object with your API key: </b>";
echo '<code>$pachube = new Pachube($api_key); </code>';

$pachube = new Pachube($api_key);


echo "</li><hr>";
echo "<li><b>Retrieve raw feed data via URL (e.g. http://api.pachube.com/v2/feeds/19426.csv [.json | .xml]): </b>";
$url = "http://api.pachube.com/v2/feeds/19426.csv";
$data = $pachube->retrieveData ( $url );
echo '<code>$data = $pachube->retrieveData ($url); </code>';
echo $data;


echo "</li><hr>";
echo "<li><b>Update a manual feed with CSV: </b>";
// note that you must own the feed listed below in order to update it!
$url = "http://api.pachube.com/v2/feeds/25351.csv";
$data = "0, ".$fromFlashOffice;
//$data = "0, 003";
$data2 = "1, ".$fromFlashShop;

echo '<code>$update_status = $pachube->updatePachube ( $url, $data ); </code>';

// this next line makes the actual update attempt and returns a status code

$update_status = $pachube->updatePachube ( $url, $data );	
$pachube->debugStatusCode($update_status);

$update_status = $pachube->updatePachube ( $url, $data2 );	
$pachube->debugStatusCode($update_status);


