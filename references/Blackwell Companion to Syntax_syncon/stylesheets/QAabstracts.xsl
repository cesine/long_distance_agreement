<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Name: QAabstracts.xsl -->
<!-- LastUpdate: 2001-02-02 -->
<!-- Version: 2001-02-02.1 -->
<!-- Description: Check XML abstracts file -->

<xsl:output method="html" indent="no" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<html><body>
	<!-- Misc checks -->
	<xsl:if test="/content/documentgroup/header/documentinfo/trackinghistory/trackingdate[@type='markedup']/@date=0000">
		<p><xsl:text>Invalid markedup tracking date in documentgroup header.</xsl:text></p>
	</xsl:if>
	<xsl:if test="/content/document/header/documentinfo/trackinghistory/trackingdate[@type='markedup']/@date=0000">
		<p><xsl:text>Invalid markedup tracking date in document header.</xsl:text></p>
	</xsl:if>

	<!-- Process all documents -->
	<xsl:apply-templates select="/content/documentgroup/document"/>
	<xsl:apply-templates select="/content/document"/>
	</body></html>
</xsl:template>

<xsl:template match="document">
	<!-- Title -->
	<xsl:if test="count(header/titlegroup/title[@type='document'])=0">
		<p><xsl:text>Abstract title missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>

	<!-- Authors -->
	<xsl:if test="count(header/namegroup)=0">
		<p><xsl:text>Abstract authors missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
 	</xsl:if>

	<!-- Journal -->
	<xsl:if test="count(header/documentinfo/relatedgroup/related[@type='source']/reference/title)=0">
		<p><xsl:text>Journal title missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>

	<!-- Year -->
	<xsl:if test="count(header/documentinfo/relatedgroup/related[@type='source']/reference/date/@date)=0">
		<p><xsl:text>Date missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>

	<!-- VolumeIss -->

	<!-- Pages -->

	<!-- PubMed -->
	<xsl:if test="count(header/documentinfo/relatedgroup/related[@type='source']/reference/externallink[@type='pubmed']/@id)=0">
		<p><xsl:text>PubMed id missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>
	<xsl:if test="string-length(header/documentinfo/relatedgroup/related[@type='source']/reference/externallink[@type='pubmed']/@id) != 8">
		<p><xsl:text>Unusual length PubMed id in no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>

	<!-- DOI -->

	<!-- Summary -->
	<!-- No longer receiving abstract summaries -->

	<!-- Text -->
	<xsl:if test="contains(header/summary, 'PMID')">
		<p><xsl:text>PMID in text of no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>

	<!-- Rating -->

	<!-- Date -->

	<!-- SubjectCode -->
	<xsl:if test="count(header/documentinfo/subjectgroup/subject)=0">
		<p><xsl:text>Subject code missing from no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>
	<xsl:if test="contains(header/documentinfo/subjectgroup/subject, ' ') or string-length(header/documentinfo/subjectgroup/subject) &gt; 5">
		<p><xsl:text>Invalid subject code in no. </xsl:text><xsl:value-of select="@sequence"/></p>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
