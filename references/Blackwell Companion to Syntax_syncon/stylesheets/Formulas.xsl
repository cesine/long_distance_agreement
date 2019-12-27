<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<!-- Name: Formulas.xsl -->
	<!-- LastUpdate: 2000-11-8 -->
	<!-- Version: 2000-09-12.1 -->
	<!-- Dependancies: [style .formula-block] -->
	<!-- Description: Handles DTD4.0 formula element -->
	<!-- Update: 2000-09-12.1 By:acb
	     Added xsl header
	-->
	<!-- Update: 2000-10-23.1 By:acb
	     Partial fix for new alternativemath structures
	-->
	<!-- Update: 2000-11-8.1 By:acb
	     Fixed wrapiing and added support for mundovr
	-->
	<xsl:template match="simplemath | mi | mo | mn | mfunc">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:attribute-set name="formula">
		<xsl:attribute name="class">formula</xsl:attribute>
		<xsl:attribute name="style">width:100%;vertical-align:middle</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="cellpadding">0</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="inline-formula">
		<xsl:attribute name="class">formula</xsl:attribute>
		<xsl:attribute name="style">display:inline;float:none;vertical-align:middle</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="cellpadding">0</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="formula">
		<a name="{@id}">
		<font face="Garamond">
		<!-- <table class="formula" border="0" cellpadding="8" cellspacing="1"> -->
		<xsl:choose>
		<xsl:when test="@format='inline'">
			<table xsl:use-attribute-sets="inline-formula">
				<tr>
				<xsl:apply-templates mode="formula-cell"/>
				</tr>
			</table>
		</xsl:when>
		<xsl:otherwise>
			<table xsl:use-attribute-sets="formula">
				<tr>
				<xsl:apply-templates mode="formula-cell"/>
				</tr>
			</table>
		</xsl:otherwise>
		</xsl:choose>
		</font>
		</a>
	</xsl:template>
	
	<xsl:template match="*" mode="formula-cell"/>
	<xsl:template match="number" mode="formula-cell">
		<td valign="middle">
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="math" mode="formula-cell">
		<td width="90%" nowrap="yes">
		<xsl:call-template name="formula-math-in-table"/>
		</td>
	</xsl:template>
	<xsl:template match="simplemath" mode="formula-cell">
		<td width="90%" nowrap="yes">
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="file" mode="formula-cell">
		<td width="90%">
			<img src="{@name}"/>
		</td>
	</xsl:template>
	<xsl:template match="tex" mode="formula-cell"/>
	<xsl:template match="alternativemath" mode="formula-cell">
		<xsl:if test="not(boolean(../math or ../simplemath or ../file))">
			<xsl:apply-templates mode="formula-cell"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="formula-math">
		<xsl:choose>
		<xsl:when test="mfrac | mfenced">
			<xsl:variable name="nodelist" select="node()[not(preceding-sibling::mfrac | preceding-sibling::mfenced | preceding-sibling::msup| preceding-sibling::mundrovr) and not(self::mfrac | self::mfenced | self::msup | self::msubsup  | self::mundrovr)]"/>
			<xsl:if test="$nodelist">
				<td nowrap="yes" valign="middle">
				<xsl:apply-templates select="$nodelist"/>
				</td>
			</xsl:if>
			<xsl:for-each select="mfrac | mfenced | msup| msubsup | mundrovr">
				<xsl:choose>
					<xsl:when test="self::msup and preceding-sibling::*[1][self::mfenced/mfrac or self::mfrac | self::mundrovr]">
						<td valign="top"><xsl:apply-templates select="."/></td>
					</xsl:when>
					<xsl:otherwise>
						<td nowrap="yes" valign="middle"><xsl:apply-templates select="."/></td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:variable name="lpc" select="count(preceding-sibling::mfrac | preceding-sibling::mfenced | preceding-sibling::msup| preceding-sibling::msubsup | preceding-sibling::mundrovr)"/>
				<xsl:variable name="lnodelist" select="following-sibling::node()[not(self::mfrac | self::mfenced | self::msup | self::msubsup | self::mundrovr) and count(preceding-sibling::mfrac | preceding-sibling::mfenced | preceding-sibling::msup | preceding-sibling::msubsup | preceding-sibling::mundrovr) = $lpc + 1]"/>
				<xsl:if test="$lnodelist">
				<td nowrap="yes" valign="middle"><xsl:apply-templates select="$lnodelist"/></td>
				</xsl:if>
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>
			<td valign="middle" nowrap="yes" ><xsl:apply-templates/></td>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="formula-math-in-table">
		<table  class="formula-block" border="0" cellspacing="1" cellpadding="0">
		<tr>
		<xsl:call-template name="formula-math"/>
		</tr>
		</table>
	</xsl:template>
	<xsl:template match="msub">
		<sub>
		<xsl:apply-templates/>
		</sub>
	</xsl:template>
	<xsl:template match="msup">
		<sup>
		<xsl:apply-templates/>
		</sup>
	</xsl:template>
	<xsl:template match="msup//msub">
		<span style="font-size:92%;vertical-align:text-bottom">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="mfenced">
		<table class="formula-block" border="0" cellspacing="1" cellpadding="0">
		<tr><td valign="middle">
		<xsl:choose>
			<xsl:when test=".//mrow">
				<span style="font-size:300%">
				<xsl:value-of select="@open"/>
				<xsl:if test="not(@open)">(</xsl:if>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@open"/>
				<xsl:if test="not(@open)">(</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		</td>
		<xsl:call-template name="formula-math"/>
		<td valign="middle">
		<xsl:choose>
			<xsl:when test=".//mrow">
				<span style="font-size:300%">
				<xsl:value-of select="@close"/>
				<xsl:if test="not(@close)">
					<xsl:value-of select="translate(@open,'([{','0]}')"/>
					<xsl:if test="not(@open)">)</xsl:if>
				</xsl:if>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="@close"/>
				<xsl:if test="not(@close)">
					<xsl:value-of select="translate(@open,'([{','0]}')"/>
					<xsl:if test="not(@open)">)</xsl:if>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		</td></tr>
		</table>
	</xsl:template>
	<xsl:template match="mfrac">
		<table class="formula-block" border="0" cellspacing="0" cellpadding="0">
			<xsl:for-each select="mrow">
				<xsl:if test="position() &gt; 1">
					<tr ><td style="line-height:1px;background-color:black">.</td></tr>
				</xsl:if>
				<tr><td align="center"><xsl:call-template name="formula-math-in-table"/></td></tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template match="msubsup">
		<table class="formula-block" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<xsl:for-each select="mrow[1]">
				<td valign="middle" rowspan="2">
				<xsl:call-template name="formula-math-in-table"/>
				</td>
			</xsl:for-each>
			<xsl:for-each select="mrow[3]">
				<td style="font-size:70%">
				<xsl:apply-templates/>
				</td>
			</xsl:for-each>
			</tr>
			<tr>
			<xsl:for-each select="mrow[2]">
				<td style="font-size:70%">
				<xsl:apply-templates/>
				</td>
			</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="mundrovr">
		<table class="formula-block" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<xsl:for-each select="mrow[1]">
				<td style="font-size:150%" valign="middle" rowspan="2">
				<xsl:call-template name="formula-math-in-table"/>
				</td>
			</xsl:for-each>
			<xsl:for-each select="mrow[3]">
				<td>
				<xsl:apply-templates/>
				</td>
			</xsl:for-each>
			</tr>
			<tr>
			<xsl:for-each select="mrow[2]">
				<td>
				<xsl:apply-templates/>
				</td>
			</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
