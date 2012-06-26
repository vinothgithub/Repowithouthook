package Test;

import java.util.Hashtable;

import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import com.Softcrylic.demo.testautomation.Base.BaseTest;
import com.Softcrylic.demo.testautomation.Common.TableLayout;
import com.Softcrylic.demo.testautomation.Common.XLSReader;
import com.Softcrylic.demo.testautomation.Utilities.JustLogger;
import com.Softcrylic.demo.testautomation.Utilities.LogHelper;
import com.Softcrylic.demo.testautomation.Utilities.LogWriter;

import Actions.AppleStoreActions;


@Test
public class Omniture extends BaseTest {
	@DataProvider(name = "OmnitureTestData")
	public Object[][] DataProvider_OmnitureTestData() throws Exception {
		XLSReader reader = new XLSReader(TableLayout.VERTICAL, sup.getDataSource());
		Object[][] data1 = reader.getTableArray("OmnitureData", "OmnitureTestData1");
		
		Object[][] data2= reader.getTableArray("OmnitureData", "OmnitureTestData2");
		Object[][] data = new Object[1][2];
		data [0][0] = data1[0][0];
		data [0][1] = data2[0][0];
        return data;
	}
	@Test(groups={"Omniture"}, testName="OmniuteDemoScript1", dataProvider="OmnitureTestData")
	public void OmniuteDemoScript1(Hashtable<String,String> data1,Hashtable<String,String> data2){
		data1 = this.replaceTagNameWithProp((Hashtable<String,String>)data1);
		sup.setTestName("OmniuteDemoScript1");
		startUp("001");
		sup.setTestCaseID(this.getTestCaseId("01", 
				sup.getTestName(), 
				sup.getBrowser(),
				sup.getBrowserVersion()));
		XLSReader reader = new XLSReader(null,null);
		
		reader.generateXML(data1, getActionName());
		this.inputDataFileName = reader.getXMLFileName();
		JustLogger.logInfo("Input data file stored at"+this.inputDataFileName);
		//this.addInputFileName(inputDataFileName);
    	this.setupOmnitureDebugger(this.inputDataFileName, this.getActionName());
    	engine = this.enableWebAnalyticsTesting(engine);
    	AppleStoreActions sa = new AppleStoreActions();
    	System.out.println("FireFox hooking driver page");
    	driver = sa.goToSelectIPadPage(driver, sb, data1);
    	LogHelper.enableOmnitureTest(true);
    	LogWriter logger = new LogWriter();
    	logger.createTestCase(
    			sup.getTestCaseID(), 
    			sup.getTestName() +"_"+
						sup.getBrowser()+"_"+
						sup.getBrowserVersion(), 
						sup.getTestName() + sup.getBrowser(), 
						driver.getCurrentUrl(), 
						sup.getVideoURL(), 
						sup.getBrowser());
        AssertionError ae=null;
		try{
			this.startTest(logger);
		}catch(AssertionError e){
			ae=e;
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.close(logger.gettestCase(), "Omniture");
		OmniuteDemoScript2(data2,ae);
	}
	@SuppressWarnings("unchecked")
	public void OmniuteDemoScript2(Object data,AssertionError ae)
	{
		data = this.replaceTagNameWithProp((Hashtable<String,String>)data);
		sup.setTestName("OmniuteDemoScript2");
		sup.setTestCaseID(this.getTestCaseId("02", 
				sup.getTestName(), 
				sup.getBrowser(),
				sup.getBrowserVersion()));
		XLSReader reader = new XLSReader(null,null);
		reader.generateXML(data, getActionName());
		this.inputDataFileName = reader.getXMLFileName();
		//this.addInputFileName(inputDataFileName);
    	this.setupOmnitureDebugger(this.inputDataFileName, this.getActionName());
    	engine = this.enableWebAnalyticsTesting(engine);
    	AppleStoreActions sa = new AppleStoreActions();
    	driver = sa.goToSelectIPhone4sPage(driver, sb, data);
    	LogHelper.enableOmnitureTest(true);
    	LogWriter logger = new LogWriter();
    	logger.createTestCase(
    			sup.getTestCaseID(), 
    			sup.getTestName() +"_"+
						sup.getBrowser()+"_"+
						sup.getBrowserVersion(), 
						sup.getTestName() + sup.getBrowser(), 
						driver.getCurrentUrl(), 
						sup.getVideoURL(), 
						sup.getBrowser());
		try{
			this.startTest(logger);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.close(logger.gettestCase(), "Omniture");
		try {if(driver!=null) driver.close();}catch(Exception ignore){} 
		if(ae != null) throw ae;
	}
}
