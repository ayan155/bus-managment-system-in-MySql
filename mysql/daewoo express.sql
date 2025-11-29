CREATE DATABASE daewoo_express;

USE daewoo_express;

CREATE TABLE stop (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  location VARCHAR(50),
  sequence INT
);

INSERT INTO stop (id, name, location, sequence)
VALUES
  (1, 'Karachi', 'Karachi', 0),
  (2, 'Hyderabad', 'Hyderabad', 1),
  (3, 'Sukkur', 'Sukkur', 2),
  (4, 'Rohri', 'Rohri', 3),
  (5, 'Multan', 'Multan', 4),
  (6, 'Lahore', 'Lahore', 5),
  (7, 'chechwatni', 'chechawatni', 6),
  (8, 'Rawalpindi', 'Rawalpindi', 7);

CREATE TABLE route (
  id INT PRIMARY KEY,
  start_stop_id INT,
end_stop_id INT,
  distance INT,
  FOREIGN KEY (start_stop_id) REFERENCES stop(id),
  FOREIGN KEY (end_stop_id) REFERENCES stop(id)
);

INSERT INTO route (id, start_stop_id, end_stop_id, distance)
VALUES
  (1, 1, 8, 1240),
  (2, 2, 8, 1150),
  (3, 3, 8, 950),
  (4, 4, 8, 790),
  (5, 5, 8, 570);

CREATE TABLE schedule (
  id INT PRIMARY KEY,
  route_id INT,
  departure_time TIME,
  arrival_time TIME,
  FOREIGN KEY (route_id) REFERENCES route(id)
);

INSERT INTO schedule (id, route_id, departure_time, arrival_time)
VALUES
  (1, 1, '06:05:00', '18:45:00'),
  (2, 2, '07:35:00', '17:55:00'),
  (3, 3, '08:40:00', '16:56:00'),
  (4, 4, '09:20:00', '17:00:00'),
  (5, 5, '10:10:00', '14:20:00');

CREATE TABLE bus (
  id INT PRIMARY KEY,
  model VARCHAR(50),
  year INT,
  license_plate VARCHAR(50),
  current_location VARCHAR(50)
);

INSERT INTO bus (id, model, year, license_plate, current_location)
VALUES
  (1, 'Daewoo Express', 2018, 'KHI-123', 'Karachi'),
  (2, 'Daewoo Express', 2019, 'KHI-456', 'Karachi'),
  (3, 'Daewoo Express', 2020, 'KHI-789', 'Karachi'),
  (4, 'Daewoo Express', 2021, 'KHI-012', 'Karachi'),
  (5, 'Daewoo Express', 2018, 'ISB-345', 'Rawalpindi'),
  (6, 'Daewoo Express', 2019, 'ISB-678', 'Rawalpindi'),
  (7, 'Daewoo Express', 2020, 'ISB-901', 'Rawalpindi'),
  (8, 'Daewoo Express', 2021, 'ISB-234', 'Rawalpindi'),
  (9, 'Daewoo Express', 2018, 'LHR-567', 'Lahore'),
  (10, 'Daewoo Express', 2019, 'LHR-890', 'Lahore'),
  (11, 'Daewoo Express', 2020, 'LHR-123', 'Lahore'),
  (12, 'Daewoo Express', 2021, 'LHR-456', 'Lahore'),
  (13, 'Daewoo Express', 2018, 'MUX-789', 'Multan'),
  (14, 'Daewoo Express', 2019, 'MUX-012', 'Multan'),
  (15, 'Daewoo Express', 2020, 'MUX-345', 'Multan');

CREATE TABLE bus_schedule (
  id INT PRIMARY KEY,
  bus_id INT,
  schedule_id INT,
  assigned_driver VARCHAR(50),
  status ENUM('available', 'maintenance'),
  FOREIGN KEY (bus_id) REFERENCES bus(id),
  FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

INSERT INTO bus_schedule (id, bus_id, schedule_id, assigned_driver, status)
VALUES
  (1, 1, 1, 'kaloo ustad', 'available'),
  (2, 2, 1, 'chacha 786', 'maintenance'),
  (3, 3, 2, 'mudasir baig', 'available'),
  (4, 4, 2, 'asim muneer', 'available'),
  (5, 5, 3, 'Faizan qureshi', 'available'),
  (6, 6, 3, 'Ahmed iqbal', 'available'),
  (7, 7, 4, 'Ali baig', 'available'),
  (8, 8, 4, 'shahbaz sharif', 'maintenance'),
  (9, 9, 5, 'nawaz shareef', 'available'),
  (10, 10, 5, 'Hamza shabaz shareef', 'available'),
  (11, 11, 1, 'qamar javed bajwa', 'available'),
  (12, 12, 1, 'cristiano ronaldo', 'available'),
  (13, 13, 2, 'george bush', 'maintenance'),
  (14, 14, 2, 'imran khan', 'available'),
  (15, 15, 3, 'babar azam', 'available');

CREATE TABLE ticket (
  id INT PRIMARY KEY,
  passenger_name VARCHAR(50),
  passenger_contact VARCHAR(20),
  bus_schedule_id INT,
  seat_number VARCHAR(10),
  price DECIMAL(10,2)
);

INSERT INTO ticket (id, passenger_name, passenger_contact, bus_schedule_id, seat_number, price)
VALUES
  (1, 'Masood', '03001234567', 1, '1A', 2000),
  (2, 'Zainab', '03332345678', 1, '1B', 2000),
  (3, 'Ali', '03123456789', 2, '2A', 2000),
  (4, 'Zain', '03456789012', 2, '2B', 2000),
  (5, 'kainat', '03789012345', 3, '3A', 2000),
  (6, 'Fatima', '03012345678', 3, '3B', 2000),
  (7, 'Faizan', '03345678901', 4, '4A', 2000),
  (8, 'Faqia', '03678901234', 4, '4B', 2000),
  (9, 'umer', '03901234567', 5, '5A', 2000),
  (10, 'Zain', '03234567890', 5, '5B', 2000),
  (11, 'Asadullah', '03567890123', 6, '6A', 2000),
  (12, 'sadia', '03890123456', 6, '6B', 2000),
  (13, 'yumna', '03123456789', 7, '7A', 2000),
  (14, 'Zain', '03456789012', 7, '7B', 2000),
  (15, 'Asad', '03789012345', 8, '8A', 2000),
  (16, 'Hamza', '03012345678', 8, '8B', 2000),
  (17, 'zubda', '03345678901',9, '9A', 2000),
  (18, 'uroob', '03678901234', 9, '9B', 2000),
  (19, 'zoya', '03901234567', 10, '10A', 2000),
  (20, 'Zain', '03234567890', 10, '10B', 2000);

CREATE TABLE maintenance (
  id INT PRIMARY KEY,
  bus_id INT,
  description VARCHAR(50),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (bus_id) REFERENCES bus(id)
);

INSERT INTO maintenance (id, bus_id, description, start_date, end_date)
VALUES
  (1, 2, 'cluch plate khatam hai', '2023-03-01', '2023-03-02'),
  (2, 6, 'engine blast', '2023-03-05', '2023-03-06'),
  (3, 11, 'Brake fail', '2023-03-08', '2023-03-09'),
  (4, 15, 'suspension shart hai', '2023-03-12', '2023-03-13');
  
  
  SELECT * FROM bus WHERE current_location = 'Karachi';
  
  select * from stop;
  
DELIMITER //
CREATE PROCEDURE GetAvailableBuses()
BEGIN
  SELECT COUNT(*) FROM bus_schedule WHERE status = 'available';
END//
DELIMITER ;

CALL GetAvailableBuses();

DELIMITER //
CREATE PROCEDURE AssignDriverToBusSchedule(IN p_driver_name VARCHAR(50), IN p_bus_schedule_id INT)
BEGIN
  UPDATE bus_schedule SET assigned_driver = p_driver_name WHERE id = p_bus_schedule_id;
END;//
DELIMITER ;

CALL AssignDriverToBusSchedule('chacha 786', 2);

