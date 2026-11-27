package vn.rikkei.cinemabox.customer;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vn.rikkei.cinemabox.common.ConflictException;
import vn.rikkei.cinemabox.common.ResourceNotFoundException;

@Service
@Transactional(readOnly = true)
public class CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Transactional
    public CustomerResponse create(CreateCustomerRequest request) {
        String normalizedEmail = request.email().trim();
        if (customerRepository.existsByEmailIgnoreCase(normalizedEmail)) {
            throw new ConflictException("Email đã tồn tại: " + normalizedEmail);
        }

        Customer customer = new Customer();
        customer.setFullName(request.fullName().trim());
        customer.setEmail(normalizedEmail);
        customer.setPhone(request.phone());
        customer.setMemberLevel(request.memberLevel() == null ? "STANDARD" : request.memberLevel());

        Customer saved = customerRepository.save(customer);
        return CustomerResponse.from(saved);
    }

    public CustomerResponse getById(Long id) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Không tìm thấy khách hàng id=" + id));
        return CustomerResponse.from(customer);
    }
}
