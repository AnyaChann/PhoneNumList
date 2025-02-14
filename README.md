# PhoneNumList Project

## Overview
The PhoneNumList project is a web application that allows users to manage a list of phone information. Users can add new phone entries through a form and view the list of existing phones. The application is built using Java, JSP, and a relational database.

## Features
- Add new phone details including ID, Name, Brand, Price, and Description.
- View a list of all phones stored in the database.
- Input validation for form fields.
- Reset button to clear all input fields in the form.

## Project Structure
```
PhoneNumList
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── phonenumlist
│   │   │               ├── dao
│   │   │               │   └── PhoneDAO.java
│   │   │               ├── model
│   │   │               │   └── Phone.java
│   │   │               ├── service
│   │   │               │   └── PhoneService.java
│   │   │               ├── servlet
│   │   │               │   └── PhoneServlet.java
│   │   │               └── util
│   │   │                   └── DatabaseUtil.java
│   │   └── resources
│   │       └── db
│   │           └── schema.sql
│   └── webapp
│       ├── addphone.jsp
│       └── listphone.jsp
├── pom.xml
└── README.md
```

## Setup Instructions
1. **Clone the repository**: Use `git clone <repository-url>` to clone the project to your local machine.
2. **Database Setup**: 
   - Create a database in your preferred relational database management system.
   - Execute the SQL statements in `src/main/resources/db/schema.sql` to create the necessary tables.
3. **Maven Build**: 
   - Navigate to the project directory and run `mvn clean install` to build the project and resolve dependencies.
4. **Run the Application**: 
   - Deploy the application on a servlet container (e.g., Apache Tomcat).
   - Access the application through your web browser.

## Usage
- Navigate to the `addphone.jsp` page to input new phone details.
- After submitting the form, you will be redirected to the `listphone.jsp` page where you can view all the phones stored in the database.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.