<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Name: References.xsl -->
	<!-- LastUpdate: 2000-09-12 -->
	<!-- Version: 2000-09-12.1 -->
	<!-- Dependancies: [none] -->
	<!-- Description: Handles display of references -->
	<!-- Update: 2000-09-12.1 By:acb
	     Added support for type="pubmed"
	-->
	<!-- Update: 2000-11-17.1 By:acb
	     Moved Links implementation to separate templates
	-->
	<!-- Update: 2001-03-07 By:ptw
	     added support for genbank
	-->
	<!-- Update: 2001-03-27 By:ptw
	     added italics to title@type=book
	-->
	<xsl:strip-space elements="*"/>
	<xsl:attribute-set name="reference">
		<xsl:attribute name="class">reference</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="reference" >
	  <a name="{@id}">	
        <xsl:variable name="storeref">
		<table xsl:use-attribute-sets="reference">
		<xsl:attribute name="xml:space">preserve</xsl:attribute>
		<tbody>
		<tr>
		<td vAlign="top">
			<xsl:choose>
				<xsl:when test="number/node()">
					<xsl:apply-templates select="number"/>
				</xsl:when>
				<xsl:otherwise>
					<!--- display bullet -->
					<font size="+2"><b>
					<xsl:text disable-output-escaping="yes">&amp;#149;</xsl:text>
					</b></font>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
			<br/>
			<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text>
		</td>
		<td>
			<xsl:apply-templates mode="reference"/>
			<br/>
			<xsl:for-each select="externallink[@type='doi']">
				<xsl:apply-templates mode="reference-link" select="."/>
			</xsl:for-each>
			<xsl:for-each select="externallink[@type='pubmed']">
				<xsl:apply-templates mode="reference-link" select="."/>
			</xsl:for-each>
			<xsl:for-each select="externallink[@type='ads']">
				<xsl:apply-templates mode="reference-link" select="."/>
			</xsl:for-each>
		</td>
		</tr>
		</tbody>
		</table>
            </xsl:variable>  
		</a>
				<xsl:variable name="storeref-nodelist" select="$storeref"/>
		<xsl:apply-templates select="$storeref-nodelist" mode="anchors-as-scripts"/>
	</xsl:template>

	<xsl:template mode="reference" match="*">
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template mode="reference" match="number"/>
	<xsl:template mode="reference" match="title[@type='publication' or @type='journal' or @type='book']">
		<i>
		<xsl:apply-templates/>
		</i>
	</xsl:template>
	<xsl:template mode="reference" match="volume | issue">
		<b>
		<xsl:apply-templates/>
		</b>
	</xsl:template>

	<xsl:template mode="reference-link" match="externallink[@type='doi']">
		<a>
		<xsl:attribute name="href">
			<xsl:text disable-output-escaping="yes">javascript:makewindow('http://dx.doi.org/</xsl:text>
			<!-- http://www.blackwell-synergy.com/Journals/reference_search.asp?searchEngine=DOI&UID={@id} -->
			<xsl:value-of select="@id"/>
			<xsl:text>')</xsl:text>
		</xsl:attribute> 
		<img border="0" src="{$ImagePath}/CRButton.gif"/>
		</a>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
	</xsl:template>

	<xsl:template mode="reference-link" match="externallink[@type='pubmed']">
		<a href="javascript:searchpubmedid('{@id}')">
		<img border="0" src="{$ImagePath}/medline.gif"/>
		</a>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
	</xsl:template>

	<!--<xsl:template mode="reference-link" match="externallink[@type='genbank']">
		<a href="javascript:searchgenbankid('{@id}')">
		<img border="0" src="{$ImagePath}/genbank.gif"/>
		</a>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
	</xsl:template>-->
	
	<xsl:template mode="reference-link" match="externallink[@type='ads']">
		<a href="javascript:searchads('{@id}')">
		<img border="0" src="{$ImagePath}/abstract.gif"/>
		</a>
		<xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
	</xsl:template>

</xsl:stylesheet>
