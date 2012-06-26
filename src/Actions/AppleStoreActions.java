package Actions;

import org.openqa.selenium.WebDriver;

import PageObjects.Product_Apple_IPad;
import PageObjects.Product_Apple_IPhone4s;

public class AppleStoreActions {
	public WebDriver loadHomePage(WebDriver driver,StringBuffer sb,Object data){
		{
			BaseActions ba = new BaseActions();
			driver = ba.navigateToAppleHomePage(driver, sb, data);
		}
		return driver;
	}
	public WebDriver goToSelectIPadPage(WebDriver driver,StringBuffer sb,Object data){
		{
			driver = loadHomePage(driver,sb,data);
			driver.get(Product_Apple_IPad.getURL());
		}
		return driver;
	}
	public WebDriver goToSelectIPhone4sPage(WebDriver driver,StringBuffer sb,Object data){
		{
			driver = loadHomePage(driver,sb,data);
			driver.get(Product_Apple_IPhone4s.getURL());
		}
		return driver;
	}
}
