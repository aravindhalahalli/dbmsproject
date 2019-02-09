
<!DOCTYPE html>

<html>
	<head>
		<title>Review</title>	
	</head>
	<body>
<?php

		$song_id = $_GET['songID'];
		$name = $_GET['Name'];
		$email = $_GET['EmailID'];
		$rating = $_GET['Rating'];
		$comment = $_GET['Comment'];

		if(is_numeric($rating)) {
			include('config.php');

			$sql = "select Reviewer_Email from REVIEWS where Reviewer_Email = '" . $email . "' and Song_ID = " . $song_id;

			$result = $conn->query($sql);

			if($result->num_rows < 1) {
				$sql = "insert into REVIEWS values (" . $song_id . ", '" . $name . "', '" . $email . "', " . $rating . " , '" . $comment . "')";
				if($conn->query($sql) === TRUE) {
					$sql = "call calculateRank(" . $song_id . ")";
					$conn->query($sql);
?>
					<h1>Thank You!!</h1>
					<h2>Your Review has been added successfully.</h2>

<?php
				}
				else {
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}
			else {
?>
				<h1>Sorry!!</h1>
				<h2>You have already added one Review.</h2>
		
<?php
			}
		}
		else {
?>
			<h1>Invalid Input!!</h1>
			<h2>Nuemric variable required for Rating.</h2>
<?php
		}
		echo "<a href = " . "play_song.php?songID=" . $song_id . "><p>Go to Previous Page</p></a>";

		$conn->close();

?>

		
	</body>
</html>

