<?php

	echo "<!DOCTYPE html>
		<html>

			<head>

				<title>Music Monkey(Songs)</title>";
				echo "<link rel = " . "'stylesheet'" . " href = " . "'style.css'";

			echo "</head>";

			echo "<body>";

				include('header.php');
				
				include('config.php');
				$album_id = $_GET['albumID'];
				$sql = "select Album_Name, Artwork_URL, Year_Of_Release from ALBUM where Album_ID = " . $album_id;
				$result = $conn->query($sql);

				$row = $result->fetch_assoc();
				echo "<div> <p style = " . "color:brown;font-family:courier;font-size:250%;letter-spacing:7px;" . "> <img src=" . $row["Artwork_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " align = " . "center" . " height=300px width=300px float = " . "left" . ">" . "&nbsp;" . $row["Album_Name"] . "(" . $row["Year_Of_Release"] . ")</p> </div> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";

				$sql = "select Song_ID, Title from SONG where Album_ID = " . $album_id . " order by Title";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						echo "<a href = " . "play_song.php?songID=" . $row["Song_ID"] . "><p style = " . "padding:10px 5px 15px 20px;" . ">" . $row["Title"] . "<p></a> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";
					}
				}
				else {
					echo "No Result."; 
				}

				$conn->close();

			echo "</body>

			</head>

		</html>";
?>
