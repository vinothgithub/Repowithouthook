package Actions;

import org.openqa.selenium.WebDriver;

import PageObjects.Product_Magento_Anashria_Sandal;

public class MagentoProductActions {
	public WebDriver goToAnashria_Sandal_Page(WebDriver driver,StringBuffer sb,Object data){
		{
			BaseActions ba = new BaseActions();
			driver = ba.navigateToMagentoHomePage(driver, sb, data);
			driver.get(Product_Magento_Anashria_Sandal.getURL());
		}
		return driver;
	}
}
