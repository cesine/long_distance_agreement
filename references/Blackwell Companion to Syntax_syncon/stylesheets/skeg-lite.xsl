<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="file://batchgate1\StyleS\Tables.xsl"/>
	<xsl:import href="file://batchgate1\StyleS\CommonUtils.xsl"/>
	<xsl:import href="file://batchgate1\StyleS\Symbols.xsl"/>
	<xsl:output method="html" indent="yes" encoding="windows-1252"/>
	<xsl:strip-space elements="*"/>
	
	<!-- updated 28/11/00 by ptw: 
		name thumbnails according to housestyle;
		make 'previews' display thumbnails of all objectgroups;
		remove tns-specific display of 'guidelines' sections;
		remove various tns-specific variables ($main, $existrefs);
		 -->
		 
	<!-- updated 28/11/00 by ptw: 
		internal links calling up popup!!! - fixed;
		simplified imagepreviews;
		popup refs;
		popup html tables
		jump from preview to first occurance of image in text;
		colour references markup & toggle **n.b. this can be streamlined!;
		added warning about use of <table> to meta class;
		-->
		 		
	<!-- updated 05/12/00 by ptw:
		take (sub)section anchors out of hidden metagroups (so there is something to jump to!);
		add conditional link to pdf version of file ($ pdfversion stores path of pdf);
		correct display & linking of thumbnails;
		add visual representation of <br/> in tables to meta class (so can toggle on/off);
		add <br/> tag in tables to new 'break' class so can toggle it's effect (as often want to delete);
		toggle the explanatory text of the toggle buttons to indicate current state;
		-->
		
	<!-- updated 07/12/00 by ptw:
		repaired the first occurrence widget;
		added in xsl commonutils & tables to replace mine;
		@class assigned to disguise internal links in popups (in template 'hrefs')... but may conflict with pre-existing @class?;
		objectgroup & objectsubgroup (& contents) added to document metadata;
		-->
		
	<!-- updated 08/12/00 by ptw:
		improve handling of metadata;
		catch abstracts;
		put [ ] round headings from the header;
		to do: try to put tooltips on special characters...?
		-->
		
	<xsl:variable name="popup" select="'default'"/><!--popup window name-->
	<xsl:variable name="images" select="'images/'"/><!--images path-->
	<xsl:variable name="pdfs" select="'pdf/'"/><!--pdf-files path-->
	<xsl:variable name="thumbs" select="'images/thumbnails/'"/><!--thumbnail images path-->
	<xsl:variable name="EntityPath" select="'http://www.blackwell-synergy.com/journals/entity-images'"/>
	<xsl:variable name="ins-template"/>
	<!--<xsl:variable name="" select=""/>-->

	
<!-- main template ************************************************************************* -->
	<xsl:template match="/">
		<html>
			<head>
			<META http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
			<title><xsl:value-of select="/content/contentinfo/titlegroup/title"/></title>
<script>
<!-- only works on IE (4+); use the document.classes.meta.all object in Netscape -->
<xsl:text><![CDATA[
function popupFigure(file, legend) {
var newwindow = window.open("","popup","scrollbars,resizable,height=400,width=525");
newwindow.document.write('<html><head><title>Figure</title>\n');
newwindow.document.write('<style type=\"text/css\">a.local {text-decoration:none; color:black;cursor:text}</style>\n');
newwindow.document.write('<script>function popupInsitu(id,height,width) {return}\n');
newwindow.document.write('function popupFigure(file, legend) {return}<'+'/script></head>\n');
newwindow.document.write('<body bgcolor=\"#ffffff\">\n');
newwindow.document.write('<p align=\"right\"><font size=\"-1\"><a href=\"javascript:self.close();\">');
newwindow.document.write('Close window</a></font></p>\n');
newwindow.document.write('<img src=\"' + file + '\"></p>\n');
newwindow.document.write('<p>' + legend + '</p>\n');
newwindow.document.write('<p align=\"right\"><font size=\"-1\"><a href=\"javascript:self.close();\">');
newwindow.document.write('Close window</a></font></p>\n');
newwindow.document.write('</body>\n</html>\n');
newwindow.document.close();
newwindow.focus();
}
]]></xsl:text>

<xsl:text><![CDATA[
function popupInsitu(id,height,width) {
var newwindow = window.open("","popup","scrollbars,resizable,height="+height+",width="+width);
newwindow.document.write('<html><head><title>Figure</title>\n');
newwindow.document.write('<style type=\"text/css\">a.local {text-decoration:none;color:black;cursor:text}</style></head>\n');
newwindow.document.write('<script>function popupInsitu(id,height,width) {return}\n');
newwindow.document.write('function popupFigure(file, legend) {return}<'+'/script></head>\n');
newwindow.document.write('<body bgcolor=\"#ffffff\">\n');
newwindow.document.write(document.all.item(id).outerHTML);
newwindow.document.write('</body>\n</html>\n');
newwindow.document.close();
newwindow.focus();
}
]]></xsl:text>

function jumpTo(id) {
document.location.hash = id;

}

			</script>			
			</head>
			<body bgcolor="#ffffff">
			<a name="top"/>
				<!--fulltext-->
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="document">
				<table cellPadding="0" cellSpacing="0" width="100%" border="0">
					<tr>
<!-- lefthand column ******************************** -->
						<td vAlign="top" bgcolor="#ffffff" width="160">
							<table width="100%" cellpadding="3" cellspacing="3" border="0">
							<xsl:variable name="pdfversion" select="header/documentinfo/relatedgroup/related[@relationship = 'sibling' and @type = 'pages']/file/@name"/>
							<xsl:if test="$pdfversion">
								<tr>
									<td bgcolor="#660099">
										<a target="{$popup}" href="{$pdfs}{$pdfversion}">
											<font size="3" face="Arial, Helvetica, sans-serif" color="#ffffff">
												<b>PDF version</b>
											</font>
										</a>
									</td>
								</tr>
							</xsl:if>
									<tr>
										<td>
											<font size="3" face="Arial, Helvetica, sans-serif">
												<b>Contents</b>
											</font>
										</td>
									</tr>
								<xsl:call-template name="nav"/>
								<tr>
									<td>
										<br/>
										<!-- floating graphics, if there are any -->
								<xsl:if test="/content//objectgroup/object/@position = 'floating'">
								<b>Image Previews</b>
								<xsl:for-each select="/content//objectgroup/object[@position = 'floating']">
									<xsl:call-template name="previews"/>
								</xsl:for-each>
								</xsl:if>
								</td>
								</tr>
							</table>
						</td>
						<td vAlign="top" width="*">
							<font size="5" color="#660099" face="Arial, Helvetica, sans-serif">
							<!--<xsl:variable name="title">
								<xsl:apply-templates select="header/titlegroup/title[@type = 'document']"/>
							</xsl:variable>
								<b><xsl:value-of select="substring($title,8)"/></b>-->
								<b><xsl:apply-templates select="header/titlegroup"/></b>
							</font>
							<br />	<hr />
							<!-- author -->
							<i><xsl:call-template name="author"/><xsl:call-template name="space"/>
							<xsl:call-template name="summarist" /></i><br/>
							<xsl:if test="header/summary">
							<font size="5" color="#660099" face="Arial, Helvetica, sans-serif">Abstract</font>
								<xsl:for-each select="header/summary">
									<xsl:apply-templates/>
								</xsl:for-each>
								<hr />
							</xsl:if>
							<!-- document text -->
								<xsl:apply-templates/>
							<!-- end of main body text -->
							<p align="right"><a href="#top">Back to the top</a><xsl:call-template name="nbsp" /></p>
						</td>
					</tr>
				</table>
	</xsl:template>

<xsl:template name="showHeadings"/>

<xsl:template match="section | subsection | objectgroup | objectsubgroup | objectgroup/object | objectsubgroup/object">
	<xsl:apply-templates/>
</xsl:template>

<!-- nav menu specifics ****************************************************-->

	<xsl:template name="nav">
		<xsl:apply-templates select="." mode="wholeDocument"/>
	</xsl:template>

<xsl:template match="text()" mode="wholeDocument"/>
		
<xsl:template match="heading" mode="wholeDocument">
	<tr>
		<td>
			<xsl:if test="ancestor::summary">[</xsl:if>
			<a href="#{@id}">
				<xsl:call-template name="headingTextOnly"/>
			</a>
			<xsl:if test="ancestor::summary">]</xsl:if>
		</td>
	</tr>
</xsl:template>

<xsl:template match="section/titlegroup/title" mode="wholeDocument">
	<tr>
		<td>
			<xsl:if test="ancestor::summary">[</xsl:if>
			<a href="#{ancestor::section[1]/@id}">
				<b><xsl:apply-templates/></b>
			</a>
			<xsl:if test="ancestor::summary">]</xsl:if>
		</td>
	</tr>
</xsl:template>

<xsl:template match="header/summary"/>

<xsl:template match="header | contentinfo | publisherinfo"/>

<xsl:template match="abstractinfo | bookdetails | copyright | correspondent | definitiongroup | documentinfo | footnotegroup | history | keywordgroup | namegroup | titlegroup">
	<p>
		<xsl:value-of select="name(.)"/><xsl:call-template name="space"/>
		(<xsl:for-each select="@*">
		@<xsl:value-of select="name(.)"/>: <xsl:value-of select="."/><xsl:if test="position() != last()">;</xsl:if><xsl:call-template name="space"/>
		</xsl:for-each>)<xsl:call-template name="space"/>
		<xsl:apply-templates/>
	</p>
</xsl:template>

<!-- variables *********************************************** -->

	<xsl:variable name="doctype">
	<!-- save result of check to see whether portal/book/journal (to check always looking in same place!) -->
	<!-- to ensure doctype is in lowercase, and taken from the common source of /content/contentinfo/titlegroup/title/@type -->
		<xsl:value-of select="translate(/content/contentinfo/@type, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
	</xsl:variable>

	<xsl:variable name="myname">
	<!-- basename of html document (for ease of archiving, if the document is a child the html name should be of the parent) -->
	<!-- graphics files are listed as 'children' but with type 'object' - ignore them for the purposes of this variable -->
		<xsl:choose>
			<xsl:when test="/content/document/header/documentinfo/relatedgroup/related[@relationship = 'child' and @type != 'object']">
				<xsl:value-of select="substring-before(/content/document/header/documentinfo/relatedgroup/related[@relationship = 'child' and @type != 'object']/file/@name , '.')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="substring-before(/content/document/header/documentinfo/relatedgroup/related[@relationship = 'self']/file/@name , '.')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

<!-- tools **************************************************************************-->

<xsl:template name="doctitle">
	<xsl:value-of select="/content/document/header/titlegroup/title[@type = 'document']" />
</xsl:template>

	<xsl:template name="author">
		<xsl:choose>
			<!-- authors in 'portal' docs are in a diff place from standalones -->
			<xsl:when test="$doctype = 'portal'">
				<xsl:variable name="howmany" select="count(/content/document/section[@type = 'source']//reference//name[@type = 'author'])"/>
				Author<xsl:if test="$howmany &gt; 1">s</xsl:if>:
				<xsl:for-each select="/content/document/section[@type = 'source']//reference//name[@type = 'author']">
					<xsl:call-template name="names">
						<xsl:with-param name="howmany" select="$howmany"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="howmany" select="count(/content/document/header/namegroup/name[@type = 'author'])"/>
				Author<xsl:if test="$howmany &gt; 1">s</xsl:if>:
				<xsl:for-each select="/content/document/header/namegroup/name[@type = 'author']">
					<xsl:call-template name="names">
						<xsl:with-param name="howmany" select="$howmany"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="summarist">
		<xsl:choose>
			<!-- if there is a summarist -->
			<xsl:when test="//name[@type = 'summarist']">
				<xsl:variable name="howmany" select="count(//name[@type = 'summarist'])"/>
				(abridged by 
				<xsl:for-each select="//name[@type = 'summarist']">
					<xsl:call-template name="names">
						<xsl:with-param name="howmany" select="$howmany"/>
					</xsl:call-template>
				</xsl:for-each>)
			</xsl:when>
			<xsl:otherwise />
		</xsl:choose>
	</xsl:template>

	<xsl:template match="name" /><!-- nb this is captured & expanded elsewhere in the context of reference -->
	
	<xsl:template match="namegroup">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name="names">
	<!-- given a context, sorts out and punctuates names in a namegroup -->
		<xsl:param name="howmany"/>
		<xsl:apply-templates select="forenames"/>
		<xsl:call-template name="nbsp"/>
		<xsl:apply-templates select="surname"/>
		<xsl:choose>
			<!-- authors (formatting for different numbers of authors) -->
			<xsl:when test="$howmany &gt; '1'">
				<xsl:choose>
					<xsl:when test="position() + 1 = $howmany"> &amp; </xsl:when>
					<xsl:when test="position() = $howmany"/>
					<xsl:otherwise>, </xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
		
	<xsl:template name="headerref">
		<xsl:variable name="howmany" select="count(/content/document/header/namegroup/name[@type = 'author'])"/>
		<xsl:for-each select="/content/document/header/namegroup/name[@type = 'author']">
			<xsl:call-template name="names">
				<xsl:with-param name="howmany" select="$howmany"/>
			</xsl:call-template>
		</xsl:for-each>
		<xsl:call-template name="space"/>
		<!-- book date (year only) -->(<xsl:value-of select="substring(/content/document/header/documentinfo/date/@date,'1','4')"/>)
		<!-- chapter/article title -->	<xsl:value-of select="/content/document/header/titlegroup/title[@type != 'surtitle']"/>. In:<xsl:call-template name="space"/>
		<!-- book/journal title --><i><xsl:value-of select="/content/contentinfo/titlegroup/title[@type != 'subtitle']"/><xsl:if test="/content/contentinfo/titlegroup/title[@type = 'subtitle']">: <xsl:value-of select="/content/contentinfo/titlegroup/title[@type = 'subtitle']"/></xsl:if></i><xsl:call-template name="space"/>
		<!-- publisher --><xsl:value-of select="/content/publisherinfo/publisher"/>,<xsl:call-template name="space"/>
		<!-- place --><xsl:value-of select="/content/publisherinfo/address"/>.
		<xsl:if test="$doctype = 'journal'">
			<!-- volume --><b><xsl:value-of select="/content/document/header/documentinfo/pagedetails/volume"/></b><xsl:call-template name="space"/>
			<!-- issue -->(<xsl:value-of select="/content/document/header/documentinfo/pagedetails/issue"/>)<xsl:call-template name="space"/>
		</xsl:if>
		<!-- start/end pages --><xsl:value-of select="/content/document/header/documentinfo/pagedetails/page[@type='first']"/>-<xsl:value-of select="/content/document/header/documentinfo/pagedetails/page[@type='last']"/>.
	</xsl:template>

	<xsl:template name="objects"><!-- currently only for gifs -->
	<!-- puts images inline; see template 'floaters' for thumbnail treatments -->
		<xsl:if test="file[@type='gif']"><h1>report this error!</h1>
			<p>
				<a>
					<xsl:attribute name="name"><xsl:value-of select="file/@id"/></xsl:attribute>
				</a>
				<img border="0">
					<xsl:attribute name="src"><xsl:value-of select="$images"/><xsl:value-of select="file/@name"/></xsl:attribute>
				</img>
				<xsl:if test="alternativeversion/file[@type = 'pdf']">
					<br/>
					<a target="{$popup}">
						<xsl:attribute name="href"><xsl:value-of select="alternativeversion/file/@name"/></xsl:attribute>
		View printable version</a>
				</xsl:if>
				<br/>
				
			</p>
		</xsl:if>
	</xsl:template>
	
	<!-- image previews **************************************************************** -->
		
	<xsl:template name="previews">
		<!-- inserts a thumbnail image in the document (held in images/thumbnails) linked to main image in separate popup -->
		<!-- uses thumbnail of each image or in the case of a table a single 'table thumbnail' image -->
		<!-- context: document/objectgroup/object[@position = 'floating'] -->
		<xsl:variable name="thumbnail">images/thumbnails/<xsl:value-of select="substring-before(objectsource/file/@name, '.')"/>_thumb.<xsl:value-of select="substring-after(objectsource/file/@name, '.')"/></xsl:variable>
		<p>
			<a>
				<xsl:call-template name="hrefs"/>
				<xsl:choose>
					<xsl:when test="@type = 'table'">
						<font face="sans-serif" size="+1"><b>HTML table</b></font><br/>
						<xsl:call-template name="nbsp"/>
					</xsl:when>
					<xsl:otherwise>
						<img border="0" width="150" src="{$thumbnail}"/>
					</xsl:otherwise>
				</xsl:choose>
				<br/><font size="-1">Click to view full size</font>
			</a><br/>
			<i><span id="{@id}_leg"><xsl:apply-templates select="legend" mode="justLegend"/></span></i>
			<xsl:if test="alternativeversion/objectsource//file[@type = 'pdf']">
				<br/>
				<a target="tns" href="{alternativeversion/objectsource//file[@type = 'pdf']/@name}">
					View printable version
				</a>
			</xsl:if>
			<!--<xsl:if test="objectsource/insitu">
				<xsl:call-template name="floatingtable"/>
			</xsl:if>-->
			<br/>
			<a href="#caller_{@id}">
				<font size="-1">First occurrence...</font>
			</a>
		</p>
	</xsl:template>
	
	<xsl:template match="legend">
		<span class="legend"><xsl:apply-templates/></span>
	</xsl:template>
				
	<xsl:template match="legend" mode="justLegend"><!-- suppresses paragraph spacing -->
		<xsl:for-each select="*">
			<xsl:apply-templates/>
		</xsl:for-each>
	</xsl:template>
	
	<!-- references ************************************************** -->
	
	<xsl:template name="refs"><!-- assumes the context of <reference>...</reference> -->
	<!-- preserves ordering & punctuation of xml -->
			<!-- internal link to text ref -->
			<a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
			<xsl:apply-templates/>
	</xsl:template>
		
	<xsl:template match="bibliography">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="reference">
		<!-- id_ added as IE confuses 'name' and 'id' - this is to make id's unique for popupInsitu script -->
		<p id="id_{@id}">
			<!--<xsl:call-template name="back" /> removed cos can popup & is meaningless in popup window
			<xsl:call-template name="nbsp"/> -->
			<xsl:call-template name="refs" />
		</p>
	</xsl:template>

	<xsl:template match="volume">
		<span class="rvolume" onMouseOver="window.status='{name(.)}';return true" onMouseOut="window.status=' ';return true"><b><xsl:apply-templates/></b></span>
	</xsl:template>
	
	<xsl:template match="reference/title[@type != 'document']">
		<span class="rtitle" onMouseOver="window.status='{name(.)}';return true" onMouseOut="window.status=' ';return true"><i><xsl:apply-templates/></i></span>
	</xsl:template>
	
	<xsl:template match="reference/title[@type = 'document'] | corporatename | miscellaneoustext | nametitle | forenames | surnameprefix | surname | qualifications | date | address | etal | page | supplement | issue | publisher | inpress | edition">
		<span class="r{name(.)}" onMouseOver="window.status='{name(.)}';return true" onMouseOut="window.status=' ';return true"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="reference/name | reference/namegroup/name">
		<xsl:apply-templates/>
	</xsl:template>

	
	<xsl:template match="externallink[@type='pubmed']"><xsl:text disable-output-escaping="yes"> </xsl:text>
			<a target="{$popup}"><xsl:attribute name="href"><xsl:text><![CDATA[http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=]]></xsl:text><xsl:value-of select="@id"/><xsl:text><![CDATA[&dopt=Abstract]]></xsl:text></xsl:attribute><font size="-1">link to pubmed</font></a>
	</xsl:template>
	
	<xsl:template match="externallink[@type='url']">
		<a target="{$popup}">
			<xsl:choose>
				<xsl:when test="@id"><xsl:attribute name="href"><xsl:value-of select="@id"/></xsl:attribute></xsl:when>
				<xsl:otherwise><xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute></xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	
	<xsl:template match="link">
		<xsl:variable name="link">
			<root>
				<xsl:copy-of select="id(@rid)"/>
			</root>	
		</xsl:variable>
		<xsl:variable name="link-nodes" select="$link"/>
		<!-- this line only caters for single-value hrefs: need to amend to do something sensible with multi's -->
		<xsl:call-template name="linkToCaller"/>
		<a>
			<xsl:for-each select="$link-nodes/root/*[1]"><xsl:call-template name="hrefs"/></xsl:for-each>
			<!--<xsl:if test="id(@rid)/objectsource//file">
				<xsl:attribute name="target"><xsl:value-of select="$popup"/></xsl:attribute>
			</xsl:if>-->
			<xsl:apply-templates/>
		</a>		
		<!-- if multi-value href... -->
		<xsl:for-each select="$link-nodes/root/*">
			<xsl:if test="position() &gt; '1'">
				<xsl:text> </xsl:text>
				<xsl:call-template name="linkToCaller"/>
				<sup>[<a><xsl:call-template name="hrefs"/>
						<xsl:value-of select="position()"/>
					</a>]</sup>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="id(@rid)/self::objectsubgroup">
			<xsl:for-each select="$link-nodes/root/objectsubgroup/object">
				<xsl:text> </xsl:text>
				<xsl:call-template name="linkToCaller"/>
					<sup>[<a><xsl:call-template name="hrefs"/>
							<xsl:value-of select="@id"/>
						</a>]</sup>
			</xsl:for-each>		
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="linkToCaller">
		<!-- creates a link from a preview to the first occurance of the link in the text -->
		<!-- i.e. if it's the first occurance of this @rid and there is a file that will appear in 'image previews' -->
		<!--<b><xsl:value-of select="name(.)"/>: <xsl:value-of select="count(preceding::*[@rid = current()/@rid])"/></b>-->
		<xsl:if test="not(count(preceding::*[@rid = current()/@rid])) and id(@rid)/objectsource//file">
			<a name="caller_{@rid}"/>
		</xsl:if>
	</xsl:template>
		
	<xsl:template name="hrefs">
		<!-- called by match to <link> template, given context of linked object -->
		<!-- this @name assigned to disguise internal links in popups... but may conflict with pre-existing @name? -->
		<xsl:if test="not(objectsource//file)"><xsl:attribute name="class">local</xsl:attribute></xsl:if>
		<xsl:choose>
			<xsl:when test="(substring(@id , 1 , 1) = 'f' or substring(@id , 1 , 1) = 't') and objectsource//file">
				<!-- a figure or a table which is a graphic -->
				<!--<xsl:variable name="legend">'<xsl:apply-templates select="legend"/>'</xsl:variable>-->
				<xsl:variable name="legend">document.all.item('<xsl:value-of select="@id"/>_leg').innerHTML</xsl:variable>
				<xsl:attribute name="href">javascript:popupFigure('<xsl:value-of select="$images"/><xsl:value-of select="objectsource/file/@name"/>',<xsl:value-of select="$legend"/>)</xsl:attribute>
			</xsl:when>
			<xsl:when test="substring(@id , 1 , 1) = 't' and objectsource/insitu">
				<!-- an html table -->
			<xsl:attribute name="href">javascript:popupInsitu('id_<xsl:value-of select="@id"/>',300,500)</xsl:attribute>
			</xsl:when>
			<xsl:otherwise><xsl:attribute name="href">javascript:popupInsitu('id_<xsl:value-of select="@id"/>',100,400)</xsl:attribute>
			<xsl:attribute name="onDblClick">jumpTo('<xsl:value-of select="@id"/>')</xsl:attribute>
			</xsl:otherwise>
			<!--<xsl:otherwise><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute></xsl:otherwise>-->
		</xsl:choose>
	</xsl:template>
	
<xsl:template match="heading">
	<a>
		<xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
	</a>

	<xsl:element name="h{@level + 1}">
	<xsl:call-template name="showHeadings"/>
		<font face="Arial, Helvetica, sans-serif">
			<xsl:apply-templates/>
		</font>
		<xsl:call-template name="nbsp"/>
		<xsl:call-template name="top" />
	</xsl:element>
</xsl:template>

<xsl:template name="headingTextOnly">
	<xsl:apply-templates/>
</xsl:template>
	
	<xsl:template match="quotation">
		<blockquote>
			<i>
				<xsl:apply-templates/>
			</i>
		</blockquote>
	</xsl:template>
	
	<xsl:template match="displaychange">
		<blockquote>
			<font color="#993366">
				<xsl:apply-templates/>
			</font>
		</blockquote>
	</xsl:template>

<!-- listgroup specifics ************************************************* -->
	
	<xsl:template match="listgroup"><!-- calls start_ul & end_ul -->
		<xsl:variable name="numberlist" select="string(number(li[1]/p[1]/number)) != 'NaN'"/>
		<!-- test to see if list is numbered or bulleted-->
		<xsl:for-each select="li">
		<xsl:call-template name="start_ul">
			<xsl:with-param name="position">
				<xsl:choose>
					<xsl:when test="position() = '1'">none</xsl:when>
					<xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
			<xsl:with-param name="numberlist" select="$numberlist"/>
		</xsl:call-template>
		<xsl:apply-templates/><!-- print out the contents of the li tag -->
		<xsl:call-template name="end_ul">
			<xsl:with-param name="position">
				<xsl:choose>
					<xsl:when test="position() = last()">none</xsl:when>
					<xsl:otherwise><xsl:value-of select="position()"/></xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
			<xsl:with-param name="numberlist" select="$numberlist"/>
		</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="start_ul"><!-- called by listgroup -->
		<xsl:param name="position"/>
		<xsl:param name="numberlist"/>
		<xsl:variable name="step" select="@level - parent::listgroup/li[$position - '1']/@level"/>
		<xsl:variable name="uls">
			<xsl:choose>
				<xsl:when test="$numberlist">
					<xsl:text disable-output-escaping="yes"><![CDATA[<ol><ol><ol><ol><ol><ol>]]></xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes"><![CDATA[<ul><ul><ul><ul><ul><ul>]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$position = 'none'"><!-- to catch the first element, which has no preceding element -->
				<xsl:value-of select="substring($uls , 1 , 4 * @level)" disable-output-escaping="yes"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$step &gt; '0'">
					<xsl:value-of select="substring($uls , 1 , 4 * $step)" disable-output-escaping="yes"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="end_ul"><!-- called by listgroup -->
		<xsl:param name="position"/>
		<xsl:param name="numberlist"/>
		<xsl:variable name="step" select="@level - parent::listgroup/li[$position + '1']/@level"/><!-- nb. sign change -->
		<xsl:variable name="uls">
			<xsl:choose>
				<xsl:when test="$numberlist">
					<xsl:text disable-output-escaping="yes"><![CDATA[</ol></ol></ol></ol></ol></ol>]]></xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes"><![CDATA[</ul></ul></ul></ul></ul></ul>]]></xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$position = 'none'"><!-- to catch the final element, which has no following element -->
				<xsl:value-of select="substring($uls , 1 , 5 * @level)" disable-output-escaping="yes"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="$step &gt; '0'">
					<xsl:value-of select="substring($uls , 1 , 5 * $step)" disable-output-escaping="yes"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="li/p">
	<!-- catches all <li>s not caught by template below-->
		<li>
			<xsl:apply-templates />
		</li>
	</xsl:template>
	
	<xsl:template match="section[not(p)]/listgroup/li[not(@level &gt; 1)]/p">
	<!-- add a linespace after each level 1 <li> tag [this template overgeneralizes & needs to be revised] -->
		<li>
			<xsl:apply-templates/>
		</li>
		<br/><xsl:call-template name="nbsp"/>
	</xsl:template>
	
	<xsl:template match="li/p/number"><!-- context in html of list will add automatic bullet/number, so suppress these -->
		<xsl:choose>
			<xsl:when test="contains(. , '&#8226;')" />
			<xsl:when test="boolean(number(.))"/>
			<xsl:otherwise>
				<b><xsl:apply-templates /></b>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="number">
		<b><xsl:apply-templates /></b>
	</xsl:template>
	
	<xsl:template match="p | b | i | br | u | sup">
		<xsl:copy><xsl:apply-templates/></xsl:copy>
	</xsl:template>
	
	<!--<xsl:template match="row//br">
		<xsl:text> </xsl:text><font color="red"><xsl:text disable-output-escaping="yes">&amp;not;</xsl:text></font><br class="break" />
	</xsl:template>-->

	
<!-- table specifics ******************************************-->

	
	<xsl:template match="table">
		<!--<div class="meta"><font size="+1" color="red">&lt;Table&gt; is no longer used in DTD4</font></div>-->
		<xsl:apply-templates select="legend"/>
		<xsl:apply-templates select="tbl"/>
	</xsl:template>
		
	<xsl:template match="object[@type='table']">
		<div id="id_{@id}">
			<a name="{@id}"/>
			<xsl:apply-templates select="legend"/>		
			<xsl:for-each select="objectsource/insitu">
				<xsl:apply-templates/>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template match="x">
		<xsl:choose>
			<xsl:when test="string-length(normalize-space(.)) = '0'"><xsl:text> </xsl:text></xsl:when>
			<xsl:otherwise><xsl:apply-templates/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- comments: expand this?? ************************** -->
	<xsl:template match="commentgroup"/>
	
	<xsl:template name="nbsp">
	<!-- insert a non-breaking space -->
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
	</xsl:template>

	<xsl:template name="space">
	<!-- insert a space -->
		<xsl:text> </xsl:text>
	</xsl:template>
	
	<xsl:template match="file"> 
		<xsl:call-template name="file" />
	</xsl:template>
	
	<xsl:template name="file">
	<xsl:if test="@type='gif'">
		 <p><a><xsl:attribute name="name"><xsl:value-of select="@id" /></xsl:attribute></a>
			<img border="0">
				<xsl:attribute name="src"><xsl:value-of select="$images"/><xsl:value-of select="@name"/>.<xsl:value-of select="@type"/></xsl:attribute>
			</img>
		<xsl:if test="alternativeversion/file[@type = 'pdf']">
			<br /><a target="{$popup}"><xsl:attribute name="href"><xsl:value-of select="alternativeversion/file/@name"/>.pdf</xsl:attribute>
			View printable version</a>
		</xsl:if>
		</p>
	</xsl:if>
	</xsl:template>
	
	<xsl:template name="top">
		<a href="#top">^</a>
	</xsl:template>
	
	<xsl:template name="back">
		<a href="javascript:history.back()">^</a>
	</xsl:template>
	
	<xsl:template name="title">
		<xsl:call-template name="plaintitle" />
		<xsl:call-template name="nbsp" />
		<xsl:call-template name="top" />
	</xsl:template>
	
	<xsl:template match="titlegroup">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template name="plaintitle">
		<!--<font size="5" color="#660099" face="Arial, Helvetica, sans-serif"><b><xsl:apply-templates select="* | text()"/></b></font>-->
		<font size="5" color="#660099" face="Arial, Helvetica, sans-serif"><b><xsl:apply-templates/></b></font>
	</xsl:template>
	
	<xsl:template match="title" >
		<xsl:call-template name="title"/>
	</xsl:template>
	
	<xsl:template match="subsection[@border = 'all']">
	<!-- display change -->
		<p>
			<table width="95%" cellspacing="1" cellpadding="5" border="0" bgcolor="#000000">
				<tr>
					<td bgcolor="#ffffff">
						<xsl:apply-templates/>	
					</td>
				</tr>
			</table>
		</p>
	</xsl:template>
	
	<xsl:template match="subsection[@border = 'all']/heading">
		<font size="3" color="#660099" face="Arial, Helvetica, sans-serif">
			<b><xsl:apply-templates/></b>
		</font>
	</xsl:template>
	
	<xsl:template match="object">
		<!--<xsl:apply-templates/> might need to reinstate this...-->
	</xsl:template>
	
	<xsl:template match="objectsource">
		<p>
			<a target="{$popup}">
				<xsl:attribute name="name"><xsl:value-of select="parent::object/@id"/></xsl:attribute>
			</a>
			<img border="0">
				<xsl:attribute name="src"><xsl:value-of select="$images"/><xsl:value-of select="file/@name"/></xsl:attribute>
			</img>
			<!--<br/>
			<xsl:apply-templates select="parent::object/legend" mode="justLegend"/>-->
		</p>
	</xsl:template>

</xsl:stylesheet>
