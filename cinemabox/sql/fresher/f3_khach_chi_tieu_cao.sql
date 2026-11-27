-- F3. Khách chi tiêu cao (xem đề). Viết MỘT câu SELECT bên dưới, kết thúc bằng dấu ;
SELECT c.full_name,
       c.email,
       COUNT(b.id)         AS so_lan_dat,
       SUM(b.total_amount) AS tong_chi_tieu
FROM customers c
JOIN bookings b ON b.customer_id = c.id
WHERE b.status = 'CONFIRMED'
GROUP BY c.id, c.full_name, c.email
HAVING SUM(b.total_amount) >= 500000
ORDER BY tong_chi_tieu DESC, c.email ASC;