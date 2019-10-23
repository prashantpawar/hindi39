const fs = require("fs");

const hindi_words = fs.readFileSync("hindi.csv");

console.log(hindi_words.toString());