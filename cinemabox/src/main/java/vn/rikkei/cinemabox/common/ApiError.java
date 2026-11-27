package vn.rikkei.cinemabox.common;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Định dạng lỗi chung của toàn bộ API. Mọi lỗi (4xx, 5xx) đều trả về đúng cấu trúc này.
 *
 * <pre>
 * {
 *   "status": 404,
 *   "error": "NOT_FOUND",
 *   "message": "Không tìm thấy phim id=99",
 *   "path": "/api/movies/99",
 *   "timestamp": "2026-12-01T07:15:00",
 *   "details": []
 * }
 * </pre>
 *
 * details chỉ có phần tử khi lỗi kiểm tra dữ liệu (mỗi phần tử: field + message).
 */
public record ApiError(
        int status,
        String error,
        String message,
        String path,
        LocalDateTime timestamp,
        List<FieldViolation> details) {

    public record FieldViolation(String field, String message) {
    }

    public static ApiError of(int status, String error, String message, String path, List<FieldViolation> details) {
        return new ApiError(status, error, message, path, LocalDateTime.now(), details == null ? List.of() : details);
    }
}
