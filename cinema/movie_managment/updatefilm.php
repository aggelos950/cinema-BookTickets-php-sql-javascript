<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema</title>
    <link rel="stylesheet" href="../style/style.css">

</head>

<body>
    <div class="top-panel">
        <?php
        //check if the logged user is admin and then show the admin panel
        session_start();
        if ($_SESSION["admin"] == 1) {
            echo '<a href="../adminpanel.php" class="adminpanel">ADMIN PANEL</a>';
        }
        ?>
        <a href="../index.php">PointOfView</a> <!--the title of the site is also a link to go in the movies page-->
        <a href="../logout.php" class="logout">Log out</a>
        <!--when the user is logged in this link appear to end the session and log him out-->
    </div>



    <div class="bottom-panel">
        <h3>Update film</h3>

        <div class="addnewfilm">
            <form method="POST">

                <label for="selectfilm">Select film to update:</label>
                <select name="selectfilm" id="selectfilm">
                    <?php
                    include "../database/DatabaseData.php";

                    //create new connection
                    $conn = new mysqli($servername, $username, $password, $database);

                    //check connection
                    if ($conn->connect_errno)
                        die('Error MySQL');

                    //get the title of every movie
                    $sql = "SELECT title FROM `movie`";
                    $res = $conn->query($sql);

                    //store the titles in an array
                    $response = array();
                    while ($row = mysqli_fetch_assoc($res)) {
                        $response[] = $row;
                    }
                    //show the titles 
                    var_dump($response);
                    for ($i = 0; $i < count($response); $i++) {
                        $film = $response[$i]['title'];
                        echo '<option value="' . $film . '">' . $film . '</option>';
                    }
                    $conn->close();
                    ?>
                </select>

                <label for="filmname">Insert title:</label>
                <input type="text" name="filmname" id="filmname"></input>

                <label for="filmdirector">Insert director:</label>
                <input type="text" name="filmdirector" id="filmdirector"></input>

                <label for="filmduration">Insert duration:</label>
                <input type="text" name="filmduration" id="filmduration"></input>

                <label for="filmproduction">Insert production year:</label>
                <input type="text" name="filmproduction" id="filmproduction"></input>

                <label for="selectimage">Choose film image:</label>
                <select name="selectimage" id="selectimage">

                    <?php
                    //show the available images on the img/films file
                    $images = scandir('../img/films');
                    for ($i = 2; $i < count($images); $i++) {
                        echo '<option value="' . $images[$i] . '">' . $images[$i] . '</option>';
                    }
                    ?>
                </select>

                <input type="submit" value="Update"></input>
            </form>



            <?php
            include "../database/DatabaseData.php";

            //create new connection
            $conn = new mysqli($servername, $username, $password, $database);

            //check connection
            if ($conn->connect_errno)
                die('Error MySQL');

            //get the selected movie from the form
            if (isset($_POST['selectfilm'])) {
                $film = $_POST['selectfilm'];
                $res = null;

                //check and update the changed data
                if (!empty($_POST['filmname']) || !empty($_POST['filmdirector']) || !empty($_POST['filmduration']) || !empty($_POST['filmproduction']) || (!empty($_POST['selectimage']))) {

                    if (!empty($_POST['filmname'])) {
                        $title = $_POST['filmname'];
                        $sql = "UPDATE movie SET title='$title' WHERE title='$film'";
                        $res = $conn->query($sql);
                    }
                    if (!empty($_POST['filmdirector'])) {
                        $director = $_POST['filmdirector'];
                        $sql = "UPDATE movie SET director='$director' WHERE title='$film'";
                        $res = $conn->query($sql);
                    }
                    if (!empty($_POST['filmduration'])) {
                        $duration = $_POST['filmduration'];
                        $sql = "UPDATE movie SET duration='$duration' WHERE title='$film'";
                        $res = $conn->query($sql);
                    }
                    if (!empty($_POST['filmproduction'])) {
                        $production = $_POST['filmproduction'];
                        $sql = "UPDATE movie SET production_date='$production' WHERE title='$film'";
                        $res = $conn->query($sql);
                    }
                    if (!empty($_POST['selectimage'])) {
                        $image = $_POST['selectimage'];
                        $sql = "UPDATE movie SET image='$image' WHERE title='$film'";
                        $res = $conn->query($sql);
                    }

                    if ($res != null) {
                        echo "<p>Record updated successfully.</p>";
                    } else {
                        echo "<p>Record wasn't updated</p> " . $conn->error;
                    }
                } else {
                    echo "<p> You must fill at least one field!</p>";
                }
            }
            ?>

        </div>
    </div>

    <?php
    //check if user is logged in 
    if (!isset($_SESSION["username"])) {
        header("Location: login_check.php");
        $_SESSION["logged"] = false;
        exit();
    } else {
        if ($_SESSION["admin"] != 1) {
            header("Location: index.php");
            exit();
        } else {
            $_SESSION["logged"] = true;
        }
    }
    ?>
</body>

</html>