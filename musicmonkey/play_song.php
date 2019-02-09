<?php

echo "<!DOCTYPE html>
	<html>

		<head>

			<title>Music Monkey(Play)</title>";
			echo "<link rel = " . "'stylesheet'" . " href = " . "'style.css'" . ">";

		echo "</head>";

		echo "<body>";

			include('header.php');

			include('config.php');
			$song_id = $_GET['songID'];
			$sql = "select Title, ALBUM.Album_ID, Artwork_URL, Album_Name, Year_Of_Release, Song_URL, Language from ALBUM, SONG where Song_ID = " . $song_id . " and ALBUM.Album_ID = SONG.Album_ID";
			$result = $conn->query($sql);

			$row = $result->fetch_assoc();
			$song_url = "https://www.youtube.com/embed/" . $row["Song_URL"];
			$lang = $row["Language"];
			echo "<div style = " . "width:350px;margin-top:0cm;display:inline-block>
				<img src=" . $row["Artwork_URL"] . " onerror = " . "this.onerror=null;this.src='/Images/Error/NoImageAvailable.jpg'" . " height=300px width=300px float = " . "left" . ">
				</div>" . 
				"&nbsp;<div style = " . "width:920px;margin-top:0cm;display:inline-block><p style = " . "color:brown;font-family:courier;font-size:250%;letter-spacing:7px;margin-top:0px;margin-left:0px;margin-right:0px;margin-bottom:10px;>" . $row["Album_Name"] . "(" . $row["Year_Of_Release"] . ")<br /><p style = " . "color:brown;font-family:courier;font-size:170%;letter-spacing:3px;margin-top:0px;margin-left:0px;margin-right:0px;margin-bottom:15px;>Song: " . $row["Title"] . "<br /><p style = " . "color:brown;font-family:courier;font-size:109%;letter-spacing:0px;margin-top:0px;margin-left:0px;margin-right:0px;margin-bottom:10px;>Artist(s): ";

			$sql = "select Artist_Name from ARTIST, ARTIST_SONGS where Song_ID = " . $song_id . " and ARTIST.Artist_ID = ARTIST_SONGS.Artist_ID order by Artist_Name";
			$result = $conn->query($sql);
			if($result->num_rows > 1) {
				$i = 1;
				while($i < ($result->num_rows)) {
					$row = $result->fetch_assoc();
					echo $row["Artist_Name"] . ", ";
					$i = $i + 1;
				}
				$row = $result->fetch_assoc();
				echo $row["Artist_Name"];
			}
			else {
				$row = $result->fetch_assoc();
				echo $row["Artist_Name"];
			}

			echo "<br />Composer(s): ";

			$sql = "select Composer_Name from COMPOSER, SONG, COMPOSER_ALBUMS where Song_ID = " . $song_id . " and SONG.Album_ID = COMPOSER_ALBUMS.Album_ID and COMPOSER_ALBUMS.Composer_ID = COMPOSER.Composer_ID order by Composer_Name";
			$result = $conn->query($sql);
			if($result->num_rows > 1) {
				$i = 1;
				while($i < ($result->num_rows)) {
					$row = $result->fetch_assoc();
					echo $row["Composer_Name"] . ", ";
					$i = $i + 1;
				}
				$row = $result->fetch_assoc();
				echo $row["Composer_Name"];
			}
			else {
				$row = $result->fetch_assoc();
				echo $row["Composer_Name"];
			}


			echo "<br />Lyricist(s): ";

			$sql = "select Lyricist_Name from LYRICIST, SONG, LYRICIST_ALBUMS where Song_ID = " . $song_id . " and SONG.Album_ID = LYRICIST_ALBUMS.Album_ID and LYRICIST_ALBUMS.Lyricist_ID = LYRICIST.Lyricist_ID order by Lyricist_Name";
			$result = $conn->query($sql);
			if($result->num_rows > 1) {
				$i = 1;
				while($i < ($result->num_rows)) {
					$row = $result->fetch_assoc();
					echo $row["Lyricist_Name"] . ", ";
					$i = $i + 1;
				}
				$row = $result->fetch_assoc();
				echo $row["Lyricist_Name"];
			}
			else {
				$row = $result->fetch_assoc();
				echo $row["Lyricist_Name"];
			}

			echo "<br /><p style = " . "color:brown;font-family:courier;font-size:109%;letter-spacing:0px;margin-top:20px;margin-left:0px;margin-right:0px;margin-bottom:10px;>Language: " . $lang . "</p><br /><br /></p></p></p></div><hr style = 'height:1px;border:none;color: black;background-color:black;' />";

?>

<div align = "center">
<?php
	echo "<iframe width='560' height='315' src=" . $song_url . "?rel=0&amp;showinfo=0" . " frameborder='2' allowfullscreen></iframe>"
?>
</div>
<?php
			$sql = "call incrementNumberOfPlays(" . $song_id . ")";
			$conn->query($sql);
			include('reviews.php');
			
			$conn->close();

		echo "</body>

	</html>";
?>

