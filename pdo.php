<?php

// Connect to the database
$pdo = new PDO("jdbc:mysql://localhost:3306/database_name", "username", "password");

// Perform a SELECT query
$stmt = $pdo->query("SELECT * FROM table_name");

// Fetch the results of the query
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
  echo $row['column_name'] . "\n";
}

// Disconnect from the database
$pdo = null;

?>
