<?php
$con=mysqli_connect("localhost", "wsmsuser", "msws!pw", "wsmsdb");
//wsmsdb | wsmsuser | msws!pw
if(mysqli_connect_errno()){
echo "Connection Fail".mysqli_connect_error();
}

?>
