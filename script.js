// Display the approvals table
function displayApprovals(approvals) {
    let contentDiv = document.querySelector(".content");
    
    if (!approvals.length) {
        contentDiv.innerHTML = "<p>No approval requests available.</p>";
        return;
    }

    let tableHTML = `
        <table>
            <thead>
                <tr>
                    <th>Select</th>
                    <th>Admin ID</th>
                    <th>Approval ID</th>
                    <th>Approval Date</th>
                    <th>Request Type</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>`;

    approvals.forEach(approval => {
        tableHTML += `
            <tr>
                <td>
                    <input type="radio" name="approvalSelect" value="${approval.approval_ID}">
                </td>
                <td>${approval.admin_ID}</td>
                <td>${approval.approval_ID}</td>
                <td>${new Date(approval.approval_date).toLocaleString()}</td>
                <td>${approval.request_type}</td>
                <td>${approval.approval_remarks === 1 ? "Approved" : approval.approval_remarks === 2 ? "Declined" : "Pending"}</td>
            </tr>`;
    });

    contentDiv.innerHTML = tableHTML;

    // Attach event listeners for approval actions
    document.querySelector(".btn.approval-approve").addEventListener("click", () => updateApprovalStatus(1));
    document.querySelector(".btn.approval-decline").addEventListener("click", () => updateApprovalStatus(2));
}


// Update approval status
function updateApprovalStatus(status) {
    const selectedApproval = document.querySelector('input[name="approvalSelect"]:checked');
    
    if (!selectedApproval) {
        alert("Please select an approval request first.");
        return;
    }

    const approval_ID = selectedApproval.value;

    fetch("http://localhost:3000/api/updateApprovalStatus", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ approval_ID, approval_remarks: status })
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        location.reload();
    })
    .catch(error => console.error("Error updating approval status:", error));
}
//Submit approvals
function submitApprovals() {
    const approvalRows = document.querySelectorAll("input[type='radio']:checked");

    if (approvalRows.length === 0) {
        alert("No approvals selected.");
        return;
    }

    approvalRows.forEach(radio => {
        const approval_ID = radio.name.split("_")[1];
        updateApprovalStatus(approval_ID);
    });
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
                <th>Select</th>
                <th>Material Request ID</th>
                <th>Material Request Date</th>
                <th>Status</th>
                <th>Jobsite ID</th>
                <th>Employee ID</th>
            </tr>`;

    materialRequests.forEach(materialRequest => {
        tableHTML += `
            <tr>
                <td><input type="radio" name="selectedRequest" value="${materialRequest.materialReq_ID}"></td>
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

//Approval / Decline for Material Request
function updateRequestStatus(status) {
    const selectedRequest = document.querySelector('input[name="selectedRequest"]:checked');
    if (!selectedRequest) {
        alert("Please select a material request first.");
        return;
    }

    const requestId = selectedRequest.value;

    fetch(`http://localhost:3000/api/material_requests/${requestId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ approval_status: status })
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            location.reload();
        })
        .catch(error => console.error("Error updating request:", error));
}


//Redirect to the page
function redirect(page) {
    window.location.href = page;
}

//Logout Function
function logout() {
    localStorage.removeItem("driver_id");
    localStorage.removeItem("driver_password");
    window.location.href = "login.html"; // Redirect to login page
}

//Event Listeners
document.addEventListener("DOMContentLoaded", () => {
    console.log("DOM fully loaded");

    // 🔹 Trip Ticket Form Submission
    const tripTicketForm = document.getElementById("tripTicketForm");
    if (tripTicketForm) {
        tripTicketForm.addEventListener("submit", async function (event) {
            event.preventDefault();

            const tripTicket_ID = document.getElementById("ticketIdInput").value;
            const driver_ID = document.getElementById("driverIdInput").value;
            const employee_ID = document.getElementById("employeeIdInput").value;
            const truck_licenseNumber = document.getElementById("licenseNoInput").value;
            const jobsite_ID = document.getElementById("jobsiteIdInput").value;
            const trip_date = document.getElementById("dateInput").value;

            const requestData = {
                tripTicket_ID,
                driver_ID,  
                employee_ID,
                truck_licenseNumber,
                jobsite_ID,
                trip_date
            };

            try {
                const response = await fetch("http://localhost:3000/api/trip_tickets", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(requestData)
                });

                const result = await response.json();
                if (response.ok) {
                    alert("Trip ticket submitted successfully!");
                    tripTicketForm.reset();
                } else {
                    alert("Error: " + result.error);
                }
            } catch (error) {
                console.error("Error submitting form:", error);
                alert("Failed to submit trip ticket.");
            }
        });
    } else {
        console.error("Trip ticket form not found!");
    }

    // 🔹 Login Form Submission
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            event.preventDefault();

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
                        if (data.userType === "admin") {
                            window.location.href = "Admin View/material_requests.html";
                        } else if (data.userType === "driver") {
                            window.location.href = "Driver View/trip_ticket_create.html";
                        }
                    } else {
                        alert("Invalid ID or Password. Try again.");
                    }
                })
                .catch(error => console.error("Error logging in:", error));
        });
    }

    // 🔹 Event Listeners for Buttons
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

    //Approve or Decline Material Request
    document.querySelector(".btn.material-approve")?.addEventListener("click", () => updateRequestStatus(1));
    document.querySelector(".btn.material-decline")?.addEventListener("click", () => updateRequestStatus(2));

    document.getElementById("logoutButton")?.addEventListener("click", logout);
    document.getElementById("cancelButton")?.addEventListener("click", logout);

    document.getElementById("logoutButton").addEventListener("click", function (event) {
        event.preventDefault(); // Prevents form submission if inside a form
    
        // Clear session storage or any authentication tokens
        sessionStorage.clear(); // Optional: Clear any stored session data
    
        // Redirect to the correct login page
        window.location.href = "http://127.0.0.1:5500/login.html"; 
    });

    document.getElementById("cancelButton").addEventListener("click", function (event) {
        event.preventDefault(); 
    
        sessionStorage.clear(); 
    
        window.location.href = "http://127.0.0.1:5500/login.html"; 
    });

    document.addEventListener("DOMContentLoaded", function () {
        fetchApprovalRequests();
    });

});



//end of script.js
