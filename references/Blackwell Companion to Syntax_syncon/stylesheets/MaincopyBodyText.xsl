<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Name: BodyText.xsl -->
	<!-- LastUpdate: 2000-11-06 -->
	<!-- Version: 2000-09-12.1 -->
	<!-- Dependancies: CommonUtils.xsl -->
	<!-- Description: Handles DTD4.0 formating element -->
	<!-- Update: 2000-09-12.1 By:acb
	     Added xsl file-header
	-->
	<!-- Update: 2000-11-06.1 By:acb
	     Added p to preserve-space lsit
	-->
	<!-- Update: 2000-11-06.2 By:acb
	     Added template for p to produce
	     inline images when $inline-linked-images is true
	-->
	<!-- Update: 2000-11-06.3 By:acb
	     Added $show-comments-mode - displays empty links
	-->
	<!-- Update: 2000-11-06.4 By:acb
	     Fixed links to headings so they are alwasy local jumps (not popups)
	-->
	<!-- Update: 2000-11-06.5 By:acb
	     Fixed links to headings so they are alwasy local jumps (not popups)
	-->
	<!-- Update: 2000-11-06.6 By:acb
	     Modified HRefs to use popuprefs as opposed to multirefwindow
	-->
	<!-- Update: 2000-11-06.7 By:acb
	     Fixed links to use @id not text contents
	-->
	<!-- Update: 2000-11-06.8 By:acb
	     Split template "h1" to makee subtemplate tempate "h1-body"
	-->
	<!-- Update: 2000-11-06.9 By:acb
	     Remove "xml-" prefix from attribute-set names etc
	-->
	<!-- Update: 2000-11-07.1 By:acb
	     Added dummy show-comments variable
	-->
	<!-- Update: 2001-03-16 By: ptw
	     added support for external links to 'GenBank'
	-->
	<!-- Update: 2001-03-23 By: ptw
	     remove h1-submenu from h1 headings in summaries
	-->
	<!-- Update: 2001-03-26 By: ptw
	     <history> now not displayed directly
	     id from <definitionpair> carried into html (for popups)
	     <heading format="inline"> now recognized (before <p> only, otherwise heading processed as if format="display"; also: levels currently not differentiated visually in inline mode but are reflected in span class-attribute)
	-->
	<!-- Update: 2001-03-27 By: ptw
	     <etal> now italicized
	-->
	<!-- Update: 2001-03-28 By: ptw
	     reworked support for <smallcapitals> to work around IE bug
	-->
	<!-- Update: 2001-03-29
			url externallink force breaks in display urls after '/' to prevent strings exceeding line measure
	-->


	<xsl:strip-space elements="*"/>
	<xsl:preserve-space elements="x p"/>
	<xsl:template match="text()" priority="-8">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="*" priority="-8">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="@*" priority="-8"/>
	<xsl:template match="address | nametitle | forenames | surnameprefix | surname | qualifications | pedigree">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="title | legend | volume | issue | page | summary | bibliography | acknowledgement | copyright">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="subsection">
		<xsl:apply-templates select="*" mode="section-contents"/>
	</xsl:template>
	<xsl:template match="*" mode="section-contents">
		<xsl:apply-templates select="."/>
	</xsl:template>
	<!-- Formating  -->
	<xsl:template match="b | i | br | u | sub | sup">
		<xsl:copy><xsl:apply-templates/></xsl:copy>
	</xsl:template>
	
	<xsl:template match="etal">
		<i><xsl:apply-templates/></i>
	</xsl:template>

	<xsl:template match="smallcapitals">
		<font size="" style="font-variant:small-caps;font-size:70%"><xsl:apply-templates/></font>
	</xsl:template>
	<xsl:template match="accent"><xsl:apply-templates select="ac"/><xsl:apply-templates select="am"/></xsl:template>
	<xsl:template match="accolade">
		<span class="accolade-{@type}">
		<!-- Attributes type side offset -->
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="highlight">
		<div style="background-color:{@bgcolor}">
		<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="openface | scriptface">
		<span class="{name()}">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="roman">
		<span class="roman" style="font-family:'Times New Roman'">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="sansserif">
		<span class="sansserif" style="font-family:sans-serif">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="tt">
		<span class="tt" style="font-family:monospace">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="uu">
		<u class="uu"><!-- The closest we can get -->
		<xsl:apply-templates/>
		</u>
	</xsl:template>
	<xsl:template match="overline">
		<span class="overline" style="text-decoration:overline">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="slanted">
		<span class="slanted" style="font-style:oblique">
		<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="softbr">
		<wbr>
		<xsl:apply-templates/>
		</wbr>
	</xsl:template>
	<xsl:template match="font">
		<font face="{@name}">
		<xsl:apply-templates/>
		</font>
	</xsl:template>
	<xsl:variable name="inline-linked-images" select="'5'"/>
	<xsl:template name="insert-this-object">
		<script language="javascript">
			<xsl:text>document.write(sect["</xsl:text>
			<xsl:value-of select="@id"/>
			<xsl:text>"])</xsl:text>
		</script>
	</xsl:template>
	<xsl:template match="p">
		<xsl:copy>
			<xsl:variable name="position" select="position()"/>
			<xsl:variable name="test-for-inline-heading" select="../*[$position - 1]"/>
			<xsl:variable name="test-for-inline-heading-nodelist" select="$test-for-inline-heading"/>
			<!-- workaround in absence of preceding-sibling in msxml -->
			<xsl:if test="$test-for-inline-heading-nodelist/@format = 'inline'">
				<b>
					<xsl:apply-templates select="$test-for-inline-heading-nodelist" mode="show-inline-heading"/>
				</b>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:copy>
		<xsl:if test="$inline-linked-images and ancestor::section and not(ancestor::object)">
			<xsl:variable name="ns" select="id(.//link/@rid)[not(@id = id(current()/preceding::link/@rid)/@id)]/self::object"/>
			<xsl:if test="$ns">
				<xsl:if test="$inline-linked-images='5'">
					<script language="JavaScript">
						<xsl:text>if(version() &lt; 5)document.write("&lt;" + "!--\n")</xsl:text>
					</script>
				</xsl:if>
				<xsl:for-each select="$ns">
					<div class="inline-linked-object">
					<table border="1" cellpadding="5">
					<tr>
					<td>
						<xsl:call-template name="insert-this-object"/>
					</td>
					</tr>
					</table>
					</div>
				</xsl:for-each>
				<xsl:if test="$inline-linked-images='5'">
					<xsl:comment/>
				</xsl:if>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="heading" mode="show-inline-heading">
		<b>
			<span class="inline-h{@level}" id="{@id}"><xsl:apply-templates/></span>
		</b>
	</xsl:template>
	
	<!-- /Formating -->

	<xsl:template match="link">
		<xsl:variable name="ref-node" select="id(@rid)[1]"/>
		<xsl:variable name="show-comments"/>
		<xsl:choose>
		<xsl:when test="not(node())">
			<xsl:if test="$show-comments">
				<a href="javascript:popuprefs('{@rid}')"><font color="red"><sup>
				<xsl:if test="$ref-node and not(preceding::link[@rid=current()/@rid])">
					<xsl:attribute name="name">
						<xsl:text>backlink-</xsl:text>
						<xsl:value-of select="$ref-node/@id"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:text disable-output-escaping="yes">&amp;iquest;</xsl:text>
				<xsl:if test="id(@rid)/self::comment">
					<xsl:text>Q</xsl:text>
					<xsl:value-of select="count(id(@rid)/self::comment[1]/preceding::comment)+1"/>
				</xsl:if>
				</sup></font></a>
			</xsl:if>
		</xsl:when>
		<xsl:when test="id(@rid)/self::heading or //heading[@id=current()/@rid]">
			<a href="#{@rid}">
			<xsl:apply-templates/>
			</a>
		</xsl:when>
		<xsl:when test="id(@rid) or //*[@id=current()/@rid]">
			<a href="javascript:popupids('{@rid}','{id(@rid)/@type}:{name(id(@rid))}')" onMouseMove="window.status='Popup'">
			<xsl:apply-templates/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<font color="red">
			<a href="javascript:popupids('{@rid}','{name(id(@rid))}.{id(@rid)/@type}')" onMouseMove="window.status='Popup'">
			<xsl:apply-templates/>
			</a>
			</font>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="externallink[@type='email']">
		<xsl:variable name="ref">
		<xsl:value-of select="@id"/>
		<xsl:if test="not(@id)">
			<xsl:value-of select="."/>
		</xsl:if>
		</xsl:variable>	
		<a href="mailto:{$ref}">
		<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xsl:template match="externallink[@type='url']">
		<xsl:choose>
			<xsl:when test="@id">
				<a href="javascript:extLink('{@id}')">
				<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<a href="javascript:extLink('{.}')">
					<xsl:call-template name="force-break">
						<xsl:with-param name="text" select="."/>
					</xsl:call-template>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="externallink[@type='genbank']">
		<xsl:variable name="ref">
		<xsl:value-of select="@id"/>
		<xsl:if test="not(@id)">
			<xsl:value-of select="."/>
		</xsl:if>
		</xsl:variable>
		<a href="javascript:searchgenbankid('{$ref}')">
		<xsl:apply-templates/>
		</a>
	</xsl:template>
	
	<xsl:template match="bookreference | otherreference|journalreference">
		<div>
			<xsl:attribute name="title"><xsl:value-of select="publisher"/></xsl:attribute>
			<xsl:value-of select="publicationtitle"/>
			<xsl:text/>
			<span style="font-size:smaller; font-style:italic">
				<xsl:for-each select="name">
					<xsl:value-of select="forenames"/>
					<xsl:value-of select="surname"/>
					<xsl:if test="position() != last()">
						<xsl:text>; </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</span>
		</div>
	</xsl:template>

	<xsl:template match="heading">
		<span>
			<xsl:attribute name="class"><xsl:text>h</xsl:text><xsl:value-of select="@level"/></xsl:attribute>
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template name="h1" match="heading[@level='1' and not(@format='inline' and following-sibling::p)]" >
	      <xsl:call-template name="h1-body"/>
			<xsl:if test="not(ancestor::summary)">
		      <xsl:call-template name="h1-submenu"/>
	      </xsl:if>
	      <xsl:if test="ancestor::bibliography or name(following-sibling::*[1])!='p'">
		<p/>
	      </xsl:if>
	</xsl:template>
	
	<xsl:template match="heading[@format='inline' and following-sibling::p]"/>

	<xsl:template name="h1-body" >
	      <font face="Arial" size="+1" class="h1">
	      <br/>
	      <p/>
	      <b>
	      <a name="{@id}">
	      <xsl:apply-templates/>
	      </a>
	      </b>
	      </font>
	      <br/>
	</xsl:template>

	<xsl:template name="h1-submenu">
	      <br/>
	      <xsl:for-each select="preceding-sibling::heading[@level='1'] | ancestor::*/preceding-sibling::*//heading[@level='1']">
		<a>
		<xsl:attribute name="href">
			<!-- <xsl:text>http://www.blackwell-synergy.com/member/institutions/processpaid.asp?contentid=man.2000.5&amp;filetype=articles&amp;article=56756&amp;year=&amp;journal=#</xsl:text> -->
			<xsl:text>#</xsl:text>
			<xsl:value-of select="@id"/>
		</xsl:attribute>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<!--<img border="0" src="{$ImagePath}/uparrow.gif"/>-->
		</a>
		<xsl:text> </xsl:text>
	      </xsl:for-each>
	      <xsl:for-each select="following::heading[@level='1' and not(@format='inline')]">
		<a>
		<xsl:attribute name="href">
			<!-- <xsl:text>http://www.blackwell-synergy.com/member/institutions/processpaid.asp?contentid=man.2000.5&amp;filetype=articles&amp;article=56756&amp;year=&amp;journal=#</xsl:text> -->
			<xsl:text>#</xsl:text>
			<xsl:value-of select="@id"/>
		</xsl:attribute>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<!--<img border="0" src="{$ImagePath}/downarrow.gif"/>-->
		</a>
		<xsl:text> </xsl:text>
	      </xsl:for-each>
	</xsl:template>
	<xsl:template match="heading[@level='2' and not(@format='inline' and following-sibling::p)]" >
	      <b class="h2">
	      <br/>
	      <p/>
	      <xsl:apply-templates/>
	      </b>
	      <xsl:if test="ancestor::bibliography or name(following-sibling::*[1])!='p'">
		<p/>
	      </xsl:if>
	</xsl:template>
	<xsl:template match="heading[@level='3' and not(@format='inline' and following-sibling::p)]" >
	      <i class="h3">
	      <br/>
	      <p/>
	      <xsl:apply-templates/>
	      </i>
	      <xsl:variable name="name-of-next" select="name(following-sibling::*[1])"/>
	      <xsl:if test="$name-of-next!='p' and name-of-next!='heading'">
		<p/>
	      </xsl:if>
	</xsl:template>
	<xsl:template match="objectgroup">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="object | section//history"/>
	<xsl:template match="object[@position='fixed']">
		<xsl:call-template name="object"/>
	</xsl:template>
	<xsl:template match="x">
		<!-- Note: xml:space used to preserve space only nodes -->
		<xsl:choose>
		<xsl:when test="*">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:attribute-set name="ident">
		<xsl:attribute name="class">ident</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="number">
		<b xsl:use-attribute-sets="ident">
		<xsl:apply-templates/>
		</b>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="footnote | span | correspondent | definitionpair">
		<xsl:choose>
		<xsl:when test="@id">
			<a name="{@id}">
			<xsl:apply-templates/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="footnote/p">
		<xsl:apply-templates/>
		<br/>
	</xsl:template>
	<xsl:attribute-set name="listgroup">
		<xsl:attribute name="class">listgroup</xsl:attribute>
		<xsl:attribute name="border">0</xsl:attribute>
		<xsl:attribute name="width">95%</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="listgroup">
		<table xsl:use-attribute-sets="listgroup">
		<xsl:for-each select="*">
			<xsl:variable name="level">
				<xsl:value-of select="@level"/>
				<xsl:if test="not(@level)">1</xsl:if>
			</xsl:variable>
			<tr class="li{$level}">
			<xsl:if test="$level &gt; 1">
				<xsl:call-template name="repeat">
					<xsl:with-param name="count" select="number(@level) - 1"/>
					<xsl:with-param name="content">
						<td><br/></td>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
			<td valign="top">
			<xsl:apply-templates select=".//number[1]"/>
			</td>
			<td colspan="{6 - $level}">
			<xsl:call-template name="apply-templates">
				<xsl:with-param name="mode" select="'no-number'"/>
				<xsl:with-param name="select" select="*"/>
			</xsl:call-template>
			</td>
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template match="li">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="/no-number//number"/>
	<xsl:template match="abstractinfo"/>
	
</xsl:stylesheet>
