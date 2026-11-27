package vn.rikkei.cinemabox.payment;

/** Cổng thanh toán từ chối giao dịch. */
public class PaymentFailedException extends RuntimeException {

    public PaymentFailedException(String message) {
        super(message);
    }
}
