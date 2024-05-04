<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LexiSearch</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .dictionary {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 10px;
        }
        .dictionary-item {
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .dictionary-key {
            font-weight: bold;
        }
        
        .ant-syn {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        
        .languages-container {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .languages-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .languages-list-item {
            margin-bottom: 5px;
        }
        
         .footer {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
            color: indigo;
        }
    </style>
</head>
<body>
    <div class="container">
        <?php
        $word = $_POST["txt"];
        
        $servername = "localhost";
        $username = "";
        $password = "";
        
        try {
            $conn = new PDO("mysql:host=$servername;dbname=DB", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            $stmt0 = $conn->prepare("SELECT syll FROM word WHERE word = :word");
            
            $stmt1 = $conn->prepare("SELECT meaning FROM meaning WHERE wid IN (SELECT wid FROM word WHERE word = :word) AND spid IN (SELECT spid FROM pos WHERE spid IN (SELECT spid FROM pspeech WHERE wid IN (SELECT wid FROM word WHERE word = :word)))");
            
            $stmt2 = $conn->prepare("SELECT Sanskrit, Hindi, French FROM word WHERE word = :word");
            
            $stmt3 = $conn->prepare("SELECT pos FROM pos WHERE spid IN (SELECT spid FROM pspeech WHERE wid IN (SELECT wid FROM word WHERE word = :word))");
            
            $stmt4 = $conn->prepare("SELECT name FROM sc_name WHERE wid IN (SELECT wid FROM word WHERE word = :word)");
            
            $stmt5 = $conn->prepare("SELECT antonym FROM antonym WHERE wid IN (SELECT wid FROM word WHERE word = :word) AND spid IN (SELECT spid FROM pos WHERE spid IN (SELECT spid FROM pspeech WHERE wid IN (SELECT wid FROM word WHERE word = :word)))");
            
            
            $stmt0->bindParam(":word", $word);
            $stmt1->bindParam(":word", $word);
            $stmt2->bindParam(":word", $word);
            $stmt3->bindParam(":word", $word);
            $stmt4->bindParam(":word", $word);
            $stmt5->bindParam(":word", $word);
            
            $stmt0->execute();
            $stmt1->execute();
            $stmt2->execute();
            $stmt3->execute();
            $stmt4->execute();
            $stmt5->execute();
            
            $syllable = $stmt0->fetchAll(PDO::FETCH_ASSOC);
            $meanings = $stmt1->fetchAll(PDO::FETCH_ASSOC);
            $wordDetails = $stmt2->fetch(PDO::FETCH_ASSOC);
            $partsOfSpeech = $stmt3->fetchAll(PDO::FETCH_COLUMN);
            $synonyms = $stmt4->fetchAll(PDO::FETCH_COLUMN);
            $antonym = $stmt5->fetchAll(PDO::FETCH_COLUMN);
            
            // Display the word itself
            echo "<h1>$word</h1>";
            
            if (!empty($syllable)) {
		    echo '<div style="margin-top: 1.5%; margin-bottom: 1.5%">';
		    foreach ($syllable as $syll) {
			echo '<div> <strong>Pronunciation: </strong>' . $syll['syll'] . '</div>';
		    }
		    echo '</div>';
	    }
            
            if (!empty($partsOfSpeech)) {
                echo '<div class="dictionary">';
                foreach ($partsOfSpeech as $pos) {
                    echo '<div class="dictionary-item"><span class="dictionary-key">Part of Speech:</span> ' . $pos . '</div>';
                }
                echo '</div>';
            }
            
            if (!empty($meanings)) {
                echo '<div class="dictionary">';
                foreach ($meanings as $meaning) {
                    echo '<div class="dictionary-item"><span class="dictionary-key">Meaning:</span> ' . $meaning['meaning'] . '</div>';
                }
                echo '</div>';
            } else {
                echo "<p>No results found for the word '$word'.</p>";
            }
            
            
            if (!empty($synonyms)) {
                echo '<div class="dictionary">';
                echo '<div class="dictionary-item"><span class="dictionary-key">Scientific Name:</span> ' . implode(', ', $synonyms) . '</div>';
                echo '</div>';
            }
            
            if (!empty($antonym)) {
                echo '<div class="ant-syn">';
                foreach ($antonym as $ant) {
                    echo '<div><span class="dictionary-key">Antonym:</span> ' . $ant . '</div>';
                }
                echo '</div>';
            }
            
            if (!empty($wordDetails)) {
                echo '<div class="languages-container">';
                echo '<h2>Translations:</h2>';
                echo '<ul class="languages-list">';
                foreach ($wordDetails as $language => $translation) {
                    echo '<li class="languages-list-item"><span class="dictionary-key">' . ucfirst($language) . ':</span> ' . $translation . '</li>';
                }
                echo '</ul>';
                echo '</div>';
            }
            
            if ($word == 'tiger') {
        	echo '<center><img src="https://images.pexels.com/photos/2541239/pexels-photo-2541239.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Tiger Image" style="display: block; margin: 1.5%; max-width: 50%;"></center>';
    	    } elseif ($word == 'horse') {
       	        echo '<center><img src="https://images.pexels.com/photos/1996333/pexels-photo-1996333.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Horse Image" style="display: block; margin: 1.5%; max-width: 50%;"></center>';
   	    } elseif ($word == 'apple') {
        	echo '<center><img src="https://images.pexels.com/photos/635705/pexels-photo-635705.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Apple Image" style="display: block; margin: 1.5%; max-width: 100%;"></center>';
    	    }
            
        } catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
        ?>
    </div>
     <footer class="footer">
     	<p> Together made with <strong>Yogesh</strong> and <strong>Anubhav</strong>. </p>
        <p>Styling done with <a href="https://chat.openai.com/" target="_blank">ChatGPT</a></p>
        <p>Images sourced from <a href="https://images.pexels.com/" target="_blank">Pexels</a></p>
    </footer>
</body>
</html>
