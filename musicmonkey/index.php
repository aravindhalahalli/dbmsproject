<!DOCTYPE html>

<html>

	<head>

		<title>Music Monkey</title>
		<link rel = "stylesheet" href = "style.css">
	</head>
	<body>
<?php
		include('header.php');
?>
		<h2>Trending</h2> <br /><hr style = "height:1px;border:none;color:black;background-color:black;" />
<?php		
		include('config.php');
		$sql = "select Ranking, T.Song_ID, Title from TRENDING T, SONG S where S.Song_ID = T.Song_ID order by Ranking";
		$result = $conn->query($sql);
		if($result->num_rows > 0) {
			while($row = $result->fetch_assoc()) {
				echo "<a href = " . "play_song.php?songID=" . $row["Song_ID"] . "><div><p>" . "&emsp;&emsp;&emsp;" . $row["Ranking"] . "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" . $row["Title"] . "</p></div></a><hr style = " . "'height:1px;border:none;color: black;background-color: black;'" . " />";
			}
		}
		else {
			$sql = "call allotDefaultRank()";
			$conn->query($sql);
?>
		<script>
			setTimeout(function() {
				window.location.href = "index.php";
			}, 0);
		</script>
<?php			
		}

		$conn->close();
?>
		<hr style = 'height:1px;border:none;color:black;background-color:black;' />
	</body>

</html>

