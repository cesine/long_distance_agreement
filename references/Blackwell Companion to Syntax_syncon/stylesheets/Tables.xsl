<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Name: Tables.xsl -->
	<!-- LastUpdate: 2000-09-26 -->
	<!-- Version: 2000-09-26.1 -->
	<!-- Dependancies: CommonUtils.xsl -->
	<!-- Description: Handles DTD4.0 tbl element
	     Generating blank cells with as required to fill complete table
	-->
	<!-- Update: 2000-09-26.1 By:acb
	     Added "table" attribute-set
	     Added align/valign/char/charoff attribute handling
	     Added nbsp filler for empty <entry> tags in original
	-->
	<!-- Update: 2001-01-02.1 By:ptw
	     Added match for "tbltl"
	-->
	<!-- Update: 2001-01-03.1 By:acb
	     Forced order of THead/TBody/TFoot for NS
	-->
	<!-- Update: 2001-02-09 By:rob
	     Changed <tr valign="top" to <tr valign="bottom" in 	<xsl:template match="row" mode="expanded-table">
	-->
	<!-- Update: 2001-03-14 By:ptw
	     fixed align/valign/char/charoff attribute handling
	     fixed bold/italic treatment of text in thead/tfoot
	     fixed extraneous placeholder cell resulting from colspans (rather drastic fix: commented out the logic for displaying/not-displaying the temporary <entry placeholder="yes"...> elements... may need to revisit this!)
	-->
	<!-- Update: 2001-03-27 By:ptw
	     removed default italics from tfoot
	-->
	
	<xsl:strip-space elements="*"/>
	
	<xsl:attribute-set name="table">
		<xsl:attribute name="class">table</xsl:attribute>
		<xsl:attribute name="width">95%</xsl:attribute>
		<xsl:attribute name="border">2</xsl:attribute>
		<xsl:attribute name="frame">box</xsl:attribute>
		<xsl:attribute name="bordercolor">#99ccff</xsl:attribute>
		<xsl:attribute name="cellspacing">1</xsl:attribute>
		<xsl:attribute name="cellpadding">3</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="tbl">
		<xsl:for-each select="tbltl">
			<span class="tbltl"><xsl:apply-templates/></span>
		</xsl:for-each>
		<xsl:for-each select="tgroup">
			<table xsl:use-attribute-sets="table">
			<xsl:if test="@cols">
				<xsl:attribute name="cols">
					<xsl:value-of select="@cols"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:variable name="expanded-table">
				<xsl:for-each select="thead">
					<xsl:copy>
						<xsl:copy-of select="@*"/>
						<xsl:for-each select="*"> <!-- row -->
							<xsl:copy>
								<xsl:call-template name="expand-table-entrys"/>
							</xsl:copy>
						</xsl:for-each>
					</xsl:copy>
				</xsl:for-each>
				<xsl:for-each select="tbody">
					<xsl:copy>
						<xsl:copy-of select="@*"/>
						<xsl:for-each select="*"> <!-- row -->
							<xsl:copy>
								<xsl:call-template name="expand-table-entrys"/>
							</xsl:copy>
						</xsl:for-each>
					</xsl:copy>
				</xsl:for-each>
				<xsl:for-each select="tfoot">
					<xsl:copy>
						<xsl:copy-of select="@*"/>
						<xsl:for-each select="*"> <!-- row -->
							<xsl:copy>
								<xsl:call-template name="expand-table-entrys"/>
							</xsl:copy>
						</xsl:for-each>
					</xsl:copy>
				</xsl:for-each>
			</xsl:variable>
			<xsl:variable name="expanded-table-nodeset" select="$expanded-table"/>
			<!-- <xsl:apply-templates select="tgroup/*"/> -->
			<!--<debug><xsl:copy-of select="$expanded-table"/></debug>-->
			<xsl:apply-templates select="$expanded-table-nodeset" mode="expanded-table"/>
			</table>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="thead | tbody | tfoot" mode="expanded-table">
		<xsl:copy>
			<xsl:copy-of select="@align"/>
			<xsl:copy-of select="@valign"/>
			<xsl:copy-of select="@char"/>
			<xsl:copy-of select="@charoff"/>
		<xsl:apply-templates mode="expanded-table"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="expand-table-entry-place-holder">
		<xsl:param name="start-col"/>
		<xsl:param name="repeat"/>
		<xsl:if test="$repeat &gt; 0">
			<entry start-col="{$start-col}" place-holder="yes"/>
		</xsl:if>
		<xsl:if test="$repeat &gt; 1">
			<xsl:call-template name="expand-table-entry-place-holder">
				<xsl:with-param name="start-col" select="$start-col + 1"/>
				<xsl:with-param name="repeat" select="$repeat - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="expand-table-entrys">
		<xsl:param name="current-idx" select="1"/>
		<xsl:param name="current-col" select="1"/>
		<xsl:variable name="this" select="entry[$current-idx]"/>
		<xsl:variable name="start-col">
			<xsl:choose>
				<xsl:when test="$this/@namest">
					<xsl:value-of select="number(../../colspec[@colname=$this/@namest]/@colnum)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$current-col"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="colspan">
			<xsl:choose>
				<xsl:when test="$this/@nameend">
					<xsl:value-of select="../../colspec[@colname=$this/@nameend]/@colnum - $start-col + 1"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="end-col" select="$start-col + $colspan - 1"/>
		<xsl:if test="$start-col &gt; $current-col">
			<xsl:call-template name="expand-table-entry-place-holder">
				<xsl:with-param name="start-col" select="$current-col"/>
				<xsl:with-param name="repeat" select="$start-col - $current-col"/>
			</xsl:call-template>
		</xsl:if>
		<entry start-col="{$start-col}">
			<xsl:if test="$colspan &gt; 1">
				<xsl:attribute name="colspan">
					<xsl:value-of select="$colspan"/>
				</xsl:attribute> 
			</xsl:if>
			<xsl:if test="$this/@morerows &gt; 0">
				<xsl:attribute name="rowspan">
					<xsl:value-of select="$this/@morerows + 1"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="entry/@align"/>
			<xsl:copy-of select="entry/@valign"/>
			<xsl:copy-of select="entry/@char"/>
			<xsl:copy-of select="entry/@charoff"/>
			<xsl:copy-of select="$this/node()"/>
		</entry>
		<xsl:if test="$this/@morerows &gt; 0">
			 <colspan start-col="{$start-col}" end-col="{$end-col}" end-row="{count(preceding-sibling::row) + $this/@morerows + 1}"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="entry[$current-idx + 1]">
				<xsl:call-template name="expand-table-entrys">
					<xsl:with-param name="current-idx" select="$current-idx + 1"/>
					<xsl:with-param name="current-col" select="$start-col + $colspan"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="../../@cols &gt; $end-col">
				<xsl:call-template name="expand-table-entry-place-holder">
					<xsl:with-param name="start-col" select="$end-col + 1"/>
					<xsl:with-param name="repeat" select="../../@cols - $end-col"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="row" mode="expanded-table">
		<tr valign="bottom">
			<xsl:for-each select="entry">
				<xsl:choose>
					<xsl:when test="@place-holder">
						<!--<xsl:if test="not(../preceding-sibling::row/colspan[@start-col &lt;= current()/@start-col and @end-col &gt;= current()/@start-col and @end-row &gt;= count(../row)])">
							<td>
								<xsl:call-template name="nbsp"/>
							</td>
						</xsl:if>-->
					</xsl:when>
					<xsl:otherwise>
						<td>	
							<xsl:copy-of select="@colspan"/>
							<xsl:copy-of select="@rowspan"/>
							<xsl:copy-of select="@align"/>
							<xsl:copy-of select="@valign"/>
							<xsl:copy-of select="@char"/>
							<xsl:copy-of select="@charoff"/>
							<xsl:choose>
								<xsl:when test="not(node())">
									<xsl:call-template name="nbsp"/>
								</xsl:when>
								<xsl:when test="name(../..)='thead'">
									<b><xsl:apply-templates/></b>
								</xsl:when>
								<xsl:when test="name(../..)='tfoot'">
									<!--<i><xsl:apply-templates/></i>-->
									<xsl:apply-templates/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:apply-templates/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>
