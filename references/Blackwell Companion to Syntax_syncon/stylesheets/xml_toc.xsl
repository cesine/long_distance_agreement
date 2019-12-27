<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
							xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
							xmlns:msxsl="urn:schemas-microsoft-com:xslt"
							extension-element-prefixes="msxsl" >
							
	<!--<xsl:output method="xml" doctype-public="-//BLACKWELL PUBLISHING GROUP//DTD 4.0//EN" doctype-system="\\oxford\vol01\bpgdtd\4-0\bpg4-0.dtd" indent="yes"/>-->

	<xsl:output method="xml" 
							doctype-public="-//BLACKWELL PUBLISHING GROUP//DTD 4.0//EN" 
							doctype-system="\\oxford\vol01\bpgdtd\4-0\bpg4-0.dtd" 
							omit-xml-declaration="yes" 
							indent="yes"/>

	<xsl:strip-space elements="*"/>
	<xsl:preserve-space elements="x"/>
			
	<!-- amended: 17-11-2000 by PTW 
		  select contents of volume & issue tags rather than their @number
		  amended listing:issueTOC to listing_issueTOC -->
		
	<!-- amended: 13-12-2000 by PTW
		  if a link is removed from a name/titlegroup because it has no antecedent
		  its contents are now deleted if they are not enclosed in content tags (to prevent
		  errors such as <span> inside <name>; and to delete redundant (linkless) link markers -->
		  
	<!-- amended: 11-01-2001 by PTW
			inserted processing instruction into output document
			added 'v' and 'i' prefix to 'volume' and 'issue' elements in relatedgroup filename
			removed id from externallink in pdf & fulltext version links
			-->	

	<!-- amended: 16-01-2001 by PTW
			to deal with multipart documents (adds links to the documents inside a multipart)
			-->	
			
	<!-- amended: 17-01-2001 by PTW
			correction: now only inserts external link to pdf if there is a pdf to link to...
			also preserves tocheadings with an @level > 1 (puts them in the format level1/level2/... as recommended in dtd)
			n.b. the tocs are only grouped according to level 1 tocheadings at the moment
			remove the msxsl namespace declaration from the <content> tag
			amended to suit the new layout of the <tocentry> (as of 17-01-2001)
			hard-coded in the xml declaration as MS parser automatically declares encoding as UTF-16
			-->
			
		<!-- amended: 19-01-2001 by PTW
			fixed 'echoing' of xml declaration
			-->	

		<!-- amended: 02-02-2001 by PTW
			fixed incorrect ordering by page of tocentries -->	
			
		<!-- amended: 15-02-2001 by PTW
			fixed author names -->	
			
		<!-- amended: 19-02-2001 by PTW
			fixed expanded 'br' tags
			-->	
		<!-- amended: 22-02-2001 by PTW
			expanded <date> to include text of date as well as attribute
			fixed bug whereby entries w/o <tocheading> were ignored: 
			now a default tocheading @level='2' of 'Original Articles' is assigned 
			-->	
		<!-- amended: 14-03-2001 by PTW
			xsl now allows entities in <tocheading>
			-->	
		<!-- amended: 29-03-2001 by PTW
			fixed logic of mode ridcheck
			-->	
		
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
			
	<xsl:template match="filelist">
		<!--compile TOClist of articles based on filenames in filelist.xml-->
		<xsl:variable name="rawTOCs">
			<tempRoot>
				<xsl:for-each select="file">
					<xsl:call-template name="TOCentry"/>
				</xsl:for-each>
			</tempRoot>
		</xsl:variable>
		<!-- sort by page order -->
		<xsl:variable name="sortedTOCs">
			<xsl:for-each select="msxsl:node-set($rawTOCs)/tempRoot">
				<xsl:copy>
					<xsl:for-each select="tocentry">
						<xsl:sort select="pagedetails/page[@type='first']" data-type="number"/>
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:copy>
			</xsl:for-each>
		</xsl:variable>
		<!-- deduped list of level 1 tocheadings in page-number order-->
		<xsl:variable name="h1" select="msxsl:node-set($sortedTOCs)/tempRoot/tocentry/tocheading[@level='1' and not(. = preceding::tocheading)]"/>
		<!-- arrange tocs under correct subheadings; currently level 1 only -->
		<xsl:variable name="orderedTOCs">
			<section id="s1">
				<xsl:for-each select="$h1">
					<subsection level="1">
						<heading level="1">
							<!--<xsl:value-of select="@title"/>-->
							<xsl:apply-templates/>
						</heading>
						<xsl:for-each select="msxsl:node-set($sortedTOCs)/tempRoot/tocentry[tocheading = current()]">
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</subsection>
				</xsl:for-each>
			</section>
		</xsl:variable>
		<!-- create xml holder-->
		<!--<xsl:copy-of select="$orderedTOCs"/>-->
		<xsl:variable name="done">
			<content dtdver="4.0">
				<xsl:for-each select="document(file[1])/content">
					<xsl:copy-of select="publisherinfo"/>
					<xsl:copy-of select="contentinfo"/>
				</xsl:for-each>
				<document sequence="1" type="listing_issueTOC">
					<xsl:call-template name="header"/>
					<!-- insert tocs, assign final ids & delete <temp> -->
					<xsl:apply-templates select="msxsl:node-set($orderedTOCs)"/>
				</document>
			</content>
		</xsl:variable>
		<!-- preserve entities -->
		<xsl:call-template name="xmlHeader"/>
		<xsl:apply-templates select="msxsl:node-set($done)" mode="output"/>
	</xsl:template>
	
<!-- ****** mode="output": read xml document into result tree, escape entities -->
		
	<xsl:template match="symbol" mode="output">
		<xsl:call-template name="preserve-entity"/>
	</xsl:template>
	
	<xsl:template name="preserve-entity">
		<xsl:text disable-output-escaping="yes">&amp;</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>;</xsl:text>
	</xsl:template>
	
	<!-- ensures 'empty' tags are not expanded with cosmetic linebreaks etc. -->
	<xsl:template match="br | softbr" mode="output">
		<xsl:element name="{name(.)}"/>
	</xsl:template>

	<xsl:template match="*" mode="output">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="output"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="x[not(text())]">
		<x><xsl:text disable-output-escaping="yes"> </xsl:text></x>
	</xsl:template>
		
<!-- ******  -->
	
	<xsl:template match="*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="heading">
		<xsl:call-template name="copyWithID"/>
	</xsl:template>
	
	<xsl:template match="subsection">
		<xsl:call-template name="copyWithID">
			<xsl:with-param name="prefix" select="'ss'"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="tocentry">
		<xsl:call-template name="copyWithID">
			<xsl:with-param name="prefix" select="'te'"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- ********* named templates -->
	
	<xsl:template name="copyWithID">
	<!-- copies node and assigns ID according to order of elements of this type in the whole document -->
		<xsl:param name="prefix" select="substring(name(),1,1)"/>
		<xsl:variable name="num">
			<xsl:number level="any"/>
		</xsl:variable>
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:attribute name="id"><xsl:value-of select="$prefix"/><xsl:value-of select="$num"/></xsl:attribute>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="header">
		<!-- taken abitrarily from first file in list: completed tocs inserted with call to insertTOCs-->
		<xsl:for-each select="document(file[1])/content">
			<xsl:choose>
				<xsl:when test="documentgroup">
					<xsl:for-each select="documentgroup">
						<xsl:call-template name="buildHeader"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="document">
						<xsl:call-template name="buildHeader"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="buildHeader">
		<header>
			<documentinfo language="{header/documentinfo/@language}">
				<idgroup>
					<documentid type="bsl" id="{generate-id()}"/>
				</idgroup>
				<relatedgroup>
					<related relationship="self" type="listing:issueTOC">
						<file type="xml">
							<xsl:attribute name="name"><xsl:value-of select="/content/contentinfo/contentcode"/>_v<xsl:value-of select="header/documentinfo/pagedetails/volume"/>_i<xsl:value-of select="header/documentinfo/pagedetails/issue"/>_toc.xml</xsl:attribute>
						</file>
					</related>
				</relatedgroup>
				<!--<date date="{header/documentinfo/date/@date}"/>-->
				<xsl:copy-of select="header/documentinfo/date"/>
				<pagedetails>
					<volume><xsl:value-of select="header/documentinfo/pagedetails/volume"/></volume>
					<issue><xsl:value-of select="header/documentinfo/pagedetails/issue"/></issue>
				</pagedetails>
			</documentinfo>
			<titlegroup>
				<title type="document">Table of Contents</title>
			</titlegroup>
		</header>
	</xsl:template>
	
	<xsl:template name="TOCentry">
		<!--TOC entries assembled / context set according to whether the document is simple or multipart -->
		<!-- context is the current filename -->
		<xsl:for-each select="document(.)/content">
			<xsl:choose>
				<xsl:when test="documentgroup">
					<xsl:for-each select="documentgroup">
						<xsl:call-template name="buildTOCentry"/>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="document">
						<xsl:call-template name="buildTOCentry"/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="buildTOCentry">
		<!-- ***entry details***-->
		<!-- called by 'TOCentry' within the context of document(current)/content/document(group) -->
		<xsl:variable name="articleID" select="header/documentinfo/idgroup/documentid[@type='bsl']/@id"/>
		<!-- append to id values to keep them unique outside their source file  -->
		<tocentry type="{@type}">
			<xsl:copy-of select="header/documentinfo/idgroup"/>
			<xsl:copy-of select="header/documentinfo/pagedetails"/>
			<xsl:copy-of select="header/documentinfo/date"/>
			<xsl:copy-of select="/contentinfo/contentcode"/>
			<xsl:choose>
				<xsl:when test="header/documentinfo/tocheading">
					<xsl:for-each select="header/documentinfo/tocheading">
						<xsl:sort select="@level"/>
						<!--<xsl:copy-of select="."/>-->
						<xsl:copy>
							<xsl:if test="not(@level)"><xsl:attribute name="level">1</xsl:attribute></xsl:if>
							<xsl:copy-of select="* | text()"/>
						</xsl:copy>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<tocheading level="1">Original Articles</tocheading>
				</xsl:otherwise>
			</xsl:choose>
			<!-- ***article title & authors (text containing @(r)id) ***-->
			<xsl:variable name="updateRids">
				<xsl:for-each select="header/titlegroup | header/namegroup">
					<xsl:call-template name="copy-of">
						<xsl:with-param name="articleID" select="$articleID"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:variable>
			<xsl:apply-templates select="msxsl:node-set($updateRids)" mode="ridCheck"/>
			<!-- ***source file***-->
			<externallink type="articleSource">
				<xsl:value-of select="header/documentinfo/relatedgroup/related[@relationship='self']/file/@name"/>
			</externallink>
			<!-- ***PDF version***-->
			<xsl:if test="header/documentinfo/relatedgroup/related[@relationship='sibling' and @type='pages']">
				<externallink type="reprint">
					<xsl:value-of select="header/documentinfo/relatedgroup/related[@relationship='sibling' and @type='pages']/file/@name"/>
				</externallink>
			</xsl:if>
			<!-- ***abstract if there is one***-->
			<xsl:if test="header/summary">
				<externallink type="abstract"/>
			</xsl:if>
			<!-- ***fulltext if there is any***-->
			<xsl:if test="//section">
				<externallink type="fulltext"/>
			</xsl:if>
			<xsl:if test="document">
				<!-- if a multipart doc then include links to the individual docs -->
				<xsl:for-each select="document">
				<externallink type="inthisissuedocseq" id="{@sequence}">
					<xsl:apply-templates select="header/titlegroup/title[@type='document']" mode="noTitle"/>
				</externallink>
				</xsl:for-each>
			</xsl:if>
		</tocentry>
	</xsl:template>
	
	<xsl:template match="title" mode="noTitle">
		<xsl:apply-templates/>
	</xsl:template>
	
<!-- ****** check rids once read in -->

	<xsl:template match="*" mode="ridCheck">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="ridCheck"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*[@rid]" mode="ridCheck">
		<!-- checks @rid has a valid @id ref (using ridMunch), and deletes invalid ref. or whole tag if necessary-->
		<xsl:variable name="outputlist">
			<xsl:call-template name="ridMunch">
				<xsl:with-param name="list" select="concat(normalize-space(@rid), ' ')"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$outputlist = ''">
			<!-- $outputlist is the @rid string with non-linking rids removed -->
			<!-- i.e. suppress link tag if no longer links to anything in this document
					assuming here that this will be inside a <namegroup> or <titlegroup> tags -->
				<xsl:choose>
					<xsl:when test="self::forenames | self::nametitle | self::pedigree | self::qualifications | self::roles | self::surname | self::surnameprefix | self::address | self::corporatename | self::etal | self::heading | self::link | self::miscellaneoustext | self::title">
					<!-- if the link contains name information, remove tag but keep contents -->
						<xsl:apply-templates mode="ridCheck"/>
					</xsl:when>
					<!--if the parent element is <name> and the children are not content tags 
							then delete the whole thing as it is only a link placeholder -->
					<xsl:otherwise/>
						
				</xsl:choose>
				<!--<xsl:apply-templates mode="ridCheck"/>-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy>
					<xsl:copy-of select="@*"/>
					<xsl:attribute name="rid"><xsl:value-of select="$outputlist"/></xsl:attribute>
					<xsl:apply-templates mode="ridCheck"/>
				</xsl:copy>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="ridMunch">
		<!-- checks @rid has valid ref: if not deletes (and link tag if necessary) -->
		<xsl:param name="list"/>
		<xsl:param name="outputlist"/>
		<xsl:choose>
			<xsl:when test="not(normalize-space($list))"><xsl:value-of select="normalize-space($outputlist)"/></xsl:when>
			<xsl:otherwise>
				<xsl:variable name="idOK" select="substring-before($list, ' ')"/>
				<xsl:call-template name="ridMunch">
					<xsl:with-param name="list" select="substring-after($list, ' ')"/>
					<xsl:with-param name="outputlist"><xsl:value-of select="$outputlist"/><xsl:if 
						test="//*/@id[. = $idOK]"><xsl:value-of 
						select="concat(' ' , $idOK)"/></xsl:if>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<!-- ****** read in (r)ids & other tags -->

	<xsl:template name="copy-of">
		<!--suffixes articleID to uniquely specify imported (r)id's-->
		<xsl:param name="articleID"/>
		<xsl:copy>
			<xsl:for-each select="@*">
				<xsl:choose>
					<xsl:when test="name() = 'id'">
						<xsl:attribute name="id"><xsl:value-of select="."/><xsl:text>-</xsl:text><xsl:value-of select="$articleID"/></xsl:attribute>
					</xsl:when>
					<xsl:when test="name() = 'rid'">
						<xsl:attribute name="rid"><xsl:call-template name="ridChomp"><xsl:with-param name="articleID" select="$articleID"/><xsl:with-param name="list" select="concat(normalize-space(.), ' ')"/></xsl:call-template></xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
						<xsl:copy/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:apply-templates mode="input">
				<xsl:with-param name="articleID" select="$articleID"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="ridChomp">
		<!-- expands @rid to include fileID -->
		<xsl:param name="articleID"/>
		<xsl:param name="list"/>
		<xsl:param name="outputlist"/>
		<xsl:choose>
			<xsl:when test="not($list)">
				<xsl:value-of select="normalize-space($outputlist)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="ridChomp">
					<xsl:with-param name="articleID" select="$articleID"/>
					<xsl:with-param name="list" select="substring-after($list, ' ')"/>
					<xsl:with-param name="outputlist" select="concat( $outputlist , substring-before($list, ' '), '-', $articleID, ' ')"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="input">
		<xsl:param name="articleID"/>
		<xsl:call-template name="copy-of">
			<xsl:with-param name="articleID" select="$articleID"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="xmlHeader">
		<xsl:text disable-output-escaping="yes">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
</xsl:text>
		<xsl:processing-instruction name="xml-stylesheet">
			<xsl:text>type="text/xsl" href="file://mass2\emu\sharedinfo\sentrystylesheets\hgToc.xsl"</xsl:text>
		</xsl:processing-instruction>
	</xsl:template>
	
</xsl:stylesheet>
