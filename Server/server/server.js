const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "localhost", // Ensure MySQL is running on this host
    user: "root",
    password: "", // Add your MySQL password if applicable
    database: "db_rg_salanatin",
    port: 3307 
});

db.connect((err) => {
    if (err) {
        console.error("Database connection failed:", err);
        return;
    }
    console.log("Connected to the database");
});

// API to GET tbl_approval data
app.get("/api/approvals", (req, res) => {
    const sql = "SELECT admin_ID, approval_ID, approval_date, approval_remarks, request_type FROM tbl_approval";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching data:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

// API to POST tbl_approval data
app.post("/api/approvals", (req, res) => {
    const { admin_ID, approval_ID, approval_date, approval_remarks, request_type } = req.body;

    if (!admin_ID || !approval_ID || !approval_date || !request_type) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    const sql = "INSERT INTO tbl_approval (admin_ID, approval_ID, approval_date, approval_remarks, request_type) VALUES (?, ?, ?, ?, ?)";
    const values = [admin_ID, approval_ID, approval_date, approval_remarks, request_type];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error("Error inserting approval:", err);
            return res.status(500).json({ error: "Database error" });
        }
        res.status(201).json({ message: "Approval added successfully", id: result.insertId });
    });
});

// API to GET tbl_purchaseorders data
app.get("/api/purchase_orders", (req, res) => {
    const sql = "SELECT admin_ID, approval_ID, po_ID, po_type, po_dateIssued, total_amount FROM tbl_purchaseorder";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching purchase orders:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

//API to GET tbl_materialrequests data
app.get("/api/material_requests", (req, res) => {
    const sql = "SELECT materialReq_ID, materialReq_date, materialReq_status, jobsite_ID, employee_ID FROM tbl_materialrequest";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching material requests:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

//API to GET tbl_fuelrequest data
app.get("/api/fuel_requests", (req, res) => {
    const sql = "SELECT fuelReq_ID, tripTicket_ID, fuelReq_amount, fuelReq_pricePerLiter, fuel_type FROM tbl_fuelrequest";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching fuel requests:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

//API to GET tbl_tripticket data
app.get("/api/trip_tickets", (req, res) => {
    const sql = "SELECT tripTicket_ID, admin_ID , time_IN, time_OUT, truck_licenseNumber, trip_date FROM tbl_tripticket";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching trip tickets:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});




app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
