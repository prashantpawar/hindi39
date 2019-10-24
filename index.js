const fs = require("fs");

const hindi_words = fs.readFileSync("hi_IN.txt");

console.log(hindi_words.length);