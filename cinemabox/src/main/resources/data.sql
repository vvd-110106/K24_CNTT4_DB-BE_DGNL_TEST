-- Dữ liệu mẫu CinemaBox. Khi chấm, bộ chấm dùng bộ dữ liệu khác cùng cấu trúc.
-- id tự tăng theo thứ tự chèn, bắt đầu từ 1.

INSERT INTO movies (title, genre, duration_min, age_rating, release_date) VALUES
  ('Biệt Đội Sấm Sét', 'ACTION', 125, 'T13', '2026-11-14'),
  ('Hành Tinh Cát Đỏ', 'ACTION', 140, 'T16', '2026-10-03'),
  ('Nụ Cười Mùa Thu', 'DRAMA', 105, 'T13', '2026-09-20'),
  ('Ngôi Nhà Trong Sương', 'HORROR', 98, 'T18', '2026-11-28'),
  ('Chú Mèo Phi Hành Gia', 'ANIMATION', 92, 'P', '2026-11-07'),
  ('Ba Chàng Ngốc Ở Đà Lạt', 'COMEDY', 110, 'T13', '2026-10-17'),
  ('Mật Mã Biển Đông', 'ACTION', 132, 'T16', '2026-08-22'),
  ('Lời Hứa Năm Ấy', 'DRAMA', 115, 'T13', '2026-12-04'),
  ('Vũ Điệu Rồng Con', 'ANIMATION', 88, 'P', '2026-12-11'),
  ('Cuộc Đua Cuối Cùng', 'ACTION', 118, 'T13', '2026-12-01');

INSERT INTO rooms (name, total_seats) VALUES
  ('Phòng 1', 120),
  ('Phòng 2', 90),
  ('Phòng 3', 60),
  ('Phòng IMAX', 150);

INSERT INTO showtimes (movie_id, room_id, start_time, price, available_seats) VALUES
  (1, 4, '2026-12-04 19:00:00', 120000, 35),
  (2, 1, '2026-12-04 20:30:00', 100000, 60),
  (3, 3, '2026-12-05 09:30:00', 75000, 42),
  (1, 4, '2026-12-05 14:00:00', 120000, 48),
  (5, 2, '2026-12-05 14:00:00', 75000, 55),
  (10, 1, '2026-12-05 19:30:00', 110000, 20),
  (4, 3, '2026-12-05 21:45:00', 90000, 8),
  (8, 2, '2026-12-06 00:15:00', 85000, 70),
  (6, 1, '2026-12-06 10:00:00', 80000, 100),
  (7, 2, '2026-12-04 17:00:00', 95000, 0),
  (2, 4, '2026-12-05 20:00:00', 130000, 25),
  (6, 3, '2026-12-05 00:00:00', 60000, 30),
  (8, 1, '2026-12-05 16:30:00', 85000, 19);

INSERT INTO customers (full_name, email, phone, member_level, created_at) VALUES
  ('Nguyễn Văn An', 'an.nguyen@example.com', '0901234567', 'GOLD', '2026-06-01 09:00:00'),
  ('Trần Thị Bình', 'binh.tran@example.com', '0912345678', 'STANDARD', '2026-06-15 10:30:00'),
  ('Lê Hoàng Cường', 'cuong.le@example.com', '0923456789', 'GOLD', '2026-07-02 08:15:00'),
  ('Phạm Thu Dung', 'dung.pham@example.com', NULL, 'STANDARD', '2026-07-20 14:00:00'),
  ('Hoàng Minh Đức', 'duc.hoang@example.com', '0934567890', 'STANDARD', '2026-08-05 16:45:00'),
  ('Vũ Ngọc Hà', 'ha.vu@example.com', '0945678901', 'GOLD', '2026-08-30 11:20:00'),
  ('Đặng Quốc Huy', 'huy.dang@example.com', '0956789012', 'STANDARD', '2026-09-12 19:05:00'),
  ('Bùi Thanh Lan', 'lan.bui@example.com', '0967890123', 'STANDARD', '2026-10-01 07:50:00');

INSERT INTO bookings (customer_id, showtime_id, quantity, total_amount, status, payment_ref, created_at) VALUES
  (1, 1, 2, 216000, 'CONFIRMED', 'PAY-SEED-1', '2026-11-20 10:00:00'),
  (1, 3, 1, 67500, 'CONFIRMED', 'PAY-SEED-2', '2026-11-21 11:00:00'),
  (1, 2, 2, 180000, 'CANCELLED', NULL, '2026-11-21 12:00:00'),
  (2, 1, 4, 480000, 'CONFIRMED', 'PAY-SEED-4', '2026-11-22 09:30:00'),
  (2, 5, 2, 150000, 'CONFIRMED', 'PAY-SEED-5', '2026-11-22 10:15:00'),
  (3, 4, 3, 324000, 'CONFIRMED', 'PAY-SEED-6', '2026-11-23 08:00:00'),
  (3, 11, 2, 234000, 'CONFIRMED', 'PAY-SEED-7', '2026-11-23 08:30:00'),
  (4, 9, 1, 80000, 'CANCELLED', NULL, '2026-11-24 13:00:00'),
  (5, 6, 5, 550000, 'CONFIRMED', 'PAY-SEED-9', '2026-11-24 15:00:00'),
  (5, 10, 1, 95000, 'CONFIRMED', 'PAY-SEED-10', '2026-11-25 16:00:00'),
  (6, 2, 6, 540000, 'CONFIRMED', 'PAY-SEED-11', '2026-11-25 17:30:00'),
  (7, 3, 2, 150000, 'CONFIRMED', 'PAY-SEED-12', '2026-11-26 18:00:00'),
  (1, 12, 1, 54000, 'CONFIRMED', 'PAY-SEED-13', '2026-11-26 19:00:00'),
  (8, 7, 2, 180000, 'CONFIRMED', 'PAY-SEED-14', '2026-11-27 20:00:00'),
  (2, 8, 2, 170000, 'CONFIRMED', 'PAY-SEED-15', '2026-11-27 21:00:00');
