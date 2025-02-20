<?php
// Adatbázis kapcsolat létrehozása
$servername = "localhost";
$username = "root"; // Az adatbázis felhasználóneve
$password = ""; // Az adatbázis jelszava
$dbname = "my_database"; // Az adatbázis neve

// Kapcsolódás az adatbázishoz
$conn = new mysqli($servername, $username, $password, $dbname);

// Kapcsolódás ellenőrzése
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Adatok lekérdezése
$sql = "SELECT id, name, email FROM users";
$result = $conn->query($sql);

// HTML struktúra
echo "<h1>Felhasználók listája</h1>";

if ($result->num_rows > 0) {
    // Táblázat kezdete
    echo "<table border='1'>";
    echo "<tr><th>ID</th><th>Név</th><th>Email</th></tr>";
    
    // Soronkénti adat megjelenítése
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["id"]. "</td><td>" . $row["name"]. "</td><td>" . $row["email"]. "</td></tr>";
    }
    
    echo "</table>";
} else {
    echo "Nincsenek adatok.";
}

// Kapcsolat bezárása
$conn->close();
?>