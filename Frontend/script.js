async function handleLogin(event) {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Fetch user from backend
    const response = await fetch(`/api/users/${username}`);
    const user = await response.json();

    if (user && user.password === password) {
        if (username === 'admin') {
            document.getElementById('adminOptions').style.display = 'block';
        } else {
            document.getElementById('welcomeMessage').innerText = `Welcome @${username}`;
            document.getElementById('userOptions').style.display = 'block';
        }
        document.getElementById('loginForm').style.display = 'none';
    } else {
        alert('Invalid credentials');
    }
}

async function handleAddUser (event) {
    event.preventDefault();
    const newUser  = {
        username: document.getElementById('newUsername').value,
        password: document.getElementById('newPassword').value,
        name: document.getElementById('newName').value
    };

    await fetch('/api/users/add', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(newUser )
    });

    alert('User  added successfully!');
    document.getElementById('addUser Form').reset();
}

async function reserveSeat() {
    const reservation = {
        userId: 1, // Replace with actual user ID
        seatNumber: 5, // Replace with actual seat number
        reservationDate: new Date() // Current date
    };

    await fetch('/api/reservations/reserve', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(reservation)
    });

    alert('Seat reserved successfully!');
}