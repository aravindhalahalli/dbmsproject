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
				$lyricist_id = $_GET["lyricistID"];
				$sql = "select Lyricist_Name, Photo_URL, Date_Of_Birth from LYRICIST where Lyricist_ID = " . $lyricist_id;
				$result = $conn->query($sql);

				$row = $result->fetch_assoc();
				echo "<div> <p style = " . "color:brown;font-family:courier;font-size:250%;letter-spacing:7px;" . "> <img src=" . $row["Photo_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " align = " . "center" . " height=300px width=300px float = " . "left" . ">" . "&nbsp;" . $row["Lyricist_Name"] . "<br />" . "</p> </div> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";

				$sql = "select ALBUM.Album_ID, Album_Name, Artwork_URL, Year_Of_Release from LYRICIST_ALBUMS, ALBUM where Lyricist_ID = " . $lyricist_id . " and ALBUM.Album_ID = LYRICIST_ALBUMS.Album_ID order by Album_Name";
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

			</head>

		</html>";
?>
