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

// API to fetch tbl_approval data
app.get("/api/approvals", (req, res) => {
    const sql = "SELECT * FROM tbl_approval";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching data:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

// API to get purchase order data
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



app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
