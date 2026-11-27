package vn.rikkei.cinemabox;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

/**
 * Tự kiểm tra môi trường: chạy được 2 test này nghĩa là JDK, Maven, H2 và API mẫu đều ổn.
 * Không sửa, không xoá file này. Test của bạn viết ở file khác.
 */
@SpringBootTest
@AutoConfigureMockMvc
class TuKiemTraTest {

    @Autowired
    private MockMvc mvc;

    @Test
    void apiMauTraVePhim() throws Exception {
        mvc.perform(get("/api/movies/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.title").value("Biệt Đội Sấm Sét"));
    }

    @Test
    void loiKhongTimThayDungDinhDangChung() throws Exception {
        mvc.perform(get("/api/movies/9999"))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.status").value(404))
                .andExpect(jsonPath("$.error").value("NOT_FOUND"))
                .andExpect(jsonPath("$.path").value("/api/movies/9999"));
    }
}
