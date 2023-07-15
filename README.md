# Furniture-Management-System
The Furniture Management System is a full-stack web application developed using JSP (JavaServer Pages) and Java Servlets. It is designed to manage furniture inventory, sales, and customer information. The project follows the Model-View-Controller (MVC) architecture and utilizes an embedded MySQL database. The development is done using the Eclipse IDE.

# Project Overview
The Furniture Management System is designed to facilitate the management of furniture inventory and sales processes. The project consists of the following components:

Model: The model component represents the data entities and the business logic of the application. It includes Java classes that map to database tables, handle data manipulation, and perform calculations.

View: The view component is responsible for rendering the user interface. It comprises JSP files that define the structure and appearance of web pages, allowing users to interact with the system.

Controller: The controller component handles the flow of the application and acts as an intermediary between the model and the view. It consists of Java Servlets that receive HTTP requests, process the data, and invoke appropriate methods from the model to fetch or update data.

MySQL Database: The project utilizes an embedded MySQL database to store furniture inventory, customer details, and sales information. The database is accessed and manipulated using Java Database Connectivity (JDBC) APIs.

# Features
The Furniture Management System provides the following features:

Inventory Management: Allows users to add, update, and delete furniture items. Users can view the current stock, search for specific items, and track availability.

Sales Management: Provides functionality to record and manage sales transactions. Users can generate invoices, track sales history, and view sales reports.

Customer Management: Enables users to store and manage customer information. Users can add new customers, update their details, and view customer profiles.

Authentication and Authorization: Implements user authentication and authorization mechanisms to secure the application. Only authorized users can access specific functionalities based on their roles and permissions.

# Installation
To set up the Furniture Management System locally, follow these steps:

Ensure that you have the Java Development Kit (JDK) and Eclipse IDE installed on your machine.

Clone the repository or download the project files.

Open Eclipse and import the project into your workspace.

Set up the embedded MySQL database by running the SQL scripts provided in the project's database folder. These scripts will create the necessary tables and seed the initial data.

Configure the database connection details in the project's configuration files or properties.

Build and run the project in the Eclipse IDE.

Access the Furniture Management System by navigating to the specified URL in your web browser.
