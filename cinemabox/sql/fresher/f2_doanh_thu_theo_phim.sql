-- F2. Doanh thu theo phim (xem đề). Viết MỘT câu SELECT bên dưới, kết thúc bằng dấu ;
SELECT m.title,
       COALESCE(SUM(b.quantity), 0)     AS so_ve,
       COALESCE(SUM(b.total_amount), 0) AS doanh_thu
FROM movies m
LEFT JOIN showtimes s ON s.movie_id = m.id
LEFT JOIN bookings b  ON b.showtime_id = s.id AND b.status = 'CONFIRMED'
GROUP BY m.id, m.title
ORDER BY doanh_thu DESC, m.title ASC;