<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ins="http://www.blacksci.co.uk/xsl-subs">
	<!-- Name: HGAbstract.xsl -->
	<!-- LastUpdate: 2000-09-13 -->
	<!-- Version: 2000-09-13.1 -->
	<!-- Dependancies: HGFullText.xsl -->
	<!-- Description: Top level XSL file
	-->
	<!-- Update: 2000-09-13.1 By:acb
	     Added Objects.xsl
	-->
	<!-- Update: 2000-10-19.1 By:acb
	     Added Converted from HGFulltext.xsl
	-->
	<!-- Update: 2000-11-17.1 By:acb
	     Added AbstractOnly varaible 
	-->
	<xsl:import href="Paths.xsl"/>
	<xsl:import href="CommonUtils.xsl"/>
	<xsl:import href="SubPanes.xsl"/>
	<xsl:import href="BodyText.xsl"/>
	<xsl:import href="Objects.xsl"/>
	<xsl:import href="Tables.xsl"/>
	<xsl:import href="Formulas.xsl"/>
	<xsl:import href="Symbols.xsl"/>
	<xsl:import href="References.xsl"/>
	<xsl:include href="SynergyExts.xsl"/>
	
	<xsl:variable name="AbstractOnly" select="."/>
	<xsl:template match="/">
		<xsl:apply-templates select="document('pagelayout.xml')/root" mode="output"/>
	</xsl:template>
	<xsl:variable name="ins-template" select="document('mainpanes-abs.xml')/ins:stylesheet"/>
</xsl:stylesheet>
