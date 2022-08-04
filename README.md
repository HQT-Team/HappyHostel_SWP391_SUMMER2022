# :star_struck: HQT Hostel Management - SWP391

The main project folder for the team to organize, manage and work

Live Demo: :point_right: [here]()

## Table of Contents

- [Description](#description)

- [Preview Screenshot](#preview-screenshot)

- [Install and run](#install-and-run)

- [Technology](#technology)

- [Functional requirements](#functional-requirements)

- [Useful Resources](#useful-resources)

- [Contributors](#contributors)

- [Learn More](#learn-more)

- [Reference](#reference)

- [License & Copyright](#license--copyright)

## Description

- This web application is ...

## Preview Screenshot

- Updating

## Install and run

### Required

- Open source code with IntelliJ IDE
- Installed JDK verison 11.x or above
- Installed Tomcat server version 8.5.x or higher and below version 10
- Installed Microsoft SQL Server Management Studio 18 and run the attached project script file in the source code folder
- Installed NodeJS Latest Version and SASS

### Install
1. Clone the source code to your computer and open the source code with IntelliJ IDE
2. Wait for the libraries configured in the dependencies of the POM.xml file to be downloaded
3. Select Runs/Debug configuration
4. Select Add New Configuration
5. Select Tomcat Server Local version
6. In the Server tab, in the Application server section, link to the folder where Tomcat is installed
7. In the Server tab, in the JRE section, link to the folder where the JDK is installed
8. On the Deployment tab, click Add, select Artifact and select HappyHostel:war
9. Also in the Deployment tab, scroll down to see the Application context item is currently "/HappyHostel_war", delete "_war" and click Apply
10. In the project's IntelliJ window, open Terminal with Command Prompt
11. Run command ``` sass --watch src/main/webapp/assets/scss:src/main/webapp/assets/css ``` to build SCSS files into CSS files to display styles for pages

### Run
1. Click run to let IntelliJ turn on tomcat, build the project into a .war file and deploy it to the server
2. The web will automatically be turned on in the selected default browser or type "http://localhost:8080/HappyHostel/"

## Technology

**1. Frontend**

- HTML, CSS, Javascript, Bootstrap, jQuery
- Font awesome
- JSP - JavaServer Pages
- JSTL - JSP Standard Tag Library
- axios - Promise based HTTP client for the browser and node.js
- ...

**2. Backend**

- Servlets - a Java programming language class that is used to extend the capabilities of servers that host applications accessed by means of a request-response programming model
- JDBC - Java Database Connectivity - a Java API to connect and execute the query with the database

**3. Database**

- Microsoft SQL Server - a relational model database server produced by Microsoft

**4. Other Technologies**

- Design pattern: MVC2

**5. Tool**

- IntelliJ
- Java JDK 8
- Apache Tomcat 8.5.29
- Visual Studio Code
- Microsoft SQL Server Management Studio 18

**6.Libraries**

- Lombok
- JSTL
- sqljdbc4
 
## Functional requirements

**1. Guest:**
- [x] View home page
- [x] Login by account
- [x] Register a hostel owner account
- [x] Register a renter account by invite code

**2. Hostel Owner**
- [x] View home page
- [x] Login by account
- [x] Logout
- [x] View account information
- [x] Update account information
- [x] List hostel
- [x] Add new hostel
- [x] Update hostel information
- [x] View list services (Hostel detail)
- [x] Add new service (Hostel detail)
- [x] Room detail
- [x] Add room
- [x] Generate room account
- [x] View Invite code
- [x] Update room information (room detail)
- [x] View room information
- [x] Update room consume (room detail)
- [x] View current consume (room detail)
- [x] View history update consume (room detail)
- [x] View room infrastructure (Room detail)
- [x] Add room infrastructure (Room detail)
- [x] Update infrastructure (Room detail)
- [x] Update contact (room detail)
- [x] View contract
- [x] Generate contract (in generate room account screen)
- [x] View detail invoice
- [x] View all invoice
- [x] Calculate money
- [x] Export invoice
- [x] View revenue statistic
- [x] View report statistic
- [x] View list roommates
- [x] Add roommate
- [x] Roommate information
- [x] Update roommate information
- [x] Send reports
- [x] List report
- [x] Process the report and change its state
- [x] View list notification
- [x] View detail notification
- [x] Add notification

**3. Hostel Owner**
- [x] View home page
- [x] Login by account
- [x] Logout
- [x] View account information
- [x] Update account information
- [x] Hostel detail
- [x] View list services (Hostel detail)
- [x] Room detail
- [x] View room information
- [x] View room infrastructure (Room detail)
- [x] View contract
- [x] View detail invoice
- [x] View all invoice
- [x] Export invoice
- [x] View list roommates
- [x] Add roommate
- [x] Roommate information
- [x] Update roommate information
- [x] Send reports
- [x] List report
- [x] View list notification

**4. Admin:**
- [x] View home page
- [x] Login by account
- [x] Logout
- [x] Managing account
- [x] View list account pending to approve

## Useful Resources

#| Name | Description
-| ---- | -----------
1| [Main Project Folder](https://github.com/HaiNam-FoodBoy/HappyHostel_SWP391_SUMMER2022) | -
2| [Database Script]() | -
2.1| [Database ERD Diagram](https://drive.google.com/file/d/1EWFwGAEFJI4Ijg2RoIbt_WtL_wtLur4R/view?usp=sharing) | -
2.2| [Database Physical Diagram]() | -
3| [UI Design](https://www.figma.com/file/2gRO4Afc88rHWHuuQlrR6g/Layout-Hostel?node-id=0%3A1) | -

## Contributors
- [Hoang Dang Khoa](https://github.com/khoahd7621) - SE150848 - **Front-end Developer | Back-end Developer | UI Designer**

- [Nguyen Tan Loc](https://github.com/ngntanloc) - SE150877 - **Back-end Developer | Database Designer**

- [Ho Hai Nam](https://github.com/HaiNam-FoodBoy) - SE150929 - **Back-end Developer | Database Designer**

- [Thai Thanh Phat](https://github.com/ttphats) - SE150968 - **Back-end Developer**

- [Tran Hoai Nam](https://github.com/namth1606) - SE150921 - **Front-end Developer | UI Designer**

## Learn More

## Reference

## License & Copyright

&copy; 2022 [HQT Team](https://github.com/HQT-Team) Licensed under the [GPL-3.0 LICENSE]().
