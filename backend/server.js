const express = require("express");
const cors = require("cors");
const db = require("./database");

const app = express();
app.use(cors());
app.use(express.json());

// Adatbázis inicializálása
db.serialize(() => {
  db.run(
    "CREATE TABLE IF NOT EXISTS plants (id INTEGER PRIMARY KEY, name TEXT, type TEXT)"
  );
});

// Növények lekérése
app.get("/plants", (req, res) => {
  db.all("SELECT * FROM plants", [], (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(rows);
    }
  });
});

// Új növény hozzáadása
app.post("/plants", (req, res) => {
  const { name, type } = req.body;
  db.run(
    "INSERT INTO plants (name, type) VALUES (?, ?)",
    [name, type],
    function (err) {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json({ id: this.lastID, name, type });
      }
    }
  );
});

const PORT = 5000;
app.listen(PORT, () => console.log(`Szerver fut a ${PORT} porton`));
