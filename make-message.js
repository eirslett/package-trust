const fs = require('fs');
const crypto = require('crypto');

const secret = fs.readFileSync(process.env.ARCHIVE);

const sha1 = crypto.createHash('sha1').update(secret).digest("hex");
const sha512 = crypto.createHash('sha512').update(secret).digest("base64");

console.log(JSON.stringify({
    package: process.env.PACKAGE,
    version: process.env.VERSION,
    time: Date.now(),
    hash: {
        sha1,
        sha512
    }
}));
