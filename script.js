function checkLogin() {
    let userID = document.getElementById("userID").value.toLowerCase();
    let password = document.getElementById("password").value;

    if (userID === "admin" && password === "123") {
        window.location.href = "material_requests.html";  
    } else if (userID === "driver" && password === "345") {
        window.location.href = "trip_ticket_create.html";  
    } else {
        alert("Invalid ID or Password. Try again.");
    }
}

function redirect(page) {
    window.location.href = page;
}


