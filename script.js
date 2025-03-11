function checkLogin() {
    let userID = document.getElementById("userID").value.toLowerCase();
    let password = document.getElementById("password").value;

    if (userID === "admin" && password === "123") {
        // window.location.href = "material_requests.html"; 
        redirect('Admin View/material_requests.html');
    } else if (userID === "driver" && password === "345") {
        // window.location.href = "trip_ticket_create.html";  
        redirect("Driver View/trip_ticket_create.html");
    } else {
        alert("Invalid ID or Password. Try again.");
    }
}

function redirect(page) {
    window.location.href = page;
}

//Button Functions
document.addEventListener("DOMContentLoaded", () => {
    const approvalButton = document.querySelector(".btn.approval");
    const purchaseOrdersButton = document.querySelector(".btn.purchase-order");
    const contentDiv = document.querySelector(".content");

    if (approvalButton) {
        contentDiv.style.display = "none";

        approvalButton.addEventListener("click", () => {
            contentDiv.style.display = "block";

            fetch("http://localhost:3000/api/approvals")
                .then(response => response.json())
                .then(data => {
                    displayApprovals(data);
                    approvalButton.classList.add("disabled");
                    approvalButton.disabled = true;
                })
                .catch(error => console.error("Error fetching approvals:", error));
        });
    }

    if (purchaseOrdersButton) {
        contentDiv.style.display = "none";

        purchaseOrdersButton.addEventListener("click", () => {
            contentDiv.style.display = "block";

            fetch("http://localhost:3000/api/purchase_orders")
                .then(response => response.json())
                .then(data => {
                    displayPurchaseOrders(data);
                    purchaseOrdersButton.classList.add("disabled");
                    purchaseOrdersButton.disabled = true;
                })
                .catch(error => console.error("Error fetching purchase orders:", error));
        });
    }
});

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
                <td>${po.po_dateissued}</td>
                <td>${po.total_amount}</td>
            </tr>`;
    });

    tableHTML += `</table>`;
    purchaseOrdersTable.innerHTML = tableHTML;
}


