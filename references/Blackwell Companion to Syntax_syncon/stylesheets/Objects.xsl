<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Name: BodyText.xsl -->
	<!-- LastUpdate: 2000-09-13 -->
	<!-- Version: 2000-09-13.2 -->
	<!-- Dependancies: Objects.xsl -->
	<!-- Description: Handles DTD4.0 Object elements 
	-->
	<!-- Update: 2000-09-13.1 By:acb
	     Moved code from Bodytext.xsl and SubPanes.xsl
	-->
	<!-- Update: 2000-09-13.2 By:acb
	     Fixed for new <insitu> tag
	-->
	<!-- Update: 2000-11-6.1 By:acb
	     Added support for filegroups
	-->
	<!-- Update: 2000-11-6.2 By:acb
	     Added thumb-nail support
	     and seperated out object-source handling into seperate templates
	-->
	<!-- Update: 2001-03-07 By:ptw
	     added support for <objectnote>
	-->
	<!-- Update: 2001-03-13 By:ptw
	     removed the 'width="150"' attribute from object-body-source-thumb (thumbnail previews)
	-->
	<!-- Update: 2001-03-27 By:ptw
	     added support for <object type="box">
	-->

	<xsl:strip-space elements="*"/>

	<xsl:attribute-set name="xml-inline-object">
		<xsl:attribute name="class">xml-inline-object</xsl:attribute>
		<xsl:attribute name="style">display:inline;float:none;vertical-align:middle</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="xml-block-object">
		<xsl:attribute name="class">xml-inline-object</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="style">float:none;vertical-align:middle</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template name="object">
		<xsl:choose>
			<xsl:when test="@id">
				<a name="{@id}">
				<xsl:call-template name="object-in-table"/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="object-in-table"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:attribute-set name="box">
		<xsl:attribute name="class">box</xsl:attribute>
		<xsl:attribute name="width">100%</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="frame">box</xsl:attribute>
		<xsl:attribute name="bgcolor">#99ccff</xsl:attribute>
		<xsl:attribute name="cellspacing">3</xsl:attribute>
		<xsl:attribute name="cellpadding">3</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template name="object-in-table">
		<xsl:choose>
		<xsl:when test="@format='inline'">
			<table xsl:use-attribute-sets="xml-inline-object">
			<tr><td>
			<xsl:call-template name="object-content"/>
			</td></tr>
			</table>
		</xsl:when>
		<xsl:otherwise>
			<table xsl:use-attribute-sets="xml-block-object">
			<tr><td>
			<xsl:call-template name="object-content"/>
			</td></tr>
			</table>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:variable name="table-legeneds-follow"/>
	<xsl:template name="object-content">
		<xsl:choose>
			<xsl:when test="@type='table' and $table-legeneds-follow">
				<xsl:call-template name="object-legend"/>
				<xsl:call-template name="object-body"/>
				<xsl:call-template name="object-objectnote"/>
			</xsl:when>
			<xsl:when test="@type='box'">
				<xsl:call-template name="object-legend"/>
				<table xsl:use-attribute-sets="box">
					<tr>
						<td>
							<xsl:call-template name="object-body"/>
						</td>
					</tr>
				</table>
				<xsl:call-template name="object-objectnote"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="object-legend"/>
				<xsl:call-template name="object-body"/>
				<xsl:call-template name="object-objectnote"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="object-body">
		<xsl:for-each select="objectsource">
			<xsl:call-template name="object-body-source"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="object-body-source">
		<a>
		<xsl:if test="*[1]/@id">
			<xsl:attribute name="name">
				<xsl:value-of select="*[1]/@id"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="insitu/tbl" >
				<xsl:apply-templates select="insitu/tbl"/>
			</xsl:when>
			<xsl:when test="self::table" >
				<xsl:apply-templates select="tbl"/>
			</xsl:when>
			<xsl:when test="filegroup" >
				<xsl:for-each select="filegroup/file">
				<img src="{@name}"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="file">
				<img src="{file/@name}"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="insitu"/>
			</xsl:otherwise>
		</xsl:choose>
		</a>
	</xsl:template>
	<xsl:template name="object-body-source-thumb">
		<xsl:choose>
			<xsl:when test="insitu" >
				<img border="1" src="{$ImagePath}/table.gif"/>
			</xsl:when>
			<xsl:when test="file">
				<xsl:variable name="src" select="string(file/@name)"/>
				<img border="1" src="{substring($src,1,string-length($src)-4)}_thumb.gif"/>
			</xsl:when>
			<xsl:when test="filegroup" >
				<xsl:for-each select="filegroup/file">
					<xsl:variable name="src" select="string(@name)"/>
					<img border="1" src="{substring($src,1,string-length($src)-4)}_thumb.gif"/>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="object-legend">
		<xsl:if test="legend">
			<a name="{legend/@id}">
			<div class="legend">
			<!-- <xsl:apply-templates select="legend"/> -->
			<xsl:call-template name="apply-templates">
				<xsl:with-param name="select" select="legend"/>
				<xsl:with-param name="mode" select="'no-anchors-or-ids'"/>
			</xsl:call-template>
			</div>
			</a>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="object-objectnote">
		<xsl:if test="objectnote">
			<div class="objectnote">
			<xsl:call-template name="apply-templates">
				<xsl:with-param name="select" select="objectnote"/>
				<xsl:with-param name="mode" select="'no-anchors-or-ids'"/>
			</xsl:call-template>
			</div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
