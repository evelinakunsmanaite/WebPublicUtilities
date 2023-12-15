package TestUser;

import com.model.User;
import static junit.framework.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

/**
 *
 * @author Administrator
 */
public class UserTest {

    @Test
    public void testCreateUserWithId() {
        int id = 1;
        User user = new User(id);

        assertEquals(id, user.getId());
        assertNull(user.getEmail());
        assertNull(user.getPassword());
        assertNull(user.getFirstName());
        assertNull(user.getLastName());
        assertNull(user.getStatus());
    }

    @Test
    public void testCreateUserWithEmailPasswordAndStatus() {
        String email = "test@example.com";
        String password = "password";
        String firstName = "test";
        String lastName = "test";
        String status = "user";

        User user = new User(email, password, firstName, lastName, status);

        assertEquals(0, user.getId());
        assertEquals(email, user.getEmail());
        assertEquals(password, user.getPassword());
        assertEquals(firstName, user.getFirstName());
        assertEquals(lastName, user.getLastName());
        assertEquals(status, user.getStatus());
    }

    @Test
    public void testGetters() {
        User user = new User(1, "test@example.com", "password", "test", "test", "user");

        assertEquals(1, user.getId());
        assertEquals("test@example.com", user.getEmail());
        assertEquals("password", user.getPassword());
        assertEquals("test", user.getFirstName());
        assertEquals("test", user.getLastName());
        assertEquals("user", user.getStatus());
    }

    @Test
    public void testCompareTo() {
        User user1 = new User(1, "test1@example.com", "password", "test1", "test1", "user");
        User user2 = new User(2, "test2@example.com", "password", "test2", "test2", "admin");

        assertTrue(user1.compareTo(user2) < 0);
        assertTrue(user2.compareTo(user1) > 0);
        assertEquals(0, user1.compareTo(user1));
    }
}
