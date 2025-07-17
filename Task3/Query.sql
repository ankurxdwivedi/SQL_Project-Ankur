-- 1. Database Creation
CREATE DATABASE EventsManagement;
USE EventsManagement;

-- Table: Events
CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description TEXT
);

-- Table: Attendees
CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(50)
);

-- Table: Registrations
CREATE TABLE Registrations (
    Registration_Id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount DECIMAL(10,2),
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

-- 2. Data Creation

-- Insert sample data into Events
INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES
(1, 'Tech Conference', '2024-08-10', 'New York', 'Annual technology conference'),
(2, 'Music Fest', '2024-09-05', 'Los Angeles', 'Outdoor music festival'),
(3, 'Art Exhibition', '2024-10-15', 'Paris', 'Modern art showcase');

-- Insert sample data into Attendees
INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
(1, 'Alice Johnson', '1234567890', 'alice.j@example.com', 'New York'),
(2, 'Bob Smith', '2345678901', 'bob.s@example.com', 'Los Angeles'),
(3, 'Carol Lee', '3456789012', 'carol.l@example.com', 'Paris');

-- Insert sample data into Registrations
INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, 1, '2024-07-15', 100.00),
(2, 2, 2, '2024-08-20', 150.00),
(3, 3, 3, '2024-09-01', 120.00);

-- 3. Manage Event Details

-- a) Inserting a new event
INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES
(4, 'Startup Meetup', '2024-11-12', 'San Francisco', 'Networking event for startups');

-- b) Updating an event's information (updating location of event 1)
UPDATE Events
SET Event_Location = 'Boston'
WHERE Event_Id = 1;

-- c) Deleting an event (delete event with Event_Id = 3)
DELETE FROM Registrations
WHERE Event_Id = 3;

DELETE FROM Events
WHERE Event_Id = 3;

-- 4. Manage Track Attendees & Handle Events

-- a) Inserting a new attendee
INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
(4, 'David Brown', '4567890123', 'david.b@example.com', 'San Francisco');

-- b) Registering an attendee for an event
INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(4, 4, 4, '2024-10-10', 80.00);

-- 5. Queries to Retrieve Information and Statistics

-- a) Retrieve all event information
SELECT * FROM Events;

-- b) Generate attendee list for a specific event (example: Event_Id = 1)
SELECT 
    e.Event_Name,
    a.Attendee_Name,
    a.Attendee_Email,
    a.Attendee_City
FROM 
    Attendees a
JOIN 
    Registrations r ON a.Attendee_Id = r.Attendee_Id
JOIN 
    Events e ON r.Event_Id = e.Event_Id
WHERE 
    r.Event_Id = 1;

-- c) Calculate event attendance statistics (number of attendees per event)
SELECT 
    e.Event_Name,
    COUNT(r.Attendee_Id) AS Number_of_Attendees,
    COALESCE(SUM(r.Registration_Amount), 0) AS Total_Sales
FROM 
    Events e
LEFT JOIN 
    Registrations r ON e.Event_Id = r.Event_Id
GROUP BY 
    e.Event_Name;