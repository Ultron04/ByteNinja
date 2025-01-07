import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;

import com.user.model.User;

class userTEST {

	
	User user = new User("APrem@gmail.com","A123","ANAND PREM");
	@Test
	void getUsername_test() { 
		String expectedName = "ANAND PREM"; 
		String actualName = user.getName(); 
		assertEquals(expectedName, actualName);
	}
	@Test
	void getPassword_test() { 
		String expectedPassword = "A123"; 
		String actualPassword = user.getPassword(); 
		assertEquals(expectedPassword, actualPassword);
	}

}
