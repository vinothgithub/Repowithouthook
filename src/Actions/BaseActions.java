package Actions;

import org.openqa.selenium.WebDriver;

import PageObjects.HomePage;

public class BaseActions {
	public WebDriver navigateToAppleHomePage(WebDriver driver,StringBuffer sb,Object data){
		try{
			driver.navigate().to(HomePage.getAppleURL());
		}catch(Exception e){
			sb.append(e.getMessage());
		}
		return driver;
	}
	public WebDriver navigateToMagentoHomePage(WebDriver driver,StringBuffer sb,Object data){
		try{
			driver.navigate().to(HomePage.getMagentoURL());
		}catch(Exception e){
			sb.append(e.getMessage());
		}
		return driver;
	}
}
