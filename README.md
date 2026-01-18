# FindIt - Lost & Found Platform 🔍

FindIt is a modern, community-driven web application designed to help users report lost items and reunite with found belongings. Built with a premium Glassmorphism UI and a robust Node.js backend, it simplifies the process of tracking lost items on campus or within organizations.

![FindIt Dashboard](https://via.placeholder.com/800x400?text=FindIt+Dashboard+Preview)

## 🚀 Features

- **Authenticated Access**: Secure Signup/Login with Role-Based Access Control (Student, Faculty, Admin).
- **Smart Reporting**: Easy-to-use forms for reporting Lost and Found items with image uploads.
- **Intelligent Matching**: Backend algorithm automatically detects potential matches between lost and found reports.
- **Premium UI**: Responsive React frontend featuring a sleek Glassmorphism design and dark mode aesthetics.
- **User Dashboard**: Dedicated profile page to track your reported activity and history.
- **Privacy First**: Contact details are protected and only shared when necessary.

## 🛠️ Tech Stack

- **Frontend**: React (Vite), CSS Modules (Glassmorphism), Lucide React Icons.
- **Backend**: Node.js, Express.js.
- **Database**: MySQL (using `mysql2`).
- **Authentication**: JWT (JSON Web Tokens), Bcrypt for password hashing.
- **File Storage**: Multer for local image storage.
- **Email**: Nodemailer for notifications (mock/dev mode supported).

## ⚙️ Installation & Setup

### Prerequisites
- Node.js (v14+)
- MySQL Server installed and running

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/FindIt.git
cd FindIt/lost_found
```

### 2. Database Setup
Create a `.env` file in the `server` directory and configure your credentials:
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=lost_and_found_db
JWT_SECRET=your_super_secret_key
SERVER_PORT=5000
EMAIL_USER=your_email@gmail.com (Optional for Dev)
EMAIL_PASS=your_app_password (Optional for Dev)
```

Run the setup script to initialize the database schema:
```bash
cd server
npm install
node setup_db.js
```

### 3. Start the Backend
```bash
# Inside the /server directory
npm start
```
Server runs on `http://localhost:5000`.

### 4. Start the Frontend
Open a new terminal:
```bash
cd client
npm install
npm run dev
```
Client runs on `http://localhost:5173`.

## 📖 Usage

1.  **Sign Up**: Create an account as a Student or Faculty.
2.  **Report**: Lost something? Post a "Lost Item" report. Found something? Post a "Found Item".
3.  **Browse**: Check the listings to see if your item has been found.
4.  **Match**: The system will notify you if a matching item is reported.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1.  Fork the project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
