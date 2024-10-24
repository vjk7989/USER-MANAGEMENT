# User Access Management System

## Overview

This system allows users to sign up, log in, request access to software applications, and enables managers to approve or reject these requests.

## Technologies

- Backend: Java Servlets
- Frontend: JavaServer Pages (JSP), HTML, CSS
- Database: PostgreSQL
- Build Tool: Maven
- Server: Apache Tomcat

## Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Maven
- PostgreSQL
- Apache Tomcat 9.x

## Setup Instructions

### 1. Database Configuration

1. Install PostgreSQL if not already installed.
2. Create a new database:   ```
   createdb UserAccessManagement   ```
3. Connect to the database:   ```
   psql -d UserAccessManagement   ```
4. Run the SQL script in `src/main/resources/schema.sql` to create the necessary tables:   ```
   \i path/to/your/project/src/main/resources/schema.sql   ```

### 2. Project Configuration

1. Clone the repository:   ```
   git clone https://github.com/yourusername/UserAccessManagement.git
   cd UserAccessManagement   ```
2. Update database connection details in all servlet files (`src/main/java/com/example/useraccess/*.java`):
   Replace the following line with your PostgreSQL credentials:   ```java
   Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UserAccessManagement", "postgres", "viki@123");   ```

### 3. Build the Project

1. Open a terminal in the project root directory.
2. Run the Maven build command:   ```
   mvn clean install   ```

### 4. Deploy to Apache Tomcat

1. Copy the generated WAR file from `target/UserAccessManagement-1.0-SNAPSHOT.war` to Tomcat's `webapps` directory.
2. Start Tomcat:
   - On Windows: `%CATALINA_HOME%\bin\startup.bat`
   - On Unix-based systems: `$CATALINA_HOME/bin/startup.sh`

### 5. Access the Application

Open a web browser and go to:
http://localhost:8080/UserAccessManagement

## Usage

1. Register a new user:
   - Navigate to the registration page
   - Fill in the required information
   - Submit the form

2. Log in:
   - Use your registered email and password to log in

3. Manage user access:
   - Administrators can view all users
   - Assign or revoke roles and permissions

4. Log out:
   - Click on the logout button to end your session

## Project Structure

- `src/main/java/com/example/useraccess/`: Contains Java servlet files
- `src/main/webapp/`: Contains JSP, HTML, and CSS files
- `src/main/resources/`: Contains database schema and configuration files

## Troubleshooting

- If you encounter database connection issues, ensure your PostgreSQL server is running and the connection details in the servlet files are correct.
- For deployment issues, check Tomcat logs in `$CATALINA_HOME/logs/` directory.



