<?php

echo "<!DOCTYPE html>
	<html>

		<head>

			<title>Music Monkey(Album)</title>";
			echo "<link rel = " . "'stylesheet'" . " href = " . "'style.css'";

		echo "</head>";

		echo "<body>";

			include('header.php');
			echo "<h2>Album</h2> <br /><hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . "/>";

			include('config.php');

			$sql = "select Album_ID, Artwork_URL, Album_Name, Year_Of_Release from ALBUM order by Album_Name";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				while($row = $result->fetch_assoc()) {
					echo "<a href = " . "album_songs.php?albumID=" . $row["Album_ID"] . "><div> <p><img src=" . $row["Artwork_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " width=142px height=142px align=" . "center" . " float=" . "left" . " > " . " &nbsp; " . $row["Album_Name"] . " (" . $row["Year_Of_Release"] . ")</p> </div></a> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";
				}
			}
			else {
				echo "No Result.";
			}

			$conn->close();

		echo "</body>

	</html>";
?>


