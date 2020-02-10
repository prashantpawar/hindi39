const R = require("ramda");
const fs = require("fs");
const levenshtein = require('fast-levenshtein');

// const filename = "./hindi/hindi_sahastranam_vishnu-fitered.csv";
const filename = "./hindi/hindi_sahstranam_vishnu-filtered.csv";
const sahastranam = (fs.readFileSync(filename)).toString().split("\n");

const distances = R.map(word1 => 
        R.map(word2 => ({
            word1: word1,
            word2: word2,
            distance: levenshtein.get(word1, word2)
        })), R.take(50, sahastranam));

console.log(distances);