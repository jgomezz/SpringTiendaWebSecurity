package pe.edu.tecsup.tienda.tools;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
public class BCryptPasswordEncoderTest {


	@Test
    void testCreateBCryptPassword() {
		
        // Create an instance of BCryptPasswordEncoder
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // Encode a password
        String rawPassword = "lima"; // Here
        String encodedPassword = passwordEncoder.encode(rawPassword);

        System.out.println("Raw Password: " + rawPassword);
        System.out.println("Encoded Password: " + encodedPassword);

        // Check if a provided password matches the encoded password
        String providedPassword = "lima"; // Here
        boolean passwordMatches = passwordEncoder.matches(providedPassword, encodedPassword);

        System.out.println("Password Matches: " + passwordMatches);
    }
}
