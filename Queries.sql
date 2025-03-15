-- Selecting the `hotel_reservation` database to ensure all subsequent queries are executed within the correct database context.
USE hotel_reservation;

-- Selecting all records from the `hotel` table to view booking details
SELECT * FROM hotel;


--Q1.  What is the total number of reservations in the dataset?
SELECT 
    COUNT(Booking_ID) AS total_reservations
FROM hotel; 
-- Insight: there are 700 reservations in the dataset


--Q2.  Which meal plan is the most popular among guests? 
SELECT 
    type_of_meal_plan, COUNT(type_of_meal_plan) AS total_count
FROM hotel
GROUP BY
    type_of_meal_plan
ORDER BY
    total_count DESC;
/* insight: Meal plan 1 is the most popular meal among the guest 
 with the total count of 527 */



--Q3.  What is the average price per room for reservations involving children? 
SELECT 
    ROUND(AVG(avg_price_per_room),2) AS average_price_per_room
FROM hotel
WHERE 
    no_of_children > 0;
-- Insight: average price per room for reservations involving children is ₹144.57



--Q4.  How many reservations were made for the year 20XX (replace XX with the desired year)?  
SELECT 
    YEAR(arrival_date) AS reservation_year, COUNT(*) AS count_of_reservation
FROM 
    hotel
WHERE YEAR(arrival_date) = 2017
GROUP BY
     YEAR(arrival_date);
-- Insight:123 reservations were made for the year 2017



--Q5.  What is the most commonly booked room type?  
SELECT 
    room_type_reserved,COUNT(*) AS total_booking
FROM hotel
GROUP BY 
    room_type_reserved
ORDER BY 
    total_booking DESC;
-- Insight: Room_type_1 is the most commonly booked room type with total_booking of 534



--Q6.  How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT 
    COUNT(no_of_weekend_nights) AS weekend_reservation
FROM hotel
WHERE 
    no_of_weekend_nights >0;
-- Insight: There are 383 weekend reservations



--Q7.  What is the highest and lowest lead time for reservations?
SELECT 
    MAX(lead_time) AS highest_lead_time, 
        MIN(lead_time) AS lowest_lead_time
FROM hotel;
/* Insights:The range of lead times, from 0 to 443 days, 
suggests diverse booking behaviors among guests. 
Some prefer last-minute reservations, while others plan well in advance.*/




--Q8.  What is the most common market segment type for reservations? 
SELECT  
    market_segment_type, 
        COUNT(*) AS total_counts
FROM hotel
GROUP BY 
    market_segment_type
ORDER BY 
    total_counts DESC;
-- Insight:  Online is the most common market segment type for reservations



--Q9.   How many reservations have a booking status of "Confirmed"?
SELECT COUNT(booking_status) AS Confirmed_booking
FROM hotel
WHERE booking_status  = 'Not_Canceled';
-- Insight: 493 reservations have a booking status of "Confirmed"




--Q10.  What is the total number of adults and children across all reservations?
SELECT 
    SUM(no_of_adults) AS total_adults, 
        SUM(no_of_children) AS total_children
FROM 
    hotel;
/* Insight: The majority of reservations, totaling 1,316, 
involve adult guests, while a smaller number, 69, include children. */



--Q11.  What is the average number of weekend nights for reservations involving children? 
SELECT 
    AVG(no_of_weekend_nights) AS Avg_weekend_night_with_children
FROM 
    hotel
WHERE 
    no_of_children > 0;
-- Insight: On average, reservations with children involve a one-night stay on weekends.




--Q12.  How many reservations were made in each month of the year?
SELECT 
    MONTH(arrival_date) AS arrival_months, 
    DATENAME(MONTH, arrival_date) AS Month_name,  
    COUNT(Booking_ID) AS total_reservation
FROM 
    hotel
GROUP BY 
    MONTH(arrival_date), 
        DATENAME(MONTH, arrival_date)
ORDER BY 
    total_reservation DESC; 
/* Insight:October stands out as the peak reservation month (103 total_reservations)
followed by June and September . In contrast, 
January records the lowest number of reservations (11 total_reservations), 
indicating a quieter period. */


--13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 
SELECT 
    room_type_reserved, 
    AVG(no_of_week_nights + no_of_weekend_nights) AS avg_nights_spent
FROM hotel
GROUP BY 
    room_type_reserved
ORDER BY 
    avg_nights_spent DESC;
/* Insight:Guests staying in Room Type 2 tend to spend the most nights on average (3), while 
those in Room Type 1 have the lowest average stay duration (2).*/




-- 14.  For reservations involving children, what is the most common room type, and what is the average 
-- price for that room type? 
SELECT TOP 1
    room_type_reserved, 
    COUNT(*) AS total_reservations,ROUND(AVG(avg_price_per_room),2) AS average_per  
FROM 
    hotel
WHERE 
    no_of_children > 0
GROUP BY 
    room_type_reserved
ORDER BY 
    total_reservations DESC;
/* Insight:For reservations involving children, Room Type 1 is the preferred choice, with an average 
room price of 123.12. */



--Q15.  Find the market segment type that generates the highest average price per room
SELECT TOP 1
    market_segment_type, 
        ROUND(AVG(avg_price_per_room),2) AS average_prices
FROM 
    hotel
GROUP BY 
    market_segment_type
ORDER BY 
    average_prices DESC;
-- insight: Online bookings generate the highest average room price, reaching 112.46

















