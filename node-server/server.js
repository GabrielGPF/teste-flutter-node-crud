var express = require("express");
var app = express();
var db = require("./database.js");
var md5 = require("md5");
var cors = require('cors');

var bodyParser = require("body-parser");
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
var HTTP_PORT = 8000;

app.listen(HTTP_PORT, function () {
    console.log("Server running on port " + HTTP_PORT);
});

app.post("/login", (req, res, next) => {
    var errors = [];

    if (!req.body.password) {
        errors.push("No password specified");
    }

    if (!req.body.email) {
        errors.push("No email specified");
    }

    if (errors.length) {
        res.status(400).json({ "error": errors.join(",") });
        return;
    }

    var data = {
        email: req.body.email,
        password: md5(req.body.password)
    };

    var sql = `SELECT * FROM user WHERE email = ? AND password = ?`;
    var params = [data.email, data.password];

    db.get(sql, params, function (err, result) {
        if (err) {
            res.status(400).json({ "error": err.message })
            return;
        } else {
            if (result === undefined) {
                res.status(400).json({
                    "message": "failed",
                    "error": "Credenciais inválidas."
                });
                return;
            } else {
                res.json({
                    "message": "success",
                    "result": result
                });
            }
        }
    });
})

app.get("/modality", (req, res, next) => {
    var sql = "select * from modality";
    var params = [];

    db.all(sql, params, (err, rows) => {
        if (err) {
            res.status(400).json({ "error": err.message });
            return;
        } else {
            res.json({
                "message": "success",
                "data": rows
            });
        }
    });
});

app.get("/subject", (req, res, next) => {
    var sql = "select * from subject";
    var params = [];

    db.all(sql, params, (err, rows) => {
        if (err) {
            res.status(400).json({ "error": err.message });
            return;
        } else {
            res.json({
                "message": "success",
                "data": rows
            });
        }
    });
});

app.get("/course", (req, res, next) => {
    var sql;
    var params;

    if ([null, undefined, "0"].includes(req.query.subject_id)) {
        console.log("1");
        sql = "SELECT * FROM course";
        var params = [];
    } else {
        console.log("2");
        sql = "SELECT * FROM course WHERE subject_id = ?";
        var params = [parseInt(req.query.subject_id)];
    }

    db.all(sql, params, (err, rows) => {
        if (err) {
            res.status(400).json({ "error": err.message });
            return;
        } else {
            const response = {
                "message": "success",
                "data": rows
            };

            console.log("response: " + response);

            res.json(response);
        }
    });
});

app.post("/addCourse", (req, res, next) => {
    var errors = [];

    if (!req.body.subject_id) {
        errors.push("No subject_id specified");
    }
    if (!req.body.name) {
        errors.push("No name specified");
    }
    if (!req.body.modality_id) {
        errors.push("No modality_id specified");
    }
    if (!req.body.book) {
        errors.push("No book specified");
    }
    if (!req.body.isbn) {
        errors.push("No isbn specified");
    }
    if (!req.body.active) {
        errors.push("No active specified");
    }
    if (!req.body.workload) {
        errors.push("No workload specified");
    }

    if (errors.length) {
        console.log(errors.length);
        res.status(400).json({ "error": errors.join(", ") });
        return;
    }

    const data = {
        subject_id: req.body.subject_id,
        name: req.body.name,
        modality_id: req.body.modality_id,
        book: req.body.book,
        isbn: req.body.isbn,
        active: req.body.active,
        workload: req.body.workload,
    };
    const sql = 'INSERT INTO course (subject_id, name, modality_id, book, isbn, active, workload) VALUES (?,?,?,?,?,?,?)';
    const params = [data.subject_id, data.name, data.modality_id, data.book, data.isbn, data.active, data.workload];

    db.run(sql, params, function (err, result) {
        if (err) {
            res.status(400).json({ "error": err.message });
            return;
        } else {
            res.json({
                "message": "success",
                "data": data,
                "id": this.lastID
            });
        }
    });
});

app.patch("/updateCourse", (req, res, next) => {
    const data = {
        subject_id: req.body.subject_id,
        name: req.body.name,
        modality_id: req.body.modality_id,
        book: req.body.book,
        isbn: req.body.isbn,
        active: req.body.active,
        workload: req.body.workload,
        id: req.body.id,
    };

    const sql = `UPDATE course SET 
    subject_id = ?, 
    name = ?, 
    modality_id = ?, 
    book = ?, 
    isbn = ?, 
    active = ?, 
    workload = ?
    WHERE id = ?`;
    const params = [data.subject_id, data.name, data.modality_id, data.book, data.isbn, data.active, data.workload, data.id];

    db.run(sql, params, (err, result) => {
        if (err) {
            res.status(400).json({ "error": res.message });
            return;
        } else {
            console.log("suces");
            res.json({
                message: "success",
                data: data
            });
        }
    });
});

app.delete("/deleteCourse/:id", (req, res, next) => {
    const sql = 'DELETE FROM course WHERE id = ?';
    const params = req.params.id;

    db.run(sql, params, function (err, result) {
        if (err) {
            res.status(400).json({ "error": res.message });
            return;
        } else {
            res.json({
                "message": "success",
                rows: this.changes
            });
        }
    });
});

app.get("/", (req, res, next) => {
    res.json({ "message": "Ok" });
});