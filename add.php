<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    http_response_code(405); // Method Not Allowed
    echo json_encode(["error" => "Only POST requests are allowed"]);
    exit;
}

// Get the raw POST data
$data = file_get_contents("php://input");
$plantData = json_decode($data, true);

// Validate input
if (empty($plantData["magyar"]) || empty($plantData["sor_tav"]) || empty($plantData["to_tav"])) {
    http_response_code(400); // Bad request
    echo json_encode(["error" => "Hiányzó adatok"]);
    exit;
}

// Connect to the SQLite database
$db = new SQLite3("kerttervezo.db");

// Fetch the maximum ID from the novenyek table
$result = $db->querySingle("SELECT MAX(id) FROM novenyek");
$newId = $result + 1; // Increment the maximum ID by 1

// Prepare the SQL query
$query = $db->prepare("
    INSERT INTO novenyek (id, magyar_nev, latin_nev, sor_tav, to_tav, kep, szin)
    VALUES (:id, :magyar, :latin, :sor_tav, :to_tav, :kep, :szin)
");

// Bind parameters
$query->bindValue(":id", $newId, SQLITE3_INTEGER);
$query->bindValue(":magyar", $plantData["magyar"], SQLITE3_TEXT);
$query->bindValue(":latin", $plantData["latin"] ?? null, SQLITE3_TEXT);
$query->bindValue(":sor_tav", $plantData["sor_tav"], SQLITE3_INTEGER);
$query->bindValue(":to_tav", $plantData["to_tav"], SQLITE3_INTEGER);
$query->bindValue(":kep", null, SQLITE3_TEXT); // kep is optional, set to null
$query->bindValue(":szin", $plantData["szin"] ?? "#cccccc", SQLITE3_TEXT);

// Execute the query
try {
    $query->execute();
    echo json_encode(["success" => true, "message" => "Növény sikeresen hozzáadva", "id" => $newId]);
} catch (Exception $e) {
    http_response_code(500); // Internal server error
    echo json_encode(["error" => "Hiba az adatbázisba írás közben: " . $e->getMessage()]);
}

// Close the database connection
$db->close();
?>