<br />
<h3>Reviews</h3>
<hr  style = "height:1px;border:none;color: black;background-color: black;" />
<?php

$sql = "select Reviewer_Name, Rating, Review from REVIEWS where Song_ID = " . $song_id;
$result = $conn->query($sql);

if($result->num_rows > 0) {
	while($row = $result->fetch_assoc()) {
		echo "<p style = " . "color:#232323;font-family:courier;font-size:160%;letter-spacing:3px;margin-top:20px;margin-left:0px;margin-right:0px;margin-bottom:0px;>" . $row["Reviewer_Name"] . "</p><p style = " . "color:#404040;font-family:courier;font-size:100%;letter-spacing:-2px;margin-top:0px;margin-left:0px;margin-right:0px;margin-bottom:5px;>Rating: " . $row["Rating"] . "</p><p style = " . "color:#404040;font-family:courier;font-size:100%;letter-spacing:0px;margin-top:0px;margin-left:0px;margin-right:0px;margin-bottom:10px;>Comment: " . $row["Review"] . "</p>";

		echo "<hr style ='height:1px;border:none;color: black;background-color: black;' />";
	}
}
else {
	echo "<p style = " . "color:#232323;font-family:courier;font-size:160%;letter-spacing:3px;margin-top:20px;margin-left:0px;margin-right:0px;margin-bottom:0px;>No Reviews.</p>";
	echo "<hr style ='height:1px;border:none;color: black;background-color: black;' />";
}
//echo $song_id;
?>
<hr  style = "height:1px;border:none;color: black;background-color: black;" />
<br />
<h4>Add Review</h4>
<hr  style = "height:1px;border:none;color: black;background-color: black;" />
<br />
<form action = "add_review.php">
	<?php
	echo "<input type=" . "hidden" . " name = " . "songID" . " value=" . $song_id . ">";
	?>
	<strong style = "color:#353535;font-family:courier;font-size:20px;margin-bottom:0;">Name</strong>&emsp;&emsp;&emsp;
	<textarea name = "Name" placeholder = "Name" rows = "1" cols = "30" required ></textarea><br /><br /><br />
	<strong style = "color:#353535;font-family:courier;font-size:20px;margin-bottom:0;">Email</strong>&emsp;&emsp;&nbsp;
	<textarea name = "EmailID" placeholder = "Email"rows = "1" cols = "30" required></textarea>
	<p style ="font-family:courier;font-size:13px;">(Note: Only one review per email per song.)</p><br /><br />
	<strong style = "color:#353535;font-family:courier;font-size:20px;margin-bottom:0;">Rating</strong>&emsp;&nbsp;&nbsp;
	<textarea name = "Rating" placeholder = "Rating"rows = "1" cols = "10" maxlength = "3" required></textarea>
	<p style="font-family:courier;font-size:13px;margin-bottom:0px;">(Note: Acceptable values ranges between 1 and 10 inclusive.)</p>
	<p style="font-family:courier;font-size:13px;margin-top:0px;">(Note: Floating numbers upto one decimal place allowed.)</p><br /><br />
	<strong style = "color:#353535;font-family:courier;font-size:20px;margin-bottom:0;">Comment</strong>&emsp;
	<textarea name = "Comment" placeholder = "Comment"rows = "5" cols = "48" maxlength = "240"></textarea>
	<p style ="font-family:courier;font-size:13px;">(Note: Upto 240 characters allowed.)</p><br /><br /><br />
	<input type="submit" value="Submit">
</form> 
<br /><br />
<hr  style = "height:1px;border:none;color: black;background-color: black;" />

