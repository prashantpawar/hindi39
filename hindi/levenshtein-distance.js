const R = require("ramda");
const fs = require("fs");
const levenshtein = require('fast-levenshtein');

const filename = "hindi_sahstranam_vishnu-filtered.csv";
const outfilename = "hindi_sahstranam_vishnu-filtered.csv";

const calculateDistance = (limit) => {
    const sahastranam = (fs.readFileSync(`${__dirname}/${filename}`)).toString().split("\n");
    let distances = R.map(word1 =>
        R.map(word2 => ({
            word1: word1,
            word2: word2,
            distance: levenshtein.get(word1, word2)
        }), sahastranam), sahastranam);

    distances = R.unnest(distances);

    // Clean up the data
    distances = R.reject(val => val.word1 === "" || val.word2 === "", distances);

    // Keep only high distance values
    distances = R.filter(val => val.distance >= 2, distances);

    // Sort by distance values
    distances = R.sortBy(R.prop('distance'), distances);

    if(limit) {
        distances = R.take(limit, distances);
    }

    return distances;
};

const printPairs = (pairs) => {
    R.forEach(item => {
        console.log(item.distance, item.word1, item.word1);
    }, pairs);
};

module.exports = {
    calculateDistance
};