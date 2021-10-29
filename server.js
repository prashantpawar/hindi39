// server.js
// where your node app starts

// init project
import fs from "fs";
import express from "express"
import bodyParser from "body-parser"
import path from 'path';
import { getWordPairs } from "./levenshtein-distance.js"

const moduleURL = new URL(import.meta.url);
const __dirname = path.dirname(moduleURL.pathname);

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));



// we've started you off with Express,
// but feel free to use whatever libs or frameworks you'd like through `package.json`.

// http://expresses.com/en/starter/static-files.html
app.use(express.static("public"));

// init sqlite db
import sqlite3 from "sqlite3";
var dbFile = "./.data/sqlite.db";
var exists = fs.existsSync(dbFile);
var db = new sqlite3.Database(dbFile);
console.log(`${exists} exists` + __dirname);
console.log(process.cwd());

// if ./.data/sqlite.db does not exist, create it, otherwise print records to console
db.serialize(function () {
  if (!exists) {
    db.run("CREATE TABLE Words (word TEXT)");
    console.log("New table Words created!");

    const hindi_words = (fs.readFileSync("hindi_curated.csv")).toString().split("\n");

    hindi_words.map(function (word) {
      // insert default dreams
      db.serialize(function () {
        db.run(
          'INSERT INTO Words (word) VALUES ("' + word + '")'
        );
      });
    });
  } else {
    console.log('Database "Words" ready to go!');
    db.each("SELECT * from Words LIMIT 10", function (err, row) {
      if (row) {
        console.log("record:", row);
      }
    });
  }
});

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (request, response) {
  response.sendFile(__dirname + "/views/index.html");
});

// endpoint to get all the dreams in the database
// currently this is the only endpoint, ie. adding dreams won't update the database
// read the sqlite3 module docs and try to add your own! https://www.npmjs.com/package/sqlite3
app.get("/getWords", function (request, response) {
  db.all("SELECT * from Words LIMIT 48", function (err, rows) {
    response.send(JSON.stringify(rows));
  });
});


app.get("/random", function (request, response) {
  db.all("SELECT * from Words ORDER BY RANDOM() LIMIT 48", function (err, rows) {
    response.send(JSON.stringify(rows));
  });
})

// Hindi endpoints
app.get("/hindi", (_, response) => response.sendFile(__dirname + "/hindi/views/hindi.html"));
app.get("/api/v1/hindi", (_, response) => response.send(JSON.stringify(getWordPairs())));


// listen for requests :)
var listener = app.listen(40065, function () {
  console.log("Your app is serving http://localhost:" + listener.address().port);
});


import { Hindi } from "./src/index.mjs"

app.get("/hindi-curated", (_, response) =>
  response.send(Json.stringify(Hindi.lines))
)