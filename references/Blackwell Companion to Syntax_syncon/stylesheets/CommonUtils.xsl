<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ins="http://www.blacksci.co.uk/xsl-subs">
	<!-- Name: CommonUtils.xsl -->
	<!-- LastUpdate: 2000-09-12 -->
	<!-- Version: 2000-09-12.2 -->
	<!-- Dependancies: [none] -->
	<!-- Description: Handles DTD4.0 formating element -->
	<!-- Update: 2000-09-12.1 By:acb
	     Added mode indent templates
	-->
	<!-- Update: 2000-09-13.1 By:acb
	     Added anchors-as-scripts template mode
	-->
	<!-- Update: 2001-03-23 By:ptw
	     added a temp '...-nodelist' variable in the evaluation of $out (mode=output) and $In
	-->
	<!-- Update: 2001-03-29
			added utility 'force-break' to force breaks in urls (could be used with any ascii text string)
	-->
	
	<xsl:strip-space elements="*"/>

	<!-- $src-nodes: represents the root source nodes -->
	<xsl:variable name="src-nodes" select="node()"/>	
	<xsl:variable name="root" select="/"/>
	


	<!-- newline: Outputs a newline times -->
	<xsl:template name="newline">
<xsl:text xml:space="preserve">
</xsl:text>
	</xsl:template>

	<!-- nbsp: Outputs $count non-breaking spaces -->
	<xsl:template name="nbsp">
		<xsl:param name="count" select="1"/>
		<xsl:if test="$count &gt; 0">
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:call-template name="nbsp">
				<xsl:with-param name="count" select="$count - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	

	<!-- repeat: Outputs $content $count times -->
	<xsl:template name="repeat">
		<xsl:param name="count"/>
		<xsl:param name="content"/>
		<xsl:if test="$count &gt; 0">
			<!-- <xsl:copy-of select="$content"/> -->
			<xsl:call-template name="copy-of">
				<xsl:with-param name="select" select="$content"/>
			</xsl:call-template>
			<xsl:call-template name="repeat">
				<xsl:with-param name="count" select="$count - 1"/>
				<xsl:with-param name="content" select="$content"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- replace one string with another -->
	<xsl:template name="replace-text">
		<xsl:param name="text"/>
		<xsl:param name="replace"/>
		<xsl:param name="by"/>
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)"/>
				<xsl:value-of select="$by"/>
				<xsl:call-template name="replace-text">
					<xsl:with-param name="text" select="substring-after($text, $replace)"/>
					<xsl:with-param name="replace" select="$replace"/>
					<xsl:with-param name="by" select="$by"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- long-date-format: Outputs date as "dd Monthname yyyy" given ISO format yyyymmdd -->
	<xsl:template name="long-date-format">
		<xsl:param name="prefix"/>
		<xsl:param name="select" select="."/>
		<xsl:variable name="date" select="translate($select,'-/','')"/>
		<xsl:if test="contains(translate($date,'123456789','---------'),'-')">
			<xsl:copy-of select="$prefix"/>
			<xsl:value-of select="substring($date,7,2)"/>		
			<xsl:text> </xsl:text>
			<xsl:value-of select="name(document('Constants.xml')/constants/long-month-names/*[number(substring($date,5,2))])"/>		
			<xsl:text> </xsl:text>
			<xsl:value-of select="substring($date,1,4)"/>		
		</xsl:if>
	</xsl:template>


	<!-- nest-apply-templates: 
	      Outputs $element $count times
	       -->
	<xsl:template name="nest-apply-templates">
		<xsl:param name="element" select="'all'"/>
		<xsl:param name="level" select="1"/>
		<xsl:param name="select" select="."/>
		<xsl:choose>
			<xsl:when test="$level &gt; 0">
				<xsl:element name="{$element}">
					<xsl:call-template name="nest-apply-templates">
						<xsl:with-param name="element" select="$element"/>
						<xsl:with-param name="level" select="$level - 1"/>
						<xsl:with-param name="select" select="$select"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$select"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="nest-copy-of">
		<xsl:param name="element" select="'all'"/>
		<xsl:param name="level" select="1"/>
		<xsl:param name="select" select="."/>
		<xsl:choose>
			<xsl:when test="$level &gt; 0">
				<xsl:element name="{$element}">
					<xsl:call-template name="nest-copy-of">
						<xsl:with-param name="element" select="$element"/>
						<xsl:with-param name="level" select="$level - 1"/>
						<xsl:with-param name="select" select="$select"/>
					</xsl:call-template>
				</xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="$select"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- mode "output"
	     This mode defaults to outputing an exact duplicate of the input.
	     Where disable-output-escaping="yes"
	     Except: <ins:name> and the string {ins:name} in attributes
	     are replaced with the result of evaluating a template that
	     declared as follows:
	     <xsl:template match="/name" mode="template">
	     
	-->
	<xsl:template match="*" mode="output">
		<xsl:copy>
		<xsl:apply-templates select="node() | @*" mode="output"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/*" mode="output">
		<xsl:apply-templates select="node() | @*" mode="output"/>
	</xsl:template>
	<xsl:template name="output-text">
		<xsl:param name="select" select="."/>
		<xsl:choose>
			<xsl:when test="contains($select,'&amp;#')">
				<xsl:value-of disable-output-escaping="yes" select="substring-before($select,'&amp;#')"/>
				<xsl:text disable-output-escaping="yes">&amp;#</xsl:text>
				<xsl:call-template name="output-text">
					<xsl:with-param name="select" select="substring-after($select,'&amp;#')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of disable-output-escaping="yes" select="$select"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="text()" mode="output">
		<!-- <xsl:value-of disable-output-escaping="yes" select="."/> -->
		<xsl:call-template name="output-text"/>
	</xsl:template>
	<xsl:template match="@*" mode="output">
		<xsl:attribute name="{name()}">
		<xsl:choose>
		<xsl:when test="contains(.,'{ins:')">
			<xsl:value-of  disable-output-escaping="yes" select="substring-before(.,'{ins:')"/>
			<xsl:variable name="tname">
			<xsl:element name="{substring-before(substring-after(.,'{ins:'),'}')}"/>
			</xsl:variable>
			<xsl:variable name="tname-nodelist" select="$tname"/>
			<xsl:apply-templates select="$tname-nodelist" mode="template"/>
			<xsl:value-of  disable-output-escaping="yes" select="substring-after(.,'}')"/> 
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="."/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<!-- apply-templates: applys standard templates to $nodes 
	      while allowing the input and/or output to be modified
	      by using:
	      <xsl:template match="/$mode//node-name">
	      or
	      <xsl:template match="/$mode//node-name" mode="output">
	      
	      Note: disable-output-escaping="yes" for all text output
	 -->
	<xsl:template name="apply-output-templates">
		<xsl:param name="mode" select="'all'"/>
		<xsl:param name="select" select="node()"/>
		<xsl:param name="level" select="'1'"/>
		<xsl:variable name="Out">
			<output>
				<xsl:call-template name="nest-apply-templates">
					<xsl:with-param name="element" select="$mode"/>
					<xsl:with-param name="level" select="$level"/>
					<xsl:with-param name="select" select="$select/*"/>
				</xsl:call-template>
			</output>
		</xsl:variable>
		<xsl:variable name="out-nodelist" select="$Out"/>
		<xsl:apply-templates select="$out-nodelist/*" mode="output"/>
	</xsl:template>
	<xsl:template name="apply-input-templates">
		<xsl:param name="mode" select="'all'"/>
		<xsl:param name="select" select="node()"/>
		<xsl:param name="level" select="'1'"/>
		<xsl:variable name="In">
			<xsl:call-template name="nest-copy-of">
				<xsl:with-param name="element" select="$mode"/>
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="select" select="$select"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="in-nodelist" select="$In"/>
		<xsl:apply-templates select="$in-nodelist/*"/>
	</xsl:template>
	<xsl:template name="copy-of">
		<xsl:param name="mode" select="'all'"/>
		<xsl:param name="select" select="node()"/>
		<xsl:param name="level" select="'1'"/>
		<xsl:variable name="Out">
			<xsl:call-template name="nest-copy-of">
				<xsl:with-param name="element" select="$mode"/>
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="select" select="$select"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="Out-nodeset" select="$Out"/>
		<xsl:apply-templates select="$Out-nodeset" mode="output"/>
	</xsl:template>
	<xsl:template name="apply-templates">
		<xsl:param name="mode" select="'all'"/>
		<xsl:param name="select" select="node()"/>
		<xsl:param name="level" select="'1'"/>
		<xsl:param name="olevel" select="'1'"/>
		<xsl:variable name="In">
			<xsl:call-template name="nest-copy-of">
				<xsl:with-param name="element" select="$mode"/>
				<xsl:with-param name="level" select="$level"/>
				<xsl:with-param name="select" select="$select"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="In-nodeset" select="$In"/>
		<xsl:variable name="Out">
			<xsl:call-template name="nest-apply-templates">
				<xsl:with-param name="element" select="$mode"/>
				<xsl:with-param name="level" select="$olevel"/>
				<!-- <xsl:with-param name="select" select="$In/*"/> -->
				<xsl:with-param name="select" select="$In-nodeset/*"/>
			</xsl:call-template>
		</xsl:variable>
		<!-- <xsl:apply-templates select="$Out/*" mode="output"/> -->
		<xsl:variable name="Out-nodeset" select="$Out"/>
		<xsl:apply-templates select="$Out-nodeset" mode="output"/>
	</xsl:template>
	
	
	<xsl:template match="/upper-case//text()" mode="output">
		<xsl:value-of disable-output-escaping="yes" select="translate(.,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
	</xsl:template>
	<xsl:template match="/lower-case//text()" mode="output">
		<xsl:value-of disable-output-escaping="yes" select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
	</xsl:template>
	<xsl:template match="/no-anchors-or-ids//a/@name" mode="output"/>
	<xsl:template match="/no-anchors-or-ids//@id" mode="output"/>

	<xsl:template name="escaped-attributes">
		<xsl:for-each select="@*">
			<xsl:attribute name="{name()}">
			<xsl:call-template name="replace-text">
				<xsl:with-param name="text" select="."/>
				<xsl:with-param name="replace">'</xsl:with-param>
				<xsl:with-param name="by">\'</xsl:with-param>
			</xsl:call-template>
			</xsl:attribute>
		</xsl:for-each>
	</xsl:template>

	<!-- mode "anchors-as-scripts" 
	Adds the contents of any <a name="???"> as strings to sect["???"] then includes them inline 
	-->
	<xsl:template match="/ | node()" mode="anchors-as-scripts">
		<xsl:copy>
		<xsl:call-template name="escaped-attributes"/>
		<xsl:apply-templates mode="anchors-as-scripts" select="node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="text()" mode="anchors-as-scripts">
		<xsl:value-of disable-output-escaping="yes" select="."/>
	</xsl:template> 
	<xsl:template match="a[@name]" mode="anchors-as-scripts">
		<script language="JavaScript">
			<xsl:call-template name="copy-to-sect-variable"/>
			<xsl:call-template name="newline"/>
			<xsl:text>document.write(sect["</xsl:text><xsl:value-of select="@name"/><xsl:text>"])</xsl:text>
		</script>
	</xsl:template>
	<xsl:template name="copy-to-sect-variable">
		<xsl:param name="name" select="@name"/>
		<xsl:apply-templates select="*" mode="extract-anchors-to-sect-variable"/>
		<xsl:call-template name="newline"/>
		<xsl:text>sect["</xsl:text><xsl:value-of select="$name"/><xsl:text>"]=</xsl:text>
		<xsl:apply-templates mode="copy-as-java-string" select="node()"/>
		<xsl:text>'';</xsl:text>
	</xsl:template> 
	<xsl:template match="node()" mode="extract-anchors-to-sect-variable"/>
	<xsl:template match="/ | *" mode="extract-anchors-to-sect-variable">
		<xsl:apply-templates select="*" mode="extract-anchors-to-sect-variable"/>
	</xsl:template>
	<xsl:template match="a[@name]" mode="extract-anchors-to-sect-variable">
		<xsl:call-template name="copy-to-sect-variable"/>
	</xsl:template>
	
	<xsl:template match="/" mode="copy-as-java-string">
		<xsl:if test="* | text()">
			<xsl:apply-templates select="* | text()" mode="copy-as-java-string"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="copy-as-java-string">
		<xsl:call-template name="newline"/>
		<xsl:text>'</xsl:text>
		<xsl:copy>
		<xsl:call-template name="escaped-attributes"/>
		<xsl:if test="* | text()">
			<xsl:text>' + </xsl:text>
			<xsl:apply-templates select="* | text()" mode="copy-as-java-string"/>
			<xsl:text>'</xsl:text>
		</xsl:if>
		</xsl:copy>
		<xsl:text>' + </xsl:text>
	</xsl:template>
	<xsl:template match="text()" mode="copy-as-java-string">
		<xsl:if test="string-length(.) &gt; 0">
		<xsl:text>'</xsl:text>
		<xsl:call-template name="replace-text">
			<xsl:with-param name="text">
				<xsl:call-template name="replace-text">
					<xsl:with-param name="text" select="."/>
					<xsl:with-param name="replace">'</xsl:with-param>
					<xsl:with-param name="by">\'</xsl:with-param>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="replace">&#10;</xsl:with-param>
			<xsl:with-param name="by">\n</xsl:with-param>
		</xsl:call-template>
		<xsl:text>' + </xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="a[@name]" mode="copy-as-java-string">
		<xsl:call-template name="newline"/>
		<xsl:text>'</xsl:text>
		<xsl:copy>
			<xsl:call-template name="escaped-attributes"/>
			<xsl:text>' + </xsl:text>
			<xsl:text>sect["</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>"] + </xsl:text>
			<xsl:text>'</xsl:text>
		</xsl:copy>
		<xsl:text>' + </xsl:text>
	</xsl:template>
	

	<xsl:template match="*" mode="template" priority="-9"/>
	<xsl:variable name="ins-template" select="document('mainpanes.xml')/ins:stylesheet"/>
	<xsl:template match="ins:*" mode="output">
		<xsl:if test="not(@bare)">
		<xsl:comment>-----&lt;<xsl:value-of select="local-name()"/>&gt;-----</xsl:comment>
		<xsl:call-template name="newline"/>
		</xsl:if>
		<xsl:variable name="matching-nodes" select="$ins-template/*[name()=local-name(current())]"/>
		<xsl:choose>
			<xsl:when test="$matching-nodes">
				<xsl:apply-templates select="$matching-nodes[position()=last()]/node()" mode="output"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="ext-doc">
					<xsl:element name="{local-name()}">
						<xsl:copy-of select="$src-nodes"/>
					</xsl:element>
				</xsl:variable>
				<xsl:variable name="ext-doc-nodelist" select="$ext-doc"/>
				<xsl:apply-templates select="$ext-doc-nodelist/*" mode="template"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="not(@bare)">
		<xsl:call-template name="newline"/>
		<xsl:comment>-----&lt;/<xsl:value-of select="local-name()"/>&gt;-----</xsl:comment>
		</xsl:if>
	</xsl:template>

	
	<!-- mode indent: applys indenting to output 
	     to use: capture output in a variable
	     and then apply templates mode="indent" to the result
	     Note: disable-output-escaping="yes" for all text output
	 -->
	<xsl:template match="node()|/" mode="indent">
	<xsl:if test="string-length(name()) &gt; 0">
		<xsl:call-template name="newline"/>
		<xsl:for-each select="ancestor::*">
			<xsl:text xml:space="preserve">	</xsl:text>
		</xsl:for-each>
	</xsl:if>
	<xsl:copy>
	<xsl:apply-templates select="node() | @*" mode="indent"/>
	<xsl:if test="string-length(name(node()[position()=last()])) &gt; 0">
		<xsl:call-template name="newline"/>
		<xsl:for-each select="ancestor::*">
			<xsl:text xml:space="preserve">	</xsl:text>
		</xsl:for-each>
	</xsl:if>
	</xsl:copy>
	</xsl:template>
	
	<xsl:template match="@*" mode="indent">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="text()" mode="indent">
		<xsl:value-of disable-output-escaping="yes" select="."/>
	</xsl:template>

	<!-- force-break: inserts break points into display strings (good for long urls) 
			either before or after, given a text string and a string($char) to break on
			defaults: breaks after '/' -->
	<xsl:template name="force-break">
		<xsl:param name="char" select="'/'"/>
		<xsl:param name="before-or-after" select="'after'"/>
		<xsl:param name="text"/>
		<xsl:if test="$text">
			<xsl:choose>
				<xsl:when test="contains($text, $char)">
					<nobr>
						<xsl:call-template name="force-break-loop">
							<xsl:with-param name="char" select="$char"/>
							<xsl:with-param name="text" select="$text"/>
							<xsl:with-param name="before-or-after" select="$before-or-after"/>
						</xsl:call-template>
					</nobr>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$text"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

	<xsl:template name="force-break-loop">
		<xsl:param name="char"/>
		<xsl:param name="text"/>
		<xsl:param name="before-or-after"/>
		<xsl:if test="$text">
			<xsl:choose>
				<!-- if there is a $char in the text string, work out where to put the linebreak based on $before-or-after -->
				<xsl:when test="contains($text, $char)">
					<xsl:choose>
						<xsl:when test="$before-or-after = 'after'"><xsl:value-of select="substring-before($text, $char)"/><xsl:value-of select="$char"/><wbr /></xsl:when>
						<xsl:otherwise><xsl:value-of select="substring-before($text, $char)"/><wbr /><xsl:value-of select="$char"/></xsl:otherwise>
					</xsl:choose>
					<xsl:call-template name="force-break-loop">
						<xsl:with-param name="char" select="$char"/>
						<xsl:with-param name="text" select="substring-after($text, $char)"/>
						<xsl:with-param name="before-or-after" select="$before-or-after"/>
					</xsl:call-template>
				</xsl:when>
				<!-- just output end of string and terminate if no more $chars -->
				<xsl:otherwise><xsl:value-of select="$text"/></xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
