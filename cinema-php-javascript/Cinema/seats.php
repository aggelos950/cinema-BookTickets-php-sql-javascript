<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema</title>
    <link rel="stylesheet" href="./style/style.css">
    
</head>

<body>
    <?php
    session_start();
        if (!isset($_SESSION["username"])) {
            header("Location: login_check.php");
            exit();
        }
    ?>

<header>
        <?php
            if ($_SESSION["admin"] == 1) {
                echo '<a href="adminpanel.php" class="adminpanel">ADMIN PANEL</a>';
            }
            
        ?>
        <a href="index.php" class="cinemaLink">PointOfView</a>
        <a href="logout.php" class="logout">Log out</a> 
    </header>


    <main>
        <div id="filmTitle"></div>
        <div id="seats"></div>

        <div id="book">Book</div>
        <div class="seatsGoBack">
            <a href="viewAllMyReservations.php">All My Reservations</a>
            OR
            <a href="index.php">Go back to films</a>
        </div>    
    </main>

    <script>
        function giveGet() {
            return <?php echo json_encode($_GET); ?>;
        }

        function getIdOfFilm() {
            return <?php echo json_encode($_SESSION['user_id']); ?>;
        }
    </script>

    <script src="./js/seats.js"></script>

</body>

</html>