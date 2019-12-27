<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ins="http://www.blacksci.co.uk/xsl-subs">
	<!-- Name: HGFullText.xsl -->
	<!-- LastUpdate: 2000-09-13 -->
	<!-- Version: 2000-09-13.1 -->
	<!-- Dependancies: HGFullText.xsl -->
	<!-- Description: Top level XSL file
	-->
	<!-- Update: 2000-09-13.1 By:acb
	     Added Objects.xsl
	-->
	<!-- update: 2001-02-19.1 by: ptw
			added temporary text to document title for qc tocs -->
			
	<xsl:import href="Paths.xsl"/>
	<xsl:import href="CommonUtils.xsl"/>
	<xsl:import href="BodyText.xsl"/>
	<xsl:import href="SubPanes.xsl"/>
	<xsl:import href="TocEntry.xsl"/>
	<xsl:import href="Objects.xsl"/>
	<xsl:import href="Tables.xsl"/>
	<xsl:import href="Formulas.xsl"/>
	<xsl:import href="Symbols.xsl"/>
	<xsl:import href="References.xsl"/>
	<xsl:include href="SynergyExts.xsl"/>
	
	<xsl:variable name="toc-audience" select="'qc'"/>
	<!-- for live in-house demo; could be "live" or "qc" or "live-demo"-->

	<xsl:template match="/">
		<xsl:comment>#INCLUDE FILE = "../../../../../../verifyuser.asp"</xsl:comment>
  		<xsl:apply-templates select="document('pagelayout.xml')/root" mode="output"/>
	</xsl:template>
	
	<!-- quick and dirty version of subpanes.xsl for temporary qc purposes only -->
	
	<xsl:template name="DocumentTitle" match="/DocumentTitle" mode="template">
		<span xsl:use-attribute-sets="document-title">
		<xsl:if test="$toc-audience!='live'"><font color="red"><xsl:value-of select="$toc-audience"/>: </font></xsl:if>
		<xsl:apply-templates select="content/document/header/titlegroup/title[@type='document' or @type='journal']" />
		</span>
	</xsl:template>
</xsl:stylesheet>
