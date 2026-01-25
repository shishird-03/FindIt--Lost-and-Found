const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function setupDatabase() {
    try {
        const dbConfig = {
            host: process.env.MYSQLHOST || process.env.DB_HOST,
            user: process.env.MYSQLUSER || process.env.DB_USER,
            password: process.env.MYSQLPASSWORD || process.env.DB_PASSWORD,
            database: process.env.MYSQLDATABASE || process.env.DB_NAME,
            port: process.env.MYSQLPORT || process.env.DB_PORT || 3306,
            multipleStatements: true
        };

        console.log('Attempting to connect with config:', {
            host: dbConfig.host || 'UNDEFINED (Defaults to localhost)',
            user: dbConfig.user,
            port: dbConfig.port,
            // Don't log the password!
        });

        // Connect without database selected first
        const connection = await mysql.createConnection(dbConfig);

        console.log('Connected to MySQL server...');

        const sqlPath = path.join(__dirname, 'database.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        console.log('Executing database.sql...');
        await connection.query(sql);

        console.log('✅ Database setup completed successfully!');
        await connection.end();
    } catch (err) {
        console.error('❌ Error setting up database:', err);
        // On deployment, if DB setup fails, the app should probably crash so it restarts
        process.exit(1);
    }
}

setupDatabase();
