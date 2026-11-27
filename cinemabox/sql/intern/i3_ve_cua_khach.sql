-- I3. Vé đã xác nhận của khách an.nguyen@example.com (xem đề). Viết MỘT câu SELECT bên dưới, kết thúc bằng dấu ;
SELECT b.id AS booking_id, m.title, s.start_time, b.quantity, b.total_amount
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN showtimes s ON b.showtime_id = s.id
JOIN movies m ON s.movie_id = m.id
WHERE c.email = 'an.nguyen@example.com'
  AND b.status = 'CONFIRMED'
ORDER BY s.start_time ASC;