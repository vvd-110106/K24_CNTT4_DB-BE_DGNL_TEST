-- I1. Phim thể loại ACTION (xem đề). Viết MỘT câu SELECT bên dưới, kết thúc bằng dấu ;

SELECT title,release_date FROM movies
WHERE genre = 'ACTION'
ORDER BY release_date DESC, title ASC;