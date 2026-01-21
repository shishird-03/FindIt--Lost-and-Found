const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function setupDatabase() {
    try {
        const dbConfig = {
            host: process.env.DB_HOST || process.env.MYSQLHOST,
            user: process.env.DB_USER || process.env.MYSQLUSER,
            password: process.env.DB_PASSWORD || process.env.MYSQLPASSWORD,
            port: process.env.DB_PORT || process.env.MYSQLPORT || 3306,
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
        process.exit(1);
    }
}

setupDatabase();
