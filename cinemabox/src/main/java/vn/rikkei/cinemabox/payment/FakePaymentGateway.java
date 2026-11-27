package vn.rikkei.cinemabox.payment;

import java.util.UUID;
import org.springframework.stereotype.Component;

/**
 * Cổng thanh toán giả lập. KHÔNG SỬA LỚP NÀY (bộ chấm dùng đúng hành vi dưới đây).
 * - Mỗi lần gọi mất khoảng 80 ms (giống gọi sang hệ thống bên ngoài).
 * - Số tiền lớn hơn 1.000.000 đồng: từ chối, ném PaymentFailedException.
 * - Ngược lại: thành công, trả mã giao dịch dạng PAY-xxxxxxxx.
 */
@Component
public class FakePaymentGateway implements PaymentGateway {

    public static final long HAN_MUC = 1_000_000L;

    @Override
    public String charge(Long customerId, long amount) {
        try {
            Thread.sleep(80);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        if (amount > HAN_MUC) {
            throw new PaymentFailedException("Giao dịch bị từ chối: số tiền " + amount + " vượt hạn mức " + HAN_MUC);
        }
        return "PAY-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
