package test.auth; // Ensure this matches your folder structure

import auth.Register; // Import the class you are testing
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class RegisterTest {

    @Test
    public void testSuccessfulRegistration() {
        // 1. Setup: Create an instance of the actual Register Servlet
        Register reg = new Register();

        // 2. Act: Call the method directly with test data
        // Use new data each time to avoid database "Duplicate Entry" errors
        boolean result = reg.registerUser("jiya", "jiya1234@gmail.com", "15", "jiya15");

        // 3. Assert: Verify the result is true
        assertTrue(result, "Database insertion should return true for valid data.");
    }
}