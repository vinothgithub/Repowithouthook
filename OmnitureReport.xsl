<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <HTML>
      <head>
        <style>
          body
          {
          background-color: #FFFFFF;
          font: 70% Helvetica, sans-serif;
          height:100%;
          }

          h1
          {
          font:200%, Helvetica, sans-serif;
          font-weight: bold;
          text-align: right;
          font-style:italic;
          font-variant:small-caps;
          color: #71A792;
          }

          table
          {
          border-color: Black;
          padding: 2px;
          width: 100%;
          font: 100% Helvetica, sans-serif;
          }

          table.withborder
          {
          border-color: Black;
          padding: 2px;
          width: 100%;
          border-style:ridge;
          border-width: 1px;
          font: 100% Helvetica, sans-serif;
          }

          .ContentLayout
          {
          width: 1024px;
          padding: 5px
          background-color:#F1F5F5
          min-height: 100%;
          position: relative;

          }
          .Header1
          {
          text-align: center;
          font-weight: bold;
          padding: 5px
          }

          .caption
          {

          font-weight: bold;
          }

          hr
          {
          color: #827839;
          height:1px;
          border-style:dotted;
          }

          ul.navigationBar {
          list-style:none;
          margin:0;
          padding:3px;

          }

          ul.navigationBar li {
          display:inline;
          /*background-color: #DDEEE9;*/
          }

          ul.navigationBar a {
          border-width: 1px 1px 0 1px;
          border-style:solid;
          border-color:#ddddd;
          padding:3px 5px 3px 5px;
          position:relative;
          text-decoration: none;
          color: #666666;
          font-weight:bold;
          }

          ul.navigationBar li a:hover{
          color: #000000;
          }

          ul.leftbar {
          list-style: none;
          margin: 0px;
          padding: 0px;
          border: none;
          }

          ul.leftbar li {
          margin: 0px;
          padding: 0px;
          }

          ul.leftbar li a {
          font-size: 100%;
          display: block;
          border-bottom: 1px dashed #C39C4E;
          padding: 5px 0px 2px 4px;
          text-decoration: none;
          color: #666666;
          width:100%;
          }

          ul.leftbar li a:hover, ul.leftbar li a:focus{
          color: #000000;
          background-color: #eeeeee;
          }

          .VerticalMenuHeader {
          display: block;
          background-color:#7E6C74;
          font-size: 90%;
          padding: 3px 0 5px 3px;
          border: 1px solid #000000;
          color: #ffffff;
          margin: 0px;
          width:159px;
          font-weight: bold;
          }

          #copyright {
          background: #3f3f31;
          clear: both;
          color: #ffffff;
          position: relative;
          font-size: 11px;
          margin-top: 30px;
          padding: 5px 10px;
          width: auto;
          position: relative;
          }
          #copyright a:link {
          color: #ffffff;
          text-decoration: underline;
          }
          #copyright a:link:hover { color: #e5bb00; }
          #copyright a:visited {
          color: #ffffff;
          text-decoration: underline;
          }

          .defaultmenubg{
          background-color: #DDEEE9;
          }

          .selected{
          background-color: #eeeeee;
          }
        </style>
        <script type="text/javascript" src="https://ajax.microsoft.com/ajax/jQuery/jquery-1.5.2.min.js"></script>
        <!-- this blow script block has been added to get end script tag while doing transformation. it has no meaning, just added.-->
        <script type="text/javascript">var test1=10;</script>
        
        <script type="text/javascript">
          var selectedTestCase = "";
          var selectedTestCaseId="";
          function showTestCase(id)
          {

          if(selectedTestCaseId!=id)
          {

          if(selectedTestCaseId!="")
          {
          $("#div" + selectedTestCaseId).hide();
          $("#lmenu" + selectedTestCaseId).removeClass('selected');
          }


          selectedTestCaseId = id;
          $("#lmenu" + selectedTestCaseId).addClass('selected');
          $("#div" + selectedTestCaseId).show();
          }
          }

          //var selectedTestGroup = "";
          var selectedTestGroupId="";
          function showTestGroup(id)
          {


          if(selectedTestGroupId!=id)
          {
          //$("#div" + selectedTestCaseId).hide(); //resetting test case selection;

          if(selectedTestGroupId!="")
          {
          $("#div" + selectedTestGroupId).hide();
          $("#hmenu" + selectedTestGroupId).removeClass('selected');
          }




          selectedTestGroupId = id;
          $("#hmenu" + selectedTestGroupId).addClass('selected');
          $("#div" + selectedTestGroupId).show();
          }
          }

          function FilterTestCases(dropdown)
          {
          $("#div" + selectedTestCaseId).hide();
          selectedTestCaseId="";
          $("#" + dropdown.id + " option").each(function(){

          if($(this).val()==dropdown.value)
          {
          $("." + $(this).val()).show();
          showTestCase($("." + $(this).val()).first().attr('Id').replace('lmenu',''));
          return false;
          }
          else
          $("." + $(this).val()).hide();




          });





          }
        </script>
      </head>
      <body>

        <div class="ContentLayout" >
          <xsl:call-template name="header"/>
          <xsl:apply-templates select="SeleniumTest/TestSuites/TestSuite"/>
          <br/>
          <br/>

          <div style="width:1024px;">
            <xsl:apply-templates select="SeleniumTest/TestSuites/TestSuite/TestGroups"/>
          </div>
          <xsl:call-template name="footer"/>
        </div>
        <script type="text/javascript">
          showTestGroup('<xsl:value-of select="SeleniumTest/TestSuites/TestSuite/TestGroups/TestGroup/TestGroupName"/>');
          showTestCase('<xsl:value-of select="SeleniumTest/TestSuites/TestSuite/TestGroups/TestGroup/TestCases/TestCase/TestCaseId"/>');
        </script>
      </body>
    </HTML>
  </xsl:template>

  <xsl:template match="TestGroups">
    <div style="position:relative">
      <ul class="navigationBar">
        <xsl:apply-templates select="TestGroup/TestGroupName"/>
      </ul>
      <hr/>
    </div>
    <br/>
    <xsl:apply-templates select="TestGroup"/>
  </xsl:template>

  <xsl:template match="TestSuite">
    <table class="withborder">
      <tr bgcolor="#C2DFFF">
        <td width="20%" class="caption">Test Suite Name:</td>
        <td width="80%">
          <xsl:value-of select="TestSuiteName"/>
        </td>
      </tr>
      <tr bgcolor="#C2DFFF">
        <td class="caption"># of Items:</td>
        <td>
          <xsl:value-of select="count(TestCases/*/TestCase)"/>
        </td>
      </tr>
      <tr bgcolor="#C2DFFF">
        <td class="caption">Date &amp; Time of Test:</td>
        <td>
          <xsl:value-of select="TestDateTime"/>
        </td>
      </tr>
      <tr bgcolor="#C2DFFF">
        <td class="caption">Environment</td>
        <td>
          <xsl:value-of select="Environment"/>
        </td>
      </tr>
    </table>

  </xsl:template>

  <xsl:template name="header">
    <div >
      <div style="width:40%;float: left;height:70px;">
        <img src="http://www.softcrylic.com/image/logo.png" border="0"/>
      </div>
      <div style="width:60%;float: right;height:70px;">
        <h1 style="top:60%;">
          Omniture Automation Report
        </h1>
      </div>
      <hr/>
    </div>

  </xsl:template>

  <xsl:template name="footer">
    <div id="copyright">
      2001-2011 Softcrylic. All rights reserved. Softcrylic is a registered trademark of Softcrylic, LLC.
      <a href="#" onClick="MM_openBrWindow('http://www.softcrylic.com/popups/terms_of_use.html','','scrollbars=yes,resizable=yes,width=580px,height=700px')">Terms of Use</a>
    </div>
  </xsl:template>

  <xsl:template match="TestGroup">

    <div id="div{TestGroupName}" style="display:none">
      <div style="float:left; width:160px; position:relative;">

        <div>
          <span class="VerticalMenuHeader">
            <select id="ddlFilter" name="ddlFilter" onchange="JavaScript: FilterTestCases(this);" >
              <option value="all">All Test Cases</option>
              <option value="false">Failed Test Cases</option>
              <option value="true">Passed Test Cases</option>
            </select>
          </span>
          <ul class="leftbar">
            <xsl:apply-templates select="TestCases/TestCase" mode="list"/>
          </ul>
        </div>
      </div>
      <div style="float:right; width:840px; position:relative;">
        <div style="background-color: #817679;padding:3px; color:#ffffff; font-weight:bold">
          Category Name: <xsl:value-of select="../TestGroupName"/>
        </div>
        <xsl:apply-templates select="TestCases/TestCase" mode="data"/>
        <br/>
      </div>
    </div>




  </xsl:template>

  <xsl:template match="TestCase" mode="list">
    <li id="lmenu{TestCaseId}" class="all {TestCaseStatus}">
      <a href="#" onclick="JavaScript: showTestCase('{TestCaseId}');">
        <xsl:value-of select="TestCaseName"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="TestGroupName">

    <li  id="hmenu{.}" class="defaultmenubg">
      <a href="#" onclick="JavaScript: showTestGroup('{.}'); showTestCase('{../TestCases/TestCase/TestCaseId}');">
        <xsl:value-of select="."/>
      </a>
    </li>

  </xsl:template>

  <xsl:template match="TestCase" mode="data">
    <div id="div{TestCaseId}" style="display:none;">



      <div style="border: 1px black solid;padding: 3px; width:100%; overflow:auto; overflow-y: hidden; -ms-overflow-y: hidden;">



        <span class="caption"> Test Case ID: </span>
        <xsl:value-of select="TestCaseId"/>
        <br/>
        <span class="caption"> Test Case Name: </span>
        <xsl:value-of select="TestCaseName"/>
        <br/>
        <span class="caption">URL Tested:</span>
        <xsl:value-of select="ParentURL"/>
        <br/>




        <table>
          <tr bgcolor="#88aaaa">
            <th> Variable </th>
            <th> ExceptedValue </th>
            <th> ActualValue </th>
            <th> Result </th>
          </tr>
          <xsl:apply-templates select="TestSteps">
            <xsl:with-param name="header" select="'Props'"/>
            <xsl:with-param name="condition" select="'prop'"/>
          </xsl:apply-templates>

          <xsl:apply-templates select="TestSteps">
            <xsl:with-param name="header" select="'eVars'"/>
            <xsl:with-param name="condition" select="'eVar'"/>
          </xsl:apply-templates>

          <xsl:apply-templates select="TestSteps">
            <xsl:with-param name="header" select="'Others'"/>
            <xsl:with-param name="condition" select="'other'"/>
          </xsl:apply-templates>
        </table>
      </div>
    </div>
    <!--<xsl:for-each select="SeleniumTest/TestScripts/TestScript">
            <xsl:for-each select="Details">
              <table border="1">
                <tr>
                  <th colspan="4" bgcolor="#FFFFB4" align="left">Props</th>
                </tr>
                <tr>
                  <th> Varibale </th>
                  <th> ExceptedValue </th>
                  <th> ActualValue </th>
                  <th> Result </th>
                </tr>
              <xsl:for-each select="TestScriptDetail">
                <xsl:if test="contains(Description,'prop')">
                  <xsl:if test="Result='true'">
                    <tr>
                      <td>
                        <xsl:value-of select="Description"/>
                      </td>
                      <td>
                        <xsl:value-of select="ExceptedData"/>
                      </td>
                      <td>
                        <xsl:value-of select="ActualData"/>
                      </td>
                      <td>
                        <xsl:value-of select="Result"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="Result='false'">
                    <tr bgcolor="yellow">
                      <td>
                        <xsl:value-of select="Description"/>
                      </td>
                      <td>
                        <xsl:value-of select="ExceptedData"/>
                      </td>
                      <td>
                        <xsl:value-of select="ActualData"/>
                      </td>
                      <td>
                        <xsl:value-of select="Result"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:if>
              </xsl:for-each>
              </table>

              <table border="1">
                <tr>
                  <th colspan="4" bgcolor="#FFFFB4" align="left"> eVars</th>
                </tr>
                <tr>
                  <th> Varibale </th>
                  <th> ExceptedValue </th>
                  <th> ActualValue </th>
                  <th> Result </th>
                </tr>

                <xsl:for-each select="TestScriptDetail">
                  <xsl:if test="contains(Description,'eVar')">
                    <xsl:if test="Result='true'">
                      <tr>
                        <td>
                          <xsl:value-of select="Description"/>
                        </td>
                        <td>
                          <xsl:value-of select="ExceptedData"/>
                        </td>
                        <td>
                          <xsl:value-of select="ActualData"/>
                        </td>
                        <td>
                          <xsl:value-of select="Result"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="Result='false'">
                      <tr bgcolor="yellow">
                        <td>
                          <xsl:value-of select="Description"/>
                        </td>
                        <td>
                          <xsl:value-of select="ExceptedData"/>
                        </td>
                        <td>
                          <xsl:value-of select="ActualData"/>
                        </td>
                        <td>
                          <xsl:value-of select="Result"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </table>

              <table border="1">
                <tr>
                  <th colspan="4" bgcolor="#FFFFB4" align="left">others</th>
                </tr>
                <tr>
                  <th> Varibale </th>
                  <th> ExceptedValue </th>
                  <th> ActualValue </th>
                  <th> Result </th>
                </tr>
                <xsl:for-each select="TestScriptDetail">
                  <xsl:if test="not(contains(Description,'eVar')) and not(contains(Description,'prop'))
                        and not(StepNumber='2') and not(StepNumber='1')"
                        >
                    <xsl:if test="Result='true'">
                      <tr>
                        <td>
                          <xsl:value-of select="Description"/>
                        </td>
                        <td>
                          <xsl:value-of select="ExceptedData"/>
                        </td>
                        <td>
                          <xsl:value-of select="ActualData"/>
                        </td>
                        <td>
                          <xsl:value-of select="Result"/>
                        </td>
                      </tr>
                    </xsl:if>
                    <xsl:if test="Result='false'">
                      <tr bgcolor="yellow">
                        <td>
                          <xsl:value-of select="Description"/>
                        </td>
                        <td>
                          <xsl:value-of select="ExceptedData"/>
                        </td>
                        <td>
                          <xsl:value-of select="ActualData"/>
                        </td>
                        <td>
                          <xsl:value-of select="Result"/>
                        </td>
                      </tr>
                    </xsl:if>
                  </xsl:if>
                </xsl:for-each>
              </table>
            </xsl:for-each>
        </xsl:for-each>-->

  </xsl:template>

  <xsl:template match="TestSteps">
    <xsl:param name="header"></xsl:param>
    <xsl:param name="condition"></xsl:param>

    <tr>
      <th colspan="4" bgcolor="#aacccc" align="left">
        <xsl:value-of select="$header"/>
      </th>
    </tr>

    <xsl:apply-templates select="TestStep[contains(Description, $condition)]"/>

    <xsl:if test="$condition='other'and not(StepNumber='2') and not(StepNumber='1')">

      <xsl:apply-templates select="TestStep[not(contains(Description,'eVar')) and not(contains(Description,'prop'))
                        and not(StepNumber='2') and not(StepNumber='1')]"/>
    </xsl:if>


  </xsl:template>

  <xsl:template match="TestStep">
    <xsl:if test="Result='true'">
      <tr bgcolor="#E2EFED">
        <td>
          <xsl:value-of select="Description"/>
        </td>
        <td>
          <xsl:value-of select="ExceptedData"/>
        </td>
        <td>
          <xsl:value-of select="ActualData"/>
        </td>
        <td>
          Passed
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="Result='false'">
      <tr bgcolor="#F9966B">
        <td>
          <xsl:value-of select="Description"/>
        </td>
        <td>
          <xsl:value-of select="ExceptedData"/>
        </td>
        <td>
          <xsl:value-of select="ActualData"/>
        </td>
        <td>
          Failed
        </td>
      </tr>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
