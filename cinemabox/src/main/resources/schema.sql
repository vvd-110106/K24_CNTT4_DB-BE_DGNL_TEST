-- Lược đồ CSDL CinemaBox (H2 chế độ MySQL). Chạy lại mỗi lần ứng dụng khởi động.
-- Tầng Junior được thêm ràng buộc hoặc cột có giá trị mặc định; không đổi tên, không xoá bảng và cột có sẵn.
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS showtimes CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS movies CASCADE;

CREATE TABLE movies (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(150) NOT NULL,
    genre        VARCHAR(20)  NOT NULL,
    duration_min INT          NOT NULL,
    age_rating   VARCHAR(5)   NOT NULL,
    release_date DATE         NOT NULL
);

CREATE TABLE rooms (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL UNIQUE,
    total_seats INT         NOT NULL
);

CREATE TABLE showtimes (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    movie_id        BIGINT    NOT NULL,
    room_id         BIGINT    NOT NULL,
    start_time      TIMESTAMP NOT NULL,
    price           BIGINT    NOT NULL,
    available_seats INT       NOT NULL,
    CONSTRAINT fk_showtimes_movie FOREIGN KEY (movie_id) REFERENCES movies (id),
    CONSTRAINT fk_showtimes_room  FOREIGN KEY (room_id)  REFERENCES rooms (id)
);

CREATE TABLE customers (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    email        VARCHAR(150) NOT NULL UNIQUE,
    phone        VARCHAR(15),
    member_level VARCHAR(10)  NOT NULL DEFAULT 'STANDARD',
    created_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bookings (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id  BIGINT      NOT NULL,
    showtime_id  BIGINT      NOT NULL,
    quantity     INT         NOT NULL,
    total_amount BIGINT      NOT NULL,
    status       VARCHAR(10) NOT NULL,
    payment_ref  VARCHAR(50),
    created_at   TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_bookings_customer FOREIGN KEY (customer_id) REFERENCES customers (id),
    CONSTRAINT fk_bookings_showtime FOREIGN KEY (showtime_id) REFERENCES showtimes (id)
);
