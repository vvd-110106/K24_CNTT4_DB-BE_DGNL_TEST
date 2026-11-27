-- F1. Lệnh CREATE TABLE reviews (xem đề). Chỉ tạo bảng reviews, không sửa bảng có sẵn.
CREATE TABLE reviews (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT    NOT NULL,
    movie_id    BIGINT    NOT NULL,
    rating      INT       NOT NULL,
    content     VARCHAR(500),
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_customer       FOREIGN KEY (customer_id) REFERENCES customers (id),
    CONSTRAINT fk_reviews_movie          FOREIGN KEY (movie_id)    REFERENCES movies (id),
    CONSTRAINT chk_reviews_rating        CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT uq_reviews_customer_movie UNIQUE (customer_id, movie_id)
);