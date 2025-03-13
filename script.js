// Display the approvals table
function displayApprovals(approvals) {
    let contentDiv = document.querySelector(".content");
    let tableHTML = `
        <table>
            <tr>
                <th>Admin ID</th>
                <th>Approval ID</th>
                <th>Approval Date</th>
                <th>Approval Remarks</th>
                <th>Request Type</th>
            </tr>`;

    approvals.forEach(approval => {
        tableHTML += `
            <tr>
                <td>${approval.admin_ID}</td>
                <td>${approval.approval_ID}</td>
                <td>${new Date(approval.approval_date).toLocaleString()}</td>
                <td>${approval.approval_remarks || "N/A"}</td>
                <td>${approval.request_type}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    contentDiv.innerHTML = tableHTML;
}

//Display the purchase orders table
function displayPurchaseOrders(purchaseOrders) {
    let purchaseOrdersTable = document.getElementById("purchaseOrdersTable");
    if (!purchaseOrdersTable) return;
    let tableHTML = `
        <table>
            <tr>
                <th>Admin ID</th>
                <th>Approval ID</th>
                <th>PO ID</th>
                <th>PO Type</th>
                <th>PO Date Issued</th>
                <th>Total Amount</th>
            </tr>`;

    purchaseOrders.forEach(po => {
        tableHTML += `
            <tr>
                <td>${po.admin_ID}</td>
                <td>${po.approval_ID}</td>
                <td>${po.po_ID}</td>
                <td>${po.po_type}</td>
                <td>${new Date(po.po_dateIssued).toLocaleString()}</td>
                <td>${po.total_amount}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    purchaseOrdersTable.innerHTML = tableHTML;
}

//Display the material requests table
function displayMaterialRequests(materialRequests) {
    let materialRequestsTable = document.getElementById("materialRequestsTable");
    if (!materialRequestsTable) return;
    let tableHTML = `
        <table>
            <tr>
                <th>Material Request ID</th>
                <th>Material Request Date</th>
                <th>Material Request Status</th>
                <th>Jobsite ID</th>
                <th>Employee ID</th>
            </tr>`;

    materialRequests.forEach(materialRequest => {
        tableHTML += `
            <tr>
                <td>${materialRequest.materialReq_ID}</td>
                <td>${new Date(materialRequest.materialReq_date).toLocaleString()}</td>
                <td>${materialRequest.materialReq_status}</td>
                <td>${materialRequest.jobsite_ID}</td>
                <td>${materialRequest.employee_ID}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    materialRequestsTable.innerHTML = tableHTML;
}

//Display the fuel requests table
function displayFuelRequests(fuelRequests) {
    let fuelRequestsTable = document.getElementById("fuelRequestsTable");
    if (!fuelRequestsTable) return;
    let tableHTML = `
        <table>
            <tr>
                <th>Fuel Request ID</th>
                <th>Trip Ticket ID</th>
                <th>Fuel Request Amount</th>
                <th>Fuel Request Price Per Liter</th>
                <th>Fuel Type</th>
            </tr>`;

    fuelRequests.forEach(fuelRequest => {
        tableHTML += `
            <tr>
                <td>${fuelRequest.fuelReq_ID}</td>
                <td>${fuelRequest.tripTicket_ID}</td>
                <td>${fuelRequest.fuelReq_amount}</td>
                <td>${fuelRequest.fuelReq_pricePerLiter}</td>
                <td>${fuelRequest.fuel_type}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    fuelRequestsTable.innerHTML = tableHTML;
}

//Display the tbl_tripticket table 
function displayTripTickets(tripTickets) {
    let tripTicketsTable = document.getElementById("tripTicketsTable");
    if (!tripTicketsTable) return;
    let tableHTML = `
        <table>
            <tr>
                <th>Trip Ticket ID</th>
                <th>Driver ID</th>
                <th>Employee ID</th>
                <th>Truck License Number</th>
                <th>Jobsite ID</th>
                <th>Trip Date</th>
            </tr>`;

    tripTickets.forEach(tripTicket => {
        tableHTML += `
            <tr>
                <td>${tripTicket.tripTicket_ID}</td>
                <td>${tripTicket.driver_ID}</td>
                <td>${tripTicket.employee_ID}</td>
                <td>${tripTicket.truck_licenseNumber}</td>
                <td>${tripTicket.jobsite_ID}</td>
                <td>${new Date(tripTicket.trip_date).toLocaleString()}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    tripTicketsTable.innerHTML = tableHTML;
}   



//Login Check Function
function checkLogin() {
    let userID = document.getElementById("userID").value;
    let password = document.getElementById("password").value;

    fetch("http://localhost:3000/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ userID, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            if (data.role === "admin") {
                window.location.href = "Admin View/material_requests.html";
            } else if (data.role === "driver") {
                window.location.href = "Driver View/trip_ticket_create.html";
            }
        } else {
            alert("Invalid ID or Password. Try again.");
        }
    })
    .catch(error => console.error("Error logging in:", error));
}

//Redirect to the page
function redirect(page) {
    window.location.href = page;
}


//Event Listeners
document.addEventListener("DOMContentLoaded", () => {
    document.querySelector(".btn.approval")?.addEventListener("click", (event) => {
        fetch("http://localhost:3000/api/approvals")
            .then(response => response.json())
            .then(data => {
                displayApprovals(data);
                event.target.classList.toggle("disabled");
            })
            .catch(error => console.error("Error fetching approvals:", error));
    });

    document.querySelector(".btn.purchase-order")?.addEventListener("click", () => {
        fetch("http://localhost:3000/api/purchase_orders")
            .then(response => response.json())
            .then(data => {
                displayPurchaseOrders(data);
                const purchaseOrdersButton = document.querySelector(".btn.purchase-order");
                purchaseOrdersButton.classList.add("disabled");
                purchaseOrdersButton.disabled = true;
            })
            .catch(error => console.error("Error fetching purchase orders:", error));
    });

    document.querySelector(".btn.material-request")?.addEventListener("click", () => {
        fetch("http://localhost:3000/api/material_requests")
            .then(response => response.json())
            .then(data => {
                displayMaterialRequests(data);
                const materialRequestsButton = document.querySelector(".btn.material-request");
                materialRequestsButton.classList.add("disabled");
                materialRequestsButton.disabled = true;
            })
            .catch(error => console.error("Error fetching material requests:", error));
    });

    document.querySelector(".btn.fuel-request")?.addEventListener("click", () => {
        fetch("http://localhost:3000/api/fuel_requests")
            .then(response => response.json())
            .then(data => {
                displayFuelRequests(data);
                const fuelRequestsButton = document.querySelector(".btn.fuel-request");
                fuelRequestsButton.classList.add("disabled");
                fuelRequestsButton.disabled = true;
            })
            .catch(error => console.error("Error fetching fuel requests:", error));
    });

    document.querySelector(".btn.trip-ticket")?.addEventListener("click", () => {
        fetch("http://localhost:3000/api/trip_tickets")
            .then(response => response.json())
            .then(data => {
                displayTripTickets(data);
                const tripTicketsButton = document.querySelector(".btn.trip-ticket");
                tripTicketsButton.classList.add("disabled");
                tripTicketsButton.disabled = true;
            })
            .catch(error => console.error("Error fetching trip tickets:", error));
    });
});

//Trip Ticket Confirmation
document.getElementById("tripTicketForm").addEventListener("submit", async function (event) {
    event.preventDefault(); 
    
    const isConfirmed = confirm("Are you sure you want to create this trip ticket?");
    
    if (!isConfirmed) {
        return; 
    }

    // Collect form data
    const formData = {
        tripTicket_ID: document.getElementById("ticketIdInput").value,
        driver_ID: document.getElementById("driverIdInput").value,
        employee_ID: document.getElementById("employeeIdInput").value,
        truck_licenseNumber: document.getElementById("licenseNoInput").value,
        jobsite_ID: document.getElementById("jobsiteIdInput").value,
        trip_date: document.getElementById("dateInput").value
    };

    try {
        const response = await fetch("http://localhost:3000/api/trip_tickets", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(formData),
        });

        const result = await response.json();
        
        if (response.ok) {
            alert("Trip ticket added successfully!"); 
            document.getElementById("tripTicketForm").reset(); 
        } else {
            alert("Error: " + result.error); // Error pop-up
        }
    } catch (error) {
        console.error("Error submitting form:", error);
        alert("Failed to submit trip ticket.");
    }
});


//end of script.js
