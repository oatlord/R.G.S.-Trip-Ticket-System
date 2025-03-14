const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: "sql.freedb.tech", // Ensure MySQL is running on this host
    user: "freedb_cjong",
    password: "&@7WcCEYHUvbBa5", // Add your MySQL password if applicable
    database: "freedb_db_salanatin_remote",
    port: 3306
});

db.connect((err) => {
    if (err) {
        console.error("Database connection failed:", err);
        return;
    }
    console.log("Connected to the database");
});

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// Login API
app.post("/api/login", (req, res) => {
    const { userID, password } = req.body;

    if (!userID || !password) {
        return res.status(400).json({ success: false, message: "Missing credentials" });
    }

    // Check Admin Table
    const adminQuery = "SELECT * FROM tbl_admin WHERE admin_ID = ? AND admin_password = ?";
    db.query(adminQuery, [userID, password], (err, adminResults) => {
        if (err) {
            console.error("Error checking admin login:", err);
            return res.status(500).json({ success: false, message: "Database error" });
        }

        if (adminResults.length > 0) {
            return res.json({ success: true, userType: "admin" });
        }

        // If not an admin, check Driver Table
        const driverQuery = "SELECT * FROM tbl_driver WHERE driver_ID = ? AND driver_password = ?";
        db.query(driverQuery, [userID, password], (err, driverResults) => {
            if (err) {
                console.error("Error checking driver login:", err);
                return res.status(500).json({ success: false, message: "Database error" });
            }

            if (driverResults.length > 0) {
                return res.json({ success: true, userType: "driver" });
            } else {
                return res.json({ success: false, message: "Invalid credentials" });
            }
        });
    });
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


//API to GET tbl_tripticket data
app.get("/api/trip_tickets", (req, res) => {
    const sql = "SELECT * FROM tbl_tripticket_request";
    db.query(sql, (err, results) => {
        if (err) {
            console.error("Error fetching trip tickets:", err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(results);
        }
    });
});

//API to POST tbl_tripticket data
app.post("/api/trip_tickets", (req, res) => {
    const { tripTicket_ID, driver_ID, employee_ID, truck_licenseNumber, jobsite_ID, trip_date } = req.body;

    // Check if required fields are provided
    if (!tripTicket_ID || !driver_ID || !employee_ID || !truck_licenseNumber || !jobsite_ID || !trip_date) {
        return res.status(400).json({ error: "Missing required fields" });
    }

    // SQL Query
    const sql = `INSERT INTO tbl_tripticket_request (tripTicket_ID, driver_ID, employee_ID, truck_licenseNumber, jobsite_ID, trip_date) 
                 VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [tripTicket_ID, driver_ID, employee_ID, truck_licenseNumber, jobsite_ID, trip_date];

    db.query(sql, values, (err, result) => {
        if (err) {
            console.error("Error inserting trip ticket:", err);
            return res.status(500).json({ error: "Database error" });
        }
        res.status(201).json({ message: "Trip ticket request submitted successfully", id: result.insertId });
    });
});


app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});
