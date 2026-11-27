package vn.rikkei.cinemabox.common;

/** Ném ra khi không tìm thấy bản ghi. GlobalExceptionHandler chuyển thành 404 NOT_FOUND. */
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String message) {
        super(message);
    }
}
