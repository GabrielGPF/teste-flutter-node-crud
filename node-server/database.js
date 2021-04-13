var sqlite3 = require('sqlite3').verbose();
var md5 = require('md5');

const DBSOURCE = "db.sqlite";

let db = new sqlite3.Database(DBSOURCE, (err) => {
    if (err) {
      // Cannot open database
      console.error(err.message);
      throw err
    }else{
        console.log('Connected to the SQLite database.');
        _createDefaultUsers(db);
        _createDefaultSubjects(db);
        _createDefaultModalities(db);
        _createDefaultCourses(db);
    }
});

function _createDefaultUsers(db){
    db.run(`CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email text UNIQUE, 
        password text, 
        CONSTRAINT email_unique UNIQUE (email)
        )`,
    (err) => {
        if (err) {
            console.log('Table user already created');
        }else{
            var insert = 'INSERT INTO user (email, password) VALUES (?,?)';
            db.run(insert, ["admin@example.com",md5("admin123456")]);
            db.run(insert, ["user@example.com",md5("user123456")]);
        }
    });  
}

function _createDefaultSubjects(db){
    db.run(`CREATE TABLE subject (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name text UNIQUE, 
        CONSTRAINT subject_unique UNIQUE (name)
        )`,
    (err) => {
        if (err) {
            console.log('Table subject already created');
        } else {
            var insert = 'INSERT INTO subject (name) VALUES (?)';
            db.run(insert, ["Inglês"]);
            db.run(insert, ["Espanhol"]);
            db.run(insert, ["Francês"]);
            db.run(insert, ["Italiano"]);
            db.run(insert, ["Japonês"]);
        }
    });  
}

function _createDefaultModalities(db){
    db.run(`CREATE TABLE modality (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name text UNIQUE, 
        CONSTRAINT modality_unique UNIQUE (name)
        )`,
    (err) => {
        if (err) {
            console.log('Table modality already created');
        } else {
            var insert = 'INSERT INTO modality (name) VALUES (?)';
            db.run(insert, ["Presencial"]);
            db.run(insert, ["Remoto"]);
            db.run(insert, ["Semipresencial"]);
        }
    });  
}


function _createDefaultCourses(db){
    db.run(`CREATE TABLE course (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        subject_id integer,
        name text,
        modality_id integer,
        book text,
        isbn text,
        active boolean,
        workload int
        )`,
    (err) => {
        if (err) {
            console.log('Table course already created');
        } else {}
    });  
}

module.exports = db;