package Test;

import java.util.Hashtable;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import Actions.MagentoProductActions;

import com.Softcrylic.demo.testautomation.Base.BaseTest;
import com.Softcrylic.demo.testautomation.Common.TableLayout;
import com.Softcrylic.demo.testautomation.Common.XLSReader;
import com.Softcrylic.demo.testautomation.Utilities.LogWriter;

@Test
public class GoogleAnalytics extends BaseTest {
	@DataProvider(name = "GAData")
	public Object[][] DataProvider_OmnitureTestData() throws Exception {
		XLSReader reader = new XLSReader(TableLayout.VERTICAL,sup.getDataSource());
		Object[][] data = reader.getTableArray("MMGA", "MMGA");
		return data;
	}
	
	@Test(groups={"Google"}, testName="GADemoScript1", dataProvider="GAData")//TODO Change here
	public void GADemoScript1(Hashtable<String,String> data){
		//com.saucelabs.sauceconnect.SauceConnect.main(new String[]{saucelab.getUserName(),saucelab.getApiKey()});
		//SauceConnect sc;
		//System.out.println(SauceConnect.restURL());
		
		sup.setTestName("GADemoScript1");//TODO Change here for testing agquin
		startUp("003");//TODO Change here
		sup.setTestCaseID(this.getTestCaseId("03", 
				sup.getTestName(), 
				sup.getBrowser(),
				sup.getBrowserVersion()));
		XLSReader reader = new XLSReader(null,null);
		reader.generateXML(data, getActionName());
		this.inputDataFileName = reader.getXMLFileName();
		{//TODO Change here
			this.setUpHTTPSniffer(new String[]{"GET /__utm.gif"},this.inputDataFileName, this.getActionName());
		}
    	engine = this.enableWebAnalyticsTesting(engine);
    	{//TODO Change here
    		MagentoProductActions ma = new MagentoProductActions();
    		driver = ma.goToAnashria_Sandal_Page(driver, sb, data);
    	}
    	LogWriter logger = new LogWriter();
    	logger.createTestCase(sup.getTestCaseID(),
				sup.getTestName() +"_"+
						sup.getBrowser()+"_"+
						sup.getBrowserVersion(), 
				sup.getTestName() + sup.getBrowser(),
				sup.getBrowser(),
				driver.getCurrentUrl(),
				sup.getVideoURL());
		try{
			this.startTest(logger);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.close(logger.gettestCase(), "GoogleAnalytics");
		try {if(driver!=null) driver.close();}catch(Exception ignore){} 
	}
}
