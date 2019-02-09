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
				$artist_id = $_GET["artistID"];
				$sql = "select Artist_Name, Photo_URL, Date_Of_Birth from ARTIST where Artist_ID = " . $artist_id;
				$result = $conn->query($sql);

				$row = $result->fetch_assoc();
				echo "<div> <p style = " . "color:brown;font-family:courier;font-size:250%;letter-spacing:7px;" . "> <img src=" . $row["Photo_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " align = " . "center" . " height=300px width=300px float = " . "left" . ">" . "&nbsp;" . $row["Artist_Name"] . "<br />" . "</p> </div> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";

				$sql = "select SONG.Song_ID, Title, Album_Name from SONG, ARTIST_SONGS, ALBUM where Artist_ID = " . $artist_id . " and SONG.Song_ID = ARTIST_SONGS.Song_ID and ALBUM.Album_ID = SONG.Album_ID order by Title";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						echo "<a href = " . "play_song.php?songID=" . $row["Song_ID"] . "><p style = " . "padding:10px 5px 15px 20px;" . ">" . $row["Title"] . " (" . $row["Album_Name"] . ")<p></a> <hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";
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
