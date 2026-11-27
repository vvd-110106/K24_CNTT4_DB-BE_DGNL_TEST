package vn.rikkei.cinemabox.movie;

import java.util.List;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.rikkei.cinemabox.common.ResourceNotFoundException;

/**
 * Mẫu tầng service: đọc dữ liệu trong transaction và chuyển sang DTO ngay tại đây
 * (open-in-view=false nên quan hệ LAZY chỉ đọc được bên trong transaction).
 */
@Service
@Transactional(readOnly = true)
public class MovieService {

    private final MovieRepository movieRepository;

    public MovieService(MovieRepository movieRepository) {
        this.movieRepository = movieRepository;
    }

    public MovieResponse getById(Long id) {
        Movie movie = movieRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Không tìm thấy phim id=" + id));
        return MovieResponse.from(movie);
    }

    public List<MovieResponse> list(String genre) {
        List<Movie> movies = (genre == null || genre.isBlank())
                ? movieRepository.findAll(Sort.by("title").ascending())
                : movieRepository.findByGenreOrderByTitleAsc(genre.trim().toUpperCase());
        return movies.stream().map(MovieResponse::from).toList();
    }
}
