package vn.rikkei.cinemabox.payment;

/** Cổng thanh toán. Không sửa interface này. */
public interface PaymentGateway {

    /**
     * Trừ tiền của khách.
     *
     * @return mã giao dịch (paymentRef) khi thành công
     * @throws PaymentFailedException khi giao dịch bị từ chối
     */
    String charge(Long customerId, long amount);
}
