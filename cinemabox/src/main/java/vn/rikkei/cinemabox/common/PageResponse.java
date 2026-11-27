package vn.rikkei.cinemabox.common;

import java.util.List;
import org.springframework.data.domain.Page;

/** Khung trả về cho danh sách có phân trang. */
public record PageResponse<T>(
        List<T> content,
        int page,
        int size,
        long totalElements,
        int totalPages) {

    public static <T> PageResponse<T> from(Page<T> p) {
        return new PageResponse<>(p.getContent(), p.getNumber(), p.getSize(), p.getTotalElements(), p.getTotalPages());
    }
}
