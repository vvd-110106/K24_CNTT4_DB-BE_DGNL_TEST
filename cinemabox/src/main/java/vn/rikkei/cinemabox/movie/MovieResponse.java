package vn.rikkei.cinemabox.movie;

import java.time.LocalDate;

/** DTO trả ra ngoài. Không trả entity trực tiếp từ controller. */
public record MovieResponse(
        Long id,
        String title,
        String genre,
        Integer durationMin,
        String ageRating,
        LocalDate releaseDate) {

    public static MovieResponse from(Movie m) {
        return new MovieResponse(m.getId(), m.getTitle(), m.getGenre(), m.getDurationMin(),
                m.getAgeRating(), m.getReleaseDate());
    }
}
