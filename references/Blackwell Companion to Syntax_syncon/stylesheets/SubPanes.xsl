<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ins="http://www.blacksci.co.uk/xsl-subs">
	<xsl:strip-space elements="*"/>
	<!-- Name: SubPanes.xsl -->
	<!-- LastUpdate: 2000-09-12 -->
	<!-- Version: 2000-09-12.2 -->
	<!-- Dependancies: CommonUtils.xsl -->
	<!-- Description: Generates named content from xml source 
	-->
	<!-- Update: 2000-09-12.1 By:acb
	     Added xsl header
	-->
	<!-- Update: 2000-09-12.2 By:acb
	     Added "comment" and "processing-instruction" templates
	-->
	<!-- Update: 2000-10-18.1 By:acb
	     Added "full-images-source"
	-->
	<!-- Update: 2000-10-18.2 By:acb
	     Added "std-stylesheet-ref"
	     Made "std-client-scripts" call ext .js file
	     Added "site-article-id"
	     Removed "HGMedline link"
	-->
	<!-- Update: 2000-11-9.1 By:acb
	     Added "document-history"
	-->
	<!-- Update: 2000-11-9.2 By:acb
	     Modified coresspondents-menu to seach all document
	-->
	<!-- Update: 2000-11-17.1 By:acb
	     Added fulltext-button,abstract-button,pdf-button,notify-button
	-->
	<!-- Update: 2000-11-17.2 By:acb
	     Added AbstractOnly varaible
	-->
	<!-- Update: 2001-02-20 By:ptw
	     transferred declaration of sect from clientScripts.js to main body of document (to support qc abstract)
	-->
	<!-- Update: 2001-03-12 By:ptw
	     image-previews-menu: 'fixed' to prevent prematurely truncated preview legends (but this facility was introduced originally to catch the dtd 'abbreviated legend' - marked by <b> tags - must now mark this up specifically using the <alternativeversion> tag with legend
	     fixed correspondent-menu to include named anchor for linking
	-->
	<!-- Update: 2001-03-13 By:ptw
	     created template name 'footnotes-source' to put author affiliations/correspondents text into popups (to display links, & to enable popups in Netscape)
	-->
	<!-- Update: 2001-03-14 By:ptw
	     added support for <title type="subtitle">
	-->
	<!-- Update: 2001-03-16 By:ptw
	     added support for <search-engine>none</search-engine> in the docConfig.xsl file: affects author-menu & keywords-menu
	     suppress &copy; in <copyright> to prevent double copyright sign
	     added support for <definitiongroup>
	-->
	<!-- Update: 2001-03-19 By:ptw
	     added in HG's update to asp call (commented by 'ac')
	-->
	<!-- Update: 2001-03-19.1 By:ptw
	     added support for entities in correspondents, author-search-menu and citation-menu
	-->
	<!-- Update: 2001-03-21 By:ptw
	     fixed abbreviations heading
	-->
	<!-- Update: 2001-03-23 By: ptw
	     support for multiple keywordgroups & summaries - assumes one for each different language
	-->
	<!-- Update: 2001-03-26 By: ptw
	     footnotes-source now includes definitionpairs
	     changed method of extracting <history> information (as section//history is now blocked by standard matches)
	-->
	<!-- Update: 2001-03-27 By:ptw
	     added inlineFootnotegroup & inlineAffiliations for IE5 printout version
	-->

	<xsl:template name="ImagePath" match="/ImagePath" mode="template">
	<xsl:copy-of select="$ImagePath"/>
	</xsl:template>

	<xsl:template name="EntityPath" match="/EntityPath" mode="template">
	<xsl:copy-of select="$EntityPath"/>
	</xsl:template>

	<xsl:template name="StyleSheetPath" match="/StyleSheetPath" mode="template">
	<xsl:copy-of select="$StyleSheetPath"/>
	</xsl:template>


	<xsl:variable name="roota" select="$root"/>

	<!-- content-type: represents the content type -->
	<xsl:template name="content-type" match="/content-type" mode="template">
		<xsl:value-of select="$roota/content/contentinfo/@type"/>
	</xsl:template>

	<xsl:variable name="ContentType" select="$roota/content/contentinfo/@type"/>

	<!-- content-code: represents the journal code etc -->
	<xsl:template name="content-code" match="/content-code" mode="template">
		<xsl:apply-templates select="$roota/content/contentinfo/contentcode"/>
	</xsl:template>

	<xsl:variable name="ContentCode" select="$roota/content/contentinfo/contentcode"/>

	<!-- document-type: represents the document type "primary-article etc -->
	<xsl:template name="document-type" match="/document-type" mode="template">
		<xsl:value-of select="$roota/content/document/@type"/>
	</xsl:template>

	<xsl:variable name="DocumentType" select="$roota/content/document/@type"/>
	
	<!-- document-id: represents the bsl document id =article-no -->
	<xsl:template name="document-id" match="/document-id" mode="template">
		<xsl:value-of select="$roota/content/document/header/documentinfo/idgroup/documentid[@type='bsl']/@id"/>
	</xsl:template>

	<xsl:variable name="DocumentID" select="$roota/content/document/header/documentinfo/idgroup/documentid[@type='bsl']/@id"/>

	<xsl:template name="Issn" match="/issn" mode="template">
		<xsl:value-of select="$roota/content/contentinfo/issn"/>
	</xsl:template>

	<xsl:variable name="Issn" select="$roota/content/contentinfo/issn"/>
	<xsl:template name="Isbn" match="/isbn" mode="template">
		<xsl:value-of select="$roota/content/contentinfo/isbn"/>
	</xsl:template>

	<xsl:variable name="Isbn" select="$roota/content/contentinfo/isbn"/>

	<!-- volume: represents the volume number -->
	<xsl:template name="volume" match="/volume" mode="template">
		<xsl:value-of select="$roota/content/document/header/documentinfo/pagedetails/volume"/>
	</xsl:template>

	<xsl:variable name="Volume" select="$roota/content/document/header/documentinfo/pagedetails/volume"/>

	<!-- issue: represents the issue number -->
	<xsl:template name="issue" match="/issue" mode="template">
		<xsl:value-of select="$roota/content/document/header/documentinfo/pagedetails/issue"/>
	</xsl:template>

	<xsl:variable name="Issue" select="$roota/content/document/header/documentinfo/pagedetails/issue"/>

	<!-- supplement: represents the issue supplement -->
	<xsl:template name="supplement" match="/supplement" mode="template">
		<xsl:value-of select="$roota/content/document/header/documentinfo/pagedetails/supplement"/>
	</xsl:template>

	<xsl:variable name="Supplement" select="$roota/content/document/header/documentinfo/pagedetails/supplement"/>
	
	
	<!-- full-content-code: represents this xsl file documents content -->
	<xsl:template name="full-content-code" match="/full-content-code" mode="template">
		<xsl:call-template name="content-type"/>
		<xsl:text>-</xsl:text>
		<xsl:call-template name="content-code"/>
		<!-- eg journal-CEP -->
	</xsl:template>

	<xsl:variable name="FullContentCode">
		<xsl:call-template name="full-content-code"/>
	</xsl:variable>
	
	<xsl:template name="site-article-id" match="/site-article-id" mode="template">
		<xsl:variable name="src" select="content/document/header/documentinfo/relatedgroup/related[@relationship='self']/file[@type='xml']/@name"/>
		<xsl:value-of select="substring($src,1,string-length($src)-4)"/>
	</xsl:template>

	<xsl:variable name="SiteArticleId">
		<xsl:call-template name="site-article-id"/>
	</xsl:variable>


	<xsl:variable name="DocConfig-v">
		<xsl:variable name="t" select="document('docconfig.xml')/root"/>
		<xsl:variable name="t1" select="$t/*[name()=$FullContentCode][last()]"/>
		<xsl:choose>
			<xsl:when test="$t1">
				<xsl:copy-of select="$t1/*"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$t/default/*"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DocConfig" select="$DocConfig-v"/>


	
	<xsl:attribute-set name="document-reference">
		<xsl:attribute name="class">document-reference</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentReference" match="/DocumentReference" mode="template">
		<span xsl:use-attribute-sets="document-reference">
		<i><xsl:apply-templates select="content/contentinfo/titlegroup/title[@type='document' or @type='journal']"/></i>
		<xsl:if test="content/document/header/documentinfo/pagedetails/volume">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<b><xsl:apply-templates select="content/document/header/documentinfo/pagedetails/volume"/></b>
		</xsl:if>
		<xsl:if test="content/document/header/documentinfo/pagedetails/issue">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;(</xsl:text>
			<xsl:apply-templates select="content/document/header/documentinfo/pagedetails/issue"/>
			<xsl:text disable-output-escaping="yes">)</xsl:text>
		</xsl:if>
		<xsl:if test="content/document/header/documentinfo/pagedetails/page">
			<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
			<xsl:apply-templates select="content/document/header/documentinfo/pagedetails/page[@type='first']"/>
			<xsl:text>-</xsl:text>
			<xsl:apply-templates select="content/document/header/documentinfo/pagedetails/page[@type='last']"/>
		</xsl:if>
		</span>
	</xsl:template>

	<xsl:template name="document-reference-text" match="/document-reference-text" mode="template">
		<xsl:value-of select="content/contentinfo/titlegroup/title[@type='document' or @type='journal']"/>
		<xsl:if test="content/document/header/documentinfo/pagedetails/volume">
			<xsl:text> </xsl:text>
			<xsl:value-of select="content/document/header/documentinfo/pagedetails/volume"/>
		</xsl:if>
		<xsl:if test="content/document/header/documentinfo/pagedetails/issue">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="content/document/header/documentinfo/pagedetails/issue"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="content/document/header/documentinfo/pagedetails/page">
			<xsl:text>,  </xsl:text>
			<xsl:value-of select="content/document/header/documentinfo/pagedetails/page[@type='first']"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="content/document/header/documentinfo/pagedetails/page[@type='last']"/>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="copyright-message">
		<xsl:attribute name="class">copyright-message</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="CopyrightMessage" match="/CopyrightMessage" mode="template">
		<span xsl:use-attribute-sets="copyright-message">
		<xsl:text disable-output-escaping="yes">&amp;copy; </xsl:text>
		<!--<i><xsl:apply-templates select="content/contentinfo/copyright"/></i>-->
		<i><xsl:for-each select="content/contentinfo/copyright">
			<xsl:apply-templates select="text() | *[not(self::symbol/@name='copy')]"/>
		</xsl:for-each></i>
		</span>
	</xsl:template>

	<xsl:attribute-set name="document-title">
		<xsl:attribute name="class">document-title</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentTitle" match="/DocumentTitle" mode="template">
		<span xsl:use-attribute-sets="document-title">
		<xsl:apply-templates select="content/document/header/titlegroup/title[@type='document' or @type='journal']" />
		</span>
	</xsl:template>

	<xsl:attribute-set name="document-subtitle">
		<xsl:attribute name="class">document-subtitle</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentSubtitle" match="/DocumentSubtitle" mode="template">
		<xsl:if test="content/document/header/titlegroup/title[@type='subtitle']">
			<br />
			<span xsl:use-attribute-sets="document-subtitle">
				<xsl:apply-templates select="content/document/header/titlegroup/title[@type='subtitle']" />
			</span>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="document-surtitle">
		<xsl:attribute name="class">document-surtitle</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentSurtitle" match="/DocumentSurtitle" mode="template">
		<span xsl:use-attribute-sets="document-surtitle">
		<xsl:apply-templates select="content/document/header/titlegroup/title[@type='surtitle']" />
		</span>
	</xsl:template>

	<xsl:template name="document-surtitle" match="/document-surtitle" mode="template">
		<xsl:if test="content/document/header/titlegroup/title[@type='surtitle']">
			<p/>
			<div>
			<b><xsl:call-template name="DocumentSurtitle"/></b></div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="document-doi">
		<xsl:attribute name="class">document-doi</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentDOI" match="/DocumentDOI" mode="template">
		<xsl:param name="prefix"/>
		<xsl:if test="content/document/header/documentinfo/idgroup/documentid[@type='doi']/@id">
			<span xsl:use-attribute-sets="document-doi">
			<xsl:copy-of select="$prefix"/>
			<xsl:value-of select="content/document/header/documentinfo/idgroup/documentid[@type='doi']/@id"/>
			</span>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="document-author-list">
		<xsl:attribute name="class">document-author-list</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentAuthorList" match="/DocumentAuthorList" mode="template">
		<span xsl:use-attribute-sets="document-author-list">
		<xsl:for-each select="content/document/header/namegroup/name" >
			<xsl:apply-templates/>
			<xsl:choose>
				<xsl:when test="position()=last()-1">
					<xsl:text> and </xsl:text>
				</xsl:when>
				<xsl:when test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		</span>
	</xsl:template>

	<xsl:template name="inlineAffiliations" match="/inlineAffiliations" mode="template">
		<xsl:if test="$inline-linked-images='5'">
			<script language="JavaScript">
				<xsl:text>if(version() &lt; 5)document.write("&lt;" + "!--\n")</xsl:text>
			</script>
		</xsl:if>
		<div class="inline-linked-object">
			<p class="inlineAffiliations">
				<font size="-1">
					<xsl:if test="//header/namegroup/address">
						<xsl:apply-templates select="//header/namegroup/address" mode="print-inline"/>
					</xsl:if>
				</font>
			</p>
		</div>
		<xsl:if test="$inline-linked-images='5'">
			<xsl:comment/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="inlineFootnotegroup" match="/inlineFootnotegroup" mode="template">
		<xsl:if test="$inline-linked-images='5'">
			<script language="JavaScript">
				<xsl:text>if(version() &lt; 5)document.write("&lt;" + "!--\n")</xsl:text>
			</script>
		</xsl:if>
		<div class="inline-linked-object">
			<span class="inlineFootnotegroup">
				<font size="-1">
					<xsl:if test="//keywordgroup">
						<p class="document-summary">
							<xsl:for-each select="//keywordgroup">
								<xsl:apply-templates mode="print-inline"/>
							</xsl:for-each>
						</p>
					</xsl:if>
					<hr align="left" width="75%"/>
					<xsl:if test="//correspondent">
						<p><xsl:for-each select="//correspondent">
							<!--<xsl:apply-templates/>
							<xsl:for-each select="*">
								<xsl:choose>
									<xsl:when test="self::br">
										<xsl:text> </xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="."/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>-->
							<xsl:apply-templates mode="print-inline"/>
						</xsl:for-each></p>
					</xsl:if>
					<xsl:if test="//definitiongroup">
						<p><xsl:for-each select="//definitiongroup">
							<xsl:apply-templates mode="print-inline"/>
						</xsl:for-each></p>
					</xsl:if>
					<xsl:if test="//footnotegroup/footnote[not(id(@id))]">
						<p><xsl:for-each select="//footnotegroup/footnote[not(id(@id))]">
							<xsl:apply-templates select="."/>
						</xsl:for-each></p>
					</xsl:if>
					<xsl:if test="//history">
						<p><xsl:for-each select="//history">
							<xsl:apply-templates mode="print-inline"/>
						</xsl:for-each></p>
					</xsl:if>
				</font>
			</span>
			<p class="newpage"><xsl:call-template name="nbsp"/></p>
		</div>
		<xsl:if test="$inline-linked-images='5'">
			<xsl:comment/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template mode="print-inline" match="*">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template mode="print-inline" match="br">
		<xsl:text> </xsl:text>
	</xsl:template>
	
	<xsl:template mode="print-inline" match="heading">
		<i><xsl:apply-templates/></i>
	</xsl:template>

	<xsl:attribute-set name="document-summary">
		<xsl:attribute name="class">document-summary</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentSummary" match="/DocumentSummary" mode="template">
		<xsl:if test="content/document/header/summary">
		<div xsl:use-attribute-sets="document-summary">
		<xsl:for-each select="content/document/header/summary">
			<xsl:apply-templates/>
		</xsl:for-each>
		</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="document-content">
		<xsl:attribute name="class">document-content</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="DocumentContent" match="/DocumentContent" mode="template">
		<span xsl:use-attribute-sets="document-content">
		<xsl:apply-templates select="content/document/section/*" mode="section-contents"/>
		</span>
	</xsl:template>

	<xsl:template match="*" mode="section-contents">
		<xsl:apply-templates select="."/>
	</xsl:template>

	<xsl:template match="notegroup | citation" mode="section-contents"/>
	<xsl:attribute-set name="tracking-history">
		<xsl:attribute name="class">tracking-history</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="tracking-history" match="/tracking-history" mode="template">
		<xsl:if test="//trackingdate[@type='received' or @type='accepted']">
			<div xsl:use-attribute-sets="tracking-history">
			<font size="-1">
			<br/>
			<xsl:text>(</xsl:text>
			<xsl:call-template name="long-date-format">
				<xsl:with-param name="prefix" select="'Received '"/>
				<xsl:with-param name="select" select="//trackingdate[@type='received']/@date"/>
			</xsl:call-template>
			<xsl:if test="//trackingdate[@type='received'] and //trackingdate[@type='accepted']">
				<xsl:text>, </xsl:text>
				<br/>
			</xsl:if>
			<xsl:call-template name="long-date-format">
				<xsl:with-param name="prefix" select="'accepted '"/>
				<xsl:with-param name="select" select="//trackingdate[@type='accepted']/@date"/>
			</xsl:call-template>
			<xsl:text>)</xsl:text>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="document-history">
		<xsl:attribute name="class">document-history</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="document-history" match="/document-history" mode="template">
		<xsl:if test="//history">
			<div xsl:use-attribute-sets="document-history">
			<font size="-1">
			<br/>
			<xsl:for-each select="//history">
				<xsl:apply-templates/>
			</xsl:for-each>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="menu-title">
		<xsl:attribute name="class">menu-title</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="menu-title">
		<xsl:param name="text"/>
		<xsl:variable name="text1">
			<root>
				<xsl:copy-of select="$text"/>
			</root>
		</xsl:variable>
		<b xsl:use-attribute-sets="menu-title">
		<!--<xsl:copy-of select="$text"/>-->
		<xsl:variable name="text-nodelist" select="$text1"/>
		<xsl:apply-templates select="$text-nodelist/root"/>
		<br/>
		</b>
	</xsl:template>

	<xsl:attribute-set name="affiliations-menu">
		<xsl:attribute name="class">affiliations-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="affiliations-menu" match="/affiliations-menu" mode="template">
		<xsl:if test="//header/namegroup/address">
			<div xsl:use-attribute-sets="affiliations-menu">
			<p/>
			<xsl:call-template name="menu-title">
				<xsl:with-param name="text" select="'Affiliations'"/>
			</xsl:call-template>
			<font size="-1">
				<xsl:apply-templates select="//header/namegroup/address"/>
				<br/>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="correspondents-menu">
		<xsl:attribute name="class">correspondents-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="correspondents-menu" match="/correspondents-menu" mode="template">
		<xsl:if test="//correspondent">
			<div xsl:use-attribute-sets="correspondents-menu">
			<p/>
			<xsl:call-template name="menu-title">
				<xsl:with-param name="text" select="'Correspondence'"/>
			</xsl:call-template>
			<font size="-1">
				<xsl:for-each select="//correspondent">
					<a name="{@id}">
						<xsl:apply-templates select="."/>
					</a>
				</xsl:for-each>
				<br/>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="misc-footnote-menu">
		<xsl:attribute name="class">misc-footnote-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="misc-footnote-menu" match="/misc-footnote-menu" mode="template">
		<xsl:if test="//footnotegroup/footnote[not(id(@id))]">
			<div xsl:use-attribute-sets="correspondents-menu">
			<p/>
			<hr/>
			<font size="-1">
				<xsl:for-each select="//footnotegroup/footnote[not(id(@id))]">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<br/>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="correspondent/heading"/>
	<xsl:template match="/no-anchors-or-ids-and-string-length-255//text()" mode="output">
		<xsl:variable name="string-so-far">
			<xsl:for-each select="ancestor-or-self::node()/preceding-sibling::node()">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="len-so-far" select="string-length($string-so-far)"/>
		<xsl:choose>
			<xsl:when test="254 &gt; $len-so-far + string-length(.)">
				<xsl:call-template name="output-text"/>
			</xsl:when>
			<xsl:when test="255 &gt; $len-so-far">
				<xsl:call-template name="output-text">
					<xsl:with-param name="select" select="substring(.,1,255 - $len-so-far)"/>
				</xsl:call-template>
				<xsl:text>...</xsl:text>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>	
	</xsl:template>

	<xsl:template match="/no-anchors-or-ids-and-string-length-255//*" mode="output">
		<xsl:variable name="string-so-far">
			<xsl:for-each select="ancestor-or-self::node()/preceding-sibling::node()">
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="len-so-far" select="string-length($string-so-far)"/>
		<xsl:if test="255 &gt; $len-so-far">
			<xsl:copy>
			<xsl:apply-templates select="node() | @*" mode="output"/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>

	<xsl:template match="/no-anchors-or-ids-and-string-length-255//a/@name" mode="output"/>
	<xsl:template match="/no-anchors-or-ids-and-string-length-255//@id" mode="output"/>
	<xsl:attribute-set name="image-previews-menu">
		<xsl:attribute name="class">image-previews-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template match="object | table" mode="image-previews-menu">
		<xsl:variable name="anchors">
			<xsl:value-of select="file/@id | table/@id | @id"/>
			<xsl:if test="legend/p/number/@id">
				<xsl:text> </xsl:text>
				<xsl:value-of select="legend/p/number/@id"/>
			</xsl:if>
		</xsl:variable>
		<a href="javascript:popupids('{$anchors}','{id($anchors)/@type}:{name(id($anchors))}')" title="Full screen version" onMouseMove="window.status='Popup'">
		<xsl:choose>
			<xsl:when test="self::table or @type='table'" >
				<img border="1" width="150" src="{$ImagePath}/table.gif"/>
			</xsl:when>
			<xsl:when test="objectsource" >
				<xsl:for-each select="objectsource">
					<xsl:call-template name="object-body-source-thumb"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="object-body-source-thumb"/>
			</xsl:otherwise>
		</xsl:choose>
		<br/>
		<xsl:text>[Full Screen]</xsl:text>
		<br/>
		</a>
		<xsl:choose>
			<xsl:when test="legend/*[1][name()='p' and name(node()[1]) = 'number' and name(node()[2]) = 'b']">
				<xsl:call-template name="apply-templates">
					<xsl:with-param name="select" select="legend/p/node()"/>
					<xsl:with-param name="mode" select="'no-anchors-or-ids-and-string-length-255'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="legend/*[1][name()='p' and node()[1][name()='span' and name(node()[1]) = 'number' and name(node()[2]) = 'b']]">
				<xsl:call-template name="apply-templates">
					<xsl:with-param name="select" select="legend/p/span/node()"/>
					<xsl:with-param name="mode" select="'no-anchors-or-ids-and-string-length-255'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="apply-templates">
					<xsl:with-param name="select" select="legend/*[1]/node()"/>
					<xsl:with-param name="mode" select="'no-anchors-or-ids-and-string-length-255'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<p/>
	</xsl:template>

	<xsl:template name="image-previews-menu" match="/image-previews-menu" mode="template">
		<xsl:if test="//objectgroup/object | //objectgroup/table">
			<div xsl:use-attribute-sets="image-previews-menu">
			<p/>
			<xsl:call-template name="menu-title">
				<xsl:with-param name="text" select="'Image Previews'"/>
			</xsl:call-template>
			<font size="-1">
			<xsl:apply-templates select="//objectgroup/*" mode="image-previews-menu"/>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="full-images">
		<xsl:attribute name="class">full-images</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template match="object | table" mode="fullimages">
		<xsl:choose>
			<xsl:when test="@id">
				<a name="{@id}">
				<table border="0" width="100%">
				<tr><td>
				<xsl:call-template name="object-content"/>
				</td></tr>
				</table>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="object-content"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="fullimages" match="/fullimages" mode="template">
		<div xsl:use-attribute-sets="full-images">
		<xsl:apply-templates select="//object[@position='floating']" mode="fullimages"/>
		</div>
	</xsl:template>

	<xsl:template mode="full-images-source" match="object | table">
		<a name="{@id}">
		<xsl:call-template name="object-content"/>
		</a>
	</xsl:template>

	<xsl:template name="full-images-source" match="/full-images-source" mode="template">
		<xsl:variable name="object-source">
			<xsl:apply-templates select="//object[@position='floating']" mode="full-images-source" />
		</xsl:variable>
		<xsl:variable name="object-source-node-list" select="$object-source"/>
		<script language="JavaScript">
			<xsl:apply-templates select="$object-source-node-list" mode="extract-anchors-to-sect-variable"/>
		</script>
	</xsl:template>


	<xsl:template name="footnotes-source" match="/footnotes-source" mode="template">
		<xsl:variable name="footnotes-source">
			<xsl:apply-templates select="//footnote | //correspondent | //header/namegroup/address | //definitionpair" />
		</xsl:variable>
		<xsl:variable name="footnotes-source-node-list" select="$footnotes-source"/>
		<script language="JavaScript">
			<xsl:apply-templates select="$footnotes-source-node-list" mode="extract-anchors-to-sect-variable"/>
		</script>
	</xsl:template>
	
	
	<xsl:attribute-set name="keywords-menu">
		<xsl:attribute name="class">keywords-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="keywords-menu" match="/keywords-menu" mode="template">
		<xsl:if test="//keywordgroup">
			<xsl:for-each select="//keywordgroup">
			<div xsl:use-attribute-sets="keywords-menu">
			<p/>
			<xsl:call-template name="menu-title">
				<xsl:with-param name="text" select="heading/* | heading/text()"/>
			</xsl:call-template>
			<table border="0" vAlign="top">
				<xsl:choose>
					<xsl:when test="$DocConfig/search-engine != 'none'">
					<form action="javascript:void()" onSubmit="searchform(document.keywords)" name="keywords">
					<tbody>
					<xsl:for-each select="keyword" >
						<tr>
						<td vAlign="top">
							<input name="search" type="checkbox" value="{.}"/>
						</td>
						<td align="left">
							<font size="-1">
								<a href="javascript:searchkeyword('{.}')" > 
								<xsl:apply-templates/>
								</a>
							</font>
						</td>
						</tr>
					</xsl:for-each>
					<tr>
					<td colSpan="2">
						<input border="0" cache="true" src="{$ImagePath}/synsrch.gif" type="image"/>
					</td>
					</tr>
					</tbody>
					</form>
					</xsl:when>
					<xsl:otherwise>
					<!-- i.e. contains keywords but should not link to search engine -->
						<tbody>
						<xsl:for-each select="keyword" >
							<tr>
							<td align="left"><font size="-1"><xsl:apply-templates/></font></td>
							</tr>
						</xsl:for-each>
						</tbody>
					</xsl:otherwise>
					</xsl:choose>
				</table>
			</div>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:attribute-set name="definitions-menu">
		<xsl:attribute name="class">definitions-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="definitions-menu" match="/definitions-menu" mode="template">
		<xsl:if test="//definitiongroup">
			<xsl:for-each select="//definitiongroup">
				<div xsl:use-attribute-sets="definitions-menu">
				<p/>
				<xsl:call-template name="menu-title">
					<xsl:with-param name="text">
						<xsl:choose>
							<xsl:when test="@type = 'abbreviation'">Abbreviations</xsl:when>
							<xsl:otherwise>
							<xsl:value-of select="translate(substring(@type,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/><xsl:value-of select="substring(@type,2)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>
				</xsl:call-template>
				<table border="0" vAlign="top">
					<tbody>
						<xsl:for-each select="definitionpair" >
							<tr>
							<td vAlign="top">
								<p id="@id"><font size="-1">
									<b><xsl:apply-templates select="term"/></b><xsl:text>: </xsl:text><xsl:apply-templates select="definition"/>
								</font></p>
							</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				</div>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
		
	<xsl:template name="site-menu" priority="-9"/>
	<xsl:template name="std-stylesheet-ref" match="/std-stylesheet-ref" mode="template">
		<link rel="stylesheet" type="text/css" href="{$StyleSheetPath}/SStyleSheet.css"/>
	</xsl:template>

	<xsl:template name="std-client-scripts" match="/std-client-scripts" mode="template">
		<script language="javascript">
			var sect = new Object();
			src = new Object();
			src['style-sheet-path'] = "<xsl:value-of select="$StyleSheetPath"/>";
			src['base-filename'] = "<xsl:value-of select="$SiteArticleId"/>";
			src['content-type'] = "<xsl:value-of select="$ContentType"/>";
			src['content-code'] = "<xsl:value-of select="$ContentCode"/>";
			src['document-type'] = "<xsl:value-of select="$DocumentType"/>";
			src['document-id'] = "<xsl:value-of select="$DocumentID"/>";
			<xsl:if test="$Issn">
			src['issn'] = "<xsl:value-of select="$Issn"/>";
			</xsl:if>
			<xsl:if test="$Isbn">
			src['isbn'] = "<xsl:value-of select="$Isbn"/>";
			</xsl:if>
			src['volume'] = "<xsl:value-of select="$Volume"/>";
			src['issue'] = "<xsl:value-of select="$Issue"/>";
			<xsl:if test="$Supplement">
			src['supplement'] = "<xsl:value-of select="$Supplement"/>";
			</xsl:if>
			src['search-engine'] = "<xsl:value-of select="$DocConfig/search-engine"/>";
			src['document-reference-text'] = "<xsl:call-template name="document-reference-text"/>";
			asp = new Object();
			<!-- /* ac 3.16.01
			asp['fulltext_NavString'] = '&lt;%=Request("NavViewArt")%&gt;'
			asp['pdf_NavString'] = '&lt;%=Request("NavViewPDF")%&gt;'
			asp['notify_NavString'] = '&lt;%=Request("NavSendColleage")%&gt;'
			asp['abstract_NavString'] = '&lt;%=Request("NavViewAbstact")%&gt;'
			-->
			asp['fulltext_NavString'] = '&lt;%=NavViewArt%&gt;'
			asp['pdf_NavString'] = '&lt;%=NavViewPDF%&gt;'
			asp['notify_NavString'] = '&lt;%=NavSendColleage%&gt;'
			asp['abstract_NavString'] = '&lt;%=NavViewAbstact%&gt;'
			<!-- ac */ -->
			ImagePath = "<xsl:value-of select="$ImagePath"/>";
			<xsl:variable name="cb"><xsl:call-template name="citation-body"/></xsl:variable>
			<xsl:variable name="cbnl" select="$cb"/>
			CitationText= <xsl:apply-templates mode="copy-as-java-string" select="$cbnl"/>''
		</script>
		<script language="javascript" src="{$StyleSheetPath}/ClientScripts.js"/>
	</xsl:template>

	<xsl:template name="site-client-scripts" priority="-9"/>
		<!-- <xsl:copy-of select="document('ClientScripts.xml')/scripts/*"/> -->
	<xsl:template name="comment" match="/comment" mode="template">
		<xsl:comment>
		<xsl:apply-templates select="* | text()" mode="output"/>
		</xsl:comment>
	</xsl:template>

	<xsl:template name="processing-instruction" match="/processing-instruction" mode="template">
		<xsl:processing-instruction name="{@name}">
		<xsl:apply-templates select="* | text()" mode="output"/>
		</xsl:processing-instruction>
	</xsl:template>

	<xsl:attribute-set name="citation">
		<xsl:attribute name="class">citation</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="citation-body" match="/citation-body" mode="template">
		<xsl:for-each select="//header/namegroup[@type='author']/name">
			<xsl:choose>
				<xsl:when test="position() = 1">
				</xsl:when>
				<xsl:when test="position() &lt; last()">
					<xsl:text>, </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> &amp; </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
 			<xsl:apply-templates select="surname"/>
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="forenames"/>
		</xsl:for-each>
		<br/>
		<xsl:apply-templates select="content/document/header/titlegroup/title[@type='document' or @type='journal']" />
		<xsl:text>.</xsl:text><br/>
		<xsl:call-template name="DocumentReference"/>
		<xsl:text>.</xsl:text>
		<br/>
		<xsl:variable name="DOI">
			<xsl:call-template name="DocumentDOI"/>
		</xsl:variable>
		<xsl:if test="string-length($DOI) &gt; 0">
			<xsl:text>Available from: </xsl:text>
			<a href="javascript:extLink('http://dx.doi.org/{$DOI}')">
				<xsl:text>http://dx.doi.org/</xsl:text>
				<xsl:value-of select="$DOI"/>
			</a>
		<br/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="citation" match="/citation" mode="template">
		<div xsl:use-attribute-sets="citation">
		<p/>
		<xsl:call-template name="menu-title">
			<xsl:with-param name="text" select="'To cite this article:'"/>
		</xsl:call-template>
		<font size="-1">
		<xsl:call-template name="citation-body"/>
		</font>
		</div>
	</xsl:template>

	<xsl:attribute-set name="author-menu">
		<xsl:attribute name="class">author-menu</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="author-menu" match="/author-menu" mode="template">
		<xsl:if test="//header/namegroup[@type='author']/name and $DocConfig/search-engine != 'none'">
			<div xsl:use-attribute-sets="author-menu">
			<p/>
			<xsl:call-template name="menu-title">
				<xsl:with-param name="text" select="concat($DocConfig/search-engine,' Search')"/>
			</xsl:call-template>
			<font size="-1">
			<xsl:for-each select="//header/namegroup[@type='author']/name">
				<xsl:call-template name="Medline-Link"/>
			<br/>
			</xsl:for-each>
			<p/>
			</font>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template name="Medline-Link">
		<xsl:variable name="ascii-surname">
			<xsl:call-template name="replace-text">
			<xsl:with-param name="text">
				<xsl:call-template name="unicode-to-ascii">
					<xsl:with-param name="select" select="surname"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="replace">'</xsl:with-param>
			<xsl:with-param name="by">\'</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="ascii-forenames">
			<xsl:call-template name="replace-text">
			<xsl:with-param name="text">
				<xsl:call-template name="unicode-to-ascii">
					<xsl:with-param name="select" select="forenames"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="replace">'</xsl:with-param>
			<xsl:with-param name="by">\'</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<a href="javascript:searchauthor('{$ascii-surname}+{substring($ascii-forenames,1,1)}')">
	 		<xsl:apply-templates select="surname"/>
			<xsl:text>, </xsl:text>
			<!--<xsl:value-of select="substring-before(concat(forenames,'.'),'.')"/>-->
			<xsl:apply-templates select="forenames"/>
		</a>
	</xsl:template>

	<xsl:attribute-set name="footnotes">
		<xsl:attribute name="class">footnotes</xsl:attribute>
	</xsl:attribute-set>
	<xsl:template name="footnote-group" match="/footnote-group" mode="template">
		<xsl:if test=".//footnote">
			<div xsl:use-attribute-sets="footnotes">
			<xsl:for-each select=".//footnote">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
			</div>
			<p/>
		</xsl:if>
	</xsl:template>

	<xsl:variable name="show-comments"/>
	<xsl:template name="comment-group" match="/comment-group" mode="template">
		<xsl:if test="$show-comments and .//comment">
			<xsl:variable name="title">Comments</xsl:variable>
			<xsl:variable name="title-nodelist" select="$title"/>
			<xsl:for-each select="$title-nodelist">
			<xsl:call-template name="h1-body"/>
			</xsl:for-each>
			<p/>
			<table>
			<xsl:for-each select=".//comment">
				<xsl:variable name="link" select="//link[@rid=current()/@id][1]"/>
				<tr>
					<td valign="top">
						<b>
						<sup>
						<xsl:choose>
						<xsl:when test="$link">
							<a href="#backlink-{@id}">
							<xsl:text disable-output-escaping="yes">&amp;iquest;Q</xsl:text>
							<xsl:number/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text disable-output-escaping="yes">&amp;iquest;Q</xsl:text>
							<xsl:number/>
						</xsl:otherwise>
						</xsl:choose>
						</sup>
						</b>
					</td>
					<td>
						<xsl:variable name="store">
						<a name="{@id}">
						<xsl:apply-templates/>
						</a>
						</xsl:variable>
						<xsl:variable name="store-nodelist" select="$store"/>
						<xsl:apply-templates select="$store-nodelist" mode="anchors-as-scripts"/>
					</td>
				</tr>
			</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>

	<xsl:template name="fulltext-button" match="/fulltext-button" mode="template">
		<xsl:if test=".//document/section[@type='body']">
			<a href="javascript:gotoTarget('fulltext')"><img border="0" src="{$ImagePath}/full.gif" alt="Full Text of this article in this browser"/></a>
			<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="abstract-button" match="/abstract-button" mode="template">
		<xsl:if test=".//document/header/summary">
			<a href="javascript:gotoTarget('abstract')"><img border="0" src="{$ImagePath}/full.gif" alt="Abstract of this article in this browser"/></a>
			<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="pdf-button" match="/pdf-button" mode="template">
		<xsl:if test=".//document/header/documentinfo/relatedgroup/related[@relationship='sibling' and @type='pages']/file[@type='pdf']/@name">
			<a href="javascript:gotoTarget('pdf')"><img border="0" src="{$ImagePath}/pdf.gif" alt="Article in PDF format for downloading and printing"/></a>
			<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
		</xsl:if>
	</xsl:template>


	<xsl:template name="notify-button" match="/notify-button" mode="template">
		<xsl:text disable-output-escaping="yes" >&lt;% if request("NavSendColleage") &lt;&gt;"" then %&gt;</xsl:text>	
			<a href="javascript:gotoTarget('notify')"><img src="{$ImagePath}/notify.gif" border="0" alt="Notify a colleague about this article"/></a>
			<img src="{$ImagePath}/unitx.gif" width="12" height="1"/>
		<xsl:text disable-output-escaping="yes" >&lt;% end if %&gt;</xsl:text>
	</xsl:template>

	<xsl:variable name="AbstractOnly"/>
</xsl:stylesheet>
