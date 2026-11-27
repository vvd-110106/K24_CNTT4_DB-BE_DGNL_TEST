package vn.rikkei.cinemabox.movie;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/** API mẫu. Làm các endpoint khác theo đúng cách tổ chức này: controller -> service -> repository, trả DTO. */
@RestController
@RequestMapping("/api/movies")
public class MovieController {

    private final MovieService movieService;

    public MovieController(MovieService movieService) {
        this.movieService = movieService;
    }

    /** GET /api/movies/1 */
    @GetMapping("/{id}")
    public MovieResponse getById(@PathVariable Long id) {
        return movieService.getById(id);
    }

    /** GET /api/movies  hoặc  GET /api/movies?genre=ACTION */
    @GetMapping
    public List<MovieResponse> list(@RequestParam(required = false) String genre) {
        return movieService.list(genre);
    }
}
