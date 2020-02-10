const R = require("ramda");
const fs = require("fs");
const filename = "hindi_sahastranam_vishnu.csv";
const outfilename = "hindi_sahstranam_vishnu-filtered.csv";
const raw_sahastranam = (fs.readFileSync(filename)).toString().split("\n");
const filterIndexed = R.addIndex(R.filter);
const mapIndexed = R.addIndex(R.map);
const sahastranam = filterIndexed((_, i) => (i % 5) === 0, raw_sahastranam);

const outfs = fs.createWriteStream(outfilename);
outfs.on('error', console.error);
R.forEach(item => outfs.write(item + '\n'), sahastranam);
outfs.end();
console.log(sahastranam);