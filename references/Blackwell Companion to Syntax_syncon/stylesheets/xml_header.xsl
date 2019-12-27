<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
							xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							xmlns:msxsl="urn:schemas-microsoft-com:xslt"
							extension-element-prefixes="msxsl" >
							

	<xsl:output method="xml" 
							doctype-public="-//BLACKWELL PUBLISHING GROUP//DTD 4.0//EN" 
							doctype-system="\\oxford\vol01\bpgdtd\4-0\bpg4-0.dtd" 
							omit-xml-declaration="yes" 
							indent="no"/>

	<xsl:strip-space elements="*"/>
	<xsl:preserve-space elements="x"/>
			
	<!-- created: 22-02-2001 by PTW 
		   creates copies of just the header, publisherinfo and contentinfo sections of a document
		   - for use with xml_toc.xsl and header-only files -->
		
	<xsl:template match="/">
		<xsl:call-template name="xmlHeader"/>
		<xsl:apply-templates mode="minimum"/>
	</xsl:template>

	<xsl:template mode="minimum" match="content">
		<xsl:copy >
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="minimum"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template mode="minimum" match="publisherinfo | contentinfo">
		<xsl:copy >
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<xsl:template mode="minimum" match="document">
		<xsl:copy >
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<xsl:template mode="minimum" match="documentgroup">
		<xsl:for-each select="header">
			<xsl:apply-templates/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template mode="minimum" match="*"/>

	<xsl:template match="*">
		<xsl:copy >
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="x">
		<xsl:copy >
			<xsl:if test="not(@xml:space = 'preserve')"><xsl:copy-of select="@*"/></xsl:if>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="x[.=' ']">
		<xsl:copy >
			<xsl:if test="not(@xml:space = 'preserve')"><xsl:copy-of select="@*"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:copy>
	</xsl:template>


	<xsl:template match="symbol">
		<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
		<xsl:value-of select="@name"/><xsl:text >;</xsl:text>
	</xsl:template>

	<xsl:template name="xmlHeader">
		<xsl:text disable-output-escaping="yes">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
</xsl:text>
		<xsl:processing-instruction name="xml-stylesheet">
			<xsl:text>type="text/xsl" href="file://batchgate1\StyleS\hgToc.xsl"</xsl:text>
		</xsl:processing-instruction>
	</xsl:template>
	
</xsl:stylesheet>
