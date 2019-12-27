<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ins="http://www.blacksci.co.uk/xsl-subs">
	<!-- Name: TocEntry.xsl -->
	<!-- LastUpdate: 2001-01-19 -->
	<!-- Version: 2000-10-31.1 -->
	<!-- Dependencies: [none] -->
	<!-- Description: Handles tocentry tag
	-->
	
	<!-- Updated: 2001-01-19
			to handle new layout of tocentry 
			also added QC only variant of gotoTarget client javascript
			-->
	<!-- Updated: 2001-02-19 by ptw
			added qc warning in heading, and links to xml & pdf
			-->
	<!-- Updated: 2001-02-20 by ptw
			added links to abstract
			-->
	<!-- Updated: 2001-03-20 by ptw
			mended links to abstract
			put in support for 'live-demo' mode
			-->

	<xsl:variable name="toc-audience" select="'qc'"/>
	<!-- default value; reset by hgTOC.xsl; allowable values: "live" or "qc" or "live-demo"-->

			
	<xsl:attribute-set name="toc-entry">
		<xsl:attribute name="class">toc-entry</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="cellspacing">5</xsl:attribute>
		<xsl:attribute name="cellpadding">0</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="tocentry">
	
		<!-- temporary: to decide between different versions of the toc output -->
		<xsl:variable name="full-text-target">
			<xsl:choose>
				<xsl:when test="$toc-audience='live-demo'">
					<xsl:value-of select="concat(substring(externallink[@type='articleSource'], 1, string-length(externallink[@type='articleSource'])-4),'.asp')"/>
				</xsl:when>
				<xsl:when test="$toc-audience='live'"/>
				<xsl:otherwise>
					<xsl:value-of select="externallink[@type='articleSource']"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="abstract-target" select="concat(substring(externallink[@type='articleSource'], 1, string-length(externallink[@type='articleSource'])-4),'_abstract.asp')"/>

		<!-- for QC only: gotoTarget javascript brings up xml not html (insert script for first occurrence of tocentry only) -->
		<xsl:variable name="qcTOCshowXMLtext"><xsl:number count="tocentry" level="any"/></xsl:variable>
		<xsl:if test="$qcTOCshowXMLtext = 1">
		<script language="javascript">
			function showAbstract(file) {
			var XMLDoc = new ActiveXObject("Msxml2.DOMDocument");
			XMLDoc.async = false;
			XMLDoc.validateOnParse = false;
			XMLDoc.load(file);
			
			var XSLDoc = new ActiveXObject("Msxml2.DOMDocument");
			XSLDoc.async = false;
			XSLDoc.validateOnParse = false;
			XSLDoc.load(src['style-sheet-path'] + "/HGAbstract.xsl");
			
			var XSLoutput = XMLDoc.transformNode(XSLDoc);
			var abstract_win = window.open('','_self', 'resizable,status,width=500,height=300,scrollbars=yes');
			var abstract_doc = abstract_win.document;
			abstract_win.sect = new Object();
			abstract_doc.write(XSLoutput);
			abstract_doc.close();
		}
		</script>
		</xsl:if>
		<table xsl:use-attribute-sets="toc-entry">
			<tr>
				<td valign="top" width="50">
					<xsl:apply-templates select="pagedetails/page[@type='first']"/>
				</td>
				<td>
					<xsl:apply-templates select="titlegroup/title"/>
					<br/>
					<i>
						<xsl:for-each select="namegroup/name[@type='author']">
							<xsl:choose>
								<xsl:when test="position()=1"/>
								<xsl:otherwise>
									<xsl:text>; </xsl:text>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:apply-templates select="*[not(self::link)]"/>
						</xsl:for-each>
					</i>
					<br/>
					<xsl:if test="externallink[@type='inthisissuedocseq']">
						<xsl:for-each select="externallink[@type='inthisissuedocseq']">
							<xsl:if test="position()!='1'"><xsl:text>; </xsl:text></xsl:if><xsl:apply-templates/>
						</xsl:for-each>
						<br />
					</xsl:if>
					<!-- need to tidy/fix for live version of toc
					<font size="+2">
						<xsl:if test="externallink[@type='abstract']">
							<a href="javascript:GotoTarget('abstract')">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/abstract.gif" alt="Full Text of this article in this browser"/>
							</a>
							<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
						</xsl:if>
						<xsl:if test="externallink[@type='fulltext']">
							<a href="javascript:GotoTarget('fulltext')">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/full.gif" alt="Full Text of this article in this browser"/>
							</a>
						</xsl:if>
						<xsl:if test="externallink[@type='reprint']">
							<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
							<a href="javascript:gotoTarget('pdf')">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/pdf.gif" alt="Article in PDF format for downloading and printing"/>
							</a>
						</xsl:if>
					</font>-->
					<font size="+2">
						<xsl:if test="externallink[@type='abstract']">
			<xsl:choose>
				<xsl:when test="$toc-audience='live-demo'">
							<a href="{$abstract-target}">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/abstract.gif" alt="Full Text of this article in this browser"/>
							</a>
				</xsl:when>
				<xsl:when test="$toc-audience='live'"/>
				<xsl:otherwise>
							<a href="javascript:showAbstract('{externallink[@type='articleSource']}')">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/abstract.gif" alt="Full Text of this article in this browser"/>
							</a>
				</xsl:otherwise>
			</xsl:choose>
							<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
						</xsl:if>
						<xsl:if test="externallink[@type='fulltext']">
							<a href="{$full-text-target}">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/full.gif" alt="Full Text of this article in this browser"/>
							</a>
						</xsl:if>
						<xsl:if test="externallink[@type='reprint']">
							<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
							<a href="{externallink[@type='reprint']}">
								<img align="ABSBOTTOM" border="0" src="{$ImagePath}/pdf.gif" alt="Article in PDF format for downloading and printing"/>
							</a>
						</xsl:if>
					</font>
				</td>
			</tr>
		</table>
		<p/>
	</xsl:template>
	
	<xsl:template match="tocentry/tocheading"/>
	
	<xsl:template match="subsection[tocentry]/heading">
		<h3><xsl:apply-templates/></h3>
	</xsl:template>
	
</xsl:stylesheet>
