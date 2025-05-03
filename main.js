const express = require("express");
const app = express();
const fs = require("fs");
const job = require("./cron.js");
var whitelisted = JSON.parse(fs.readFileSync("./whitelist.json", "utf8"));
app.get("/addWhitelist", (req, res) => {
    id = req.query.ID;
    if (!id) {
        res.send({ status: false, error: "ID is required to whitelist." });
    }
    whitelisted.push(id);
    fs.writeFileSync("./whitelist.json", JSON.stringify(whitelisted, null, 2));
});
app.get("/whitelist-check", (req, res) => {
    id = req.query.ID;
    if (!id) {
        res.send({ status: false });
    }
    if ((!id) in whitelisted) {
        return res.send(`user:Kick("Can't use this script. Not Whitelisted.")`);
    } else {
        return res.send(`return true`);
    }
});
app.get("/", (req, res) => {
    return res.send({ status: true });
});
app.get("/muscle", (req, res) => {
    res.send(fs.readFileSync("./musclelegends.lua", "utf8"));
});

app.listen(3000, () => {
    console.log("Running on Port:3000");
});
job("https://renskihub.onrender.com");
