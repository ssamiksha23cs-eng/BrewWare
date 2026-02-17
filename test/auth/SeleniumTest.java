package test.auth;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SeleniumTest {
    public static void main(String[] args) {
        // 1. Point to your chromedriver.exe
        System.setProperty("webdriver.chrome.driver", "C:\\selenium1\\chromedriver.exe");

        // 2. Open the Chrome Browser
        WebDriver driver = new ChromeDriver();

        try {
            // 3. Navigate to your registration page
            driver.get("http://localhost:9090/BrewWare/register.jsp");

            // 4. Find the text boxes by their 'name' attribute from your HTML
            driver.findElement(By.name("username")).sendKeys("SeleniumUser");
            driver.findElement(By.name("email")).sendKeys("selenium@test.com");
            driver.findElement(By.name("age")).sendKeys("28");
            driver.findElement(By.name("password")).sendKeys("secure123");

            // 5. Click the "Register Now" button
            driver.findElement(By.className("login-btn")).click();

            // 6. Wait for the alert and check the result
            System.out.println("Registration test complete!");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // driver.quit(); // Closes the browser
        }
    }
}