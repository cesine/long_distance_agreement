<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Name: SynergyExtss.xsl -->
	<!-- LastUpdate: 2000-11-17 -->
	<!-- Version: 2000-09-12.1 -->
	<!-- Dependancies: [none] -->
	<!-- Description: Synergy specific elements -->
	<!-- Update: 2000-09-12.1 By:acb
	     Added mode indent templates
	-->
	<!-- Update: 2000-10-19.1 By:acb
	     Added mode indent templates
	-->
	<!-- Update: 2000-11-17.1 By:acb/HG:as
	     Updated HG NavBar
	-->
	<!-- Update: 2001-03-23 By: ptw
	     adapted menu-title to accept nodesets (to allow for titles w/ entities etc.)
	-->

<!-- Partha

	<xsl:strip-space elements="*"/>
	<xsl:template name="site-menu" match="site-menu" mode="template">
		<xsl:text disable-output-escaping="yes">&lt;a href='&lt;%=request("NavDefault")%&gt;' onmouseout="img_inact('sy')" onmouseover="img_act('sy')"&gt;</xsl:text>
		<img border="0" height="19" width="153" name="sy" src="{$ImagePath}/synhmpg.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavYHP")%&gt;' onmouseout="img_inact('yr')" onmouseover="img_act('yr')"&gt;</xsl:text>

		<img border="0" height="18" width="153" name="yr" src="{$ImagePath}/yrhmpg.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavJlist")%&gt;' onmouseout="img_inact('jl')" onmouseover="img_act('jl')"></xsl:text>
		<img border="0" height="18"  width="153" name="jl" src="{$ImagePath}/jrnllist.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavIssuelist")%&gt;' onmouseout="img_inact('io')" onmouseover="img_act('io')"></xsl:text>
		<img border="0" height="18" width="153" name="io"  src="{$ImagePath}/issnln.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavTOC")%&gt;' onmouseout="img_inact('tc')" onmouseover="img_act('tc')"></xsl:text>
		<img border="0" height="18" width="153" name="tc" src="{$ImagePath}/tocmenu.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>

		<xsl:if test="$AbstractOnly and //document/section[@type='body']">
			<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavViewArt")%&gt;' onmouseover="img_act('va')" onmouseout="img_inact('va')"></xsl:text>
			<img border="0" height="18" width="153" name="va" src="{$ImagePath}/viewart.gif" /><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		</xsl:if>

		<xsl:if test=".//document/header/documentinfo/relatedgroup/related[@relationship='sibling' and @type='pages']/file[@type='pdf']/@name">
			<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavViewPDF")%&gt;' onmouseout="img_inact('vw')" onmouseover="img_act('vw')"></xsl:text>
			<img border="0" height="18" width="153" name="vw" src="{$ImagePath}/viewpdf.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		</xsl:if>

		<xsl:text disable-output-escaping="yes" >&lt;% if request("NavSendColleage") &lt;&gt;"" then %&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavSendColleage")%&gt;' onmouseover="img_act('sc')" onmouseout="img_inact('sc')"></xsl:text>
			<img src="http://www.blackwell-synergy.com/Journals/images/sendcolleage.gif" width="153" height="18" border="0" name="sc"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;% end if %&gt;</xsl:text>

		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavSearch")%&gt;' onmouseout="img_inact('sr')" onmouseover="img_act('sr')"></xsl:text>
		<img border="0" height="18" width="153" name="sr" src="{$ImagePath}/srch.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>

		<xsl:text disable-output-escaping="yes" >&lt;% if request("NavFavArt") &lt;&gt;"" then %&gt;</xsl:text>
			<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavFavArt")%&gt;' onmouseover="img_act('fav')" onmouseout="img_inact('fav')"></xsl:text>
			<img src="http://www.blackwell-synergy.com/Journals/images/favorites1.gif" width="153" height="19" border="0" name="fav"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>
		<xsl:text disable-output-escaping="yes" >&lt;% end if %&gt;</xsl:text>

		<xsl:text disable-output-escaping="yes" >&lt;a href='&lt;%=request("NavHelp")%&gt;' onmouseout="img_inact('hl')" onmouseover="img_act('hl')"></xsl:text>
		<img border="0" height="18" width="153" name="hl" src="{$ImagePath}/hlp.gif"/><xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text><br/>


	</xsl:template>

	<xsl:template name="site-client-scripts" match="site-client-scripts" mode="template">
		<script language="javascript" src="{$StyleSheetPath}/SiteScripts-Synergy.js"/>
	</xsl:template>

-->
	<xsl:template name="FooterPaneLeft">
		<!-- <xsl:apply-imports/> -->
<!--		<img height="1" src="{$ImagePath}/unitx.gif" width="396"/> 
		<p></p>
		<hr align="left" width="100%"/>
		<a href="http://www.crossref.org/">
			<img alt="CrossRef" border="0" src="{$ImagePath}/CRMemberLogo.gif"/>
		</a> 
-->
		<p align="left">
		<font size="1">
			<xsl:text disable-output-escaping="yes" >&amp;copy; Blackwell Science and Munksgaard. All rights reserved. Some contents contained herein may be owned by third parties and use is prohibited without express written permission.</xsl:text>
		</font>
		</p>
<!--		<font color="#2e18a0" size="1">
		<img align="middle" src="{$ImagePath}/activepress.gif"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:text> technology by HealthGate Data Corp. </xsl:text>
		<a href="http://www.healthgate.com/">
			<xsl:text>http://www.healthgate.com/</xsl:text>
		</a>
		</font> -->
	</xsl:template>


	<xsl:template match="summary/title">
		<p class="summary-title">
			<b><xsl:apply-templates/></b>
		</p>
	</xsl:template>
</xsl:stylesheet>
