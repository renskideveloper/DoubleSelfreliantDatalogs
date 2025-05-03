const express = require("express");
const fs = require("fs");
const job = require("./cron.js");

const app = express();

// Load whitelist
let whitelisted = [];
try {
    whitelisted = JSON.parse(fs.readFileSync('./whitelist.json', 'utf8'));
} catch (e) {
    whitelisted = [];
    fs.writeFileSync('./whitelist.json', JSON.stringify(whitelisted, null, 2));
}

// Add ID to whitelist
app.get("/addWhitelist", (req, res) => {
    const id = req.query.ID;
    if (!id) {
        return res.send({ status: false, error: "ID is required to whitelist." });
    }

    if (!whitelisted.includes(id)) {
        whitelisted.push(id);
        fs.writeFileSync('./whitelist.json', JSON.stringify(whitelisted, null, 2));
    }

    return res.send({ status: true, added: id });
});

// Check if ID is whitelisted
app.get("/whitelist-check", (req, res) => {
    const id = req.query.ID;
    if (!id) return res.send({ status: false });

    if (!whitelisted.includes(id)) {
        return res.send(`user:Kick("Can't use this script. Not Whitelisted.")`);
    }

    return res.send(`return true`);
});

// Status check
app.get("/", (req, res) => {
    return res.send({ status: true });
});

// Serve Lua script
app.get("/muscle", (req, res) => {
    try {
        const script = fs.readFileSync("./musclelegends.lua", "utf8");
        res.type("text/plain").send(script);
    } catch (err) {
        res.status(500).send("Lua script not found.");
    }
});

// Start server
app.listen(3000, () => {
    console.log("Running on Port: 3000");
});

// Start the cron job
job("https://renskihub.onrender.com");
