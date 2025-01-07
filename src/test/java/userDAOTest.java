import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.user.dao.userDAO;
import com.user.model.User;

class userDAOTest {
	userDAO dao = new userDAO();
	@Test
	void Selectallusertest() {
		List<User> user = dao.selectAllUsers();
		assertTrue(user.size()>0);
	}
	
	@Test
	void CheckUser_Test() {
		boolean status = dao.checkUser("Aprem@gamil.com");
		assertFalse(status);
	}
	
	@Test
	void validateUser_test() {
		boolean status = dao.validateUser("Aprem@gmail.com", "A123");
		assertTrue(status);
	}
}
