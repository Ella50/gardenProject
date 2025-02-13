const sqlite3 = require("sqlite3").verbose();
const db = new sqlite3.Database("./database.sqlite", (err) => {
  if (err) {
    console.error("Hiba az adatbázis megnyitásakor:", err.message);
  } else {
    console.log("Csatlakozva az SQLite adatbázishoz.");
  }
});

module.exports = db;
