<?php

echo "<!DOCTYPE html>
	<html>

		<head>

			<title>Music Monkey(Artist)</title>";
			echo "<link rel = " . "'stylesheet'" . " href = " . "'style.css'";
		echo "</head>";

		echo "<body>";

			include('header.php');
			echo "<h2>Artist</h2> <br /><hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . "/>";

			include('config.php');

			$sql = "select Artist_ID, Artist_Name, Photo_URL from ARTIST order by Artist_Name";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				while($row = $result->fetch_assoc()) {
					echo "<a href = " . "artist_songs.php?artistID=" . $row["Artist_ID"] . "><div> <p><img src=" . $row["Photo_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " width=142px height=142px align=" . "center" . " float=" . "left" . " > " . " &nbsp; " . $row["Artist_Name"] . "</p> </div></a> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";
				}
			}
			else {
				echo "No Result.";
			}

			$conn->close();

		echo "</body>

	</html>";

?>
