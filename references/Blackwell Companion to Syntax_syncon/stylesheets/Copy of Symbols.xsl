<?xml version="1.0" encoding="UTF-8"?>
<!-- Name: Symbols.xsl -->
<!-- LastUpdate: 2001-03-30 to add entities-->
<!--Latest change: two new entities added bsl00164 and bsl00165-->
<!--bsl00164 filled diamond, grey. bsl00165 filled triangle, grey-->
<!-- entities update list:
		Commented out accented letters A-Z added 2001-03-01
		&phis; added 2001-02-01
		&epsiv; added 2001-02-02
		bsl00000 to bsl00104; corrected 2001-02-15-->

<!-- mismatches (to resolve when we have dynamically downloading fonts):
		&epsi; and &epsis; should be a different character from &epsi;	-->
		
<!-- Version: 2000-11-17.1 -->
<!-- Dependancies: Value must be set for the variable EntityPath which points to the URL of GIF versions of entities.-->
<!-- Description: Outputs symbols
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>

	<xsl:template match="symbol">
		<xsl:variable name="rslt" select="document('symbols.xml')/symbol/*[name()=current()/@name]"/>
		<xsl:choose>
			<xsl:when test="$rslt">
				<xsl:copy-of select="$rslt"/>
			</xsl:when>
			<xsl:otherwise>
				<span class="symbol-u">
				<xsl:text>[</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>]</xsl:text>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="unicode-to-ascii">
		<xsl:param name="select" select="."/>
		<xsl:variable name="s1" select="translate($select,'&#259;&#257;&#261;&#258;&#256;&#260;&#263;&#269;&#265;&#267;&#262;&#268;&#264;&#266;&#271;&#273;&#270;&#272;&#283;&#279;&#275;&#331;&#281;&#282;&#278;&#274;&#330;&#280;&#501;&#287;&#285;&#289;&#286;&#290;&#284;&#288;&#293;&#295;&#295;&#292;&#294;&#307;&#299;&#305;&#303;&#297;&#304;&#306;&#296;&#309;&#308;&#311;&#312;&#310;&#314;&#318;&#316;&#320;&#322;&#313;&#317;&#315;&#319;&#321;&#324;&#329;&#328;&#326;&#323;&#327;&#325;&#337;&#339;&#333;&#336;&#338;&#338;&#332;&#341;&#343;&#340;&#344;&#342;&#347;&#353;&#351;&#349;&#346;&#352;&#350;&#348;&#357;&#355;&#359;&#356;&#354;&#358;&#365;&#369;&#363;&#371;&#367;&#361;','aaaAAAccccCCCCddDDeeeeeEEEEEggggGGGGhhHHiiiiiIIIIIjKjjKlllllLLLLLnnnnNNNoooOOOrrrRRRssssSSSStttTTTuuuuuuUUUUUUwWyYYzzZZZ')"/>
		<xsl:variable name="s2" select="translate($s1,'&#225;&#226;&#230;&#224;&#229;&#227;&#228;&#193;&#194;&#198;&#192;&#197;&#195;&#196;&#231;&#199;&#233;&#234;&#232;&#240;&#235;&#201;&#202;&#200;&#208;&#203;&#237;&#238;&#236;&#239;&#205;&#206;&#204;&#207;&#241;&#209;&#243;&#244;&#242;&#248;&#245;&#246;&#211;&#212;&#213;&#214;&#223;&#254;&#222;&#250;&#251;&#249;&#252;&#218;&#219;&#217;&#220;&#253;&#255;&#221;','aaaaaaaAAAAAAAcCeeeeeEEEEEiiiiIIIInNooooooOOOOOOstTuuuUUUyyY')"/>
		<xsl:value-of select="$s2"/>
	</xsl:template>
	<xsl:template match="symbol[@name='abreve'     ]"><img src="{$EntityPath}/abreve.gif" BORDER="0" ALT="abreve"/></xsl:template><!-- #259; =U0103 =small a, breve  --><!--from DTD3-->
	<xsl:template match="symbol[@name='amacr'      ]"><img src="{$EntityPath}/amacr.gif" BORDER="0" ALT="amacr"/></xsl:template><!-- #257; =U0101 =small a, macron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='aogon'      ]"><img src="{$EntityPath}/aogon-.gif" ALIGN="absbottom" BORDER="0" ALT="aogon"/></xsl:template><!-- #261; =U0105 =small a, ogonek  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Abreve'     ]"><img src="{$EntityPath}/capAbreve.gif" BORDER="0" ALT="Abreve"/></xsl:template><!-- #258; =U0102 =capital A, breve  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Amacr'      ]"><img src="{$EntityPath}/capAmacr.gif" BORDER="0" ALT="Amacr"/></xsl:template><!-- #256; =U0100 =capital A, macron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Aogon'      ]"><img src="{$EntityPath}/capAogon-.gif" ALIGN="absbottom" BORDER="0" ALT="Aogon"/></xsl:template><!-- #260; =U0104 =capital A, ogonek  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cacute'     ]"><img src="{$EntityPath}/cacute.gif" BORDER="0" ALT="cacute"/></xsl:template><!-- #263; =U0107 =small c, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ccaron'     ]"><img src="{$EntityPath}/ccaron.gif" BORDER="0" ALT="ccaron"/></xsl:template><!-- #269; =U010D =small c, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ccirc'      ]"><img src="{$EntityPath}/ccirc.gif" BORDER="0" ALT="ccirc"/></xsl:template><!-- #265; =U0109 =small c, circumflex accent  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cdot'       ]"></xsl:template>--><!-- #267; =U010B =small c, dot above  -->
	<xsl:template match="symbol[@name='Cacute'     ]"><img src="{$EntityPath}/capCacute.gif" BORDER="0" ALT="Cacute"/></xsl:template><!-- #262; =U0106 =capital C, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ccaron'     ]"><img src="{$EntityPath}/capCcaron.gif" BORDER="0" ALT="Ccaron"/></xsl:template><!-- #268; =U010C =capital C, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ccirc'      ]"><img src="{$EntityPath}/capCcirc.gif" BORDER="0" ALT="Ccirc"/></xsl:template><!-- #264; =U0108 =capital C, circumflex accent  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Cdot'       ]"></xsl:template>--><!-- #266; =U010A =capital C, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dcaron'     ]"></xsl:template>--><!-- #271; =U010F =small d, caron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dstrok'     ]"></xsl:template>--><!-- #273; =U0111 =small d, stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Dcaron'     ]"></xsl:template>--><!-- #270; =U010E =capital D, caron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Dstrok'     ]"></xsl:template>--><!-- #272; =U0110 =capital D, stroke  -->
	<xsl:template match="symbol[@name='ecaron'     ]"><img src="{$EntityPath}/ecaron.gif" BORDER="0" ALT="ecaron"/></xsl:template><!-- #283; =U011B =small e, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='edot'       ]"><img src="{$EntityPath}/edot.gif" BORDER="0" ALT="edot"/></xsl:template><!-- #279; =U0117 =small e, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='emacr'      ]"><img src="{$EntityPath}/emacr.gif" BORDER="0" ALT="emacr"/></xsl:template><!-- #275; =U0113 =small e, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eng'        ]"></xsl:template>--><!-- #331; =U014B =small eng, Lapp  -->
	<xsl:template match="symbol[@name='eogon'      ]"><img src="{$EntityPath}/eogon-.gif" ALIGN="absbottom" BORDER="0" ALT="eogon"/></xsl:template><!-- #281; =U0119 =small e, ogonek  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ecaron'     ]"><img src="{$EntityPath}/capEcaron.gif" BORDER="0" ALT="Ecaron"/></xsl:template><!-- #282; =U011A =capital E, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Edot'       ]"><img src="{$EntityPath}/capEdot.gif" BORDER="0" ALT="Edot"/></xsl:template><!-- #278; =U0116 =capital E, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Emacr'      ]"><img src="{$EntityPath}/capEmacr.gif" BORDER="0" ALT="Emacr"/></xsl:template><!-- #274; =U0112 =capital E, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ENG'        ]"></xsl:template>--><!-- #330; =U014A =capital ENG, Lapp  -->
	<xsl:template match="symbol[@name='Eogon'      ]"><img src="{$EntityPath}/capEogon-.gif" ALIGN="absbottom" BORDER="0" ALT="Eogon"/></xsl:template><!-- #280; =U0118 =capital E, ogonek  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gacute'     ]"></xsl:template>--><!-- #501; =U01F5 =small g, acute accent  -->
	<xsl:template match="symbol[@name='gbreve'     ]"><img src="{$EntityPath}/gbreve-.gif" ALIGN="absbottom" BORDER="0" ALT="gbreve"/></xsl:template><!-- #287; =U011F =small g, breve  --><!--from DTD3-->
	<xsl:template match="symbol[@name='gcirc'      ]"><img src="{$EntityPath}/gcirc-.gif" ALIGN="absbottom" BORDER="0" ALT="gcirc"/></xsl:template><!-- #285; =U011D =small g, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='gdot'       ]"><img src="{$EntityPath}/gdot-.gif" ALIGN="absbottom" BORDER="0" ALT="gdot"/></xsl:template><!-- #289; =U0121 =small g, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Gbreve'     ]"><img src="{$EntityPath}/capGbreve.gif" BORDER="0" ALT="Gbreve"/></xsl:template><!-- #286; =U011E =capital G, breve  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Gcedil'     ]"></xsl:template>--><!-- #290; =U0122 =capital G, cedilla  -->
	<xsl:template match="symbol[@name='Gcirc'      ]"><img src="{$EntityPath}/capGcirc.gif" BORDER="0" ALT="Gcirc"/></xsl:template><!-- #284; =U011C =capital G, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Gdot'       ]"><img src="{$EntityPath}/capGdot.gif" BORDER="0" ALT="Gdot"/></xsl:template><!-- #288; =U0120 =capital G, dot above  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hcirc'      ]"></xsl:template>--><!-- #293; =U0125 =small h, circumflex accent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hstrok'     ]"></xsl:template>--><!-- #295; =U0127 =small h, stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hcirc'      ]"></xsl:template>--><!-- #292; =U0124 =capital H, circumflex accent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hstrok'     ]"></xsl:template>--><!-- #294; =U0126 =capital H, stroke  -->
	<xsl:template match="symbol[@name='ijlig'      ]"><img src="{$EntityPath}/ijlig-.gif" ALIGN="absbottom" BORDER="0" ALT="ijlig"/></xsl:template><!-- #307; =U0133 =small ij ligature  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='imacr'      ]"></xsl:template>--><!-- #299; =U012B =small i, macron  -->
	<xsl:template match="symbol[@name='inodot'     ]"><img src="{$EntityPath}/inodot.gif" BORDER="0" ALT="inodot"/></xsl:template><!-- #305; =U0131 =small i without dot  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iogon'      ]"></xsl:template>--><!-- #303; =U012F =small i, ogonek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='itilde'     ]"></xsl:template>--><!-- #297; =U0129 =small i, tilde  -->
<xsl:template match="symbol[@name='Idot'       ]"><img src="{$EntityPath}/Idot_uc.gif" ALIGN="absbottom" BORDER="0" ALT="Idot"/></xsl:template><!-- #304; =U0130 =capital I, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='IJlig'      ]"></xsl:template>--><!-- #306; =U0132 =capital IJ ligature  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Imacr'      ]"></xsl:template>--><!-- #298; =U012A =capital I, macron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Iogon'      ]"></xsl:template>--><!-- #302; =U012E =capital I, ogonek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Itilde'     ]"></xsl:template>--><!-- #296; =U0128 =capital I, tilde  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='jcirc'      ]"></xsl:template>--><!-- #309; =U0135 =small j, circumflex accent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jcirc'      ]"></xsl:template>--><!-- #308; =U0134 =capital J, circumflex accent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='kcedil'     ]"></xsl:template>--><!-- #311; =U0137 =small k, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='kgreen'     ]"></xsl:template>--><!-- #312; =U0138 =small k, Greenlandic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Kcedil'     ]"></xsl:template>--><!-- #310; =U0136 =capital K, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lacute'     ]"></xsl:template>--><!-- #314; =U013A =small l, acute accent  -->
	<xsl:template match="symbol[@name='lcaron'     ]"><img src="{$EntityPath}/lcaron.gif" BORDER="0" ALT="lcaron"/></xsl:template><!-- #318; =U013E =small l, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lcedil'     ]"></xsl:template>--><!-- #316; =U013C =small l, cedilla  -->
	<xsl:template match="symbol[@name='lmidot'     ]"><img src="{$EntityPath}/lmidot.gif" BORDER="0" ALT="lmidot"/></xsl:template><!-- #320; =U0140 =small l, middle dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lstrok'     ]"><img src="{$EntityPath}/lstrok.gif" BORDER="0" ALT="lstrok"/></xsl:template><!-- #322; =U0142 =small l, stroke  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lacute'     ]"></xsl:template>--><!-- #313; =U0139 =capital L, acute accent  -->
	<xsl:template match="symbol[@name='Lcaron'     ]"><img src="{$EntityPath}/capLcaron.gif" BORDER="0" ALT="Lcaron"/></xsl:template><!-- #317; =U013D =capital L, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lcedil'     ]"></xsl:template>--><!-- #315; =U013B =capital L, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lmidot'     ]"></xsl:template>--><!-- #319; =U013F =capital L, middle dot  -->
	<xsl:template match="symbol[@name='Lstrok'     ]"><img src="{$EntityPath}/capLstrok.gif" BORDER="0" ALT="Lstrok"/></xsl:template><!-- #321; =U0141 =capital L, stroke  --><!--from DTD3-->
	<xsl:template match="symbol[@name='nacute'     ]"><img src="{$EntityPath}/nacute.gif" BORDER="0" ALT="nacute"/></xsl:template><!-- #324; =U0144 =small n, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='napos'      ]"><img src="{$EntityPath}/napos.gif" BORDER="0" ALT="napos"/></xsl:template><!-- #329; =U0149 =small n, apostrophe  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ncaron'     ]"><img src="{$EntityPath}/ncaron.gif" BORDER="0" ALT="ncaron"/></xsl:template><!-- #328; =U0148 =small n, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ncedil'     ]"></xsl:template>--><!-- #326; =U0146 =small n, cedilla  -->
	<xsl:template match="symbol[@name='Nacute'     ]"><img src="{$EntityPath}/capNacute.gif" BORDER="0" ALT="Nacute"/></xsl:template><!-- #323; =U0143 =capital N, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ncaron'     ]"><img src="{$EntityPath}/capNcaron.gif" BORDER="0" ALT="Ncaron"/></xsl:template><!-- #327; =U0147 =capital N, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ncedil'     ]"></xsl:template>--><!-- #325; =U0145 =capital N, cedilla  -->
	<xsl:template match="symbol[@name='odblac'     ]"><img src="{$EntityPath}/odblac.gif" BORDER="0" ALT="odblac"/></xsl:template><!-- #337; =U0151 =small o, double acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='oelig'      ]"><xsl:text disable-output-escaping="yes">&amp;#156;</xsl:text></xsl:template><!-- #339; =U0153 =small oe ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='omacr'      ]"><img src="{$EntityPath}/omacr.gif" BORDER="0" ALT="omacr"/></xsl:template><!-- #333; =U014D =small o, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Odblac'     ]"></xsl:template>--><!-- #336; =U0150 =capital O, double acute accent  -->
	<xsl:template match="symbol[@name='OElig'      ]"><xsl:text disable-output-escaping="yes">&amp;#140;</xsl:text></xsl:template><!-- #338; =U0152 =capital OE ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Omacr'      ]"><img src="{$EntityPath}/capOmacr.gif" BORDER="0" ALT="Omacr"/></xsl:template><!-- #332; =U014C =capital O, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='racute'     ]"></xsl:template>--><!-- #341; =U0155 =small r, acute accent  -->
	<xsl:template match="symbol[@name='rcaron'     ]"><img src="{$EntityPath}/rcaron.gif" BORDER="0" ALT="rcaron"/></xsl:template><!-- #345; =U0159 =small r, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rcedil'     ]"></xsl:template>--><!-- #343; =U0157 =small r, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Racute'     ]"></xsl:template>--><!-- #340; =U0154 =capital R, acute accent  -->
	<xsl:template match="symbol[@name='Rcaron'     ]"><img src="{$EntityPath}/capRcaron.gif" BORDER="0" ALT="Rcaron"/></xsl:template><!-- #344; =U0158 =capital R, caron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rcedil'     ]"></xsl:template>--><!-- #342; =U0156 =capital R, cedilla  -->
	<xsl:template match="symbol[@name='sacute'     ]"><img src="{$EntityPath}/sacute.gif" BORDER="0" ALT="sacute"/></xsl:template><!-- #347; =U015B =small s, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='scaron'     ]"><xsl:text disable-output-escaping="yes">&amp;#154;</xsl:text></xsl:template><!-- #353; =U0161 =small s, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='scedil'     ]"><img src="{$EntityPath}/scedil-.gif" ALIGN="absbottom" BORDER="0" ALT="scedil"/></xsl:template><!-- #351; =U015F =small s, cedilla  --><!--from DTD3-->
	<xsl:template match="symbol[@name='scirc'      ]"><img src="{$EntityPath}/scirc.gif" BORDER="0" ALT="scirc"/></xsl:template><!-- #349; =U015D =small s, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Sacute'     ]"><img src="{$EntityPath}/capSacute.gif" BORDER="0" ALT="Sacute"/></xsl:template><!-- #346; =U015A =capital S, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Scaron'     ]"><xsl:text disable-output-escaping="yes">&amp;#138;</xsl:text></xsl:template><!-- #352; =U0160 =capital S, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Scedil'     ]"><img src="{$EntityPath}/capScedil-.gif" ALIGN="absbottom" BORDER="0" ALT="Scedil"/></xsl:template><!-- #350; =U015E =capital S, cedilla  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Scirc'      ]"><img src="{$EntityPath}/capScirc.gif" BORDER="0" ALT="Scirc"/></xsl:template><!-- #348; =U015C =capital S, circumflex accent  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tcaron'     ]"></xsl:template>--><!-- #357; =U0165 =small t, caron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tcedil'     ]"></xsl:template>--><!-- #355; =U0163 =small t, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tstrok'     ]"></xsl:template>--><!-- #359; =U0167 =small t, stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tcaron'     ]"></xsl:template>--><!-- #356; =U0164 =capital T, caron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tcedil'     ]"></xsl:template>--><!-- #354; =U0162 =capital T, cedilla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tstrok'     ]"></xsl:template>--><!-- #358; =U0166 =capital T, stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ubreve'     ]"></xsl:template>--><!-- #365; =U016D =small u, breve  -->
	<xsl:template match="symbol[@name='udblac'     ]"><img src="{$EntityPath}/udblac.gif" BORDER="0" ALT="udblac"/></xsl:template><!-- #369; =U0171 =small u, double acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='umacr'      ]"><img src="{$EntityPath}/umacr.gif" BORDER="0" ALT="umacr"/></xsl:template><!-- #363; =U016B =small u, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uogon'      ]"></xsl:template>--><!-- #371; =U0173 =small u, ogonek  -->
	<xsl:template match="symbol[@name='uring'      ]"><img src="{$EntityPath}/uring.gif" BORDER="0" ALT="uring"/></xsl:template><!-- #367; =U016F =small u, ring  --><!--from DTD3-->
	<xsl:template match="symbol[@name='utilde'     ]"><img src="{$EntityPath}/utilde.gif" BORDER="0" ALT="utilde"/></xsl:template><!-- #361; =U0169 =small u, tilde  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ubreve'     ]"></xsl:template>--><!-- #364; =U016C =capital U, breve  -->
	<xsl:template match="symbol[@name='Udblac'     ]"><img src="{$EntityPath}/capUdblac.gif" BORDER="0" ALT="Udblac"/></xsl:template><!-- #368; =U0170 =capital U, double acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Umacr'      ]"><img src="{$EntityPath}/capUmacr.gif" BORDER="0" ALT="Umacr"/></xsl:template><!-- #362; =U016A =capital U, macron  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uogon'      ]"></xsl:template>--><!-- #370; =U0172 =capital U, ogonek  -->
	<xsl:template match="symbol[@name='Uring'      ]"><img src="{$EntityPath}/capUring.gif" BORDER="0" ALT="Uring"/></xsl:template><!-- #366; =U016E =capital U, ring  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Utilde'     ]"><img src="{$EntityPath}/capUtilde.gif" BORDER="0" ALT="Utilde"/></xsl:template><!-- #360; =U0168 =capital U, tilde  --><!--from DTD3-->
	<xsl:template match="symbol[@name='wcirc'      ]"><img src="{$EntityPath}/wcirc.gif" BORDER="0" ALT="wcirc"/></xsl:template><!-- #373; =U0175 =small w, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Wcirc'      ]"><img src="{$EntityPath}/capWcirc.gif" BORDER="0" ALT="Wcirc"/></xsl:template><!-- #372; =U0174 =capital W, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ycirc'      ]"><img src="{$EntityPath}/ycirc-.gif" ALIGN="absbottom" BORDER="0" ALT="ycirc"/></xsl:template><!-- #375; =U0177 =small y, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ycirc'      ]"><img src="{$EntityPath}/capYcirc.gif" BORDER="0" ALT="Ycirc"/></xsl:template><!-- #374; =U0176 =capital Y, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Yuml'       ]"><xsl:text disable-output-escaping="yes">&amp;#159;</xsl:text></xsl:template><!-- #376; =U0178 =capital Y, dieresis or umlaut mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='zacute'     ]"><img src="{$EntityPath}/zacute.gif" BORDER="0" ALT="zacute"/></xsl:template><!-- #378; =U017A =small z, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='zcaron'     ]"><img src="{$EntityPath}/zcaron.gif" BORDER="0" ALT="zcaron"/></xsl:template><!-- #382; =U017E =small z, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='zdot'       ]"><img src="{$EntityPath}/zdot.gif" BORDER="0" ALT="zdot"/></xsl:template><!-- #380; =U017C =small z, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Zacute'     ]"><img src="{$EntityPath}/capZacute.gif" BORDER="0" ALT="Zacute"/></xsl:template><!-- #377; =U0179 =capital Z, acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Zcaron'     ]"><img src="{$EntityPath}/capZcaron.gif" BORDER="0" ALT="Zcaron"/></xsl:template><!-- #381; =U017D =capital Z, caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Zdot'       ]"><img src="{$EntityPath}/capZdot.gif" BORDER="0" ALT="Zdot"/></xsl:template><!-- #379; =U017B =capital Z, dot above  --><!--from DTD3-->
<!-- 

     File isoamsa.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angzarr'    ]"></xsl:template>--><!-- #57928; =UE248 angle with down zig-zag arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cirmid'     ]"></xsl:template>--><!-- #57936; =UE250 circle, mid below  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cudarrl'    ]"></xsl:template>--><!-- #57918; =UE23E left, curved, down arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cudarrr'    ]"></xsl:template>--><!-- #58368; =UE400 right, curved, down arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cularr'     ]"></xsl:template>--><!-- #8630; =U21B6 /curvearrowleft A: left curved arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cularrp'    ]"></xsl:template>--><!-- #57930; =UE24A curved left arrow with plus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curarr'     ]"></xsl:template>--><!-- #8631; =U21B7 /curvearrowright A: rt curved arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curarrm'    ]"></xsl:template>--><!-- #57929; =UE249 curved right arrow with minus  -->
	<xsl:template match="symbol[@name='dArr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#223;</xsl:text></font></xsl:template><!-- #8659; =U21D3 /Downarrow A: down dbl arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ddarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#175;&amp;#175;</xsl:text></font></xsl:template><!-- #8650; =U21CA /downdownarrows A: two down arrows  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dfisht'     ]"></xsl:template>--><!-- #57932; =UE24C down fish tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dharl'      ]"></xsl:template>--><!-- #8643; =U21C3 /downharpoonleft A: dn harpoon-left  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dharr'      ]"></xsl:template>--><!-- #8642; =U21C2 /downharpoonright A: down harpoon-rt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dHar'       ]"></xsl:template>--><!-- #57895; =UE227 down harpoon-left, down harpoon-right  -->
	<xsl:template match="symbol[@name='duarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#175;&amp;#173;</xsl:text></font></xsl:template><!-- #57878; =UE216 down arrow, up arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='duhar'      ]"></xsl:template>--><!-- #57879; =UE217 down harp, up harp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dzigrarr'   ]"></xsl:template>--><!-- #8669; =U21DD right long zig-zag arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Darr'       ]"></xsl:template>--><!-- #8609; =U21A1 down two-headed arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DDotrahd'   ]"></xsl:template>--><!-- #57912; =UE238 right arrow with dotted stem  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='erarr'      ]"></xsl:template>--><!-- #57910; =UE236 equal, right arrow below  -->
	<xsl:template match="symbol[@name='harr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#171;</xsl:text></font></xsl:template><!-- #8596; =U2194 /leftrightarrow A: l&r arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='harrcir'    ]"></xsl:template>--><!-- #57920; =UE240 left and right arrow with a circle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='harrw'      ]"></xsl:template>--><!-- #8621; =U21AD /leftrightsquigarrow A: l&r arr-wavy  -->
	<xsl:template match="symbol[@name='hArr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#219;</xsl:text></font></xsl:template><!-- #8660; =U21D4 /Leftrightarrow A: l&r dbl arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hoarr'      ]"></xsl:template>--><!-- #57923; =UE243 horizontal open arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='imof'       ]"></xsl:template>--><!-- #8887; =U22B7 image of  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrbfs'    ]"></xsl:template>--><!-- #57888; =UE220 left arrow-bar, filled square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrfs'     ]"></xsl:template>--><!-- #57890; =UE222 left arrow, filled square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrhk'     ]"></xsl:template>--><!-- #8617; =U21A9 /hookleftarrow A: left arrow-hooked  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrlp'     ]"></xsl:template>--><!-- #8619; =U21AB /looparrowleft A: left arrow-looped  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrpl'     ]"></xsl:template>--><!-- #57919; =UE23F left arrow, plus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrsim'    ]"></xsl:template>--><!-- #57934; =UE24E left arrow, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrtl'     ]"></xsl:template>--><!-- #8610; =U21A2 /leftarrowtail A: left arrow-tailed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='latail'     ]"></xsl:template>--><!-- #57916; =UE23C left arrow-tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lAarr'      ]"></xsl:template>--><!-- #8666; =U21DA /Lleftarrow A: left triple arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lAtail'     ]"></xsl:template>--><!-- #57917; =UE23D left double arrow-tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbarr'      ]"></xsl:template>--><!-- #58370; =UE402 left broken arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lBarr'      ]"></xsl:template>--><!-- #57862; =UE206 left doubly broken arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ldca'       ]"></xsl:template>--><!-- #57882; =UE21A left down curved arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ldrdhar'    ]"></xsl:template>--><!-- #57900; =UE22C left harpoon-down over right harpoon-down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ldrushar'   ]"></xsl:template>--><!-- #57896; =UE228 left-down-right-up harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ldsh'       ]"></xsl:template>--><!-- #8626; =U21B2 left down angled arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lfisht'     ]"></xsl:template>--><!-- #57876; =UE214 left fish tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lhard'      ]"></xsl:template>--><!-- #8637; =U21BD /leftharpoondown A: l harpoon-down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lharu'      ]"></xsl:template>--><!-- #8636; =U21BC /leftharpoonup A: left harpoon-up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lharul'     ]"></xsl:template>--><!-- #57902; =UE22E left harpoon-up over long dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lHar'       ]"></xsl:template>--><!-- #57893; =UE225 left harpoon-up over left harpoon-down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='llarr'      ]"></xsl:template>--><!-- #8647; =U21C7 /leftleftarrows A: two left arrows  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='llhard'     ]"></xsl:template>--><!-- #57905; =UE231 left harpoon-down below long dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='loarr'      ]"></xsl:template>--><!-- #57922; =UE242 left open arrow  -->
	<xsl:template match="symbol[@name='lrarr'      ]"><img src="{$EntityPath}/lrarr.gif" BORDER="0" ALT="lrarr"/></xsl:template><!-- #8646; =U21C6 /leftrightarrows A: l arr over r arr  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lrhar'      ]"><img src="{$EntityPath}/lrhar.gif" BORDER="0" ALT="lrhar"/></xsl:template><!-- #8651; =U21CB /leftrightharpoons A: l harp over r  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lrhard'     ]"></xsl:template>--><!-- #57903; =UE22F right harpoon-down below long dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lsh'        ]"></xsl:template>--><!-- #8624; =U21B0 /Lsh A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lurdshar'   ]"></xsl:template>--><!-- #57897; =UE229 left-up-right-down harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='luruhar'    ]"></xsl:template>--><!-- #57899; =UE22B left harpoon-up over right harpoon-up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Larr'       ]"></xsl:template>--><!-- #8606; =U219E /twoheadleftarrow A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='map'        ]"></xsl:template>--><!-- #8614; =U21A6 /mapsto A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='midcir'     ]"></xsl:template>--><!-- #57935; =UE24F mid, circle below   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mumap'      ]"></xsl:template>--><!-- #8888; =U22B8 /multimap A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Map'        ]"></xsl:template>--><!-- #57874; =UE212 twoheaded mapsto  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nearhk'     ]"></xsl:template>--><!-- #57869; =UE20D NE arrow-hooked  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nearr'      ]"></xsl:template>--><!-- #8599; =U2197 /nearrow A: NE pointing arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='neArr'      ]"></xsl:template>--><!-- #8663; =U21D7 NE pointing dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nesear'     ]"></xsl:template>--><!-- #57870; =UE20E /toea A: NE & SE arrows  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nharr'      ]"></xsl:template>--><!-- #8622; =U21AE /nleftrightarrow A: not l&r arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nhArr'      ]"></xsl:template>--><!-- #8654; =U21CE /nLeftrightarrow A: not l&r dbl arr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nlarr'      ]"></xsl:template>--><!-- #8602; =U219A /nleftarrow A: not left arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nlArr'      ]"></xsl:template>--><!-- #8653; =U21CD /nLeftarrow A: not implied by  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrarr'      ]"></xsl:template>--><!-- #8603; =U219B /nrightarrow A: not right arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrarrc'     ]"></xsl:template>--><!-- #57885; =UE21D not right arrow-curved  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrarrw'     ]"></xsl:template>--><!-- #57883; =UE21B not right arrow-wavy  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrArr'      ]"></xsl:template>--><!-- #8655; =U21CF /nRightarrow A: not implies  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvHarr'     ]"></xsl:template>--><!-- #8654; =U21CE not, vert, left and right double arrow   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvlArr'     ]"></xsl:template>--><!-- #8653; =U21CD not, vert, left double arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvrArr'     ]"></xsl:template>--><!-- #8655; =U21CF not, vert, right double arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nwarhk'     ]"></xsl:template>--><!-- #57868; =UE20C NW arrow-hooked  -->
	<xsl:template match="symbol[@name='nwarr'      ]"><img src="{$EntityPath}/nwarr.gif" BORDER="0" ALT="nwarr"/></xsl:template><!-- #8598; =U2196 /nwarrow A: NW pointing arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nwArr'      ]"></xsl:template>--><!-- #8662; =U21D6 NW pointing dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nwnear'     ]"></xsl:template>--><!-- #57873; =UE211 NW & NE arrows  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='olarr'      ]"></xsl:template>--><!-- #8634; =U21BA /circlearrowleft A: l arr in circle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='orarr'      ]"></xsl:template>--><!-- #8635; =U21BB /circlearrowright A: r arr in circle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='origof'     ]"></xsl:template>--><!-- #8886; =U22B6 original of  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrap'     ]"></xsl:template>--><!-- #57909; =UE235 approximate, right arrow above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrbfs'    ]"></xsl:template>--><!-- #57889; =UE221 right arrow-bar, filled square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrc'      ]"></xsl:template>--><!-- #57884; =UE21C right arrow-curved  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrfs'     ]"></xsl:template>--><!-- #57891; =UE223 right arrow, filled square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrhk'     ]"></xsl:template>--><!-- #8618; =U21AA /hookrightarrow A: rt arrow-hooked  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrlp'     ]"></xsl:template>--><!-- #8620; =U21AC /looparrowright A: rt arrow-looped  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrpl'     ]"></xsl:template>--><!-- #57886; =UE21E right arrow, plus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrsim'    ]"></xsl:template>--><!-- #57933; =UE24D right arrow, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrtl'     ]"></xsl:template>--><!-- #8611; =U21A3 /rightarrowtail A: rt arrow-tailed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrw'      ]"></xsl:template>--><!-- #8669; =U21DD /rightsquigarrow A: rt arrow-wavy  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ratail'     ]"></xsl:template>--><!-- #8611; =U21A3 right arrow-tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rAarr'      ]"></xsl:template>--><!-- #8667; =U21DB /Rrightarrow A: right triple arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rAtail'     ]"></xsl:template>--><!-- #57915; =UE23B right double arrow-tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbarr'      ]"></xsl:template>--><!-- #58373; =UE405 /bkarow A: right broken arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rBarr'      ]"></xsl:template>--><!-- #57863; =UE207 /dbkarow A: right doubly broken arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rdca'       ]"></xsl:template>--><!-- #57881; =UE219 right down curved arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rdldhar'    ]"></xsl:template>--><!-- #57901; =UE22D right harpoon-down over left harpoon-down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rdsh'       ]"></xsl:template>--><!-- #8627; =U21B3 right down angled arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rfisht'     ]"></xsl:template>--><!-- #57877; =UE215 right fish tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rhard'      ]"></xsl:template>--><!-- #8641; =U21C1 /rightharpoondown A: rt harpoon-down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rharu'      ]"></xsl:template>--><!-- #8640; =U21C0 /rightharpoonup A: rt harpoon-up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rharul'     ]"></xsl:template>--><!-- #57904; =UE230 right harpoon-up over long dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rHar'       ]"></xsl:template>--><!-- #57892; =UE224 right harpoon-up over right harpoon-down  -->
	<xsl:template match="symbol[@name='rlarr'      ]"><img src="{$EntityPath}/rlarr.gif" BORDER="0" ALT="rlarr"/></xsl:template><!-- #8644; =U21C4 /rightleftarrows A: r arr over l arr  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rlhar'      ]"><img src="{$EntityPath}/rlhar.gif" BORDER="0" ALT="rlhar"/></xsl:template><!-- #8652; =U21CC /rightleftharpoons A: r harp over l  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='roarr'      ]"></xsl:template>--><!-- #57921; =UE241 right open arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rrarr'      ]"></xsl:template>--><!-- #8649; =U21C9 /rightrightarrows A: two rt arrows  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rsh'        ]"></xsl:template>--><!-- #8625; =U21B1 /Rsh A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ruluhar'    ]"></xsl:template>--><!-- #57898; =UE22A right harpoon-up over left harpoon-up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rarr'       ]"></xsl:template>--><!-- #8608; =U21A0 /twoheadrightarrow A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rarrtl'     ]"></xsl:template>--><!-- #57913; =UE239 right two-headed arrow with tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RBarr'      ]"></xsl:template>--><!-- #57865; =UE209 /drbkarow A: twoheaded right broken arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='searhk'     ]"></xsl:template>--><!-- #57867; =UE20B /hksearow A: SE arrow-hooken  -->
	<xsl:template match="symbol[@name='searr'      ]"><img src="{$EntityPath}/searr.gif" BORDER="0" ALT="searr"/></xsl:template><!-- #8600; =U2198 /searrow A: SE pointing arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='seArr'      ]"></xsl:template>--><!-- #8664; =U21D8 SE pointing dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='seswar'     ]"></xsl:template>--><!-- #57871; =UE20F /tosa A: SE & SW arrows  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simrarr'    ]"></xsl:template>--><!-- #57908; =UE234 similar, right arrow below  -->
	<xsl:template match="symbol[@name='slarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#172;</xsl:text></font></xsl:template><!-- #57907; =UE233 short left arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='srarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#174;</xsl:text></font></xsl:template><!-- #57906; =UE232 short right arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='swarhk'     ]"></xsl:template>--><!-- #57866; =UE20A /hkswarow A: SW arrow-hooked  -->
	<xsl:template match="symbol[@name='swarr'      ]"><img src="{$EntityPath}/swarr.gif" BORDER="0" ALT="swarr"/></xsl:template><!-- #8601; =U2199 /swarrow A: SW pointing arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='swArr'      ]"></xsl:template>--><!-- #8665; =U21D9 SW pointing dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='swnwar'     ]"></xsl:template>--><!-- #57872; =UE210 SW & NW arrows  -->
	<xsl:template match="symbol[@name='uArr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#221;</xsl:text></font></xsl:template><!-- #8657; =U21D1 /Uparrow A: up dbl arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='udarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#173;&amp;#175;</xsl:text></font></xsl:template><!-- #8645; =U21C5 up arrow, down arrow  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='udhar'      ]"></xsl:template>--><!-- #57880; =UE218 up harp, down harp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ufisht'     ]"></xsl:template>--><!-- #57931; =UE24B up fish tail  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uharl'      ]"></xsl:template>--><!-- #8639; =U21BF /upharpoonleft A: up harpoon-left  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uharr'      ]"></xsl:template>--><!-- #8638; =U21BE /upharpoonright /restriction A: up harp-r  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uHar'       ]"></xsl:template>--><!-- #57894; =UE226 up harpoon-left, up harpoon-right  -->
	<xsl:template match="symbol[@name='uuarr'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#173;&amp;#173;</xsl:text></font></xsl:template><!-- #8648; =U21C8 /upuparrows A: two up arrows  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uarr'       ]"></xsl:template>--><!-- #8607; =U219F up two-headed arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uarrocir'   ]"></xsl:template>--><!-- #57911; =UE237 up two-headed arrow above circle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varr'       ]"></xsl:template>--><!-- #8597; =U2195 /updownarrow A: up&down arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vArr'       ]"></xsl:template>--><!-- #8661; =U21D5 /Updownarrow A: up&down dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xharr'      ]"></xsl:template>--><!-- #57859; =UE203 /longleftrightarrow A: long l&r arr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xhArr'      ]"></xsl:template>--><!-- #57858; =UE202 /Longleftrightarrow A: long l&r dbl arr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xlarr'      ]"></xsl:template>--><!-- #57857; =UE201 /longleftarrow A: long left arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xlArr'      ]"></xsl:template>--><!-- #57856; =UE200 /Longleftarrow A: long l dbl arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xmap'       ]"></xsl:template>--><!-- #57864; =UE208 /longmapsto A:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xrarr'      ]"></xsl:template>--><!-- #57861; =UE205 /longrightarrow A: long right arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xrArr'      ]"></xsl:template>--><!-- #57860; =UE204 /Longrightarrow A: long rt dbl arr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='zigrarr'    ]"></xsl:template>--><!-- #57924; =UE244 right zig-zag arrow  -->
<!-- 

     File isoamsb.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ac'         ]"></xsl:template>--><!-- #57863; =UE207 most positive  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='acE'        ]"></xsl:template>--><!-- #58000; =UE290 most positive, two lines below  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='amalg'      ]"></xsl:template>--><!-- #57937; =UE251 /amalg B: amalgamation or coproduct  -->
	<xsl:template match="symbol[@name='barvee'     ]"><img src="{$EntityPath}/barvee.gif" BORDER="0" ALT="barvee"/></xsl:template><!-- #8893; =U22BD bar, vee  --><!--from DTD3-->
	<xsl:template match="symbol[@name='barwed'     ]"><img src="{$EntityPath}/barwed.gif" BORDER="0" ALT="barwed"/></xsl:template><!-- #8892; =U22BC /barwedge B: logical and, bar above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bsolb'      ]"><img src="{$EntityPath}/bsolb.gif" BORDER="0" ALT="bsolb"/></xsl:template><!-- #57984; =UE280 reverse solidus in square  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Barwed'     ]"><img src="{$EntityPath}/ucBarwed.gif" BORDER="0" ALT="Barwed"/></xsl:template><!-- #8966; =U2306 /doublebarwedge B: log and, dbl bar above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='capand'     ]"><img src="{$EntityPath}/capand.gif" BORDER="0" ALT="capand"/></xsl:template><!-- #57985; =UE281 intersection, and  --><!--from DTD3-->
	<xsl:template match="symbol[@name='capbrcup'   ]"><img src="{$EntityPath}/capbrcup-.gif" ALIGN="absbottom" BORDER="0" ALT="capbrcup"/></xsl:template><!-- #57969; =UE271 intersection, bar, union  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='capcap'     ]"></xsl:template>--><!-- #57971; =UE273 intersection, intersection, joined  -->
	<xsl:template match="symbol[@name='capcup'     ]"><img src="{$EntityPath}/capcup-.gif" ALIGN="absbottom" BORDER="0" ALT="capcup"/></xsl:template><!-- #57967; =UE26F intersection above union  --><!--from DTD3-->
	<xsl:template match="symbol[@name='capdot'     ]"><img src="{$EntityPath}/capdot.gif" BORDER="0" ALT="capdot"/></xsl:template><!-- #57953; =UE261 intersection, with dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='caps'       ]"><img src="{$EntityPath}/caps.gif" BORDER="0" ALT="caps"/></xsl:template><!-- #57973; =UE275 intersection, serifs  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ccaps'      ]"></xsl:template>--><!-- #57977; =UE279 closed intersection, serifs  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ccups'      ]"></xsl:template>--><!-- #57976; =UE278 closed union, serifs  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ccupssm'    ]"></xsl:template>--><!-- #57978; =UE27A closed union, serifs, smash product  -->
	<xsl:template match="symbol[@name='coprod'     ]"><img src="{$EntityPath}/coprod.gif" BORDER="0" ALT="coprod"/></xsl:template><!-- #8720; =U2210 /coprod L: coproduct operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cupbrcap'   ]"><img src="{$EntityPath}/cupbrcap-.gif" ALIGN="absbottom" BORDER="0" ALT="cupbrcap"/></xsl:template><!-- #57968; =UE270 union, bar, intersection  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cupcap'     ]"><img src="{$EntityPath}/cupcap-.gif" ALIGN="absbottom" BORDER="0" ALT="cupcap"/></xsl:template><!-- #57966; =UE26E union above intersection  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cupcup'     ]"></xsl:template>--><!-- #57970; =UE272 union, union, joined  -->
	<xsl:template match="symbol[@name='cupdot'     ]"><img src="{$EntityPath}/cupdot.gif" BORDER="0" ALT="cupdot"/></xsl:template><!-- #8845; =U228D union, with dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cupor'      ]"><img src="{$EntityPath}/cupor.gif" BORDER="0" ALT="cupor"/></xsl:template><!-- #57986; =UE282 union, or  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cups'       ]"><img src="{$EntityPath}/cups.gif" BORDER="0" ALT="cups"/></xsl:template><!-- #57972; =UE274 union, serifs  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cuvee'      ]"><img src="{$EntityPath}/cuvee.gif" BORDER="0" ALT="cuvee"/></xsl:template><!-- #8910; =U22CE /curlyvee B: curly logical or  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cuwed'      ]"><img src="{$EntityPath}/cuwed.gif" BORDER="0" ALT="cuwed"/></xsl:template><!-- #8911; =U22CF /curlywedge B: curly logical and  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Cap'        ]"><img src="{$EntityPath}/ucCap.gif" BORDER="0" ALT="Cap"/></xsl:template><!-- #8914; =U22D2 /Cap /doublecap B: dbl intersection  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Cup'        ]"><img src="{$EntityPath}/ucCup.gif" BORDER="0" ALT="Cup"/></xsl:template><!-- #8915; =U22D3 /Cup /doublecup B: dbl union  --><!--from DTD3-->
	<xsl:template match="symbol[@name='da1gger'     ]"><xsl:text disable-output-escaping="yes">&amp;#134;</xsl:text></xsl:template><!-- #8224; =U2020 /dagger B: dagger relation  -->
	<xsl:template match="symbol[@name='diam'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#224;</xsl:text></font></xsl:template><!-- #8900; =U22C4 /diamond B: open diamond  --><!--from DTD3-->
	<xsl:template match="symbol[@name='divonx'     ]"><img src="{$EntityPath}/divonx.gif" BORDER="0" ALT="divonx"/></xsl:template><!-- #8903; =U22C7 /divideontimes B: division on times  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Dagger'     ]"><xsl:text disable-output-escaping="yes">&amp;#135;</xsl:text></xsl:template><!-- #8225; =U2021 /ddagger B: double dagger relation  --><!--from DTD3-->
	<xsl:template match="symbol[@name='eplus'      ]"><img src="{$EntityPath}/eplus.gif" BORDER="0" ALT="eplus"/></xsl:template><!-- #57960; =UE268 equal, plus  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hercon'     ]"></xsl:template>--><!-- #8889; =U22B9 hermitian conjugate matrix  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='intcal'     ]"></xsl:template>--><!-- #8890; =U22BA /intercal B: intercal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iprod'      ]"></xsl:template>--><!-- #57945; =UE259 /intprod  -->
	<xsl:template match="symbol[@name='loplus'     ]"><img src="{$EntityPath}/loplus.gif" BORDER="0" ALT="loplus"/></xsl:template><!-- #57948; =UE25C plus sign in left half circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lotimes'    ]"><img src="{$EntityPath}/lotimes.gif" BORDER="0" ALT="lotimes"/></xsl:template><!-- #57950; =UE25E multiply sign in left half circle   --><!--from DTD3-->
	<xsl:template match="symbol[@name='lthree'     ]"><img src="{$EntityPath}/lthree.gif" BORDER="0" ALT="lthree"/></xsl:template><!-- #8907; =U22CB /leftthreetimes B:  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ltimes'     ]"><img src="{$EntityPath}/ltimes.gif" BORDER="0" ALT="ltimes"/></xsl:template><!-- #8905; =U22C9 /ltimes B: times sign, left closed  --><!--from DTD3-->
	<xsl:template match="symbol[@name='midast'     ]"><xsl:text disable-output-escaping="yes">&amp;#042;</xsl:text></xsl:template><!-- #42;  =U002A /ast B: asterisk  --><!--from DTD3-->
	<xsl:template match="symbol[@name='minusb'     ]"><img src="{$EntityPath}/minusb.gif" BORDER="0" ALT="minusb"/></xsl:template><!-- #8863; =U229F /boxminus B: minus sign in box  --><!--from DTD3-->
	<xsl:template match="symbol[@name='minusd'     ]"><img src="{$EntityPath}/minusd.gif" BORDER="0" ALT="minusd"/></xsl:template><!-- #8760; =U2238 /dotminus B: minus sign, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='minusdu'    ]"><img src="{$EntityPath}/minusdu.gif" BORDER="0" ALT="minusdu"/></xsl:template><!-- #57947; =UE25B minus sign, dot below  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ncap'       ]"><img src="{$EntityPath}/ncap.gif" BORDER="0" ALT="ncap"/></xsl:template><!-- #57988; =UE284 bar, intersection  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ncup'       ]"><img src="{$EntityPath}/ncup.gif" BORDER="0" ALT="ncup"/></xsl:template><!-- #57987; =UE283 bar, union  --><!--from DTD3-->
	<xsl:template match="symbol[@name='oast'       ]"><img src="{$EntityPath}/oast.gif" BORDER="0" ALT="oast"/></xsl:template><!-- #8859; =U229B /circledast B: asterisk in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ocir'       ]"><img src="{$EntityPath}/ocir.gif" BORDER="0" ALT="ocir"/></xsl:template><!-- #8858; =U229A /circledcirc B: small circle in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='odash'      ]"><img src="{$EntityPath}/odash.gif" BORDER="0" ALT="odash"/></xsl:template><!-- #8861; =U229D /circleddash B: hyphen in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='odiv'       ]"><img src="{$EntityPath}/odiv.gif" BORDER="0" ALT="odiv"/></xsl:template><!-- #57989; =UE285 divide in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='odot'       ]"><img src="{$EntityPath}/odot.gif" BORDER="0" ALT="odot"/></xsl:template><!-- #8857; =U2299 /odot B: middle dot in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='odsold'     ]"><img src="{$EntityPath}/odsold.gif" BORDER="0" ALT="odsold"/></xsl:template><!-- #57990; =UE286 dot, solidus, dot in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ofcir'      ]"><img src="{$EntityPath}/ofcir.gif" BORDER="0" ALT="ofcir"/></xsl:template><!-- #57991; =UE287 filled circle in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ogt'        ]"><img src="{$EntityPath}/ogt.gif" BORDER="0" ALT="ogt"/></xsl:template><!-- #57993; =UE289 greater-than in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ohbar'      ]"><img src="{$EntityPath}/ohbar.gif" BORDER="0" ALT="ohbar"/></xsl:template><!-- #57952; =UE260 circle with horizontal bar  --><!--from DTD3-->
	<xsl:template match="symbol[@name='olcir'      ]"><img src="{$EntityPath}/olcir.gif" BORDER="0" ALT="olcir"/></xsl:template><!-- #58377; =UE409 large circle in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='olt'        ]"><img src="{$EntityPath}/olt.gif" BORDER="0" ALT="olt"/></xsl:template><!-- #57992; =UE288 less-than in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='omid'       ]"><img src="{$EntityPath}/omid.gif" BORDER="0" ALT="omid"/></xsl:template><!-- #58378; =UE40A vertical bar in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ominus'     ]"><img src="{$EntityPath}/ominus.gif" BORDER="0" ALT="ominus"/></xsl:template><!-- #8854; =U2296 /ominus B: minus sign in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='opar'       ]"><img src="{$EntityPath}/opar.gif" BORDER="0" ALT="opar"/></xsl:template><!-- #57994; =UE28A parallel in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='operp'      ]"><img src="{$EntityPath}/operp.gif" BORDER="0" ALT="operp"/></xsl:template><!-- #57995; =UE28B perpendicular in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='oplus'      ]"><img src="{$EntityPath}/oplus.gif" BORDER="0" ALT="oplus"/></xsl:template><!-- #8853; =U2295 /oplus B: plus sign in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='osol'       ]"><img src="{$EntityPath}/osol.gif" BORDER="0" ALT="osol"/></xsl:template><!-- #8856; =U2298 /oslash B: solidus in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='otimes'     ]"><img src="{$EntityPath}/otimes.gif" BORDER="0" ALT="otimes"/></xsl:template><!-- #8855; =U2297 /otimes B: multiply sign in circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='otimesas'   ]"><img src="{$EntityPath}/otimesas.gif" BORDER="0" ALT="otimesas"/></xsl:template><!-- #57997; =UE28D multiply sign in circle, circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ovbar'      ]"><img src="{$EntityPath}/ovbar.gif" BORDER="0" ALT="ovbar"/></xsl:template><!-- #59448; =UE838 circle with vertical bar  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Otimes'     ]"><img src="{$EntityPath}/ucOtimes.gif" BORDER="0" ALT="Otimes"/></xsl:template><!-- #57996; =UE28C multiply sign in double circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plusacir'   ]"><img src="{$EntityPath}/plusacir.gif" BORDER="0" ALT="plusacir"/></xsl:template><!-- #57962; =UE26A plus, circumflex accent above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plusb'      ]"><img src="{$EntityPath}/plusb.gif" BORDER="0" ALT="plusb"/></xsl:template><!-- #8862; =U229E /boxplus B: plus sign in box  --><!--from DTD3-->
	<xsl:template match="symbol[@name='pluscir'    ]"><img src="{$EntityPath}/pluscir.gif" BORDER="0" ALT="pluscir"/></xsl:template><!-- #57958; =UE266 plus, small circle above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plusdo'     ]"><img src="{$EntityPath}/plusdo.gif" BORDER="0" ALT="plusdo"/></xsl:template><!-- #8724; =U2214 /dotplus B: plus sign, dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plusdu'     ]"><img src="{$EntityPath}/plusdu.gif" BORDER="0" ALT="plusdu"/></xsl:template><!-- #57946; =UE25A plus sign, dot below  --><!--from DTD3-->
	<xsl:template match="symbol[@name='pluse'      ]"><img src="{$EntityPath}/pluse.gif" BORDER="0" ALT="pluse"/></xsl:template><!-- #57959; =UE267 plus, equals  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plussim'    ]"><img src="{$EntityPath}/plussim.gif" BORDER="0" ALT="plussim"/></xsl:template><!-- #57964; =UE26C plus, similar below  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='plustwo'    ]"></xsl:template>--><!-- #57961; =UE269 plus, two; Nim-addition  -->
	<xsl:template match="symbol[@name='prod'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#213;</xsl:text></font></xsl:template><!-- #8719; =U220F /prod L: product operator  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='race'       ]"></xsl:template>--><!-- #58380; =UE40C reverse most positive, line below  -->
	<xsl:template match="symbol[@name='roplus'     ]"><img src="{$EntityPath}/roplus.gif" BORDER="0" ALT="roplus"/></xsl:template><!-- #57949; =UE25D plus sign in right half circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rotimes'    ]"><img src="{$EntityPath}/rotimes.gif" BORDER="0" ALT="rotimes"/></xsl:template><!-- #57951; =UE25F multiply sign in right half circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rthree'     ]"><img src="{$EntityPath}/rthree.gif" BORDER="0" ALT="rthree"/></xsl:template><!-- #8908; =U22CC /rightthreetimes B:  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rtimes'     ]"><img src="{$EntityPath}/rtimes.gif" BORDER="0" ALT="rtimes"/></xsl:template><!-- #8906; =U22CA /rtimes B: times sign, right closed  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sdot'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#215;</xsl:text></font></xsl:template><!-- #8901; =U22C5 /cdot B: small middle dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sdotb'      ]"><img src="{$EntityPath}/sdotb.gif" BORDER="0" ALT="sdotb"/></xsl:template><!-- #8865; =U22A1 /dotsquare /boxdot B: small dot in box  --><!--from DTD3-->
	<xsl:template match="symbol[@name='setmn'      ]">\</xsl:template><!-- #8726; =U2216 /setminus B: reverse solidus  --><!--from DTD3-->
	<xsl:template match="symbol[@name='simplus'    ]"><img src="{$EntityPath}/simplus.gif" BORDER="0" ALT="simplus"/></xsl:template><!-- #57963; =UE26B plus, similar above  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smashp'     ]"></xsl:template>--><!-- #57956; =UE264 smash product  -->
	<xsl:template match="symbol[@name='solb'       ]"><img src="{$EntityPath}/solb.gif" BORDER="0" ALT="solb"/></xsl:template><!-- #57983; =UE27F solidus in square  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sqcap'      ]"><img src="{$EntityPath}/sqcap.gif" BORDER="0" ALT="sqcap"/></xsl:template><!-- #8851; =U2293 /sqcap B: square intersection  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sqcaps'     ]"><img src="{$EntityPath}/sqcaps.gif" BORDER="0" ALT="sqcaps"/></xsl:template><!-- #57975; =UE277 square intersection, serifs  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sqcup'      ]"><img src="{$EntityPath}/sqcup.gif" BORDER="0" ALT="sqcup"/></xsl:template><!-- #8852; =U2294 /sqcup B: square union  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sqcups'     ]"><img src="{$EntityPath}/sqcups.gif" BORDER="0" ALT="sqcups"/></xsl:template><!-- #57974; =UE276 square union, serifs  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ssetmn'     ]"><font size="-2">\</font></xsl:template><!-- #59460; =UE844 /smallsetminus B: sm reverse solidus  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sstarf'     ]"><img src="{$EntityPath}/sstarf.gif" BORDER="0" ALT="sstarf"/></xsl:template><!-- #8902; =U22C6 /star B: small star, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='subdot'     ]"><img src="{$EntityPath}/subdot.gif" BORDER="0" ALT="subdot"/></xsl:template><!-- #57954; =UE262 subset, with dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sum'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#229</xsl:text></font></xsl:template><!-- #8721; =U2211 /sum L: summation operator  -->
	<xsl:template match="symbol[@name='supdot'     ]"><img src="{$EntityPath}/supdot.gif" BORDER="0" ALT="supdot"/></xsl:template><!-- #57955; =UE263 superset, with dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='timesb'     ]"><img src="{$EntityPath}/timesb.gif" BORDER="0" ALT="timesb"/></xsl:template><!-- #8864; =U22A0 /boxtimes B: multiply sign in box  --><!--from DTD3-->
	<xsl:template match="symbol[@name='timesbar'   ]"><img src="{$EntityPath}/timesbar.gif" BORDER="0" ALT="timesbar"/></xsl:template><!-- #57998; =UE28E multiply sign, bar below  --><!--from DTD3-->
	<xsl:template match="symbol[@name='timesd'     ]"><img src="{$EntityPath}/timesd.gif" BORDER="0" ALT="timesd"/></xsl:template><!-- #57965; =UE26D times, dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='tridot'     ]"><img src="{$EntityPath}/tridot.gif" BORDER="0" ALT="tridot"/></xsl:template><!-- #9708; =U25EC dot in triangle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='triminus'   ]"><img src="{$EntityPath}/triminus.gif" BORDER="0" ALT="triminus"/></xsl:template><!-- #57980; =UE27C minus in triangle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='triplus'    ]"><img src="{$EntityPath}/triplus.gif" BORDER="0" ALT="triplus"/></xsl:template><!-- #57979; =UE27B plus in triangle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='trisb'      ]"><img src="{$EntityPath}/trisb.gif" BORDER="0" ALT="trisb"/></xsl:template><!-- #57982; =UE27E triangle, serifs at bottom  --><!--from DTD3-->
	<xsl:template match="symbol[@name='tritime'    ]"><img src="{$EntityPath}/tritime.gif" BORDER="0" ALT="tritime"/></xsl:template><!-- #57981; =UE27D multiply in triangle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='uplus'      ]"><img src="{$EntityPath}/uplus.gif" BORDER="0" ALT="uplus"/></xsl:template><!-- #8846; =U228E /uplus B: plus sign in union  --><!--from DTD3-->
	<xsl:template match="symbol[@name='veebar'     ]"><img src="{$EntityPath}/veebar.gif" BORDER="0" ALT="veebar"/></xsl:template><!-- #8891; =U22BB /veebar B: logical or, bar below  --><!--from DTD3-->
	<xsl:template match="symbol[@name='wedbar'     ]"><img src="{$EntityPath}/wedbar.gif" BORDER="0" ALT="wedbar"/></xsl:template><!-- #57957; =UE265 wedge, bar below  --><!--from DTD3-->
	<xsl:template match="symbol[@name='wreath'     ]"><img src="{$EntityPath}/wreath.gif" BORDER="0" ALT="wreath"/></xsl:template><!-- #8768; =U2240 /wr B: wreath product  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xcap'       ]"><img src="{$EntityPath}/xcap.gif" BORDER="0" ALT="xcap"/></xsl:template><!-- #8898; =U22C2 /bigcap L: intersection operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xcirc'      ]"><img src="{$EntityPath}/xcirc.gif" BORDER="0" ALT="xcirc"/></xsl:template><!-- #9711; =U25EF /bigcirc B: large circle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xcup'       ]"><img src="{$EntityPath}/xcup.gif" BORDER="0" ALT="xcup"/></xsl:template><!-- #8899; =U22C3 /bigcup L: union operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xdtri'      ]"><img src="{$EntityPath}/xdtri.gif" BORDER="0" ALT="xdtri"/></xsl:template><!-- #9661; =U25BD /bigtriangledown B: big dn tri, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xodot'      ]"><img src="{$EntityPath}/xodot.gif" BORDER="0" ALT="xodot"/></xsl:template><!-- #8857; =U2299 /bigodot L: circle dot operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xoplus'     ]"><img src="{$EntityPath}/xoplus.gif" BORDER="0" ALT="xoplus"/></xsl:template><!-- #8853; =U2295 /bigoplus L: circle plus operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xotime'     ]"><img src="{$EntityPath}/xotime.gif" BORDER="0" ALT="xotime"/></xsl:template><!-- #8855; =U2297 /bigotimes L: circle times operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xsqcup'     ]"><img src="{$EntityPath}/xsqcup.gif" BORDER="0" ALT="xsqcup"/></xsl:template><!-- #8852; =U2294 /bigsqcup L: square union operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xuplus'     ]"><img src="{$EntityPath}/xuplus.gif" BORDER="0" ALT="xuplus"/></xsl:template><!-- #8846; =U228E /biguplus L:  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xutri'      ]"><img src="{$EntityPath}/xutri.gif" BORDER="0" ALT="xutri"/></xsl:template><!-- #9651; =U25B3 /bigtriangleup B: big up tri, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xvee'       ]"><img src="{$EntityPath}/xvee.gif" BORDER="0" ALT="xvee"/></xsl:template><!-- #8897; =U22C1 /bigvee L: logical and operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xwedge'     ]"><img src="{$EntityPath}/xwedge.gif" BORDER="0" ALT="xwedge"/></xsl:template><!-- #8896; =U22C0 /bigwedge L: logical or operator  --><!--from DTD3-->
<!-- 

     File isoamsc.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dlcorn'     ]"></xsl:template>--><!-- #8990; =U231E /llcorner O: lower left corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='drcorn'     ]"></xsl:template>--><!-- #8991; =U231F /lrcorner C: lower right corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtlPar'     ]"></xsl:template>--><!-- #58006; =UE296 dbl left parenthesis, greater  -->
	<xsl:template match="symbol[@name='langd'      ]"><img src="{$EntityPath}/langd.gif" BORDER="0" ALT="langd"/></xsl:template><!-- #58007; =UE297 left angle, dot  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbrke'      ]"></xsl:template>--><!-- #58009; =UE299 left bracket, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbrksld'    ]"></xsl:template>--><!-- #58013; =UE29D left bracket, solidus bottom corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbrkslu'    ]"></xsl:template>--><!-- #58011; =UE29B left bracket, solidus top corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lceil'      ]"></xsl:template>--><!-- #8968; =U2308 /lceil O: left ceiling  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lfloor'     ]"></xsl:template>--><!-- #8970; =U230A /lfloor O: left floor  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lmoust'     ]"></xsl:template>--><!-- #58004; =UE294 /lmoustache  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lparlt'     ]"></xsl:template>--><!-- #58002; =UE292 O: left parenthesis, lt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltrPar'     ]"></xsl:template>--><!-- #58005; =UE295 dbl right parenthesis, less  -->
	<xsl:template match="symbol[@name='rangd'      ]"><img src="{$EntityPath}/rangd.gif" BORDER="0" ALT="rangd"/></xsl:template><!-- #58008; =UE298 right angle, dot  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbrke'      ]"></xsl:template>--><!-- #58010; =UE29A right bracket, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbrksld'    ]"></xsl:template>--><!-- #58012; =UE29C right bracket, solidus bottom corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbrkslu'    ]"></xsl:template>--><!-- #58014; =UE29E right bracket, solidus top corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rceil'      ]"></xsl:template>--><!-- #8969; =U2309 /rceil C: right ceiling  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rfloor'     ]"></xsl:template>--><!-- #8971; =U230B /rfloor C: right floor  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rmoust'     ]"></xsl:template>--><!-- #58003; =UE293 /rmoustache  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rpargt'     ]"></xsl:template>--><!-- #58001; =UE291 C: right paren, gt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ulcorn'     ]"></xsl:template>--><!-- #8988; =U231C /ulcorner O: upper left corner  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='urcorn'     ]"></xsl:template>--><!-- #8989; =U231D /urcorner C: upper right corner  -->
<!-- 

     File isoamsn.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gnap'       ]"></xsl:template>--><!-- #58015; =UE29F /gnapprox N: greater, not approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gne'        ]"></xsl:template>--><!-- #8809; =U2269 /gneq N: greater, not equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gnE'        ]"></xsl:template>--><!-- #8809; =U2269 /gneqq N: greater, not dbl equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gnsim'      ]"></xsl:template>--><!-- #8935; =U22E7 /gnsim N: greater, not similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gvnE'       ]"></xsl:template>--><!-- #58017; =UE2A1 /gvertneqq N: gt, vert, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lnap'       ]"></xsl:template>--><!-- #58018; =UE2A2 /lnapprox N: less, not approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lne'        ]"></xsl:template>--><!-- #8808; =U2268 /lneq N: less, not equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lnE'        ]"></xsl:template>--><!-- #8808; =U2268 /lneqq N: less, not double equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lnsim'      ]"></xsl:template>--><!-- #8934; =U22E6 /lnsim N: less, not similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lvnE'       ]"></xsl:template>--><!-- #58020; =UE2A4 /lvertneqq N: less, vert, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nap'        ]"></xsl:template>--><!-- #8777; =U2249 /napprox N: not approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='napE'       ]"></xsl:template>--><!-- #58055; =UE2C7 not approximately equal or equal to  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='napid'      ]"></xsl:template>--><!-- #58044; =UE2BC not approximately identical to  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ncong'      ]"></xsl:template>--><!-- #8775; =U2247 /ncong N: not congruent with  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ncongdot'   ]"></xsl:template>--><!-- #58053; =UE2C5 not congruent, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nequiv'     ]"></xsl:template>--><!-- #8802; =U2262 /nequiv N: not identical with  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nge'        ]"></xsl:template>--><!-- #58022; =UE2A6 /ngeq N: not greater-than-or-equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nges'       ]"></xsl:template>--><!-- #8817; =U2271 /ngeqslant N: not gt-or-eq, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngE'        ]"></xsl:template>--><!-- #8817; =U2271 /ngeqq N: not greater, dbl equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngsim'      ]"></xsl:template>--><!-- #8821; =U2275 not greater, similar  -->
	<xsl:template match="symbol[@name='ngt'        ]"><img src="{$EntityPath}/ngt-.gif" BORDER="0" ALT="ngt"/></xsl:template><!-- #8815; =U226F /ngtr N: not greater-than  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nGg'        ]"></xsl:template>--><!-- #58062; =UE2CE not triple greater than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nGt'        ]"></xsl:template>--><!-- #58058; =UE2CA not, vert, much greater than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nGtv'       ]"></xsl:template>--><!-- #58060; =UE2CC not much greater than, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nle'        ]"></xsl:template>--><!-- #58023; =UE2A7 /nleq N: not less-than-or-equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nles'       ]"></xsl:template>--><!-- #8816; =U2270 /nleqslant N: not less-or-eq, slant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nlE'        ]"></xsl:template>--><!-- #8816; =U2270 /nleqq N: not less, dbl equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nlsim'      ]"></xsl:template>--><!-- #8820; =U2274 not less, similar  -->
	<xsl:template match="symbol[@name='nlt'        ]"><img src="{$EntityPath}/nlt-.gif" BORDER="0" ALT="nlt"/></xsl:template><!-- #8814; =U226E /nless N: not less-than  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nltri'      ]"></xsl:template>--><!-- #8938; =U22EA /ntriangleleft N: not left triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nltrie'     ]"></xsl:template>--><!-- #8940; =U22EC /ntrianglelefteq N: not l tri, eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nLl'        ]"></xsl:template>--><!-- #58061; =UE2CD not triple less than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nLt'        ]"></xsl:template>--><!-- #58057; =UE2C9 not, vert, much less than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nLtv'       ]"></xsl:template>--><!-- #58059; =UE2CB not much less than, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nmid'       ]"></xsl:template>--><!-- #8740; =U2224 /nmid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npar'       ]"></xsl:template>--><!-- #8742; =U2226 /nparallel N: not parallel  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npr'        ]"></xsl:template>--><!-- #8832; =U2280 /nprec N: not precedes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nprcue'     ]"></xsl:template>--><!-- #8928; =U22E0 not curly precedes, eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npre'       ]"></xsl:template>--><!-- #58844; =UE5DC /npreceq N: not precedes, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrtri'      ]"></xsl:template>--><!-- #8939; =U22EB /ntriangleright N: not rt triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrtrie'     ]"></xsl:template>--><!-- #8941; =U22ED /ntrianglerighteq N: not r tri, eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsc'        ]"></xsl:template>--><!-- #8833; =U2281 /nsucc N: not succeeds  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsccue'     ]"></xsl:template>--><!-- #8929; =U22E1 not succeeds, curly eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsce'       ]"></xsl:template>--><!-- #58865; =UE5F1 /nsucceq N: not succeeds, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsim'       ]"></xsl:template>--><!-- #8769; =U2241 /nsim N: not similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsime'      ]"></xsl:template>--><!-- #8772; =U2244 /nsimeq N: not similar, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsmid'      ]"></xsl:template>--><!-- #58026; =UE2AA /nshortmid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nspar'      ]"></xsl:template>--><!-- #58027; =UE2AB /nshortparallel N: not short par  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsqsube'    ]"></xsl:template>--><!-- #8930; =U22E2 not, square subset, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsqsupe'    ]"></xsl:template>--><!-- #8931; =U22E3 not, square superset, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsub'       ]"></xsl:template>--><!-- #8836; =U2284 not subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsube'      ]"></xsl:template>--><!-- #8840; =U2288 /nsubseteq N: not subset, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsubE'      ]"></xsl:template>--><!-- #8840; =U2288 /nsubseteqq N: not subset, dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsup'       ]"></xsl:template>--><!-- #8837; =U2285 not superset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsupe'      ]"></xsl:template>--><!-- #8841; =U2289 /nsupseteq N: not superset, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsupE'      ]"></xsl:template>--><!-- #8841; =U2289 /nsupseteqq N: not superset, dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntgl'       ]"></xsl:template>--><!-- #8825; =U2279 not greater, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntlg'       ]"></xsl:template>--><!-- #8824; =U2278 not less, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvap'       ]"></xsl:template>--><!-- #58054; =UE2C6 not, vert, approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvdash'     ]"></xsl:template>--><!-- #8876; =U22AC /nvdash N: not vertical, dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvDash'     ]"></xsl:template>--><!-- #8877; =U22AD /nvDash N: not vertical, dbl dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvge'       ]"></xsl:template>--><!-- #8817; =U2271 not, vert, greater-than-or-equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvgt'       ]"></xsl:template>--><!-- #8815; =U226F not, vert, greater-than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvle'       ]"></xsl:template>--><!-- #8816; =U2270 not, vert, less-than-or-equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvlt'       ]"></xsl:template>--><!-- #8814; =U226E not, vert, less-than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvltrie'    ]"></xsl:template>--><!-- #58064; =UE2D0 not, vert, left triangle, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvrtrie'    ]"></xsl:template>--><!-- #58063; =UE2CF not, vert, right triangle, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvsim'      ]"></xsl:template>--><!-- #58389; =UE415 not, vert, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nVdash'     ]"></xsl:template>--><!-- #8878; =U22AE /nVdash N: not dbl vertical, dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nVDash'     ]"></xsl:template>--><!-- #8879; =U22AF /nVDash N: not dbl vert, dbl dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='parsim'     ]"></xsl:template>--><!-- #58056; =UE2C8 parallel, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prnap'      ]"></xsl:template>--><!-- #8936; =U22E8 /precnapprox N: precedes, not approx  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prnE'       ]"></xsl:template>--><!-- #58035; =UE2B3 /precneqq N: precedes, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prnsim'     ]"></xsl:template>--><!-- #8936; =U22E8 /precnsim N: precedes, not similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rnmid'      ]"></xsl:template>--><!-- #58065; =UE2D1 reverse /nmid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scnap'      ]"></xsl:template>--><!-- #8937; =U22E9 /succnapprox N: succeeds, not approx  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scnE'       ]"></xsl:template>--><!-- #58037; =UE2B5 /succneqq N: succeeds, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scnsim'     ]"></xsl:template>--><!-- #8937; =U22E9 /succnsim N: succeeds, not similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simne'      ]"></xsl:template>--><!-- #8774; =U2246 similar, not equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='solbar'     ]"></xsl:template>--><!-- #58390; =UE416 solidus, bar through  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subne'      ]"></xsl:template>--><!-- #8842; =U228A /subsetneq N: subset, not equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subnE'      ]"></xsl:template>--><!-- #8842; =U228A /subsetneqq N: subset, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supne'      ]"></xsl:template>--><!-- #8843; =U228B /supsetneq N: superset, not equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supnE'      ]"></xsl:template>--><!-- #8843; =U228B /supsetneqq N: superset, not dbl eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vnsub'      ]"></xsl:template>--><!-- #8836; =U2284 /nsubset N: not subset, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vnsup'      ]"></xsl:template>--><!-- #8837; =U2285 /nsupset N: not superset, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vsubne'     ]"></xsl:template>--><!-- #58041; =UE2B9 /varsubsetneq N: subset, not eq, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vsubnE'     ]"></xsl:template>--><!-- #58040; =UE2B8 /varsubsetneqq N: subset not dbl eq, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vsupne'     ]"></xsl:template>--><!-- #58042; =UE2BA /varsupsetneq N: superset, not eq, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vsupnE'     ]"></xsl:template>--><!-- #58043; =UE2BB /varsupsetneqq N: super not dbl eq, var  -->
<!-- 

     File isoamso.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='ang'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#208;</xsl:text></font></xsl:template><!-- #8736; =U2220 /angle - angle  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ange'       ]"><img src="{$EntityPath}/ange.gif" BORDER="0" ALT="ange"/></xsl:template><!-- #58070; =UE2D6 angle, equal  --><!--from DTD3-->
	<xsl:template match="symbol[@name='angmsd'     ]"><img src="{$EntityPath}/angmsd-.gif" ALIGN="absbottom" BORDER="0" ALT="angmsd"/></xsl:template><!-- #8737; =U2221 /measuredangle - angle-measured  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdaa'   ]"></xsl:template>--><!-- #58073; =UE2D9 angle-measured, arrow, up, right  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdab'   ]"></xsl:template>--><!-- #58074; =UE2DA angle-measured, arrow, up, left  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdac'   ]"></xsl:template>--><!-- #58075; =UE2DB angle-measured, arrow, down, right  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdad'   ]"></xsl:template>--><!-- #58076; =UE2DC angle-measured, arrow, down, left  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdae'   ]"></xsl:template>--><!-- #58077; =UE2DD angle-measured, arrow, right, up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdaf'   ]"></xsl:template>--><!-- #58078; =UE2DE angle-measured, arrow, left, up  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdag'   ]"></xsl:template>--><!-- #58079; =UE2DF angle-measured, arrow, right, down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angmsdah'   ]"></xsl:template>--><!-- #58080; =UE2E0 angle-measured, arrow, left, down  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angrtvb'    ]"></xsl:template>--><!-- #58392; =UE418 right angle-measured  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angrtvbd'   ]"></xsl:template>--><!-- #58081; =UE2E1 right angle-measured, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bbrk'       ]"></xsl:template>--><!-- #58094; =UE2EE bottom square bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bbrktbrk'   ]"></xsl:template>--><!-- #58393; =UE419 bottom above top square bracket  -->
	<xsl:template match="symbol[@name='bemptyv'    ]"><img src="{$EntityPath}/bemptyv.gif" BORDER="0" ALT="bemptyv"/></xsl:template><!-- #58394; =UE41A reversed circle, slash  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='beth'       ]"></xsl:template>--><!-- #8502; =U2136 /beth - beth, Hebrew  -->
	<xsl:template match="symbol[@name='boxbox'     ]"><img src="{$EntityPath}/boxbox.gif" BORDER="0" ALT="boxbox"/></xsl:template><!-- #58086; =UE2E6 two joined squares  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bprime'     ]"><img src="{$EntityPath}/bprime.gif" BORDER="0" ALT="bprime"/></xsl:template><!-- #8245; =U2035 /backprime - reverse prime  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bsemi'      ]"><img src="{$EntityPath}/bsemi-.gif" ALIGN="absbottom" BORDER="0" ALT="bsemi"/></xsl:template><!-- #58093; =UE2ED reverse semi-colon  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cemptyv'    ]"><img src="{$EntityPath}/cemptyv.gif" BORDER="0" ALT="cemptyv"/></xsl:template><!-- #58088; =UE2E8 circle, slash, small circle above  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cirE'       ]"></xsl:template>--><!-- #58395; =UE41B circle, two horizontal stroked to the right  -->
	<xsl:template match="symbol[@name='cirscir'    ]"><img src="{$EntityPath}/cirscir.gif" BORDER="0" ALT="cirscir"/></xsl:template><!-- #58396; =UE41C circle, small circle to the right  --><!--from DTD3-->
	<xsl:template match="symbol[@name='comp'       ]"><img src="{$EntityPath}/comp.gif" BORDER="0" ALT="comp"/></xsl:template><!-- #8705; =U2201 /complement - complement sign  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='daleth'     ]"></xsl:template>--><!-- #8504; =U2138 /daleth - daleth, Hebrew  -->
	<xsl:template match="symbol[@name='demptyv'    ]"><img src="{$EntityPath}/demptyv.gif" BORDER="0" ALT="demptyv"/></xsl:template><!-- #58087; =UE2E7 circle, slash, bar above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ell'        ]"><img src="{$EntityPath}/ell.gif" BORDER="0" ALT="ell"/></xsl:template><!-- #8467; =U2113 /ell - cursive small l  --><!--from DTD3-->
	<xsl:template match="symbol[@name='empty'      ]"><img src="{$EntityPath}/empty.gif" BORDER="0" ALT="empty"/></xsl:template><!-- #58067; =UE2D3 /emptyset - zero, slash  --><!--from DTD3-->
	<xsl:template match="symbol[@name='emptyv'     ]"><img src="{$EntityPath}/emptyv.gif" BORDER="0" ALT="emptyv"/></xsl:template><!-- #8709; =U2205 /varnothing - circle, slash  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gimel'      ]"></xsl:template>--><!-- #8503; =U2137 /gimel - gimel, Hebrew  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iiota'      ]"></xsl:template>--><!-- #8489; =U2129 inverted iota  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='image'      ]"></xsl:template>--><!-- #8465; =U2111 /Im - imaginary    -->
	<xsl:template match="symbol[@name='imath'      ]"><img src="{$EntityPath}/imath.gif" BORDER="0" ALT="imath"/></xsl:template><!-- #305; =U0131 /imath - small i, no dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='jmath'      ]"><img src="{$EntityPath}/jmath-.gif" ALIGN="absbottom" BORDER="0" ALT="jmath"/></xsl:template><!-- #58068; =UE2D4 /jmath - small j, no dot  --><!--from DTD3-->
	<xsl:template match="symbol[@name='laemptyv'   ]"><img src="{$EntityPath}/laemptyv.gif" BORDER="0" ALT="laemptyv"/></xsl:template><!-- #58090; =UE2EA circle, slash, left arrow above  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lltri'      ]"></xsl:template>--><!-- #58085; =UE2E5 lower left triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lrtri'      ]"></xsl:template>--><!-- #58083; =UE2E3 lower right triangle  -->
	<xsl:template match="symbol[@name='mho'        ]"><img src="{$EntityPath}/mho.gif" BORDER="0" ALT="mho"/></xsl:template><!-- #8487; =U2127 /mho - conductance  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nang'       ]"></xsl:template>--><!-- #58072; =UE2D8 not, vert, angle  -->
	<xsl:template match="symbol[@name='nexist'     ]"><img src="{$EntityPath}/nexist-.gif" ALIGN="absbottom" BORDER="0" ALT="nexist"/></xsl:template><!-- #8708; =U2204 /nexists - negated exists  --><!--from DTD3-->
	<xsl:template match="symbol[@name='oS'         ]"><img src="{$EntityPath}/ocapS.gif" BORDER="0" ALT="oS"/></xsl:template><!-- #9416; =U24C8 /circledS - capital S in circle  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='plank'      ]"></xsl:template>--><!-- #58069; =UE2D5 /hbar - Planck's over 2pi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='plankv'     ]"></xsl:template>--><!-- #8463; =U210F /hslash - variant Planck's over 2pi  -->
	<xsl:template match="symbol[@name='raemptyv'   ]"><img src="{$EntityPath}/raemptyv.gif" BORDER="0" ALT="raemptyv"/></xsl:template><!-- #58089; =UE2E9 circle, slash, right arrow above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='range'      ]"><img src="{$EntityPath}/range.gif" BORDER="0" ALT="range"/></xsl:template><!-- #58071; =UE2D7 reverse angle, equal  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='real'       ]"></xsl:template>--><!-- #8476; =U211C /Re - real  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tbrk'       ]"></xsl:template>--><!-- #58095; =UE2EF top square bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='trpezium'   ]"></xsl:template>--><!-- #58092; =UE2EC trapezium  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ultri'      ]"></xsl:template>--><!-- #58084; =UE2E4 upper left triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='urtri'      ]"></xsl:template>--><!-- #58082; =UE2E2 upper right triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vzigzag'    ]"></xsl:template>--><!-- #58091; =UE2EB vertical zig-zag line  -->
	<xsl:template match="symbol[@name='weierp'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#195;</xsl:text></font></xsl:template><!-- #8472; =U2118 /wp - Weierstrass p  --><!--from DTD3-->
<!-- 

     File isoamsr.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='ape'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#187;</xsl:text></font></xsl:template><!-- #8778; =U224A /approxeq R: approximate, equals  --><!--from DTD3-->
	<xsl:template match="symbol[@name='apE'        ]"><img src="{$EntityPath}/apucE.gif" BORDER="0" ALT="apE"/></xsl:template><!-- #8778; =U224A approximately equal or equal to  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='apid'       ]"></xsl:template>--><!-- #8779; =U224B approximately identical to  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='asymp'      ]"></xsl:template>--><!-- #8781; =U224D /asymp R: asymptotically equal to  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bcong'      ]"></xsl:template>--><!-- #8780; =U224C /backcong R: reverse congruent  -->
	<xsl:template match="symbol[@name='bepsi'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#039;</xsl:text></font></xsl:template><!-- #59392; =UE800 /backepsilon R: such that  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bowtie'     ]"><img src="{$EntityPath}/bowtie.gif" BORDER="0" ALT="bowtie"/></xsl:template><!-- #8904; =U22C8 /bowtie R:  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bsim'       ]"></xsl:template>--><!-- #8765; =U223D /backsim R: reverse similar  -->
	<xsl:template match="symbol[@name='bsime'      ]"><img src="{$EntityPath}/bsime.gif" BORDER="0" ALT="bsime"/></xsl:template><!-- #8909; =U22CD /backsimeq R: reverse similar, eq  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bsolhsub'   ]"></xsl:template>--><!-- #58189; =UE34D reverse solidus, subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bump'       ]"></xsl:template>--><!-- #8782; =U224E /Bumpeq R: bumpy equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bumpe'      ]"></xsl:template>--><!-- #8783; =U224F /bumpeq R: bumpy equals, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bumpE'      ]"></xsl:template>--><!-- #58134; =UE316 bump, equals  -->
	<xsl:template match="symbol[@name='Barv'       ]"><img src="{$EntityPath}/ucBarv.gif" BORDER="0" ALT="Barv"/></xsl:template><!-- #58129; =UE311 vert, dbl bar (over)  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cire'       ]"></xsl:template>--><!-- #8791; =U2257 /circeq R: circle, equals  -->
	<xsl:template match="symbol[@name='colone'     ]"><nobr>:=</nobr></xsl:template><!-- #8788; =U2254 /coloneq R: colon, equals  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='congdot'    ]"></xsl:template>--><!-- #58132; =UE314 congruent, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='csub'       ]"></xsl:template>--><!-- #58193; =UE351 subset, closed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='csube'      ]"></xsl:template>--><!-- #58195; =UE353 subset, closed, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='csup'       ]"></xsl:template>--><!-- #58194; =UE352 superset, closed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='csupe'      ]"></xsl:template>--><!-- #58196; =UE354 superset, closed, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cuepr'      ]"></xsl:template>--><!-- #8926; =U22DE /curlyeqprec R: curly eq, precedes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cuesc'      ]"></xsl:template>--><!-- #8927; =U22DF /curlyeqsucc R: curly eq, succeeds  -->
	<xsl:template match="symbol[@name='Colon'      ]"><nobr>::</nobr></xsl:template><!-- #8759; =U2237 /Colon, two colons  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Colone'     ]"><nobr>::=</nobr></xsl:template><!-- #58126; =UE30E double colon, equals  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dashv'      ]"><img src="{$EntityPath}/dashv.gif" BORDER="0" ALT="dashv"/></xsl:template><!-- #8867; =U22A3 /dashv R: dash, vertical  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Dashv'      ]"><img src="{$EntityPath}/ucDashv.gif" BORDER="0" ALT="Dashv"/></xsl:template><!-- #58127; =UE30F dbl dash, vertical  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='easter'     ]"></xsl:template>--><!-- #8795; =U225B equal, asterisk above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ecir'       ]"></xsl:template>--><!-- #8790; =U2256 /eqcirc R: circle on equals sign  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ecolon'     ]"></xsl:template>--><!-- #8789; =U2255 /eqcolon R: equals, colon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eDDot'      ]"></xsl:template>--><!-- #58121; =UE309 /ddotseq R: equal with four dots  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eDot'       ]"></xsl:template>--><!-- #8785; =U2251 /doteqdot /Doteq R: eq, even dots  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='efDot'      ]"></xsl:template>--><!-- #8786; =U2252 /fallingdotseq R: eq, falling dots  -->
	<xsl:template match="symbol[@name='eg'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#179;</xsl:text></font></xsl:template><!-- #58152; =UE328 equal-or-greater  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='egs'        ]"></xsl:template>--><!-- #8925; =U22DD /eqslantgtr R: equal-or-gtr, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='egsdot'     ]"></xsl:template>--><!-- #58148; =UE324 equal-or-greater, slanted, dot inside  -->
	<xsl:template match="symbol[@name='el'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#163;</xsl:text></font></xsl:template><!-- #58151; =UE327 equal-or-less  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='els'        ]"></xsl:template>--><!-- #8924; =U22DC /eqslantless R: eq-or-less, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='elsdot'     ]"></xsl:template>--><!-- #58147; =UE323 equal-or-less, slanted, dot inside  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='equest'     ]"></xsl:template>--><!-- #8799; =U225F /questeq R: equal with questionmark  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='equivDD'    ]"></xsl:template>--><!-- #58136; =UE318 equivalent, four dots above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='erDot'      ]"></xsl:template>--><!-- #8787; =U2253 /risingdotseq R: eq, rising dots  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='esdot'      ]"></xsl:template>--><!-- #8784; =U2250 /doteq R: equals, single dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='esim'       ]"></xsl:template>--><!-- #8770; =U2242 /esim R: equals, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Esim'       ]"></xsl:template>--><!-- #58135; =UE317 equal, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='fork'       ]"></xsl:template>--><!-- #8916; =U22D4 /pitchfork R: pitchfork  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='forkv'      ]"></xsl:template>--><!-- #58139; =UE31B fork, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='frown'      ]"></xsl:template>--><!-- #8994; =U2322 /frown R: down curve  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gap'        ]"></xsl:template>--><!-- #8819; =U2273 /gtrapprox R: greater, approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gel'        ]"></xsl:template>--><!-- #8923; =U22DB /gtreqless R: greater, equals, less  -->
	<xsl:template match="symbol[@name='ges'        ]"><img src="{$EntityPath}/ges.gif" BORDER="0" ALT="ges"/></xsl:template><!-- #58102; =UE2F6 /geqslant R: gt-or-equal, slanted  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gescc'      ]"></xsl:template>--><!-- #58200; =UE358 greater than, closed by curve, equal, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gesdot'     ]"></xsl:template>--><!-- #58142; =UE31E greater-than-or-equal, slanted, dot inside  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gesdoto'    ]"></xsl:template>--><!-- #58144; =UE320 greater-than-or-equal, slanted, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gesdotol'   ]"></xsl:template>--><!-- #58146; =UE322 greater-than-or-equal, slanted, dot above left  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gesl'       ]"></xsl:template>--><!-- #58156; =UE32C greater, equal, slanted, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gesles'     ]"></xsl:template>--><!-- #58162; =UE332 greater, equal, slanted, less, equal, slanted  -->
	<xsl:template match="symbol[@name='gE'         ]"><img src="{$EntityPath}/gucE.gif" BORDER="0" ALT="gE"/></xsl:template><!-- #8807; =U2267 /geqq R: greater, double equals  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gEl'        ]"></xsl:template>--><!-- #8923; =U22DB /gtreqqless R: gt, dbl equals, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gl'         ]"></xsl:template>--><!-- #8823; =U2277 /gtrless R: greater, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gla'        ]"></xsl:template>--><!-- #58160; =UE330 greater, less, apart  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='glE'        ]"></xsl:template>--><!-- #58158; =UE32E greater, less, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='glj'        ]"></xsl:template>--><!-- #58159; =UE32F greater, less, overlapping  -->
	<xsl:template match="symbol[@name='gsim'       ]"><img src="{$EntityPath}/gsim-.gif" BORDER="0" ALT="gsim"/></xsl:template><!-- #8819; =U2273 /gtrsim R: greater, similar  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gsime'      ]"></xsl:template>--><!-- #58164; =UE334 greater, similar, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gsiml'      ]"></xsl:template>--><!-- #58166; =UE336 greater, similar, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtcc'       ]"></xsl:template>--><!-- #58198; =UE356 greater than, closed by curve  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtcir'      ]"></xsl:template>--><!-- #58150; =UE326 greater than, circle inside  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtdot'      ]"></xsl:template>--><!-- #8919; =U22D7 /gtrdot R: greater than, with dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtquest'    ]"></xsl:template>--><!-- #58154; =UE32A greater than, questionmark above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtrarr'     ]"></xsl:template>--><!-- #58207; =UE35F greater than, right arrow  -->
	<xsl:template match="symbol[@name='Gg'         ]"><img src="{$EntityPath}/ucGg.gif" BORDER="0" ALT="Gg"/></xsl:template><!-- #8921; =U22D9 /ggg /Gg /gggtr R: triple gtr-than  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Gt'         ]"><img src="{$EntityPath}/ucGt.gif" BORDER="0" ALT="Gt"/></xsl:template><!-- #8811; =U226B /gg R: dbl greater-than sign  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='homtht'     ]"></xsl:template>--><!-- #8763; =U223B homothetic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lap'        ]"></xsl:template>--><!-- #8818; =U2272 /lessapprox R: less, approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lat'        ]"></xsl:template>--><!-- #58170; =UE33A larger than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='late'       ]"></xsl:template>--><!-- #58172; =UE33C larger than or equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lates'      ]"></xsl:template>--><!-- #58174; =UE33E larger than or equal, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leg'        ]"></xsl:template>--><!-- #8922; =U22DA /lesseqgtr R: less, eq, greater  -->
	<xsl:template match="symbol[@name='les'        ]"><img src="{$EntityPath}/les.gif" BORDER="0" ALT="les"/></xsl:template><!-- #58106; =UE2FA /leqslant R: less-than-or-eq, slant  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lescc'      ]"></xsl:template>--><!-- #58199; =UE357 less than, closed by curve, equal, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesdot'     ]"></xsl:template>--><!-- #58141; =UE31D less-than-or-equal, slanted, dot inside  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesdoto'    ]"></xsl:template>--><!-- #58143; =UE31F less-than-or-equal, slanted, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesdotor'   ]"></xsl:template>--><!-- #58145; =UE321 less-than-or-equal, slanted, dot above right  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesg'       ]"></xsl:template>--><!-- #58155; =UE32B less, equal, slanted, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesges'     ]"></xsl:template>--><!-- #58161; =UE331 less, equal, slanted, greater, equal, slanted  -->
	<xsl:template match="symbol[@name='lE'         ]"><img src="{$EntityPath}/lucE.gif" BORDER="0" ALT="lE"/></xsl:template><!-- #8806; =U2266 /leqq R: less, double equals  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lEg'        ]"></xsl:template>--><!-- #8922; =U22DA /lesseqqgtr R: less, dbl eq, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lg'         ]"></xsl:template>--><!-- #8822; =U2276 /lessgtr R: less, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lgE'        ]"></xsl:template>--><!-- #58157; =UE32D less, greater, equal  -->
	<xsl:template match="symbol[@name='lsim'       ]"><img src="{$EntityPath}/lsim-.gif" BORDER="0" ALT="lsim"/></xsl:template><!-- #8818; =U2272 /lesssim R: less, similar  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lsime'      ]"></xsl:template>--><!-- #58163; =UE333 less, similar, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lsimg'      ]"></xsl:template>--><!-- #58165; =UE335 less, similar, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltcc'       ]"></xsl:template>--><!-- #58197; =UE355 less than, closed by curve  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltcir'      ]"></xsl:template>--><!-- #58149; =UE325 less than, circle inside  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltdot'      ]"></xsl:template>--><!-- #8918; =U22D6 /lessdot R: less than, with dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltlarr'     ]"></xsl:template>--><!-- #58206; =UE35E less than, left arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltquest'    ]"></xsl:template>--><!-- #58153; =UE329 less than, questionmark above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ltrie'      ]"></xsl:template>--><!-- #8884; =U22B4 /trianglelefteq R: left triangle, eq  -->
	<xsl:template match="symbol[@name='Ll'         ]"><img src="{$EntityPath}/ucLl.gif" BORDER="0" ALT="Ll"/></xsl:template><!-- #8920; =U22D8 /Ll /lll /llless R: triple less-than  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Lt'         ]"><img src="{$EntityPath}/ucLt.gif" BORDER="0" ALT="Lt"/></xsl:template><!-- #8810; =U226A /ll R: double less-than sign  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mcomma'     ]"></xsl:template>--><!-- #58138; =UE31A minus, comma above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mDDot'      ]"></xsl:template>--><!-- #8762; =U223A minus with four dots, geometric properties  -->
	<xsl:template match="symbol[@name='mid'        ]"><img src="{$EntityPath}/mid.gif" BORDER="0" ALT="mid"/></xsl:template><!-- #8739; =U2223 /mid R:  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mlcp'       ]"></xsl:template>--><!-- #58122; =UE30A /mlcp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='models'     ]"></xsl:template>--><!-- #8871; =U22A7 /models R:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mstpos'     ]"></xsl:template>--><!-- #8766; =U223E most positive  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pr'         ]"></xsl:template>--><!-- #8826; =U227A /prec R: precedes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prap'       ]"></xsl:template>--><!-- #8830; =U227E /precapprox R: precedes, approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prcue'      ]"></xsl:template>--><!-- #8828; =U227C /preccurlyeq R: precedes, curly eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pre'        ]"></xsl:template>--><!-- #58110; =UE2FE /preceq R: precedes, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prE'        ]"></xsl:template>--><!-- #58110; =UE2FE precedes, dbl equals  -->
	<xsl:template match="symbol[@name='prsim'      ]"><img src="{$EntityPath}/prsim-.gif" BORDER="0" ALT="prsim"/></xsl:template><!-- #8830; =U227E /precsim R: precedes, similar  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prurel'     ]"></xsl:template>--><!-- #8880; =U22B0 element precedes under relation  -->
	<xsl:template match="symbol[@name='Pr'         ]"><img src="{$EntityPath}/ucPr.gif" BORDER="0" ALT="Pr"/></xsl:template><!-- #58204; =UE35C dbl precedes  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ratio'      ]"></xsl:template>--><!-- #8758; =U2236 /ratio  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rtrie'      ]"></xsl:template>--><!-- #8885; =U22B5 /trianglerighteq R: right tri, eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rtriltri'   ]"></xsl:template>--><!-- #58201; =UE359 right triangle above left triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sc'         ]"></xsl:template>--><!-- #8827; =U227B /succ R: succeeds  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scap'       ]"></xsl:template>--><!-- #8831; =U227F /succapprox R: succeeds, approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sccue'      ]"></xsl:template>--><!-- #8829; =U227D /succcurlyeq R: succeeds, curly eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sce'        ]"></xsl:template>--><!-- #8829; =U227D /succeq R: succeeds, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scE'        ]"></xsl:template>--><!-- #8830; =U227E succeeds, dbl equals  -->
	<xsl:template match="symbol[@name='scsim'      ]"><img src="{$EntityPath}/scsim-.gif" BORDER="0" ALT="scsim"/></xsl:template><!-- #8831; =U227F /succsim R: succeeds, similar  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sdote'      ]"></xsl:template>--><!-- #58137; =UE319 equal, dot below  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simg'       ]"></xsl:template>--><!-- #58124; =UE30C similar, greater  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simgE'      ]"></xsl:template>--><!-- #58168; =UE338 similar, greater, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='siml'       ]"></xsl:template>--><!-- #58123; =UE30B similar, less  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simlE'      ]"></xsl:template>--><!-- #58167; =UE337 similar, less, equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smid'       ]"></xsl:template>--><!-- #58113; =UE301 /shortmid R:  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smile'      ]"></xsl:template>--><!-- #8995; =U2323 /smile R: up curve  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smt'        ]"></xsl:template>--><!-- #58169; =UE339 smaller than  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smte'       ]"></xsl:template>--><!-- #58171; =UE33B smaller than or equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smtes'      ]"></xsl:template>--><!-- #58173; =UE33D smaller than or equal, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='spar'       ]"></xsl:template>--><!-- #58114; =UE302 /shortparallel R: short parallel  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsub'      ]"></xsl:template>--><!-- #8847; =U228F /sqsubset R: square subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsube'     ]"></xsl:template>--><!-- #8849; =U2291 /sqsubseteq R: square subset, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsup'      ]"></xsl:template>--><!-- #8848; =U2290 /sqsupset R: square superset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsupe'     ]"></xsl:template>--><!-- #8850; =U2292 /sqsupseteq R: square superset, eq  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subedot'    ]"></xsl:template>--><!-- #58191; =UE34F subset, equals, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subE'       ]"></xsl:template>--><!-- #8838; =U2286 /subseteqq R: subset, dbl equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='submult'    ]"></xsl:template>--><!-- #58179; =UE343 subset, multiply  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subplus'    ]"></xsl:template>--><!-- #58177; =UE341 subset, plus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subrarr'    ]"></xsl:template>--><!-- #58175; =UE33F subset, right arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subsim'     ]"></xsl:template>--><!-- #58181; =UE345 subset, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subsub'     ]"></xsl:template>--><!-- #58185; =UE349 subset above subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subsup'     ]"></xsl:template>--><!-- #58183; =UE347 subset above superset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supdsub'    ]"></xsl:template>--><!-- #58188; =UE34C superset, subset, dash joining them  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supedot'    ]"></xsl:template>--><!-- #58192; =UE350 superset, equals, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supE'       ]"></xsl:template>--><!-- #8839; =U2287 /supseteqq R: superset, dbl equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='suphsol'    ]"></xsl:template>--><!-- #58190; =UE34E superset, solidus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='suphsub'    ]"></xsl:template>--><!-- #58187; =UE34B superset, subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='suplarr'    ]"></xsl:template>--><!-- #58176; =UE340 superset, left arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supmult'    ]"></xsl:template>--><!-- #58180; =UE344 superset, multiply  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supplus'    ]"></xsl:template>--><!-- #58178; =UE342 superset, plus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supsim'     ]"></xsl:template>--><!-- #58182; =UE346 superset, similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supsub'     ]"></xsl:template>--><!-- #58184; =UE348 superset above subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supsup'     ]"></xsl:template>--><!-- #58186; =UE34A superset above superset  -->
	<xsl:template match="symbol[@name='Sc'         ]"><img src="{$EntityPath}/ucSc.gif" BORDER="0" ALT="Sc"/></xsl:template><!-- #58205; =UE35D dbl succeeds  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sub'        ]"></xsl:template>--><!-- #8912; =U22D0 /Subset R: double subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sup'        ]"></xsl:template>--><!-- #8913; =U22D1 /Supset R: dbl superset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='thkap'      ]"></xsl:template>--><!-- #58118; =UE306 /thickapprox R: thick approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='thksim'     ]"></xsl:template>--><!-- #58409; =UE429 /thicksim R: thick similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='topfork'    ]"></xsl:template>--><!-- #58140; =UE31C fork with top  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='trie'       ]"></xsl:template>--><!-- #8796; =U225C /triangleq R: triangle, equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='twixt'      ]"></xsl:template>--><!-- #8812; =U226C /between R: between  -->
	<xsl:template match="symbol[@name='vBar'       ]"><img src="{$EntityPath}/vucBar.gif" BORDER="0" ALT="vBar"/></xsl:template><!-- #58128; =UE310 vert, dbl bar (under)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='vBarv'      ]"><img src="{$EntityPath}/vucBarv.gif" BORDER="0" ALT="vBarv"/></xsl:template><!-- #58130; =UE312 dbl bar, vert over and under  --><!--from DTD3-->
	<xsl:template match="symbol[@name='vdash'      ]"><img src="{$EntityPath}/vdash.gif" BORDER="0" ALT="vdash"/></xsl:template><!-- #8866; =U22A2 /vdash R: vertical, dash  --><!--from DTD3-->
	<xsl:template match="symbol[@name='vDash'      ]"><img src="{$EntityPath}/vucDash.gif" BORDER="0" ALT="vDash"/></xsl:template><!-- #8872; =U22A8 /vDash R: vertical, dbl dash  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vltri'      ]"></xsl:template>--><!-- #8882; =U22B2 /vartriangleleft R: l tri, open, var  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vprop'      ]"></xsl:template>--><!-- #8733; =U221D /varpropto R: proportional, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vrtri'      ]"></xsl:template>--><!-- #8883; =U22B3 /vartriangleright R: r tri, open, var  -->
	<xsl:template match="symbol[@name='Vbar'       ]"><img src="{$EntityPath}/ucVbar.gif" BORDER="0" ALT="Vbar"/></xsl:template><!-- #58125; =UE30D dbl vert, bar (under)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Vdash'      ]"><img src="{$EntityPath}/ucVdash.gif" BORDER="0" ALT="Vdash"/></xsl:template><!-- #8873; =U22A9 /Vdash R: dbl vertical, dash  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Vdashl'     ]"><img src="{$EntityPath}/ucVdashl.gif" BORDER="0" ALT="Vdashl"/></xsl:template><!-- #58131; =UE313 vertical, dash (long)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='VDash'      ]"><img src="{$EntityPath}/ucVucDash.gif" BORDER="0" ALT="VDash"/></xsl:template><!-- #8875; =U22AB dbl vert, dbl dash  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Vvdash'     ]"><img src="{$EntityPath}/ucVvdash.gif" BORDER="0" ALT="Vvdash"/></xsl:template><!-- #8874; =U22AA /Vvdash R: triple vertical, dash  --><!--from DTD3-->
<!-- 

     File isobox.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxdl'      ]"></xsl:template>--><!-- #9488; =U2510 lower left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxdL'      ]"></xsl:template>--><!-- #9557; =U2555 lower left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxdr'      ]"></xsl:template>--><!-- #9484; =U250C lower right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxdR'      ]"></xsl:template>--><!-- #9554; =U2552 lower right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxDl'      ]"></xsl:template>--><!-- #9558; =U2556 lower left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxDL'      ]"></xsl:template>--><!-- #9559; =U2557 lower left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxDr'      ]"></xsl:template>--><!-- #9555; =U2553 lower right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxDR'      ]"></xsl:template>--><!-- #9556; =U2554 lower right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxh'       ]"></xsl:template>--><!-- #9472; =U2500 horizontal line   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxhd'      ]"></xsl:template>--><!-- #9516; =U252C lower left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxhD'      ]"></xsl:template>--><!-- #9573; =U2565 lower left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxhu'      ]"></xsl:template>--><!-- #9524; =U2534 upper left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxhU'      ]"></xsl:template>--><!-- #9576; =U2568 upper left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxH'       ]"></xsl:template>--><!-- #9552; =U2550 horizontal line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxHd'      ]"></xsl:template>--><!-- #9572; =U2564 lower left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxHD'      ]"></xsl:template>--><!-- #9574; =U2566 lower left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxHu'      ]"></xsl:template>--><!-- #9575; =U2567 upper left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxHU'      ]"></xsl:template>--><!-- #9577; =U2569 upper left and right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxul'      ]"></xsl:template>--><!-- #9496; =U2518 upper left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxuL'      ]"></xsl:template>--><!-- #9563; =U255B upper left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxur'      ]"></xsl:template>--><!-- #9492; =U2514 upper right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxuR'      ]"></xsl:template>--><!-- #9560; =U2558 upper right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxUl'      ]"></xsl:template>--><!-- #9564; =U255C upper left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxUL'      ]"></xsl:template>--><!-- #9565; =U255D upper left quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxUr'      ]"></xsl:template>--><!-- #9561; =U2559 upper right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxUR'      ]"></xsl:template>--><!-- #9562; =U255A upper right quadrant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxv'       ]"></xsl:template>--><!-- #9474; =U2502 vertical line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvh'      ]"></xsl:template>--><!-- #9532; =U253C all four quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvH'      ]"></xsl:template>--><!-- #9578; =U256A all four quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvl'      ]"></xsl:template>--><!-- #9508; =U2524 upper and lower left quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvL'      ]"></xsl:template>--><!-- #9569; =U2561 upper and lower left quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvr'      ]"></xsl:template>--><!-- #9500; =U251C upper and lower right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxvR'      ]"></xsl:template>--><!-- #9566; =U255E upper and lower right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxV'       ]"></xsl:template>--><!-- #9553; =U2551 vertical line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVh'      ]"></xsl:template>--><!-- #9579; =U256B all four quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVH'      ]"></xsl:template>--><!-- #9580; =U256C all four quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVl'      ]"></xsl:template>--><!-- #9570; =U2562 upper and lower left quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVL'      ]"></xsl:template>--><!-- #9571; =U2563 upper and lower left quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVr'      ]"></xsl:template>--><!-- #9567; =U255F upper and lower right quadrants  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxVR'      ]"></xsl:template>--><!-- #9568; =U2560 upper and lower right quadrants  -->
<!-- 

     File isocyr1.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='acy'        ]"></xsl:template>--><!-- #1072; =U0430 =small a, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Acy'        ]"></xsl:template>--><!-- #1040; =U0410 =capital A, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bcy'        ]"></xsl:template>--><!-- #1073; =U0431 =small be, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Bcy'        ]"></xsl:template>--><!-- #1041; =U0411 =capital BE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='chcy'       ]"></xsl:template>--><!-- #1095; =U0447 =small che, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CHcy'       ]"></xsl:template>--><!-- #1063; =U0427 =capital CHE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dcy'        ]"></xsl:template>--><!-- #1076; =U0434 =small de, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Dcy'        ]"></xsl:template>--><!-- #1044; =U0414 =capital DE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ecy'        ]"></xsl:template>--><!-- #1101; =U044D =small e, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ecy'        ]"></xsl:template>--><!-- #1069; =U042D =capital E, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='fcy'        ]"></xsl:template>--><!-- #1092; =U0444 =small ef, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Fcy'        ]"></xsl:template>--><!-- #1060; =U0424 =capital EF, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gcy'        ]"></xsl:template>--><!-- #1075; =U0433 =small ghe, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Gcy'        ]"></xsl:template>--><!-- #1043; =U0413 =capital GHE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hardcy'     ]"></xsl:template>--><!-- #1098; =U044A =small hard sign, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='HARDcy'     ]"></xsl:template>--><!-- #1066; =U042A =capital HARD sign, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='icy'        ]"></xsl:template>--><!-- #1080; =U0438 =small i, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iecy'       ]"></xsl:template>--><!-- #1077; =U0435 =small ie, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iocy'       ]"></xsl:template>--><!-- #1105; =U0451 =small io, Russian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Icy'        ]"></xsl:template>--><!-- #1048; =U0418 =capital I, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='IEcy'       ]"></xsl:template>--><!-- #1045; =U0415 =capital IE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='IOcy'       ]"></xsl:template>--><!-- #1025; =U0401 =capital IO, Russian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='jcy'        ]"></xsl:template>--><!-- #1081; =U0439 =small short i, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jcy'        ]"></xsl:template>--><!-- #1049; =U0419 =capital short I, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='kcy'        ]"></xsl:template>--><!-- #1082; =U043A =small ka, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='khcy'       ]"></xsl:template>--><!-- #1093; =U0445 =small ha, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Kcy'        ]"></xsl:template>--><!-- #1050; =U041A =capital KA, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='KHcy'       ]"></xsl:template>--><!-- #1061; =U0425 =capital HA, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lcy'        ]"></xsl:template>--><!-- #1083; =U043B =small el, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lcy'        ]"></xsl:template>--><!-- #1051; =U041B =capital EL, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mcy'        ]"></xsl:template>--><!-- #1084; =U043C =small em, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Mcy'        ]"></xsl:template>--><!-- #1052; =U041C =capital EM, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ncy'        ]"></xsl:template>--><!-- #1085; =U043D =small en, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='numero'     ]"></xsl:template>--><!-- #8470; =U2116 =numero sign  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ncy'        ]"></xsl:template>--><!-- #1053; =U041D =capital EN, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ocy'        ]"></xsl:template>--><!-- #1086; =U043E =small o, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ocy'        ]"></xsl:template>--><!-- #1054; =U041E =capital O, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pcy'        ]"></xsl:template>--><!-- #1087; =U043F =small pe, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Pcy'        ]"></xsl:template>--><!-- #1055; =U041F =capital PE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rcy'        ]"></xsl:template>--><!-- #1088; =U0440 =small er, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rcy'        ]"></xsl:template>--><!-- #1056; =U0420 =capital ER, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scy'        ]"></xsl:template>--><!-- #1089; =U0441 =small es, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='shchcy'     ]"></xsl:template>--><!-- #1097; =U0449 =small shcha, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='shcy'       ]"></xsl:template>--><!-- #1096; =U0448 =small sha, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='softcy'     ]"></xsl:template>--><!-- #1100; =U044C =small soft sign, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Scy'        ]"></xsl:template>--><!-- #1057; =U0421 =capital ES, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SHcy'       ]"></xsl:template>--><!-- #1064; =U0428 =capital SHA, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SHCHcy'     ]"></xsl:template>--><!-- #1065; =U0429 =capital SHCHA, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SOFTcy'     ]"></xsl:template>--><!-- #1068; =U042C =capital SOFT sign, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tcy'        ]"></xsl:template>--><!-- #1090; =U0442 =small te, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tscy'       ]"></xsl:template>--><!-- #1094; =U0446 =small tse, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tcy'        ]"></xsl:template>--><!-- #1058; =U0422 =capital TE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TScy'       ]"></xsl:template>--><!-- #1062; =U0426 =capital TSE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ucy'        ]"></xsl:template>--><!-- #1091; =U0443 =small u, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ucy'        ]"></xsl:template>--><!-- #1059; =U0423 =capital U, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vcy'        ]"></xsl:template>--><!-- #1074; =U0432 =small ve, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Vcy'        ]"></xsl:template>--><!-- #1042; =U0412 =capital VE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='yacy'       ]"></xsl:template>--><!-- #1103; =U044F =small ya, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ycy'        ]"></xsl:template>--><!-- #1099; =U044B =small yeru, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='yucy'       ]"></xsl:template>--><!-- #1102; =U044E =small yu, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='YAcy'       ]"></xsl:template>--><!-- #1071; =U042F =capital YA, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ycy'        ]"></xsl:template>--><!-- #1067; =U042B =capital YERU, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='YUcy'       ]"></xsl:template>--><!-- #1070; =U042E =capital YU, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='zcy'        ]"></xsl:template>--><!-- #1079; =U0437 =small ze, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='zhcy'       ]"></xsl:template>--><!-- #1078; =U0436 =small zhe, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Zcy'        ]"></xsl:template>--><!-- #1047; =U0417 =capital ZE, Cyrillic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ZHcy'       ]"></xsl:template>--><!-- #1046; =U0416 =capital ZHE, Cyrillic  -->
<!-- 

     File isocyr2.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='djcy'       ]"></xsl:template>--><!-- #1106; =U0452 =small dje, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dscy'       ]"></xsl:template>--><!-- #1109; =U0455 =small dse, Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dzcy'       ]"></xsl:template>--><!-- #1119; =U045F =small dze, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DJcy'       ]"></xsl:template>--><!-- #1026; =U0402 =capital DJE, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DScy'       ]"></xsl:template>--><!-- #1029; =U0405 =capital DSE, Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DZcy'       ]"></xsl:template>--><!-- #1039; =U040F =capital dze, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gjcy'       ]"></xsl:template>--><!-- #1107; =U0453 =small gje, Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GJcy'       ]"></xsl:template>--><!-- #1027; =U0403 =capital GJE Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iukcy'      ]"></xsl:template>--><!-- #1110; =U0456 =small i, Ukrainian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Iukcy'      ]"></xsl:template>--><!-- #1030; =U0406 =capital I, Ukrainian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='jsercy'     ]"></xsl:template>--><!-- #1112; =U0458 =small je, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='jukcy'      ]"></xsl:template>--><!-- #1108; =U0454 =small je, Ukrainian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jsercy'     ]"></xsl:template>--><!-- #1032; =U0408 =capital JE, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jukcy'      ]"></xsl:template>--><!-- #1028; =U0404 =capital JE, Ukrainian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='kjcy'       ]"></xsl:template>--><!-- #1116; =U045C =small kje Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='KJcy'       ]"></xsl:template>--><!-- #1036; =U040C =capital KJE, Macedonian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ljcy'       ]"></xsl:template>--><!-- #1113; =U0459 =small lje, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LJcy'       ]"></xsl:template>--><!-- #1033; =U0409 =capital LJE, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='njcy'       ]"></xsl:template>--><!-- #1114; =U045A =small nje, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NJcy'       ]"></xsl:template>--><!-- #1034; =U040A =capital NJE, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tshcy'      ]"></xsl:template>--><!-- #1115; =U045B =small tshe, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TSHcy'      ]"></xsl:template>--><!-- #1035; =U040B =capital TSHE, Serbian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ubrcy'      ]"></xsl:template>--><!-- #1118; =U045E =small u, Byelorussian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ubrcy'      ]"></xsl:template>--><!-- #1038; =U040E =capital U, Byelorussian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='yicy'       ]"></xsl:template>--><!-- #1111; =U0457 =small yi, Ukrainian  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='YIcy'       ]"></xsl:template>--><!-- #1031; =U0407 =capital YI, Ukrainian  -->
<!-- 

     File isodia.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='acute'      ]"><xsl:text disable-output-escaping="yes">&amp;#180;</xsl:text></xsl:template><!-- #180; =U00B4 =acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='breve'      ]"><img src="{$EntityPath}/breve.gif" BORDER="0" ALT="breve"/></xsl:template><!-- #728; =U02D8 =breve  --><!--from DTD3-->
	<xsl:template match="symbol[@name='caron'      ]"><img src="{$EntityPath}/caron.gif" BORDER="0" ALT="caron"/></xsl:template><!-- #711; =U02C7 =caron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cedil'      ]"><xsl:text disable-output-escaping="yes">&amp;#184;</xsl:text></xsl:template><!-- #184; =U00B8 =cedilla  --><!--from DTD3-->
	<xsl:template match="symbol[@name='circ'       ]"><xsl:text disable-output-escaping="yes">&amp;#136;</xsl:text></xsl:template><!-- #94;  =U005E circumflex accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dblac'      ]"><xsl:text disable-output-escaping="yes">&amp;#180;&amp;#180;</xsl:text></xsl:template><!-- #733; =U02DD =double acute accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='die'        ]"><xsl:text disable-output-escaping="yes">&amp;#168;</xsl:text></xsl:template><!-- #168; =U00A8 =dieresis  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dot'        ]"><sup><xsl:text disable-output-escaping="yes">&amp;#183;</xsl:text></sup></xsl:template><!-- #729; =U02D9 =dot above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='grave'      ]"><xsl:text disable-output-escaping="yes">&amp;#096;</xsl:text></xsl:template><!-- #96;  =U0060 =grave accent  --><!--from DTD3-->
	<xsl:template match="symbol[@name='macr'       ]"><xsl:text disable-output-escaping="yes">&amp;#175;</xsl:text></xsl:template><!-- #175; =U00AF =macron  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ogon'       ]"><img src="{$EntityPath}/ogon-.gif" ALIGN="absbottom" BORDER="0" ALT="ogon"/></xsl:template><!-- #731; =U02DB =ogonek  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ring'       ]"><xsl:text disable-output-escaping="yes">&amp;#176;</xsl:text></xsl:template><!-- #730; =U02DA =ring  --><!--from DTD3-->
	<xsl:template match="symbol[@name='tilde'      ]"><xsl:text disable-output-escaping="yes">&amp;#126;</xsl:text></xsl:template><!-- #732; =U02DC =tilde  --><!--from DTD3-->
	<xsl:template match="symbol[@name='uml'        ]"><xsl:text disable-output-escaping="yes">&amp;#168;</xsl:text></xsl:template><!-- #168; =U00A8 =umlaut mark  --><!--from DTD3-->
<!-- 

     File isogrk1.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='agr']"><font face="symbol">a</font></xsl:template><!-- #945; =U03B1 =small alpha, Greek  -->
	<xsl:template match="symbol[@name='Agr']"><font face="symbol">A</font></xsl:template><!-- #913; =U0391 =capital Alpha, Greek  -->
	<xsl:template match="symbol[@name='bgr']"><font face="symbol">b</font></xsl:template><!-- #946; =U03B2 =small beta, Greek  -->
	<xsl:template match="symbol[@name='Bgr']"><font face="symbol">B</font></xsl:template><!-- #914; =U0392 =capital Beta, Greek  -->
	<xsl:template match="symbol[@name='dgr']"><font face="symbol">d</font></xsl:template><!-- #948; =U03B4 =small delta, Greek  -->
	<xsl:template match="symbol[@name='Dgr']"><font face="symbol">D</font></xsl:template><!-- #916; =U0394 =capital Delta, Greek  -->
	<xsl:template match="symbol[@name='eegr']"><font face="symbol">h</font></xsl:template><!-- #951; =U03B7 =small eta, Greek  -->
	<xsl:template match="symbol[@name='egr']"><font face="symbol">e</font></xsl:template><!-- #949; =U03B5 =small epsilon, Greek  -->
	<xsl:template match="symbol[@name='EEgr']"><font face="symbol">H</font></xsl:template><!-- #919; =U0397 =capital Eta, Greek  -->
	<xsl:template match="symbol[@name='Egr']"><font face="symbol">E</font></xsl:template><!-- #917; =U0395 =capital Epsilon, Greek  -->
	<xsl:template match="symbol[@name='ggr']"><font face="symbol">g</font></xsl:template><!-- #947; =U03B3 =small gamma, Greek  -->
	<xsl:template match="symbol[@name='Ggr']"><font face="symbol">G</font></xsl:template><!-- #915; =U0393 =capital Gamma, Greek  -->
	<xsl:template match="symbol[@name='igr']"><font face="symbol">i</font></xsl:template><!-- #953; =U03B9 =small iota, Greek  -->
	<xsl:template match="symbol[@name='Igr']"><font face="symbol">I</font></xsl:template><!-- #921; =U0399 =capital Iota, Greek  -->
	<xsl:template match="symbol[@name='kgr']"><font face="symbol">k</font></xsl:template><!-- #954; =U03BA =small kappa, Greek  -->
	<xsl:template match="symbol[@name='khgr']"><font face="symbol">c</font></xsl:template><!-- #967; =U03C7 =small chi, Greek  -->
	<xsl:template match="symbol[@name='Kgr']"><font face="symbol">K</font></xsl:template><!-- #922; =U039A =capital Kappa, Greek  -->
	<xsl:template match="symbol[@name='KHgr']"><font face="symbol">C</font></xsl:template><!-- #935; =U03A7 =capital Chi, Greek  -->
	<xsl:template match="symbol[@name='lgr']"><font face="symbol">l</font></xsl:template><!-- #955; =U03BB =small lambda, Greek  -->
	<xsl:template match="symbol[@name='Lgr']"><font face="symbol">L</font></xsl:template><!-- #923; =U039B =capital Lambda, Greek  -->
	<xsl:template match="symbol[@name='mgr']"><font face="symbol">m</font></xsl:template><!-- #956; =U03BC =small mu, Greek  -->
	<xsl:template match="symbol[@name='Mgr']"><font face="symbol">M</font></xsl:template><!-- #924; =U039C =capital Mu, Greek  -->
	<xsl:template match="symbol[@name='ngr']"><font face="symbol">n</font></xsl:template><!-- #957; =U03BD =small nu, Greek  -->
	<xsl:template match="symbol[@name='Ngr']"><font face="symbol">N</font></xsl:template><!-- #925; =U039D =capital Nu, Greek  -->
	<xsl:template match="symbol[@name='ogr']"><font face="symbol">o</font></xsl:template><!-- #959; =U03BF =small omicron, Greek  -->
	<xsl:template match="symbol[@name='ohgr']"><font face="symbol">w</font></xsl:template><!-- #969; =U03C9 =small omega, Greek  -->
	<xsl:template match="symbol[@name='Ogr']"><font face="symbol">O</font></xsl:template><!-- #927; =U039F =capital Omicron, Greek  -->
	<xsl:template match="symbol[@name='OHgr']"><font face="symbol">W</font></xsl:template><!-- #937; =U03A9 =capital Omega, Greek  -->
	<xsl:template match="symbol[@name='pgr']"><font face="symbol">p</font></xsl:template><!-- #960; =U03C0 =small pi, Greek  -->
	<xsl:template match="symbol[@name='phgr']"><font face="symbol">f</font></xsl:template><!-- #966; =U03C6 =small phi, Greek  -->
	<xsl:template match="symbol[@name='psgr']"><font face="symbol">y</font></xsl:template><!-- #968; =U03C8 =small psi, Greek  -->
	<xsl:template match="symbol[@name='Pgr']"><font face="symbol">P</font></xsl:template><!-- #928; =U03A0 =capital Pi, Greek  -->
	<xsl:template match="symbol[@name='PHgr']"><font face="symbol">F</font></xsl:template><!-- #934; =U03A6 =capital Phi, Greek  -->
	<xsl:template match="symbol[@name='PSgr']"><font face="symbol">Y</font></xsl:template><!-- #936; =U03A8 =capital Psi, Greek  -->
	<xsl:template match="symbol[@name='rgr']"><font face="symbol">r</font></xsl:template><!-- #961; =U03C1 =small rho, Greek  -->
	<xsl:template match="symbol[@name='Rgr']"><font face="symbol">R</font></xsl:template><!-- #929; =U03A1 =capital Rho, Greek  -->
	<xsl:template match="symbol[@name='sfgr']"><font face="symbol">V</font></xsl:template><!-- #962; =U03C2 =final small sigma, Greek  -->
	<xsl:template match="symbol[@name='sgr']"><font face="symbol">s</font></xsl:template><!-- #963; =U03C3 =small sigma, Greek  -->
	<xsl:template match="symbol[@name='Sgr']"><font face="symbol">S</font></xsl:template><!-- #931; =U03A3 =capital Sigma, Greek  -->
	<xsl:template match="symbol[@name='tgr']"><font face="symbol">t</font></xsl:template><!-- #964; =U03C4 =small tau, Greek  -->
	<xsl:template match="symbol[@name='thgr']"><font face="symbol">q</font></xsl:template><!-- #952; =U03B8 =small theta, Greek  -->
	<xsl:template match="symbol[@name='Tgr']"><font face="symbol">T</font></xsl:template><!-- #932; =U03A4 =capital Tau, Greek  -->
	<xsl:template match="symbol[@name='THgr']"><font face="symbol">Q</font></xsl:template><!-- #920; =U0398 =capital Theta, Greek  -->
	<xsl:template match="symbol[@name='ugr']"><font face="symbol">u</font></xsl:template><!-- #965; =U03C5 =small upsilon, Greek  -->
	<xsl:template match="symbol[@name='Ugr']"><font face="symbol">U</font></xsl:template><!-- #933; =U03A5 =capital Upsilon, Greek  -->
	<xsl:template match="symbol[@name='xgr']"><font face="symbol">x</font></xsl:template><!-- #958; =U03BE =small xi, Greek  -->
	<xsl:template match="symbol[@name='Xgr']"><font face="symbol">X</font></xsl:template><!-- #926; =U039E =capital Xi, Greek  -->
	<xsl:template match="symbol[@name='zgr']"><font face="symbol">z</font></xsl:template><!-- #950; =U03B6 =small zeta, Greek  -->
	<xsl:template match="symbol[@name='Zgr']"><font face="symbol">Z</font></xsl:template><!-- #918; =U0396 =capital Zeta, Greek  -->
<!-- 

     File isogrk2.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='aacgr'      ]"></xsl:template>--><!-- #940; =U03AC =small alpha, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Aacgr'      ]"></xsl:template>--><!-- #902; =U0386 =capital Alpha, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eacgr'      ]"></xsl:template>--><!-- #941; =U03AD =small epsilon, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eeacgr'     ]"></xsl:template>--><!-- #942; =U03AE =small eta, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Eacgr'      ]"></xsl:template>--><!-- #904; =U0388 =capital Epsilon, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='EEacgr'     ]"></xsl:template>--><!-- #905; =U0389 =capital Eta, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iacgr'      ]"></xsl:template>--><!-- #943; =U03AF =small iota, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='idiagr'     ]"></xsl:template>--><!-- #912; =U0390 =small iota, dieresis, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='idigr'      ]"></xsl:template>--><!-- #970; =U03CA =small iota, dieresis, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Iacgr'      ]"></xsl:template>--><!-- #906; =U038A =capital Iota, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Idigr'      ]"></xsl:template>--><!-- #938; =U03AA =capital Iota, dieresis, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='oacgr'      ]"></xsl:template>--><!-- #972; =U03CC =small omicron, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ohacgr'     ]"></xsl:template>--><!-- #974; =U03CE =small omega, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Oacgr'      ]"></xsl:template>--><!-- #908; =U038C =capital Omicron, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OHacgr'     ]"></xsl:template>--><!-- #911; =U038F =capital Omega, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uacgr'      ]"></xsl:template>--><!-- #973; =U03CD =small upsilon, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='udiagr'     ]"></xsl:template>--><!-- #944; =U03B0 =small upsilon, dieresis, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='udigr'      ]"></xsl:template>--><!-- #971; =U03CB =small upsilon, dieresis, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uacgr'      ]"></xsl:template>--><!-- #910; =U038E =capital Upsilon, accent, Greek  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Udigr'      ]"></xsl:template>--><!-- #939; =U03AB =capital Upsilon, dieresis, Greek  -->
<!-- 

     File isogrk3.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='alpha']"><font face="symbol">a</font></xsl:template><!-- #945; =U03B1 /alpha small alpha, Greek  -->
	<xsl:template match="symbol[@name='beta']"><font face="symbol">b</font></xsl:template><!-- #946; =U03B2 /beta small beta, Greek  -->
	<xsl:template match="symbol[@name='chi']"><font face="symbol">c</font></xsl:template><!-- #967; =U03C7 /chi small chi, Greek  -->
	<xsl:template match="symbol[@name='delta']"><font face="symbol">d</font></xsl:template><!-- #948; =U03B4 /delta small delta, Greek  -->
	<xsl:template match="symbol[@name='Delta']"><font face="symbol">D</font></xsl:template><!-- #916; =U0394 /Delta capital Delta, Greek  -->
	<xsl:template match="symbol[@name='epsi']"><font face="symbol">e</font></xsl:template><!-- #949; =U03B5 /straightepsilon, small epsilon, Greek  -->
	<xsl:template match="symbol[@name='epsiv']"><font face="symbol">e</font></xsl:template><!-- #603; =U025B /varepsilon  -->
	<xsl:template match="symbol[@name='eta']"><font face="symbol">h</font></xsl:template><!-- #951; =U03B7 /eta small eta, Greek  -->
	<xsl:template match="symbol[@name='gamma']"><font face="symbol">g</font></xsl:template><!-- #947; =U03B3 /gamma small gamma, Greek  -->
	<!--<xsl:template match="symbol[@name='gammad']"><font face="symbol">g</font></xsl:template>--><!-- #988; =U03DC /digamma  -->
	<xsl:template match="symbol[@name='Gamma']"><font face="symbol">G</font></xsl:template><!-- #915; =U0393 /Gamma capital Gamma, Greek  -->
	<!--<xsl:template match="symbol[@name='Gammad']"><font face="symbol">G</font></xsl:template>--><!-- #988; =U03DC capital digamma  -->
	<xsl:template match="symbol[@name='iota']"><font face="symbol">i</font></xsl:template><!-- #953; =U03B9 /iota small iota, Greek  -->
	<xsl:template match="symbol[@name='kappa']"><font face="symbol">k</font></xsl:template><!-- #954; =U03BA /kappa small kappa, Greek  -->
	<!--<xsl:template match="symbol[@name='kappav']"><font face="symbol">k</font></xsl:template>--><!-- #1008; =U03F0 /varkappa  -->
	<xsl:template match="symbol[@name='lambda']"><font face="symbol">l</font></xsl:template><!-- #955; =U03BB /lambda small lambda, Greek  -->
	<xsl:template match="symbol[@name='Lambda']"><font face="symbol">L</font></xsl:template><!-- #923; =U039B /Lambda capital Lambda, Greek  -->
	<xsl:template match="symbol[@name='mu']"><font face="symbol">m</font></xsl:template><!-- #956; =U03BC /mu small mu, Greek  -->
	<xsl:template match="symbol[@name='nu']"><font face="symbol">n</font></xsl:template><!-- #957; =U03BD /nu small nu, Greek  -->
	<xsl:template match="symbol[@name='omega']"><font face="symbol">w</font></xsl:template><!-- #969; =U03C9 /omega small omega, Greek  -->
	<xsl:template match="symbol[@name='Omega']"><font face="symbol">W</font></xsl:template><!-- #937; =U03A9 /Omega capital Omega, Greek  -->
	<xsl:template match="symbol[@name='phi']"><font face="symbol">f</font></xsl:template><!-- #966; =U03C6 /straightphi - small phi, Greek  -->
	<xsl:template match="symbol[@name='phiv']"><font face="symbol">j</font></xsl:template><!-- #981; =U03D5 /varphi - curly or open phi  -->
	<xsl:template match="symbol[@name='pi']"><font face="symbol">p</font></xsl:template><!-- #960; =U03C0 /pi small pi, Greek  -->
	<!--<xsl:template match="symbol[@name='piv']"><font face="symbol">p</font></xsl:template>--><!-- #982; =U03D6 /varpi  -->
	<xsl:template match="symbol[@name='psi']"><font face="symbol">y</font></xsl:template><!-- #968; =U03C8 /psi small psi, Greek  -->
	<xsl:template match="symbol[@name='Phi']"><font face="symbol">F</font></xsl:template><!-- #934; =U03A6 /Phi capital Phi, Greek  -->
	<xsl:template match="symbol[@name='Pi']"><font face="symbol">P</font></xsl:template><!-- #928; =U03A0 /Pi capital Pi, Greek  -->
	<xsl:template match="symbol[@name='Psi']"><font face="symbol">Y</font></xsl:template><!-- #936; =U03A8 /Psi capital Psi, Greek  -->
	<xsl:template match="symbol[@name='rho']"><font face="symbol">r</font></xsl:template><!-- #961; =U03C1 /rho small rho, Greek  -->
	<!--<xsl:template match="symbol[@name='rhov']"><font face="symbol">r</font></xsl:template>--><!-- #1009; =U03F1 /varrho  -->
	<xsl:template match="symbol[@name='sigma']"><font face="symbol">s</font></xsl:template><!-- #963; =U03C3 /sigma small sigma, Greek  -->
	<xsl:template match="symbol[@name='sigmav']"><font face="symbol">V</font></xsl:template><!-- #962; =U03C2 /varsigma  -->
	<xsl:template match="symbol[@name='Sigma']"><font face="symbol">S</font></xsl:template><!-- #931; =U03A3 /Sigma capital Sigma, Greek  -->
	<xsl:template match="symbol[@name='tau']"><font face="symbol">t</font></xsl:template><!-- #964; =U03C4 /tau small tau, Greek  -->
	<xsl:template match="symbol[@name='theta']"><font face="symbol">q</font></xsl:template><!-- #952; =U03B8 /theta straight theta, small theta, Greek  -->
	<xsl:template match="symbol[@name='thetav']"><font face="symbol">J</font></xsl:template><!-- #977; =U03D1 /vartheta - curly or open theta  -->
	<xsl:template match="symbol[@name='Theta']"><font face="symbol">Q</font></xsl:template><!-- #920; =U0398 /Theta capital Theta, Greek  -->
	<xsl:template match="symbol[@name='upsi']"><font face="symbol">u</font></xsl:template><!-- #965; =U03C5 /upsilon small upsilon, Greek  -->
	<xsl:template match="symbol[@name='Upsi']"><font face="symbol">U</font></xsl:template><!-- #978; =U03D2 /Upsilon capital Upsilon, Greek  -->
	<xsl:template match="symbol[@name='xi']"><font face="symbol">x</font></xsl:template><!-- #958; =U03BE /xi small xi, Greek  -->
	<xsl:template match="symbol[@name='Xi']"><font face="symbol">X</font></xsl:template><!-- #926; =U039E /Xi capital Xi, Greek  -->
	<xsl:template match="symbol[@name='zeta']"><font face="symbol">z</font></xsl:template><!-- #950; =U03B6 /zeta small zeta, Greek  -->
<!-- 

     File isogrk4.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='alpha']"><font face="symbol">a</font></xsl:template><!--UE700 small alpha, Greek  -->
	<xsl:template match="symbol[@name='beta']"><font face="symbol">b</font></xsl:template><!--UE701 small beta, Greek  -->
	<xsl:template match="symbol[@name='chi']"><font face="symbol">c</font></xsl:template><!--UE727 small chi, Greek  -->
	<xsl:template match="symbol[@name='delta']"><font face="symbol">d</font></xsl:template><!--UE706 small delta, Greek  -->
	<xsl:template match="symbol[@name='Delta']"><font face="symbol">D</font></xsl:template><!--UE707 capital delta, Greek  -->
	<xsl:template match="symbol[@name='epsi']"><font face="symbol">e</font></xsl:template><!--UE708 small epsilon, Greek  -->
	<!--<xsl:template match="symbol[@name='epsiv']"><font face="symbol">e</font></xsl:template>--><!--UE709 varepsilion  -->
	<xsl:template match="symbol[@name='eta']"><font face="symbol">h</font></xsl:template><!--UE70C small eta, Greek  -->
	<xsl:template match="symbol[@name='gamma']"><font face="symbol">g</font></xsl:template><!--UE702 small gamma, Greek  -->
	<!--<xsl:template match="symbol[@name='gammad']"><font face="symbol">g</font></xsl:template>--><!--UE704 digamma, Greek  -->
	<xsl:template match="symbol[@name='Gamma']"><font face="symbol">G</font></xsl:template><!--UE703 capital gamma, Greek  -->
	<!--<xsl:template match="symbol[@name='Gammad']"><font face="symbol">G</font></xsl:template>--><!--UE705 capital digamma, Greek  -->
	<xsl:template match="symbol[@name='iota']"><font face="symbol">i</font></xsl:template><!--UE710 small iota, Greek  -->
	<xsl:template match="symbol[@name='kappa']"><font face="symbol">k</font></xsl:template><!--UE711 small kappa, Greek  -->
	<xsl:template match="symbol[@name='kappav']"><font face="symbol">k</font></xsl:template><!--UE712 var kappa, Greek  -->
	<xsl:template match="symbol[@name='lambda']"><font face="symbol">l</font></xsl:template><!--UE713 small lambda, Greek  -->
	<xsl:template match="symbol[@name='Lambda']"><font face="symbol">L</font></xsl:template><!--UE714 capital lambda, Greek  -->
	<xsl:template match="symbol[@name='mu']"><font face="symbol">m</font></xsl:template><!--UE715 small mu, Greek  -->
	<xsl:template match="symbol[@name='nu']"><font face="symbol">n</font></xsl:template><!--UE716 small nu, Greek  -->
	<xsl:template match="symbol[@name='omega']"><font face="symbol">w</font></xsl:template><!--UE72A small omega, Greek  -->
	<xsl:template match="symbol[@name='Omega']"><font face="symbol">W</font></xsl:template><!--UE72B capital Omega, Greek  -->
	<xsl:template match="symbol[@name='phis']"><font face="symbol">f</font></xsl:template><!--UE724 straight phi, Greek  -->
	<xsl:template match="symbol[@name='phiv']"><font face="symbol">j</font></xsl:template><!--UE726 varphi  -->
	<xsl:template match="symbol[@name='pi']"><font face="symbol">p</font></xsl:template><!--UE719 small pi, Greek  -->
	<!--<xsl:template match="symbol[@name='piv']"><font face="symbol">p</font></xsl:template>--><!--UE71B varpi  -->
	<xsl:template match="symbol[@name='psi']"><font face="symbol">y</font></xsl:template><!--UE728 small psi, Greek  -->
	<xsl:template match="symbol[@name='Phi']"><font face="symbol">F</font></xsl:template><!--UE725 capital Phi, Greek  -->
	<xsl:template match="symbol[@name='Pi']"><font face="symbol">P</font></xsl:template><!--UE71A capital pi, Greek  -->
	<xsl:template match="symbol[@name='Psi']"><font face="symbol">Y</font></xsl:template><!--UE729 capital Psi, Greek  -->
	<xsl:template match="symbol[@name='rho']"><font face="symbol">r</font></xsl:template><!--UE71C small rho, Greek  -->
	<!--<xsl:template match="symbol[@name='rhov']"><font face="symbol">r</font></xsl:template>--><!--UE71D varrho  -->
	<xsl:template match="symbol[@name='sigma']"><font face="symbol">s</font></xsl:template><!--UE71E small sigma, Greek  -->
	<!--<xsl:template match="symbol[@name='sigmav']"><font face="symbol">s</font></xsl:template>--><!--UE720 varsigma  -->
	<xsl:template match="symbol[@name='Sigma']"><font face="symbol">S</font></xsl:template><!--UE71F capital sigma, Greek  -->
	<xsl:template match="symbol[@name='tau']"><font face="symbol">t</font></xsl:template><!--UE721 small tau, Greek  -->
	<xsl:template match="symbol[@name='thetas']"><font face="symbol">q</font></xsl:template><!--UE70D straight theta, Greek  -->
	<xsl:template match="symbol[@name='thetav']"><font face="symbol">J</font></xsl:template><!--UE70F var theta, Greek  -->
	<xsl:template match="symbol[@name='Theta']"><font face="symbol">Q</font></xsl:template><!--UE70E capital theta, Greek  -->
	<xsl:template match="symbol[@name='upsi']"><font face="symbol">u</font></xsl:template><!--UE722 small upsilon, Greek  -->
	<xsl:template match="symbol[@name='Upsilon']"><font face="symbol">U</font></xsl:template><!--UE723 capital upsilon, Greek  -->
	<xsl:template match="symbol[@name='xi']"><font face="symbol">x</font></xsl:template><!--UE717 small xi, Greek  -->
	<xsl:template match="symbol[@name='Xi']"><font face="symbol">X</font></xsl:template><!--UE718 capital xi, Greek  -->
	<xsl:template match="symbol[@name='zeta']"><font face="symbol">z</font></xsl:template><!--UE70B small zeta, Greek  -->
<!-- 

     File isolat1.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='aacute']"><xsl:text disable-output-escaping="yes">&amp;aacute;</xsl:text></xsl:template><!-- #225; =U00E1 =small a, acute accent  -->
	<xsl:template match="symbol[@name='acirc']"><xsl:text disable-output-escaping="yes">&amp;acirc;</xsl:text></xsl:template><!-- #226; =U00E2 =small a, circumflex accent  -->
	<xsl:template match="symbol[@name='aelig']"><xsl:text disable-output-escaping="yes">&amp;aelig;</xsl:text></xsl:template><!-- #230; =U00E6 =small ae diphthong (ligature)  -->
	<xsl:template match="symbol[@name='agrave']"><xsl:text disable-output-escaping="yes">&amp;agrave;</xsl:text></xsl:template><!-- #224; =U00E0 =small a, grave accent  -->
	<xsl:template match="symbol[@name='aring']"><xsl:text disable-output-escaping="yes">&amp;aring;</xsl:text></xsl:template><!-- #229; =U00E5 =small a, ring  -->
	<xsl:template match="symbol[@name='atilde']"><xsl:text disable-output-escaping="yes">&amp;atilde;</xsl:text></xsl:template><!-- #227; =U00E3 =small a, tilde  -->
	<xsl:template match="symbol[@name='auml']"><xsl:text disable-output-escaping="yes">&amp;auml;</xsl:text></xsl:template><!-- #228; =U00E4 =small a, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Aacute']"><xsl:text disable-output-escaping="yes">&amp;Aacute;</xsl:text></xsl:template><!-- #193; =U00C1 =capital A, acute accent  -->
	<xsl:template match="symbol[@name='Acirc']"><xsl:text disable-output-escaping="yes">&amp;Acirc;</xsl:text></xsl:template><!-- #194; =U00C2 =capital A, circumflex accent  -->
	<xsl:template match="symbol[@name='AElig']"><xsl:text disable-output-escaping="yes">&amp;AElig;</xsl:text></xsl:template><!-- #198; =U00C6 =capital AE diphthong (ligature)  -->
	<xsl:template match="symbol[@name='Agrave']"><xsl:text disable-output-escaping="yes">&amp;Agrave;</xsl:text></xsl:template><!-- #192; =U00C0 =capital A, grave accent  -->
	<xsl:template match="symbol[@name='Aring']"><xsl:text disable-output-escaping="yes">&amp;Aring;</xsl:text></xsl:template><!-- #197; =U00C5 =capital A, ring  -->
	<xsl:template match="symbol[@name='Atilde']"><xsl:text disable-output-escaping="yes">&amp;Atilde;</xsl:text></xsl:template><!-- #195; =U00C3 =capital A, tilde  -->
	<xsl:template match="symbol[@name='Auml']"><xsl:text disable-output-escaping="yes">&amp;Auml;</xsl:text></xsl:template><!-- #196; =U00C4 =capital A, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='ccedil']"><xsl:text disable-output-escaping="yes">&amp;ccedil;</xsl:text></xsl:template><!-- #231; =U00E7 =small c, cedilla  -->
	<xsl:template match="symbol[@name='Ccedil']"><xsl:text disable-output-escaping="yes">&amp;Ccedil;</xsl:text></xsl:template><!-- #199; =U00C7 =capital C, cedilla  -->
	<xsl:template match="symbol[@name='eacute']"><xsl:text disable-output-escaping="yes">&amp;eacute;</xsl:text></xsl:template><!-- #233; =U00E9 =small e, acute accent  -->
	<xsl:template match="symbol[@name='ecirc']"><xsl:text disable-output-escaping="yes">&amp;ecirc;</xsl:text></xsl:template><!-- #234; =U00EA =small e, circumflex accent  -->
	<xsl:template match="symbol[@name='egrave']"><xsl:text disable-output-escaping="yes">&amp;egrave;</xsl:text></xsl:template><!-- #232; =U00E8 =small e, grave accent  -->
	<xsl:template match="symbol[@name='eth']"><xsl:text disable-output-escaping="yes">&amp;eth;</xsl:text></xsl:template><!-- #240; =U00F0 =small eth, Icelandic  -->
	<xsl:template match="symbol[@name='euml']"><xsl:text disable-output-escaping="yes">&amp;euml;</xsl:text></xsl:template><!-- #235; =U00EB =small e, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Eacute']"><xsl:text disable-output-escaping="yes">&amp;Eacute;</xsl:text></xsl:template><!-- #201; =U00C9 =capital E, acute accent  -->
	<xsl:template match="symbol[@name='Ecirc']"><xsl:text disable-output-escaping="yes">&amp;Ecirc;</xsl:text></xsl:template><!-- #202; =U00CA =capital E, circumflex accent  -->
	<xsl:template match="symbol[@name='Egrave']"><xsl:text disable-output-escaping="yes">&amp;Egrave;</xsl:text></xsl:template><!-- #200; =U00C8 =capital E, grave accent  -->
	<xsl:template match="symbol[@name='ETH']"><xsl:text disable-output-escaping="yes">&amp;ETH;</xsl:text></xsl:template><!-- #208; =U00D0 =capital Eth, Icelandic  -->
	<xsl:template match="symbol[@name='Euml']"><xsl:text disable-output-escaping="yes">&amp;Euml;</xsl:text></xsl:template><!-- #203; =U00CB =capital E, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='iacute']"><xsl:text disable-output-escaping="yes">&amp;iacute;</xsl:text></xsl:template><!-- #237; =U00ED =small i, acute accent  -->
	<xsl:template match="symbol[@name='icirc']"><xsl:text disable-output-escaping="yes">&amp;icirc;</xsl:text></xsl:template><!-- #238; =U00EE =small i, circumflex accent  -->
	<xsl:template match="symbol[@name='igrave']"><xsl:text disable-output-escaping="yes">&amp;igrave;</xsl:text></xsl:template><!-- #236; =U00EC =small i, grave accent  -->
	<xsl:template match="symbol[@name='iuml']"><xsl:text disable-output-escaping="yes">&amp;iuml;</xsl:text></xsl:template><!-- #239; =U00EF =small i, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Iacute']"><xsl:text disable-output-escaping="yes">&amp;Iacute;</xsl:text></xsl:template><!-- #205; =U00CD =capital I, acute accent  -->
	<xsl:template match="symbol[@name='Icirc']"><xsl:text disable-output-escaping="yes">&amp;Icirc;</xsl:text></xsl:template><!-- #206; =U00CE =capital I, circumflex accent  -->
	<xsl:template match="symbol[@name='Igrave']"><xsl:text disable-output-escaping="yes">&amp;Igrave;</xsl:text></xsl:template><!-- #204; =U00CC =capital I, grave accent  -->
	<xsl:template match="symbol[@name='Iuml']"><xsl:text disable-output-escaping="yes">&amp;Iuml;</xsl:text></xsl:template><!-- #207; =U00CF =capital I, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='ntilde']"><xsl:text disable-output-escaping="yes">&amp;ntilde;</xsl:text></xsl:template><!-- #241; =U00F1 =small n, tilde  -->
	<xsl:template match="symbol[@name='Ntilde']"><xsl:text disable-output-escaping="yes">&amp;Ntilde;</xsl:text></xsl:template><!-- #209; =U00D1 =capital N, tilde  -->
	<xsl:template match="symbol[@name='oacute']"><xsl:text disable-output-escaping="yes">&amp;oacute;</xsl:text></xsl:template><!-- #243; =U00F3 =small o, acute accent  -->
	<xsl:template match="symbol[@name='ocirc']"><xsl:text disable-output-escaping="yes">&amp;ocirc;</xsl:text></xsl:template><!-- #244; =U00F4 =small o, circumflex accent  -->
	<xsl:template match="symbol[@name='ograve']"><xsl:text disable-output-escaping="yes">&amp;ograve;</xsl:text></xsl:template><!-- #242; =U00F2 =small o, grave accent  -->
	<xsl:template match="symbol[@name='oslash']"><xsl:text disable-output-escaping="yes">&amp;oslash;</xsl:text></xsl:template><!-- #248; =U00F8 latin small letter o with stroke  -->
	<xsl:template match="symbol[@name='otilde']"><xsl:text disable-output-escaping="yes">&amp;otilde;</xsl:text></xsl:template><!-- #245; =U00F5 =small o, tilde  -->
	<xsl:template match="symbol[@name='ouml']"><xsl:text disable-output-escaping="yes">&amp;ouml;</xsl:text></xsl:template><!-- #246; =U00F6 =small o, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Oacute']"><xsl:text disable-output-escaping="yes">&amp;Oacute;</xsl:text></xsl:template><!-- #211; =U00D3 =capital O, acute accent  -->
	<xsl:template match="symbol[@name='Ocirc']"><xsl:text disable-output-escaping="yes">&amp;Ocirc;</xsl:text></xsl:template><!-- #212; =U00D4 =capital O, circumflex accent  -->
	<xsl:template match="symbol[@name='Ograve']"><xsl:text disable-output-escaping="yes">&amp;Ograve;</xsl:text></xsl:template><!-- #210; =U00D2 =capital O, grave accent  -->
	<xsl:template match="symbol[@name='Oslash']"><xsl:text disable-output-escaping="yes">&amp;Oslash;</xsl:text></xsl:template><!-- #216; =U00D8 =capital O, slash  -->
	<xsl:template match="symbol[@name='Otilde']"><xsl:text disable-output-escaping="yes">&amp;Otilde;</xsl:text></xsl:template><!-- #213; =U00D5 =capital O, tilde  -->
	<xsl:template match="symbol[@name='Ouml']"><xsl:text disable-output-escaping="yes">&amp;Ouml;</xsl:text></xsl:template><!-- #214; =U00D6 =capital O, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='szlig']"><xsl:text disable-output-escaping="yes">&amp;szlig;</xsl:text></xsl:template><!-- #223; =U00DF =small sharp s, German (sz ligature)  -->
	<xsl:template match="symbol[@name='thorn']"><xsl:text disable-output-escaping="yes">&amp;thorn;</xsl:text></xsl:template><!-- #254; =U00FE =small thorn, Icelandic  -->
	<xsl:template match="symbol[@name='THORN']"><xsl:text disable-output-escaping="yes">&amp;THORN;</xsl:text></xsl:template><!-- #222; =U00DE =capital THORN, Icelandic  -->
	<xsl:template match="symbol[@name='uacute']"><xsl:text disable-output-escaping="yes">&amp;uacute;</xsl:text></xsl:template><!-- #250; =U00FA =small u, acute accent  -->
	<xsl:template match="symbol[@name='ucirc']"><xsl:text disable-output-escaping="yes">&amp;ucirc;</xsl:text></xsl:template><!-- #251; =U00FB =small u, circumflex accent  -->
	<xsl:template match="symbol[@name='ugrave']"><xsl:text disable-output-escaping="yes">&amp;ugrave;</xsl:text></xsl:template><!-- #249; =U00F9 =small u, grave accent  -->
	<xsl:template match="symbol[@name='uuml']"><xsl:text disable-output-escaping="yes">&amp;uuml;</xsl:text></xsl:template><!-- #252; =U00FC =small u, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Uacute']"><xsl:text disable-output-escaping="yes">&amp;Uacute;</xsl:text></xsl:template><!-- #218; =U00DA =capital U, acute accent  -->
	<xsl:template match="symbol[@name='Ucirc']"><xsl:text disable-output-escaping="yes">&amp;Ucirc;</xsl:text></xsl:template><!-- #219; =U00DB =capital U, circumflex accent  -->
	<xsl:template match="symbol[@name='Ugrave']"><xsl:text disable-output-escaping="yes">&amp;Ugrave;</xsl:text></xsl:template><!-- #217; =U00D9 =capital U, grave accent  -->
	<xsl:template match="symbol[@name='Uuml']"><xsl:text disable-output-escaping="yes">&amp;Uuml;</xsl:text></xsl:template><!-- #220; =U00DC =capital U, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='yacute']"><xsl:text disable-output-escaping="yes">&amp;yacute;</xsl:text></xsl:template><!-- #253; =U00FD =small y, acute accent  -->
	<xsl:template match="symbol[@name='yuml']"><xsl:text disable-output-escaping="yes">&amp;yuml;</xsl:text></xsl:template><!-- #255; =U00FF =small y, dieresis or umlaut mark  -->
	<xsl:template match="symbol[@name='Yacute']"><xsl:text disable-output-escaping="yes">&amp;Yacute;</xsl:text></xsl:template><!-- #221; =U00DD =capital Y, acute accent  -->
<!-- 

     File isomfrk.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='afr'        ]"></xsl:template>--><!-- #58752; =UE580 /frak a, lower case a  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Afr'        ]"></xsl:template>--><!-- #58720; =UE560 /frak A, upper case a  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bfr'        ]"></xsl:template>--><!-- #58753; =UE581 /frak b, lower case b  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Bfr'        ]"></xsl:template>--><!-- #58721; =UE561 /frak B, upper case b  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cfr'        ]"></xsl:template>--><!-- #58754; =UE582 /frak c, lower case c  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Cfr'        ]"></xsl:template>--><!-- #58722; =UE562 /frak C, upper case c  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dfr'        ]"></xsl:template>--><!-- #58755; =UE583 /frak d, lower case d  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Dfr'        ]"></xsl:template>--><!-- #58723; =UE563 /frak D, upper case d  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='efr'        ]"></xsl:template>--><!-- #58756; =UE584 /frak e, lower case e  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Efr'        ]"></xsl:template>--><!-- #58724; =UE564 /frak E, upper case e  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ffr'        ]"></xsl:template>--><!-- #58757; =UE585 /frak f, lower case f  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ffr'        ]"></xsl:template>--><!-- #58725; =UE565 /frak F, upper case f  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gfr'        ]"></xsl:template>--><!-- #58758; =UE586 /frak g, lower case g  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Gfr'        ]"></xsl:template>--><!-- #58726; =UE566 /frak G, upper case g  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hfr'        ]"></xsl:template>--><!-- #58759; =UE587 /frak h, lower case h  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hfr'        ]"></xsl:template>--><!-- #8460; =U210C /frak H, upper case h  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ifr'        ]"></xsl:template>--><!-- #58760; =UE588 /frak i, lower case i  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ifr'        ]"></xsl:template>--><!-- #8465; =U2111 /frak I, upper case i  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='jfr'        ]"></xsl:template>--><!-- #58761; =UE589 /frak j, lower case j  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jfr'        ]"></xsl:template>--><!-- #58729; =UE569 /frak J, upper case j  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='kfr'        ]"></xsl:template>--><!-- #58762; =UE58A /frak k, lower case k  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Kfr'        ]"></xsl:template>--><!-- #58730; =UE56A /frak K, upper case k  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lfr'        ]"></xsl:template>--><!-- #58763; =UE58B /frak l, lower case l  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lfr'        ]"></xsl:template>--><!-- #58731; =UE56B /frak L, upper case l  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mfr'        ]"></xsl:template>--><!-- #58764; =UE58C /frak m, lower case m  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Mfr'        ]"></xsl:template>--><!-- #58732; =UE56C /frak M, upper case m  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nfr'        ]"></xsl:template>--><!-- #58765; =UE58D /frak n, lower case n  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Nfr'        ]"></xsl:template>--><!-- #58733; =UE56D /frak N, upper case n  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ofr'        ]"></xsl:template>--><!-- #58766; =UE58E /frak o, lower case o  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ofr'        ]"></xsl:template>--><!-- #58734; =UE56E /frak O, upper case o  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pfr'        ]"></xsl:template>--><!-- #58767; =UE58F /frak p, lower case p  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Pfr'        ]"></xsl:template>--><!-- #58735; =UE56F /frak P, upper case p  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='qfr'        ]"></xsl:template>--><!-- #58768; =UE590 /frak q, lower case q  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Qfr'        ]"></xsl:template>--><!-- #58736; =UE570 /frak Q, upper case q  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rfr'        ]"></xsl:template>--><!-- #58769; =UE591 /frak r, lower case r  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rfr'        ]"></xsl:template>--><!-- #8476; =U211C /frak R, upper case r  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sfr'        ]"></xsl:template>--><!-- #58770; =UE592 /frak s, lower case s  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sfr'        ]"></xsl:template>--><!-- #58738; =UE572 /frak S, upper case s  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tfr'        ]"></xsl:template>--><!-- #58771; =UE593 /frak t, lower case t  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tfr'        ]"></xsl:template>--><!-- #58739; =UE573 /frak T, upper case t  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ufr'        ]"></xsl:template>--><!-- #58772; =UE594 /frak u, lower case u  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ufr'        ]"></xsl:template>--><!-- #58740; =UE574 /frak U, upper case u  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vfr'        ]"></xsl:template>--><!-- #58773; =UE595 /frak v, lower case v  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Vfr'        ]"></xsl:template>--><!-- #58741; =UE575 /frak V, upper case v  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='wfr'        ]"></xsl:template>--><!-- #58774; =UE596 /frak w, lower case w  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Wfr'        ]"></xsl:template>--><!-- #58742; =UE576 /frak W, upper case w  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xfr'        ]"></xsl:template>--><!-- #58775; =UE597 /frak x, lower case x  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Xfr'        ]"></xsl:template>--><!-- #58743; =UE577 /frak X, upper case x  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='yfr'        ]"></xsl:template>--><!-- #58776; =UE598 /frak y, lower case y  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Yfr'        ]"></xsl:template>--><!-- #58744; =UE578 /frak Y, upper case y  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='zfr'        ]"></xsl:template>--><!-- #58777; =UE599 /frak z, lower case z  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Zfr'        ]"></xsl:template>--><!-- #58745; =UE579 /frak Z, upper case z   -->
<!-- 

     File isomopf.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Aopf'       ]"></xsl:template>--><!-- #58624; =UE500 /Bbb A, open face A  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Bopf'       ]"></xsl:template>--><!-- #58625; =UE501 /Bbb B, open face B  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Copf'       ]"></xsl:template>--><!-- #8450; =U2102 /Bbb C, open face C  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Dopf'       ]"></xsl:template>--><!-- #58627; =UE503 /Bbb D, open face D  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Eopf'       ]"></xsl:template>--><!-- #58628; =UE504 /Bbb E, open face E  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Fopf'       ]"></xsl:template>--><!-- #58629; =UE505 /Bbb F, open face F  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Gopf'       ]"></xsl:template>--><!-- #58630; =UE506 /Bbb G, open face G  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hopf'       ]"></xsl:template>--><!-- #58631; =UE507 /Bbb H, open face H  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Iopf'       ]"></xsl:template>--><!-- #58632; =UE508 /Bbb I, open face I  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Jopf'       ]"></xsl:template>--><!-- #58633; =UE509 /Bbb J, open face J  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Kopf'       ]"></xsl:template>--><!-- #58634; =UE50A /Bbb K, open face K   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lopf'       ]"></xsl:template>--><!-- #58635; =UE50B /Bbb L, open face L   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Mopf'       ]"></xsl:template>--><!-- #58636; =UE50C /Bbb M, open face M   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Nopf'       ]"></xsl:template>--><!-- #8469; =U2115 /Bbb N, open face N  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Oopf'       ]"></xsl:template>--><!-- #58638; =UE50E /Bbb O, open face O  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Popf'       ]"></xsl:template>--><!-- #8473; =U2119 /Bbb P, open face P  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Qopf'       ]"></xsl:template>--><!-- #8474; =U211A /Bbb Q, open face Q  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Ropf'       ]"></xsl:template>--><!-- #8477; =U211D /Bbb R, open face R  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sopf'       ]"></xsl:template>--><!-- #58642; =UE512 /Bbb S, open face S  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Topf'       ]"></xsl:template>--><!-- #58643; =UE513 /Bbb T, open face T  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uopf'       ]"></xsl:template>--><!-- #58644; =UE514 /Bbb U, open face U  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Vopf'       ]"></xsl:template>--><!-- #58645; =UE515 /Bbb V, open face V  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Wopf'       ]"></xsl:template>--><!-- #58646; =UE516 /Bbb W, open face W  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Xopf'       ]"></xsl:template>--><!-- #58647; =UE517 /Bbb X, open face X  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Yopf'       ]"></xsl:template>--><!-- #58648; =UE518 /Bbb Y, open face Y  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Zopf'       ]"></xsl:template>--><!-- #8484; =U2124 /Bbb Z, open face Z  -->
<!-- 

     File isomscr.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='ascr'       ]"><img src="{$EntityPath}/scr/ascr.gif" BORDER="0" ALT="ascr"/></xsl:template><!-- #58688; =UE540 /scr a, script letter a  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Ascr'       ]"><img src="{$EntityPath}/scr/capAscr.gif" BORDER="0" ALT="Ascr"/></xsl:template><!-- #58656; =UE520 /scr A, script letter A  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bscr'       ]"><img src="{$EntityPath}/scr/bscr.gif" BORDER="0" ALT="bscr"/></xsl:template><!-- #58689; =UE541 /scr b, script letter b  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Bscr'       ]"><img src="{$EntityPath}/scr/capBscr.gif" BORDER="0" ALT="Bscr"/></xsl:template><!-- #8492; =U212C /scr B, script letter B  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cscr'       ]"><img src="{$EntityPath}/scr/cscr.gif" BORDER="0" ALT="cscr"/></xsl:template><!-- #58690; =UE542 /scr c, script letter c  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Cscr'       ]"><img src="{$EntityPath}/scr/capCscr.gif" BORDER="0" ALT="Cscr"/></xsl:template><!-- #58658; =UE522 /scr C, script letter C  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dscr'       ]"><img src="{$EntityPath}/scr/dscr.gif" BORDER="0" ALT="dscr"/></xsl:template><!-- #58691; =UE543 /scr d, script letter d  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Dscr'       ]"><img src="{$EntityPath}/scr/capDscr.gif" BORDER="0" ALT="Dscr"/></xsl:template><!-- #58659; =UE523 /scr D, script letter D  --><!--from DTD3-->
	<xsl:template match="symbol[@name='escr'       ]"><img src="{$EntityPath}/scr/escr.gif" BORDER="0" ALT="escr"/></xsl:template><!-- #8495; =U212F /scr e, script letter e  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Escr'       ]"><img src="{$EntityPath}/scr/capEscr.gif" BORDER="0" ALT="Escr"/></xsl:template><!-- #8496; =U2130 /scr E, script letter E  --><!--from DTD3-->
	<xsl:template match="symbol[@name='fscr'       ]"><img src="{$EntityPath}/scr/fscr-.gif" ALIGN="absbottom" BORDER="0" ALT="fscr"/></xsl:template><!-- #58693; =UE545 /scr f, script letter f  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Fscr'       ]"><img src="{$EntityPath}/scr/capFscr.gif" BORDER="0" ALT="Fscr"/></xsl:template><!-- #8497; =U2131 /scr F, script letter F  --><!--from DTD3-->
	<xsl:template match="symbol[@name='gscr'       ]"><img src="{$EntityPath}/scr/gscr-.gif" ALIGN="absbottom" BORDER="0" ALT="gscr"/></xsl:template><!-- #58694; =UE546 /scr g, script letter g  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Gscr'       ]"><img src="{$EntityPath}/scr/capGscr.gif" BORDER="0" ALT="Gscr"/></xsl:template><!-- #58662; =UE526 /scr G, script letter G  --><!--from DTD3-->
	<xsl:template match="symbol[@name='hscr'       ]"><img src="{$EntityPath}/scr/hscr.gif" BORDER="0" ALT="hscr"/></xsl:template><!-- #58695; =UE547 /scr h, script letter h  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Hscr'       ]"><img src="{$EntityPath}/scr/capHscr.gif" BORDER="0" ALT="Hscr"/></xsl:template><!-- #8459; =U210B /scr H, script letter H  --><!--from DTD3-->
	<xsl:template match="symbol[@name='iscr'       ]"><img src="{$EntityPath}/scr/iscr.gif" BORDER="0" ALT="iscr"/></xsl:template><!-- #58696; =UE548 /scr i, script letter i  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Iscr'       ]"><img src="{$EntityPath}/scr/capIscr.gif" BORDER="0" ALT="Iscr"/></xsl:template><!-- #8464; =U2110 /scr I, script letter I  --><!--from DTD3-->
	<xsl:template match="symbol[@name='jscr'       ]"><img src="{$EntityPath}/scr/jscr-.gif" ALIGN="absbottom" BORDER="0" ALT="jscr"/></xsl:template><!-- #58697; =UE549 /scr j, script letter j  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Jscr'       ]"><img src="{$EntityPath}/scr/capJscr-.gif" ALIGN="absbottom" BORDER="0" ALT="Jscr"/></xsl:template><!-- #58665; =UE529 /scr J, script letter J  --><!--from DTD3-->
	<xsl:template match="symbol[@name='kscr'       ]"><img src="{$EntityPath}/scr/kscr.gif" BORDER="0" ALT="kscr"/></xsl:template><!-- #58698; =UE54A /scr k, script letter k  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Kscr'       ]"><img src="{$EntityPath}/scr/capKscr.gif" BORDER="0" ALT="Kscr"/></xsl:template><!-- #58666; =UE52A /scr K, script letter K  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lscr'       ]"><img src="{$EntityPath}/scr/lscr.gif" BORDER="0" ALT="lscr"/></xsl:template><!-- #58699; =UE54B /scr l, script letter l  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Lscr'       ]"><img src="{$EntityPath}/scr/capLscr.gif" BORDER="0" ALT="Lscr"/></xsl:template><!-- #8466; =U2112 /scr L, script letter L  --><!--from DTD3-->
	<xsl:template match="symbol[@name='mscr'       ]"><img src="{$EntityPath}/scr/mscr.gif" BORDER="0" ALT="mscr"/></xsl:template><!-- #58700; =UE54C /scr m, script letter m  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Mscr'       ]"><img src="{$EntityPath}/scr/capMscr.gif" BORDER="0" ALT="Mscr"/></xsl:template><!-- #8499; =U2133 /scr M, script letter M  --><!--from DTD3-->
	<xsl:template match="symbol[@name='nscr'       ]"><img src="{$EntityPath}/scr/nscr.gif" BORDER="0" ALT="nscr"/></xsl:template><!-- #58701; =UE54D /scr n, script letter n  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Nscr'       ]"><img src="{$EntityPath}/scr/capNscr.gif" BORDER="0" ALT="Nscr"/></xsl:template><!-- #58669; =UE52D /scr N, script letter N  --><!--from DTD3-->
	<xsl:template match="symbol[@name='oscr'       ]"><img src="{$EntityPath}/scr/oscr.gif" BORDER="0" ALT="oscr"/></xsl:template><!-- #8500; =U2134 /scr o, script letter o  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Oscr'       ]"><img src="{$EntityPath}/scr/capOscr.gif" BORDER="0" ALT="Oscr"/></xsl:template><!-- #58670; =UE52E /scr O, script letter O  --><!--from DTD3-->
	<xsl:template match="symbol[@name='pscr'       ]"><img src="{$EntityPath}/scr/pscr-.gif" ALIGN="absbottom" BORDER="0" ALT="pscr"/></xsl:template><!-- #58703; =UE54F /scr p, script letter p  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Pscr'       ]"><img src="{$EntityPath}/scr/capPscr.gif" BORDER="0" ALT="Pscr"/></xsl:template><!-- #58671; =UE52F /scr P, script letter P  --><!--from DTD3-->
	<xsl:template match="symbol[@name='qscr'       ]"><img src="{$EntityPath}/scr/qscr-.gif" ALIGN="absbottom" BORDER="0" ALT="qscr"/></xsl:template><!-- #58704; =UE550 /scr q, script letter q  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Qscr'       ]"><img src="{$EntityPath}/scr/capQscr.gif" BORDER="0" ALT="Qscr"/></xsl:template><!-- #58672; =UE530 /scr Q, script letter Q  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rscr'       ]"><img src="{$EntityPath}/scr/rscr.gif" BORDER="0" ALT="rscr"/></xsl:template><!-- #58705; =UE551 /scr r, script letter r  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Rscr'       ]"><img src="{$EntityPath}/scr/capRscr.gif" BORDER="0" ALT="Rscr"/></xsl:template><!-- #58673; =UE531 /scr R, script letter R  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sscr'       ]"><img src="{$EntityPath}/scr/sscr.gif" BORDER="0" ALT="sscr"/></xsl:template><!-- #58706; =UE552 /scr s, script letter s  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Sscr'       ]"><img src="{$EntityPath}/scr/capSscr.gif" BORDER="0" ALT="Sscr"/></xsl:template><!-- #58674; =UE532 /scr S, script letter S  --><!--from DTD3-->
	<xsl:template match="symbol[@name='tscr'       ]"><img src="{$EntityPath}/scr/tscr.gif" BORDER="0" ALT="tscr"/></xsl:template><!-- #58707; =UE553 /scr t, script letter t  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Tscr'       ]"><img src="{$EntityPath}/scr/capTscr.gif" BORDER="0" ALT="Tscr"/></xsl:template><!-- #58675; =UE533 /scr T, script letter T  --><!--from DTD3-->
	<xsl:template match="symbol[@name='uscr'       ]"><img src="{$EntityPath}/scr/uscr.gif" BORDER="0" ALT="uscr"/></xsl:template><!-- #58708; =UE554 /scr u, script letter u  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Uscr'       ]"><img src="{$EntityPath}/scr/capUscr.gif" BORDER="0" ALT="Uscr"/></xsl:template><!-- #58676; =UE534 /scr U, script letter U  --><!--from DTD3-->
	<xsl:template match="symbol[@name='vscr'       ]"><img src="{$EntityPath}/scr/vscr.gif" BORDER="0" ALT="vscr"/></xsl:template><!-- #58709; =UE555 /scr v, script letter v  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Vscr'       ]"><img src="{$EntityPath}/scr/capVscr.gif" BORDER="0" ALT="Vscr"/></xsl:template><!-- #58677; =UE535 /scr V, script letter V  --><!--from DTD3-->
	<xsl:template match="symbol[@name='wscr'       ]"><img src="{$EntityPath}/scr/wscr.gif" BORDER="0" ALT="wscr"/></xsl:template><!-- #58710; =UE556 /scr w, script letter w  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Wscr'       ]"><img src="{$EntityPath}/scr/capWscr.gif" BORDER="0" ALT="Wscr"/></xsl:template><!-- #58678; =UE536 /scr W, script letter W  --><!--from DTD3-->
	<xsl:template match="symbol[@name='xscr'       ]"><img src="{$EntityPath}/scr/xscr.gif" BORDER="0" ALT="xscr"/></xsl:template><!-- #58711; =UE557 /scr x, script letter x  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Xscr'       ]"><img src="{$EntityPath}/scr/capXscr.gif" BORDER="0" ALT="Xscr"/></xsl:template><!-- #58679; =UE537 /scr X, script letter X  --><!--from DTD3-->
	<xsl:template match="symbol[@name='yscr'       ]"><img src="{$EntityPath}/scr/yscr-.gif" ALIGN="absbottom" BORDER="0" ALT="yscr"/></xsl:template><!-- #58712; =UE558 /scr y, script letter y  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Yscr'       ]"><img src="{$EntityPath}/scr/capYscr.gif" BORDER="0" ALT="Yscr"/></xsl:template><!-- #58680; =UE538 /scr Y, script letter Y  --><!--from DTD3-->
	<xsl:template match="symbol[@name='zscr'       ]"><img src="{$EntityPath}/scr/zscr-.gif" ALIGN="absbottom" BORDER="0" ALT="zscr"/></xsl:template><!-- #58713; =UE559 /scr z, script letter z  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Zscr'       ]"><img src="{$EntityPath}/scr/capZscr-.gif" ALIGN="absbottom" BORDER="0" ALT="Zscr"/></xsl:template><!-- #58681; =UE539 /scr Z, script letter Z  --><!--from DTD3-->
<!-- 

     File isonum.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='amp'        ]">&#38;&#38;</xsl:template><!-- #38;#38; =U0026 =ampersand  -->
	<xsl:template match="symbol[@name='apos'       ]">&#39;</xsl:template><!-- #39;  =U0027 =apostrophe  -->
	<xsl:template match="symbol[@name='ast'        ]">*</xsl:template><!-- #42;  =U002A /ast B: =asterisk  -->
	<!-- <xsl:template match="symbol[@name='brvbar'     ]"><xsl:text disable-output-escaping="yes">&amp;brvbar;</xsl:text></xsl:template>--><!-- #166; =U00A6 =broken (vertical) bar  -->
	<xsl:template match="symbol[@name='bsol'       ]">\</xsl:template><!-- #92;  =U005C /backslash =reverse solidus  -->
	<xsl:template match="symbol[@name='cent']"><xsl:text disable-output-escaping="yes">&amp;cent;</xsl:text></xsl:template><!-- #162; =U00A2 =cent sign  -->
	<xsl:template match="symbol[@name='colon'      ]">:</xsl:template><!-- #58;  =U003A /colon P:  -->
	<xsl:template match="symbol[@name='comma'      ]">,</xsl:template><!-- #44;  =U002C P: =comma  -->
	<xsl:template match="symbol[@name='commat'     ]">@</xsl:template><!-- #64;  =U0040 =commercial at  -->
	<xsl:template match="symbol[@name='copy'       ]"><xsl:text disable-output-escaping="yes">&amp;copy;</xsl:text></xsl:template><!-- #169; =U00A9 =copyright sign  -->
	<xsl:template match="symbol[@name='curren'     ]"><xsl:text disable-output-escaping="yes">&amp;#164;</xsl:text></xsl:template><!-- #164; =U00A4 =general currency sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='darr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#175;</xsl:text></font></xsl:template><!-- #8595; =U2193 /downarrow A: =downward arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='deg'        ]"><xsl:text disable-output-escaping="yes">&amp;deg;</xsl:text></xsl:template><!-- #176; =U00B0 =degree sign  -->
	<xsl:template match="symbol[@name='divide'     ]"><xsl:text disable-output-escaping="yes">&amp;#247;</xsl:text></xsl:template><!-- #247; =U00F7 /div B: =divide sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dollar'     ]"><xsl:text disable-output-escaping="yes">&amp;#036;</xsl:text></xsl:template><!-- #36;  =U0024 =dollar sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='equals'     ]">=</xsl:template><!-- #61;  =U003D =equals sign R:  -->
	<xsl:template match="symbol[@name='excl'     ]"><xsl:text disable-output-escaping="yes">&amp;#033;</xsl:text></xsl:template><!-- #33;  =U0021 =exclamation mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac12']"><xsl:text disable-output-escaping="yes">&amp;frac12;</xsl:text></xsl:template><!-- #189; =U00BD =fraction one-half  -->
	<xsl:template match="symbol[@name='frac14']"><xsl:text disable-output-escaping="yes">&amp;frac14;</xsl:text></xsl:template><!-- #188; =U00BC =fraction one-quarter  -->
	<xsl:template match="symbol[@name='frac18'     ]"><sup><font size="1">1</font></sup>/<font size="1">8</font></xsl:template><!-- #8539; =U215B =fraction one-eighth  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac34']"><xsl:text disable-output-escaping="yes">&amp;frac34;</xsl:text></xsl:template><!-- #190; =U00BE =fraction three-quarters  -->
	<xsl:template match="symbol[@name='frac38'     ]"><sup><font size="1">3</font></sup>/<font size="1">8</font></xsl:template><!-- #8540; =U215C =fraction three-eighths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac58'     ]"><sup><font size="1">5</font></sup>/<font size="1">8</font></xsl:template><!-- #8541; =U215D =fraction five-eighths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac78'     ]"><sup><font size="1">7</font></sup>/<font size="1">8</font></xsl:template><!-- #8542; =U215E =fraction seven-eighths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='gt'         ]">&#62;</xsl:template><!-- #62;  =U003E =greater-than sign R:  -->
	<xsl:template match="symbol[@name='half'       ]"><xsl:text disable-output-escaping="yes">&amp;#189;</xsl:text></xsl:template><!-- #189; =U00BD =fraction one-half  --><!--from DTD3-->
	<xsl:template match="symbol[@name='horbar'     ]"><xsl:text disable-output-escaping="yes">&amp;#151;</xsl:text></xsl:template><!-- #8213; =U2015 =horizontal bar  --><!--from DTD3-->
	<xsl:template match="symbol[@name='hyphen'     ]"><xsl:text disable-output-escaping="yes">&amp;#045;</xsl:text></xsl:template><!-- #8208; =U2010 =hyphen  --><!--from DTD3-->
	<xsl:template match="symbol[@name='iexcl']"><xsl:text disable-output-escaping="yes">&amp;iexcl;</xsl:text></xsl:template><!-- #161; =U00A1 =inverted exclamation mark  -->
	<xsl:template match="symbol[@name='iquest'     ]"><xsl:text disable-output-escaping="yes">&amp;iquest;</xsl:text></xsl:template><!-- #191; =U00BF =inverted question mark  -->
	<xsl:template match="symbol[@name='laquo']"><xsl:text disable-output-escaping="yes">&amp;laquo;</xsl:text></xsl:template><!-- #171; =U00AB =angle quotation mark, left  -->
	<xsl:template match="symbol[@name='larr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#172;</xsl:text></font></xsl:template><!-- #8592; =U2190 /leftarrow /gets A: =leftward arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lcub'       ]"><xsl:text disable-output-escaping="yes">&amp;#123;</xsl:text></xsl:template><!-- #123; =U007B /lbrace O: =left curly bracket  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ldquo'      ]"><xsl:text disable-output-escaping="yes">&amp;#147;</xsl:text></xsl:template><!-- #8220; =U201C =double quotation mark, left  -->
	<xsl:template match="symbol[@name='lowbar'     ]"><xsl:text disable-output-escaping="yes">&amp;#095;</xsl:text></xsl:template><!-- #95;  =U005F =low line  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lpar'       ]"><xsl:text disable-output-escaping="yes">&amp;#040;</xsl:text></xsl:template><!-- #40;  =U0028 O: =left parenthesis  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lsqb'       ]">[</xsl:template><!-- #91;  =U005B /lbrack O: =left square bracket  -->
	<xsl:template match="symbol[@name='lsquo'      ]"><xsl:text disable-output-escaping="yes">&amp;#145;</xsl:text></xsl:template><!-- #8216; =U2018 =single quotation mark, left  -->
	<xsl:template match="symbol[@name='lt'         ]"><xsl:text disable-output-escaping="yes">&amp;#060;</xsl:text></xsl:template><!-- #38;#60; =U003C =less-than sign R:  --><!--from DTD3-->
	<xsl:template match="symbol[@name='micro'      ]"><xsl:text disable-output-escaping="yes">&amp;micro;</xsl:text></xsl:template><!-- #181; =U00B5 =micro sign  -->
	<xsl:template match="symbol[@name='middot'     ]"><xsl:text disable-output-escaping="yes">&amp;middot;</xsl:text></xsl:template><!-- #183; =U00B7 /centerdot B: =middle dot  -->
	<xsl:template match="symbol[@name='nbsp'       ]"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:template><!-- #160; =U00A0 =no break (required) space  -->
	<xsl:template match="symbol[@name='not'        ]"><xsl:text disable-output-escaping="yes">&amp;#172;</xsl:text></xsl:template><!-- #172; =U00AC /neg /lnot =not sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='num'        ]"><xsl:text disable-output-escaping="yes">&amp;#035;</xsl:text></xsl:template><!-- #35;  =U0023 =number sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ohm'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#087;</xsl:text></font></xsl:template><!-- #8486; =U2126 =ohm sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ordf']"><xsl:text disable-output-escaping="yes">&amp;ordf;</xsl:text></xsl:template><!-- #170; =U00AA =ordinal indicator, feminine  -->
	<xsl:template match="symbol[@name='ordm']"><xsl:text disable-output-escaping="yes">&amp;ordm;</xsl:text></xsl:template><!-- #186; =U00BA =ordinal indicator, masculine  -->
	<xsl:template match="symbol[@name='para'       ]"><xsl:text disable-output-escaping="yes">&amp;#182;</xsl:text></xsl:template><!-- #182; =U00B6 =pilcrow (paragraph sign)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='percnt'     ]"><xsl:text disable-output-escaping="yes">&amp;#037;</xsl:text></xsl:template><!-- #37;  =U0025 =percent sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='period'     ]"><xsl:text disable-output-escaping="yes">&amp;#046;</xsl:text></xsl:template><!-- #46;  =U002E =full stop, period  --><!--from DTD3-->
	<xsl:template match="symbol[@name='plus'       ]">+</xsl:template><!-- #43;  =U002B =plus sign B:  -->
	<xsl:template match="symbol[@name='plusmn'     ]"><xsl:text disable-output-escaping="yes">&amp;plusmn;</xsl:text></xsl:template><!-- #177; =U00B1 /pm B: =plus-or-minus sign  -->
	<xsl:template match="symbol[@name='pound']"><xsl:text disable-output-escaping="yes">&amp;pound;</xsl:text></xsl:template><!-- #163; =U00A3 =pound sign  -->
	<xsl:template match="symbol[@name='quest'      ]"><xsl:text disable-output-escaping="yes">&amp;#063;</xsl:text></xsl:template><!-- #63;  =U003F =question mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='quot'       ]"><xsl:text disable-output-escaping="yes">&amp;#034;</xsl:text></xsl:template><!-- #34;  =U0022 =quotation mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='raquo']"><xsl:text disable-output-escaping="yes">&amp;raquo;</xsl:text></xsl:template><!-- #187; =U00BB =angle quotation mark, right  -->
	<xsl:template match="symbol[@name='rarr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#174;</xsl:text></font></xsl:template><!-- #8594; =U2192 /rightarrow /to A: =rightward arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rcub'       ]"><xsl:text disable-output-escaping="yes">&amp;#125;</xsl:text></xsl:template><!-- #125; =U007D /rbrace C: =right curly bracket  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rdquo'      ]"><xsl:text disable-output-escaping="yes">&amp;#148;</xsl:text></xsl:template><!-- #8221; =U201D =double quotation mark, right  -->
	<xsl:template match="symbol[@name='reg']"><xsl:text disable-output-escaping="yes">&amp;reg;</xsl:text></xsl:template><!-- #174; =U00AE /circledR =registered sign  -->
	<xsl:template match="symbol[@name='rpar'       ]"><xsl:text disable-output-escaping="yes">&amp;#041;</xsl:text></xsl:template><!-- #41;  =U0029 C: =right parenthesis  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rsqb'       ]">]</xsl:template><!-- #93;  =U005D /rbrack C: =right square bracket  -->
	<xsl:template match="symbol[@name='rsquo'      ]"><xsl:text disable-output-escaping="yes">&amp;#146;</xsl:text></xsl:template><!-- #8217; =U2019 =single quotation mark, right  -->
	<xsl:template match="symbol[@name='sect'       ]"><xsl:text disable-output-escaping="yes">&amp;#167;</xsl:text></xsl:template><!-- #167; =U00A7 =section sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='semi'       ]"><xsl:text disable-output-escaping="yes">&amp;#059;</xsl:text></xsl:template><!-- #59;  =U003B =semicolon P:  --><!--from DTD3-->
	<xsl:template match="symbol[@name='shy'        ]"><xsl:text disable-output-escaping="yes">&amp;#173;</xsl:text></xsl:template><!-- #173; =U00AD =soft hyphen  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sol'        ]">/</xsl:template><!-- #47;  =U002F =solidus  -->
	<xsl:template match="symbol[@name='sung'       ]"><img src="{$EntityPath}/sung-.gif" ALIGN="absbottom" BORDER="0" ALT="sung"/></xsl:template><!-- #9834; =U266A =music note (sung text sign)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sup1'       ]"><xsl:text disable-output-escaping="yes">&amp;#185;</xsl:text></xsl:template><!-- #185; =U00B9 =superscript one  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sup2'       ]"><xsl:text disable-output-escaping="yes">&amp;#178;</xsl:text></xsl:template><!-- #178; =U00B2 =superscript two  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sup3'       ]"><xsl:text disable-output-escaping="yes">&amp;#179;</xsl:text></xsl:template><!-- #179; =U00B3 =superscript three  --><!--from DTD3-->
	<xsl:template match="symbol[@name='times'      ]"><xsl:text disable-output-escaping="yes">&amp;times;</xsl:text></xsl:template><!-- #215; =U00D7 /times B: =multiply sign  -->
	<xsl:template match="symbol[@name='trade'      ]"><xsl:text disable-output-escaping="yes">&amp;#153;</xsl:text></xsl:template><!-- #8482; =U2122 =trade mark sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='uarr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#173;</xsl:text></font></xsl:template><!-- #8593; =U2191 /uparrow A: =upward arrow  --><!--from DTD3-->
	<xsl:template match="symbol[@name='verbar'     ]"><xsl:text disable-output-escaping="yes">&amp;#124;</xsl:text></xsl:template><!-- #124; =U007C /vert =vertical bar  --><!--from DTD3-->
	<xsl:template match="symbol[@name='yen']"><xsl:text disable-output-escaping="yes">&amp;yen;</xsl:text></xsl:template><!-- #165; =U00A5 /yen =yen sign  -->
<!-- 

     File isopub.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1986
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

	<xsl:template match="symbol[@name='blank'      ]">&amp;nbsp;</xsl:template><!-- #9251; =U2423 =significant blank symbol  --><!--from DTD3-->
	<xsl:template match="symbol[@name='blk12'      ]"><img src="{$EntityPath}/blk12.gif" BORDER="0" ALT="blk12"/></xsl:template><!-- #9618; =U2592 =50% shaded block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='blk14'      ]"><img src="{$EntityPath}/blk14.gif" BORDER="0" ALT="blk14"/></xsl:template><!-- #9617; =U2591 =25% shaded block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='blk34'      ]"><img src="{$EntityPath}/blk34.gif" BORDER="0" ALT="blk34"/></xsl:template><!-- #9619; =U2593 =75% shaded block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='block'      ]"><img src="{$EntityPath}/block.gif" BORDER="0" ALT="block"/></xsl:template><!-- #9608; =U2588 =full block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='bull'       ]">
	<!-- old HG: <img src="{$EntityPath}/bull.gif" BORDER="0" ALT="bull"/> -->
	<xsl:text disable-output-escaping="yes">&amp;#149;</xsl:text>
	</xsl:template><!-- #8226; =U2022 /bullet B: =round bullet, filled  -->
	<xsl:template match="symbol[@name='caret'      ]"><img src="{$EntityPath}/caret-.gif" ALIGN="absbottom" BORDER="0" ALT="caret"/></xsl:template><!-- #8257; =U2041 =caret (insertion mark)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='check'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#214;</xsl:text></font></xsl:template><!-- #10003; =U2713 /checkmark =tick, check mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cir'        ]"><img src="{$EntityPath}/cir.gif" BORDER="0" ALT="cir"/></xsl:template><!-- #9675; =U25CB /circ B: =circle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='clubs'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#167;</xsl:text></font></xsl:template><!-- #9827; =U2663 /clubsuit =club suit symbol   --><!--from DTD3-->
	<xsl:template match="symbol[@name='copysr'     ]"><img src="{$EntityPath}/copysr.gif" BORDER="0" ALT="copysr"/></xsl:template><!-- #8471; =U2117 =sound recording copyright sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cross'      ]"><img src="{$EntityPath}/cross.gif" BORDER="0" ALT="cross"/></xsl:template><!-- #10007; =U2717 =ballot cross  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dagger']"><xsl:text disable-output-escaping="yes">&amp;#134;</xsl:text></xsl:template><!-- #8224; =U2020 /dagger B: =dagger  -->
	<xsl:template match="symbol[@name='dash']"><xsl:text disable-output-escaping="yes">&amp;#150;</xsl:text></xsl:template><!-- #8208; =U2010 =hyphen (true graphic)  -->
	<xsl:template match="symbol[@name='diams'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#168;</xsl:text></font></xsl:template><!-- #9830; =U2666 /diamondsuit =diamond suit symbol   --><!--from DTD3-->
	<xsl:template match="symbol[@name='dlcrop'     ]"><img src="{$EntityPath}/dlcrop.gif" BORDER="0" ALT="dlcrop"/></xsl:template><!-- #8973; =U230D downward left crop mark   --><!--from DTD3-->
	<xsl:template match="symbol[@name='drcrop'     ]"><img src="{$EntityPath}/drcrop.gif" BORDER="0" ALT="drcrop"/></xsl:template><!-- #8972; =U230C downward right crop mark   --><!--from DTD3-->
	<xsl:template match="symbol[@name='dtri'       ]"><img src="{$EntityPath}/dtri.gif" BORDER="0" ALT="dtri"/></xsl:template><!-- #9663; =U25BF /triangledown =down triangle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='dtrif'      ]"><img src="{$EntityPath}/dtrif.gif" BORDER="0" ALT="dtrif"/></xsl:template><!-- #9662; =U25BE /blacktriangledown =dn tri, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Dagger'     ]"><xsl:text disable-output-escaping="yes">&amp;#135;</xsl:text></xsl:template><!-- #8225; =U2021 /ddagger B: =double dagger  --><!--from DTD3-->
	<xsl:template match="symbol[@name='emsp']"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;&nbsp;&nbsp;]]></xsl:text></xsl:template><!-- #8195; =U2003 =em space  -->
	<xsl:template match="symbol[@name='emsp14']"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text></xsl:template><!-- #8197; =U2005 =1/4-em space  -->
	<xsl:template match="symbol[@name='emsp13']"><xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp;]]></xsl:text></xsl:template><!-- #8196; =U2004 =1/3-em space  -->
	<xsl:template match="symbol[@name='ensp']"><xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text></xsl:template><!-- #8194; =U2002 =en space (1/2-em)  -->
	<xsl:template match="symbol[@name='female'     ]"><img src="{$EntityPath}/female.gif" BORDER="0" ALT="female"/></xsl:template><!-- #9792; =U2640 =female symbol  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ffilig'     ]">ffi</xsl:template><!-- #64259; =UFB03 small ffi ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='fflig'      ]">ff</xsl:template><!-- #64256; =UFB00 small ff ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ffllig'     ]">ffl</xsl:template><!-- #64260; =UFB04 small ffl ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='filig'      ]">fi</xsl:template><!-- #64257; =UFB01 small fi ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='fjlig'      ]">fj</xsl:template><!-- #58290; =UE3B2 small fj ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='flat'       ]"><img src="{$EntityPath}/flat.gif" BORDER="0" ALT="flat"/></xsl:template><!-- #9837; =U266D /flat =musical flat  --><!--from DTD3-->
	<xsl:template match="symbol[@name='fllig'      ]">fl</xsl:template><!-- #64258; =UFB02 small fl ligature  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac13'     ]"><sup><font size="1">1</font></sup>/<font size="1">3</font></xsl:template><!-- #8531; =U2153 =fraction one-third  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac15'     ]"><sup><font size="1">1</font></sup>/<font size="1">5</font></xsl:template><!-- #8533; =U2155 =fraction one-fifth  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac16'     ]"><sup><font size="1">1</font></sup>/<font size="1">6</font></xsl:template><!-- #8537; =U2159 =fraction one-sixth  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac23'     ]"><sup><font size="1">2</font></sup>/<font size="1">3</font></xsl:template><!-- #8532; =U2154 =fraction two-thirds  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac25'     ]"><sup><font size="1">2</font></sup>/<font size="1">5</font></xsl:template><!-- #8534; =U2156 =fraction two-fifths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac45'     ]"><sup><font size="1">4</font></sup>/<font size="1">5</font></xsl:template><!-- #8536; =U2158 =fraction four-fifths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac35'     ]"><sup><font size="1">3</font></sup>/<font size="1">5</font></xsl:template><!-- #8535; =U2157 =fraction three-fifths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='frac56'     ]"><sup><font size="1">5</font></sup>/<font size="1">6</font></xsl:template><!-- #8538; =U215A =fraction five-sixths  --><!--from DTD3-->
	<xsl:template match="symbol[@name='hairsp']"><img src="{$EntityPath}/hairsp.gif" BORDER="0" ALT="hairsp"/></xsl:template><!-- #8202; =U200A =hair space  -->
	<xsl:template match="symbol[@name='hearts'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#169;</xsl:text></font></xsl:template><!-- #9825; =U2661 /heartsuit =heart suit symbol   --><!--from DTD3-->
	<xsl:template match="symbol[@name='hellip']">...</xsl:template><!-- #8230; =U2026 =ellipsis (horizontal)  -->
	<xsl:template match="symbol[@name='hybull'     ]"><b><xsl:text disable-output-escaping="yes">&amp;#150;</xsl:text></b></xsl:template><!-- #8259; =U2043 rectangle, filled (hyphen bullet)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='incare'     ]"><sup>c</sup>/o</xsl:template><!-- #8453; =U2105 =in-care-of symbol  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ldquor'     ]"><xsl:text disable-output-escaping="yes">&amp;#132;</xsl:text></xsl:template><!-- #8222; =U201E =rising dbl quote, left (low)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lhblk'      ]"><img src="{$EntityPath}/lhblock.gif" BORDER="0" ALT="lhblk"/></xsl:template><!-- #9604; =U2584 =lower half block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='loz'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#224;</xsl:text></font></xsl:template><!-- #9674; =U25CA /lozenge - lozenge or total mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lozf'       ]"><img src="{$EntityPath}/lozf-.gif" ALIGN="absbottom" BORDER="0" ALT="lozf"/></xsl:template><!-- #59403; =UE80B /blacklozenge - lozenge, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lsquor'     ]"><xsl:text disable-output-escaping="yes">&amp;#130;</xsl:text></xsl:template><!-- #8218; =U201A =rising single quote, left (low)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ltri'       ]"><img src="{$EntityPath}/ltri.gif" BORDER="0" ALT="ltri"/></xsl:template><!-- #9667; =U25C3 /triangleleft B: l triangle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ltrif'      ]"><img src="{$EntityPath}/ltrif.gif" BORDER="0" ALT="ltrif"/></xsl:template><!-- #9666; =U25C2 /blacktriangleleft R: =l tri, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='male'       ]"><img src="{$EntityPath}/male.gif" BORDER="0" ALT="male"/></xsl:template><!-- #9794; =U2642 =male symbol  --><!--from DTD3-->
	<xsl:template match="symbol[@name='malt'       ]"><img src="{$EntityPath}/malt.gif" BORDER="0" ALT="malt"/></xsl:template><!-- #10016; =U2720 /maltese =maltese cross  --><!--from DTD3-->
	<xsl:template match="symbol[@name='marker'     ]"><img src="{$EntityPath}/marker.gif" BORDER="0" ALT="marker"/></xsl:template><!-- #9646; =U25AE =histogram marker  --><!--from DTD3-->
	<xsl:template match="symbol[@name='mdash'      ]"><xsl:text disable-output-escaping="yes">&amp;#151;</xsl:text></xsl:template><!-- #8212; =U2014 =em dash   -->
	<xsl:template match="symbol[@name='mldr'       ]"><nobr>....</nobr></xsl:template><!-- #8230; =U2026 em leader  --><!--from DTD3-->
	<xsl:template match="symbol[@name='natur'      ]"><img src="{$EntityPath}/natur.gif" BORDER="0" ALT="natur"/></xsl:template><!-- #9838; =U266E /natural - music natural  --><!--from DTD3-->
	     <xsl:template match="symbol[@name='ndash'      ]"><xsl:text disable-output-escaping="yes">&amp;#150;</xsl:text></xsl:template><!-- #8211; =U2013 =en dash  -->
	<xsl:template match="symbol[@name='nldr'       ]"><nobr>..</nobr></xsl:template><!-- #8229; =U2025 =double baseline dot (en leader)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='numsp'      ]">&amp;nbsp;&amp;nbsp;</xsl:template><!-- #8199; =U2007 =digit space (width of a number)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='phone'      ]"><img src="{$EntityPath}/phone.gif" BORDER="0" ALT="phone"/></xsl:template><!-- #9742; =U260E =telephone symbol   --><!--from DTD3-->
	<xsl:template match="symbol[@name='puncsp'     ]">&amp;nbsp;</xsl:template><!-- #8200; =U2008 =punctuation space (width of comma)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rdquor'     ]"><xsl:text disable-output-escaping="yes">&amp;#147;</xsl:text></xsl:template><!-- #8221; =U201D rising dbl quote, right (high)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rect'       ]"><img src="{$EntityPath}/rect.gif" BORDER="0" ALT="rect"/></xsl:template><!-- #9645; =U25AD =rectangle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rsquor'     ]"><xsl:text disable-output-escaping="yes">&amp;#145;</xsl:text></xsl:template><!-- #8217; =U2019 rising single quote, right (high)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rtri'       ]"><img src="{$EntityPath}/rtri.gif" BORDER="0" ALT="rtri"/></xsl:template><!-- #9657; =U25B9 /triangleright B: r triangle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rtrif'      ]"><img src="{$EntityPath}/rtrif.gif" BORDER="0" ALT="rtrif"/></xsl:template><!-- #9656; =U25B8 /blacktriangleright R: =r tri, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rx'         ]"><img src="{$EntityPath}/rx-.gif" ALIGN="absbottom" BORDER="0" ALT="rx"/></xsl:template><!-- #8478; =U211E pharmaceutical prescription (Rx)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sext'       ]"><img src="{$EntityPath}/sext-.gif" ALIGN="absbottom" BORDER="0" ALT="sext"/></xsl:template><!-- #10038; =U2736 sextile (6-pointed star)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sharp'      ]"><img src="{$EntityPath}/sharp.gif" BORDER="0" ALT="sharp"/></xsl:template><!-- #9839; =U266F /sharp =musical sharp  --><!--from DTD3-->
	<xsl:template match="symbol[@name='spades'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#170;</xsl:text></font></xsl:template><!-- #9824; =U2660 /spadesuit =spades suit symbol   --><!--from DTD3-->
	<xsl:template match="symbol[@name='squ'        ]"><img src="{$EntityPath}/squ.gif" BORDER="0" ALT="squ"/></xsl:template><!-- #9633; =U25A1 =square, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='squf'       ]"><img src="{$EntityPath}/squf.gif" BORDER="0" ALT="squf"/></xsl:template><!-- #9642; =U25AA /blacksquare =sq bullet, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='star'       ]"><img src="{$EntityPath}/star.gif" BORDER="0" ALT="star"/></xsl:template><!-- #8902; =U22C6 =star, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='starf'      ]"><img src="{$EntityPath}/starf.gif" BORDER="0" ALT="starf"/></xsl:template><!-- #9733; =U2605 /bigstar - star, filled   --><!--from DTD3-->
	<xsl:template match="symbol[@name='target'     ]"><img src="{$EntityPath}/target-.gif" ALIGN="absbottom" BORDER="0" ALT="target"/></xsl:template><!-- #8982; =U2316 register mark or target  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='telrec'     ]"></xsl:template>--><!-- #8981; =U2315 =telephone recorder symbol  -->
	<xsl:template match="symbol[@name='thinsp'     ]"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:template><!-- #150; =U2009 =thin space (1/6-em)  -->
	<xsl:template match="symbol[@name='uhblk'      ]"><img src="{$EntityPath}/uhblock.gif" BORDER="0" ALT="uhblk"/></xsl:template><!-- #9600; =U2580 =upper half block  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ulcrop'     ]"><img src="{$EntityPath}/ulcrop.gif" BORDER="0" ALT="ulcrop"/></xsl:template><!-- #8975; =U230F upward left crop mark   --><!--from DTD3-->
	<xsl:template match="symbol[@name='urcrop'     ]"><img src="{$EntityPath}/urcrop.gif" BORDER="0" ALT="urcrop"/></xsl:template><!-- #8974; =U230E upward right crop mark   --><!--from DTD3-->
	<xsl:template match="symbol[@name='utri'       ]"><img src="{$EntityPath}/utri.gif" BORDER="0" ALT="utri"/></xsl:template><!-- #9653; =U25B5 /triangle =up triangle, open  --><!--from DTD3-->
	<xsl:template match="symbol[@name='utrif'      ]"><img src="{$EntityPath}/utrif.gif" BORDER="0" ALT="utrif"/></xsl:template><!-- #9652; =U25B4 /blacktriangle =up tri, filled  --><!--from DTD3-->
	<xsl:template match="symbol[@name='vellip'     ]"><img src="{$EntityPath}/vellip-.gif" ALIGN="absbottom" BORDER="0" ALT="vellip"/></xsl:template><!-- #8942; =U22EE vertical ellipsis  --><!--from DTD3-->
<!-- 

     File isotech.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

     (C) International Organization for Standardization 1991
     Permission to copy in any form is granted for use with
     conforming SGML systems and applications as defined in
     ISO 8879, provided this notice is included in all copies.
-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='acd'        ]"></xsl:template>--><!-- #58278; =UE3A6 ac current  -->
	<xsl:template match="symbol[@name='aleph'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#192</xsl:text></font></xsl:template><!-- #8501; =U2135 /aleph aleph, Hebrew  -->
	<xsl:template match="symbol[@name='and'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#217;</xsl:text></font></xsl:template><!-- #8743; =U2227 /wedge /land B: logical and  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='andand'     ]"></xsl:template>--><!-- #58222; =UE36E two logical and  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='andd'       ]"></xsl:template>--><!-- #58260; =UE394 and, horizontal dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='andslope'   ]"></xsl:template>--><!-- #58634; =UE50A sloping large and  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='andv'       ]"></xsl:template>--><!-- #58257; =UE391 and with middle stem  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angrt'      ]"></xsl:template>--><!-- #8735; =U221F right (90 degree) angle  -->
	<xsl:template match="symbol[@name='angsph'     ]"><img src="{$EntityPath}/angsph-.gif" ALIGN="absbottom" BORDER="0" ALT="angsph"/></xsl:template><!-- #8738; =U2222 /sphericalangle angle-spherical  --><!--from DTD3-->
	<xsl:template match="symbol[@name='angst'      ]"><xsl:text disable-output-escaping="yes">&amp;#197;</xsl:text></xsl:template><!-- #8491; =U212B Angstrom capital A, ring  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ap'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#187;</xsl:text></font></xsl:template><!-- #8776; =U2248 /approx R: approximate  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='apacir'     ]"></xsl:template>--><!-- #58252; =UE38C approximate, circumflex accent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='awconint'   ]"></xsl:template>--><!-- #8755; =U2233 contour integral, anti-clockwise  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='awint'      ]"></xsl:template>--><!-- #58267; =UE39B anti clock-wise integration  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='And'        ]"></xsl:template>--><!-- #58228; =UE374 dbl logical and  -->
	<xsl:template match="symbol[@name='becaus'     ]"><img src="{$EntityPath}/becaus.gif" BORDER="0" ALT="becaus"/></xsl:template><!-- #8757; =U2235 /because R: because  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bernou'     ]"></xsl:template>--><!-- #8492; =U212C Bernoulli function (script capital B)   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bne'        ]"></xsl:template>--><!-- #58248; =UE388 reverse not equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bnequiv'    ]"></xsl:template>--><!-- #58247; =UE387 reverse not equivalent  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bnot'       ]"></xsl:template>--><!-- #8976; =U2310 reverse not  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bNot'       ]"></xsl:template>--><!-- #58285; =UE3AD reverse not with two horizontal strokes  -->
	<xsl:template match="symbol[@name='bottom'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#94;</xsl:text></font></xsl:template><!-- #8869; =U22A5 /bot bottom  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cap'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#199;</xsl:text></font></xsl:template><!-- #8745; =U2229 /cap B: intersection  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cirfnint'   ]"></xsl:template>--><!-- #58261; =UE395 circulation function  -->
	<xsl:template match="symbol[@name='compfn'     ]"><img src="{$EntityPath}/compfn.gif" BORDER="0" ALT="compfn"/></xsl:template><!-- #8728; =U2218 /circ B: composite function (small circle)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='cong'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#64;</xsl:text></font></xsl:template><!-- #8773; =U2245 /cong R: congruent with  --><!--from DTD3-->
	<xsl:template match="symbol[@name='conint'     ]"><img src="{$EntityPath}/conint-.gif" ALIGN="absbottom" BORDER="0" ALT="conint"/></xsl:template><!-- #8750; =U222E /oint L: contour integral operator  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ctdot'      ]"></xsl:template>--><!-- #8943; =U22EF /cdots, three dots, centered  -->
	<xsl:template match="symbol[@name='cup'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#200;</xsl:text></font></xsl:template><!-- #8746; =U222A /cup B: union or logical sum  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cwconint'   ]"></xsl:template>--><!-- #8754; =U2232 contour integral, clockwise  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cwint'      ]"></xsl:template>--><!-- #8753; =U2231 clockwise integral  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='cylcty'     ]"></xsl:template>--><!-- #9005; =U232D cylindricity  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Cconint'    ]"></xsl:template>--><!-- #8752; =U2230 triple contour integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Conint'     ]"></xsl:template>--><!-- #8751; =U222F double contour integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='disin'      ]"></xsl:template>--><!-- #58272; =UE3A0 set membership, long horizontal stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dsol'       ]"></xsl:template>--><!-- #58281; =UE3A9 solidus, bar above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dtdot'      ]"></xsl:template>--><!-- #8945; =U22F1 /ddots, three dots, descending  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dwangle'    ]"></xsl:template>--><!-- #58282; =UE3AA large downward pointing angle  -->
	<xsl:template match="symbol[@name='Dot'        ]"><xsl:text disable-output-escaping="yes">&amp;#168;</xsl:text></xsl:template><!-- #168; =U00A8 dieresis or umlaut mark  --><!--from DTD3-->
	<xsl:template match="symbol[@name='DotDot'     ]"><xsl:text disable-output-escaping="yes">&amp;#168;&amp;#168;</xsl:text></xsl:template><!-- #8412; =U20DC four dots above  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='elinters'   ]"></xsl:template>--><!-- #58279; =UE3A7 electrical intersection  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='epar'       ]"></xsl:template>--><!-- #8917; =U22D5 parallel, equal; equal or parallel  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eparsl'     ]"></xsl:template>--><!-- #58244; =UE384 parallel, slanted, equal; homothetically congruent to  -->
	<xsl:template match="symbol[@name='equiv'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#186;</xsl:text></font></xsl:template><!-- #8801; =U2261 /equiv R: identical with  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqvparsl'   ]"></xsl:template>--><!-- #58246; =UE386 equivalent, equal; congruent and parallel  -->
	<xsl:template match="symbol[@name='exist'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#36;</xsl:text></font></xsl:template><!-- #8707; =U2203 /exists at least one exists  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='fltns'      ]"></xsl:template>--><!-- #58241; =UE381 flatness  -->
	<xsl:template match="symbol[@name='fnof'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#166;</xsl:text></font></xsl:template><!-- #402; =U0192 function of (italic small f)  --><!--from DTD3-->
	<xsl:template match="symbol[@name='forall'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#34;</xsl:text></font></xsl:template><!-- #8704; =U2200 /forall for all  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='fpartint'   ]"></xsl:template>--><!-- #58262; =UE396 finite part integral  -->
	<xsl:template match="symbol[@name='ge'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#179;</xsl:text></font></xsl:template><!-- #8805; =U2265 /geq /ge R: greater-than-or-equal  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hamilt'     ]"></xsl:template>--><!-- #8459; =U210B Hamiltonian (script capital H)   -->
	<xsl:template match="symbol[@name='iff'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#219;</xsl:text></font></xsl:template><!-- #58213; =UE365 /iff if and only if   --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iinfin'     ]"></xsl:template>--><!-- #58226; =UE372 infinity sign, incomplete  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='imped'      ]"></xsl:template>--><!-- #58635; =UE50B impedance  -->
	<xsl:template match="symbol[@name='infin'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#165;</xsl:text></font></xsl:template><!-- #8734; =U221E /infty infinity  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='infintie'   ]"></xsl:template>--><!-- #58636; =UE50C tie, infinity  -->
	<xsl:template match="symbol[@name='int'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#242;</xsl:text></font></xsl:template><!-- #8747; =U222B /int L: integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='intlarhk'   ]"></xsl:template>--><!-- #58266; =UE39A integral, left arrow with hook  -->
	<xsl:template match="symbol[@name='isin'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#206;</xsl:text></font></xsl:template><!-- #8712; =U2208 /in R: set membership   --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='isindot'    ]"></xsl:template>--><!-- #58268; =UE39C set membership, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='isinE'      ]"></xsl:template>--><!-- #58270; =UE39E set membership, two horizontal strokes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='isins'      ]"></xsl:template>--><!-- #58276; =UE3A4 set membership, vertical bar on horizontal stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='isinsv'     ]"></xsl:template>--><!-- #58274; =UE3A2 large set membership, vertical bar on horizontal stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='isinv'      ]"></xsl:template>--><!-- #8712; =U2208 set membership, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Int'        ]"></xsl:template>--><!-- #8748; =U222C double integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lagran'     ]"></xsl:template>--><!-- #8466; =U2112 Lagrangian (script capital L)   -->
	<xsl:template match="symbol[@name='lang'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#225;</xsl:text></font></xsl:template><!-- #12296; =U3008 /langle O: left angle bracket  --><!--from DTD3-->
	<xsl:template match="symbol[@name='lArr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#220;</xsl:text></font></xsl:template><!-- #8656; =U21D0 /Leftarrow A: is implied by  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbbrk'      ]"></xsl:template>--><!-- #12308; =U3014 left broken bracket  -->
	<xsl:template match="symbol[@name='le'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#163;</xsl:text></font></xsl:template><!-- #8804; =U2264 /leq /le R: less-than-or-equal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='loang'      ]"></xsl:template>--><!-- #12312; =U3018 left open angular bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lobrk'      ]"></xsl:template>--><!-- #12314; =U301A left open bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lopar'      ]"></xsl:template>--><!-- #58233; =UE379 left open parenthesis  -->
	<xsl:template match="symbol[@name='lowast'     ]"><font face="symbol"><sub><xsl:text disable-output-escaping="yes">&amp;#042;</xsl:text></sub></font></xsl:template><!-- #8727; =U2217 low asterisk  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lang'       ]"></xsl:template>--><!-- #12298; =U300A left angle bracket, double  -->
	<xsl:template match="symbol[@name='minus'      ]"><font face="symbol">-</font></xsl:template><!-- #8722; =U2212 B: minus sign  -->
	<xsl:template match="symbol[@name='mnplus'     ]"><xsl:text disable-output-escaping="yes">&amp;#177;</xsl:text></xsl:template><!-- #8723; =U2213 /mp B: minus-or-plus sign  --><!--from DTD3-->
	<xsl:template match="symbol[@name='nabla'      ]"><img src="{$EntityPath}/nabla.gif" BORDER="0" ALT="nabla"/></xsl:template><!-- #8711; =U2207 /nabla del, Hamilton operator  --><!--from DTD3-->
	<xsl:template match="symbol[@name='ne'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#185;</xsl:text></font></xsl:template><!-- #8800; =U2260 /ne /neq R: not equal  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nedot'      ]"></xsl:template>--><!-- #58250; =UE38A not equal, dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nhpar'      ]"></xsl:template>--><!-- #58253; =UE38D not, horizontal, parallel  -->
	<xsl:template match="symbol[@name='ni'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#204;</xsl:text></font></xsl:template><!-- #8715; =U220B /ni /owns R: contains  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nis'        ]"></xsl:template>--><!-- #58277; =UE3A5 contains, vertical bar on horizontal stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nisd'       ]"></xsl:template>--><!-- #58273; =UE3A1 contains, long horizontal stroke  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='niv'        ]"></xsl:template>--><!-- #8715; =U220B contains, variant  -->
	<xsl:template match="symbol[@name='notin'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#207;</xsl:text></font></xsl:template><!-- #8713; =U2209 /notin N: negated set membership  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notindot'   ]"></xsl:template>--><!-- #58269; =UE39D negated set membership, dot above  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notinE'     ]"></xsl:template>--><!-- #58637; =UE50D negated set membership, two horizontal strokes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notinva'    ]"></xsl:template>--><!-- #58224; =UE370 negated set membership, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notinvb'    ]"></xsl:template>--><!-- #58235; =UE37B negated set membership, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notinvc'    ]"></xsl:template>--><!-- #58236; =UE37C negated set membership, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notni'      ]"></xsl:template>--><!-- #8716; =U220C negated contains  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notniva'    ]"></xsl:template>--><!-- #8716; =U220C negated contains, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notnivb'    ]"></xsl:template>--><!-- #58237; =UE37D contains, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='notnivc'    ]"></xsl:template>--><!-- #58238; =UE37E contains, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nparsl'     ]"></xsl:template>--><!-- #58249; =UE389 not parallel, slanted  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npart'      ]"></xsl:template>--><!-- #58256; =UE390 not partial differential  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npolint'    ]"></xsl:template>--><!-- #58265; =UE399 line integration, not including the pole  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nvinfin'    ]"></xsl:template>--><!-- #58254; =UE38E not, vert, infinity  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Not'        ]"></xsl:template>--><!-- #58284; =UE3AC not with two horizontal strokes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='olcross'    ]"></xsl:template>--><!-- #58280; =UE3A8 circle, cross  -->
	<xsl:template match="symbol[@name='or'         ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#218;</xsl:text></font></xsl:template><!-- #8744; =U2228 /vee /lor B: logical or  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ord'        ]"></xsl:template>--><!-- #58259; =UE393 or, horizontal dash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='order'      ]"></xsl:template>--><!-- #8500; =U2134 order of (script small o)   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='oror'       ]"></xsl:template>--><!-- #58223; =UE36F two logical or  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='orslope'    ]"></xsl:template>--><!-- #58286; =UE3AE sloping large or  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='orv'        ]"></xsl:template>--><!-- #58258; =UE392 or with middle stem  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Or'         ]"></xsl:template>--><!-- #58229; =UE375 dbl logical or  -->
	<xsl:template match="symbol[@name='par'        ]"><font face="symbol"><nobr><xsl:text disable-output-escaping="yes">&amp;#124;&amp;#124;</xsl:text></nobr></font></xsl:template><!-- #8741; =U2225 /parallel R: parallel  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='parsl'      ]"></xsl:template>--><!-- #58242; =UE382 parallel, slanted  -->
	<xsl:template match="symbol[@name='part'       ]"><font face="symbol">&#182;</font></xsl:template><!-- #8706; =U2202 /partial partial differential  -->
	<xsl:template match="symbol[@name='permil'     ]"><xsl:text disable-output-escaping="yes">&amp;#137;</xsl:text></xsl:template><!-- #8240; =U2030 per thousand  --><!--from DTD3-->
	<xsl:template match="symbol[@name='perp'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#94;</xsl:text></font></xsl:template><!-- #8869; =U22A5 /perp R: perpendicular  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pertenk'    ]"></xsl:template>--><!-- #8241; =U2031 per 10 thousand  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='phmmat'     ]"></xsl:template>--><!-- #8499; =U2133 physics M-matrix (script capital M)   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pointint'   ]"></xsl:template>--><!-- #58230; =UE376 integral around a point operator  -->
	<xsl:template match="symbol[@name='prime']">'</xsl:template><!-- #8242; =U2032 /prime prime or minute  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='profalar'   ]"></xsl:template>--><!-- #9006; =U232E all-around profile  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='profline'   ]"></xsl:template>--><!-- #8978; =U2312 profile of a line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='profsurf'   ]"></xsl:template>--><!-- #8979; =U2313 profile of a surface  -->
	<xsl:template match="symbol[@name='prop'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#181;</xsl:text></font></xsl:template><!-- #8733; =U221D /propto R: is proportional to  --><!--from DTD3-->
	<xsl:template match="symbol[@name='Prime'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#178;</xsl:text></font></xsl:template><!-- #8243; =U2033 double prime or second  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='qint'       ]"></xsl:template>--><!-- #58232; =UE378 /iiiint quadruple integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='qprime'     ]"></xsl:template>--><!-- #58225; =UE371 quadruple prime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='quatint'    ]"></xsl:template>--><!-- #58231; =UE377 quaternion integral operator  -->
	<xsl:template match="symbol[@name='radic'      ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#214;</xsl:text></font></xsl:template><!-- #8730; =U221A /surd radical  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rang'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#241;</xsl:text></font></xsl:template><!-- #12297; =U3009 /rangle C: right angle bracket  --><!--from DTD3-->
	<xsl:template match="symbol[@name='rArr'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#222;</xsl:text></font></xsl:template><!-- #8658; =U21D2 /Rightarrow A: implies  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbbrk'      ]"></xsl:template>--><!-- #12309; =U3015 right broken bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='roang'      ]"></xsl:template>--><!-- #12313; =U3019 right open angular bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='robrk'      ]"></xsl:template>--><!-- #12315; =U301B right open bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ropar'      ]"></xsl:template>--><!-- #58234; =UE37A right open parenthesis  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rppolint'   ]"></xsl:template>--><!-- #58263; =UE397 line integration, rectangular path around pole  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rang'       ]"></xsl:template>--><!-- #12299; =U300B right angle bracket, double  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='scpolint'   ]"></xsl:template>--><!-- #58264; =UE398 line integration, semi-circular path around pole  -->
	<xsl:template match="symbol[@name='sim'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#126;</xsl:text></font></xsl:template><!-- #8764; =U223C /sim R: similar  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simdot'     ]"></xsl:template>--><!-- #58251; =UE38B similar, dot  -->
	<xsl:template match="symbol[@name='sime'       ]"><img src="{$EntityPath}/sime.gif" BORDER="0" ALT="sime"/></xsl:template><!-- #8771; =U2243 /simeq R: similar, equals  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smeparsl'   ]"></xsl:template>--><!-- #58245; =UE385 similar, parallel, slanted, equal  -->
	<xsl:template match="symbol[@name='square'     ]"><xsl:text disable-output-escaping="yes">&amp;#178;</xsl:text></xsl:template><!-- #9633; =U25A1 /square, square  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='squarf'     ]"></xsl:template>--><!-- #9642; =U25AA /blacksquare, square, filled   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='strns'      ]"></xsl:template>--><!-- #58240; =UE380 straightness  -->
	<xsl:template match="symbol[@name='sub'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#204;</xsl:text></font></xsl:template><!-- #8834; =U2282 /subset R: subset or is implied by  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sube'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#205;</xsl:text></font></xsl:template><!-- #8838; =U2286 /subseteq R: subset, equals  --><!--from DTD3-->
	<xsl:template match="symbol[@name='sup'        ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#201;</xsl:text></font></xsl:template><!-- #8835; =U2283 /supset R: superset or implies  --><!--from DTD3-->
	<xsl:template match="symbol[@name='supe'       ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#202;</xsl:text></font></xsl:template><!-- #8839; =U2287 /supseteq R: superset, equals  --><!--from DTD3-->
	<xsl:template match="symbol[@name='tdot'       ]"><font face="symbol"><sup><xsl:text disable-output-escaping="yes">&amp;#188;</xsl:text></sup></font></xsl:template><!-- #8411; =U20DB three dots above  --><!--from DTD3-->
	<xsl:template match="symbol[@name='there4'     ]"><font face="symbol"><xsl:text disable-output-escaping="yes">&amp;#94;</xsl:text></font></xsl:template><!-- #8756; =U2234 /therefore R: therefore  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tint'       ]"></xsl:template>--><!-- #8749; =U222D /iiint triple integral operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='top'        ]"></xsl:template>--><!-- #8868; =U22A4 /top top  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='topbot'     ]"></xsl:template>--><!-- #9014; =U2336 top and bottom  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='topcir'     ]"></xsl:template>--><!-- #58243; =UE383 top, circle below  -->
	<xsl:template match="symbol[@name='tprime'     ]">'''</xsl:template><!-- #8244; =U2034 triple prime  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='utdot'      ]"></xsl:template>--><!-- #8944; =U22F0 three dots, ascending  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uwangle'    ]"></xsl:template>--><!-- #58283; =UE3AB large upward pointing angle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vangrt'     ]"></xsl:template>--><!-- #8894; =U22BE right angle, variant  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='veeeq'      ]"></xsl:template>--><!-- #8794; =U225A logical or, equals  -->
	<xsl:template match="symbol[@name='Verbar'     ]"><font face="symbol"><nobr><xsl:text disable-output-escaping="yes">&amp;#124;&amp;#124;</xsl:text></nobr></font></xsl:template><!-- #8214; =U2016 /Vert dbl vertical bar  --><!--from DTD3-->
	<xsl:template match="symbol[@name='wedgeq'     ]"><img src="{$EntityPath}/wedgeq.gif" BORDER="0" ALT="wedgeq"/></xsl:template><!-- #8793; =U2259 /wedgeq R: corresponds to (wedge, equals)  --><!--from DTD3-->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='xnis'       ]"></xsl:template>--><!-- #58275; =UE3A3 large contains, vertical bar on horizontal stroke  -->
<!-- 

     File mmlalias.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='angle'      ]"></xsl:template>--><!-- #8736; =U2220 alias ISOAMSO ang  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='approx'     ]"></xsl:template>--><!-- #8776; =U2248 alias ISOTECH ap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='approxeq'   ]"></xsl:template>--><!-- #8778; =U224A alias ISOAMSR ape  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='backcong'   ]"></xsl:template>--><!-- #8780; =U224C alias ISOAMSR bcong  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='backepsilon' ]"></xsl:template>--><!-- #59392; =UE800 alias ISOAMSR bepsi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='backprime'  ]"></xsl:template>--><!-- #8245; =U2035 alias ISOAMSO bprime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='backsim'    ]"></xsl:template>--><!-- #8765; =U223D alias ISOAMSR bsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='backsimeq'  ]"></xsl:template>--><!-- #8909; =U22CD alias ISOAMSR bsime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='barwedge'   ]"></xsl:template>--><!-- #8892; =U22BC alias ISOAMSB barwed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='because'    ]"></xsl:template>--><!-- #8757; =U2235 alias ISOTECH becaus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='between'    ]"></xsl:template>--><!-- #8812; =U226C alias ISOAMSR twixt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigcap'     ]"></xsl:template>--><!-- #8898; =U22C2 alias ISOAMSB xcap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigcirc'    ]"></xsl:template>--><!-- #9711; =U25EF alias ISOAMSB xcirc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigcup'     ]"></xsl:template>--><!-- #8899; =U22C3 alias ISOAMSB xcup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigodot'    ]"></xsl:template>--><!-- #8857; =U2299 alias ISOAMSB xodot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigoplus'   ]"></xsl:template>--><!-- #8853; =U2295 alias ISOAMSB xoplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigotimes'  ]"></xsl:template>--><!-- #8855; =U2297 alias ISOAMSB xotime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigsqcup'   ]"></xsl:template>--><!-- #8852; =U2294 alias ISOAMSB xsqcup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigstar'    ]"></xsl:template>--><!-- #9733; =U2605 ISOPUB    starf   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigtriangledown' ]"></xsl:template>--><!-- #9661; =U25BD alias ISOAMSB xdtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigtriangleup' ]"></xsl:template>--><!-- #9651; =U25B3 alias ISOAMSB xutri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='biguplus'   ]"></xsl:template>--><!-- #8846; =U228E alias ISOAMSB xuplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigvee'     ]"></xsl:template>--><!-- #8897; =U22C1 alias ISOAMSB xvee  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bigwedge'   ]"></xsl:template>--><!-- #8896; =U22C0 alias ISOAMSB xwedge  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bkarow'     ]"></xsl:template>--><!-- #58373; =UE405 alias ISOAMSA rbarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacklozenge' ]"></xsl:template>--><!-- #59403; =UE80B alias ISOPUB lozf  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacksquare' ]"></xsl:template>--><!-- #9642; =U25AA ISOTECH  squarf   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacktriangle' ]"></xsl:template>--><!-- #9652; =U25B4 alias ISOPUB utrif  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacktriangledown' ]"></xsl:template>--><!-- #9662; =U25BE alias ISOPUB dtrif  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacktriangleleft' ]"></xsl:template>--><!-- #9666; =U25C2 alias ISOPUB ltrif  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='blacktriangleright' ]"></xsl:template>--><!-- #9656; =U25B8 alias ISOPUB rtrif  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bot'        ]"></xsl:template>--><!-- #8869; =U22A5 alias ISOTECH bottom  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxminus'   ]"></xsl:template>--><!-- #8863; =U229F alias ISOAMSB minusb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxplus'    ]"></xsl:template>--><!-- #8862; =U229E alias ISOAMSB plusb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='boxtimes'   ]"></xsl:template>--><!-- #8864; =U22A0 alias ISOAMSB timesb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bullet'     ]"></xsl:template>--><!-- #8226; =U2022 alias ISOPUB bull  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='bumpeq'     ]"></xsl:template>--><!-- #8783; =U224F alias ISOAMSR bumpe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Backslash'  ]"></xsl:template>--><!-- #8726; =U2216 alias ISOAMSB setmn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Because'    ]"></xsl:template>--><!-- #8757; =U2235 alias ISOTECH becaus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Breve'      ]"></xsl:template>--><!-- #728; =U02D8 alias ISODIA breve  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Bumpeq'     ]"></xsl:template>--><!-- #8782; =U224E alias ISOAMSR bump  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='centerdot'  ]"></xsl:template>--><!-- #183; =U00B7 alias ISONUM middot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='checkmark'  ]"></xsl:template>--><!-- #10003; =U2713 alias ISOPUB check  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circeq'     ]"></xsl:template>--><!-- #8791; =U2257 alias ISOAMSR cire  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circlearrowleft' ]"></xsl:template>--><!-- #8634; =U21BA alias ISOAMSA olarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circlearrowright' ]"></xsl:template>--><!-- #8635; =U21BB alias ISOAMSA orarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circledast' ]"></xsl:template>--><!-- #8859; =U229B alias ISOAMSB oast  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circledcirc' ]"></xsl:template>--><!-- #8858; =U229A alias ISOAMSB ocir  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circleddash' ]"></xsl:template>--><!-- #8861; =U229D alias ISOAMSB odash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circledR'   ]"></xsl:template>--><!-- #174; =U00AE alias ISONUM reg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='circledS'   ]"></xsl:template>--><!-- #9416; =U24C8 alias ISOAMSO oS  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='clubsuit'   ]"></xsl:template>--><!-- #9827; =U2663 ISOPUB    clubs   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='coloneq'    ]"></xsl:template>--><!-- #8788; =U2254 alias ISOAMSR colone  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='complement' ]"></xsl:template>--><!-- #8705; =U2201 alias ISOAMSO comp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curlyeqprec' ]"></xsl:template>--><!-- #8926; =U22DE alias ISOAMSR cuepr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curlyeqsucc' ]"></xsl:template>--><!-- #8927; =U22DF alias ISOAMSR cuesc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curlyvee'   ]"></xsl:template>--><!-- #8910; =U22CE alias ISOAMSB cuvee  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curlywedge' ]"></xsl:template>--><!-- #8911; =U22CF alias ISOAMSB cuwed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curvearrowleft' ]"></xsl:template>--><!-- #8630; =U21B6 alias ISOAMSA cularr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='curvearrowright' ]"></xsl:template>--><!-- #8631; =U21B7 alias ISOAMSA curarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Cedilla'    ]"></xsl:template>--><!-- #184; =U00B8 alias ISODIA cedil  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CenterDot'  ]"></xsl:template>--><!-- #183; =U00B7 alias ISONUM middot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CircleDot'  ]"></xsl:template>--><!-- #8857; =U2299 alias ISOAMSB odot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CircleMinus' ]"></xsl:template>--><!-- #8854; =U2296 alias ISOAMSB ominus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CirclePlus' ]"></xsl:template>--><!-- #8853; =U2295 alias ISOAMSB oplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CircleTimes' ]"></xsl:template>--><!-- #8855; =U2297 alias ISOAMSB otimes  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ClockwiseContourIntegral' ]"></xsl:template>--><!-- #8754; =U2232 alias ISOTECH cwconint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CloseCurlyDoubleQuote' ]"></xsl:template>--><!-- #8221; =U201D alias ISONUM rdquo  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CloseCurlyQuote' ]"></xsl:template>--><!-- #8217; =U2019 alias ISONUM rsquo  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Congruent'  ]"></xsl:template>--><!-- #8801; =U2261 alias ISOTECH equiv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ContourIntegral' ]"></xsl:template>--><!-- #8750; =U222E alias ISOTECH conint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Coproduct'  ]"></xsl:template>--><!-- #8720; =U2210 alias ISOAMSB coprod  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CounterClockwiseContourIntegral' ]"></xsl:template>--><!-- #8755; =U2233 alias ISOTECH awconint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CupCap'     ]"></xsl:template>--><!-- #8781; =U224D alias ISOAMSR asymp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dbkarow'    ]"></xsl:template>--><!-- #57863; =UE207 alias ISOAMSA rBarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ddagger'    ]"></xsl:template>--><!-- #8225; =U2021 alias ISOPUB Dagger  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ddotseq'    ]"></xsl:template>--><!-- #58121; =UE309 alias ISOAMSR eDDot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='diamond'    ]"></xsl:template>--><!-- #8900; =U22C4 alias ISOAMSB diam  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='diamondsuit' ]"></xsl:template>--><!-- #9830; =U2666 ISOPUB    diams   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='digamma'    ]"></xsl:template>--><!-- #988; =U03DC alias ISOGRK3 gammad  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='div'        ]"></xsl:template>--><!-- #247; =U00F7 alias ISONUM divide  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='divideontimes' ]"></xsl:template>--><!-- #8903; =U22C7 alias ISOAMSB divonx  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='doteq'      ]"></xsl:template>--><!-- #8784; =U2250 alias ISOAMSR esdot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='doteqdot'   ]"></xsl:template>--><!-- #8785; =U2251 alias ISOAMSR eDot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dotminus'   ]"></xsl:template>--><!-- #8760; =U2238 alias ISOAMSB minusd  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dotplus'    ]"></xsl:template>--><!-- #8724; =U2214 alias ISOAMSB plusdo  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dotsquare'  ]"></xsl:template>--><!-- #8865; =U22A1 alias ISOAMSB sdotb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='doublebarwedge' ]"></xsl:template>--><!-- #8966; =U2306 alias ISOAMSB Barwed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='downarrow'  ]"></xsl:template>--><!-- #8595; =U2193 alias ISONUM darr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='downdownarrows' ]"></xsl:template>--><!-- #8650; =U21CA alias ISOAMSA ddarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='downharpoonleft' ]"></xsl:template>--><!-- #8643; =U21C3 alias ISOAMSA dharl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='downharpoonright' ]"></xsl:template>--><!-- #8642; =U21C2 alias ISOAMSA dharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='drbkarow'   ]"></xsl:template>--><!-- #57865; =UE209 alias ISOAMSA RBarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Del'        ]"></xsl:template>--><!-- #8711; =U2207 alias ISOTECH nabla  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DiacriticalAcute' ]"></xsl:template>--><!-- #180; =U00B4 alias ISODIA acute  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DiacriticalDot' ]"></xsl:template>--><!-- #729; =U02D9 alias ISODIA dot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DiacriticalDoubleAcute' ]"></xsl:template>--><!-- #733; =U02DD alias ISODIA dblac  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DiacriticalGrave' ]"></xsl:template>--><!-- #96;  =U0060 alias ISODIA grave  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DiacriticalTilde' ]"></xsl:template>--><!-- #732; =U02DC alias ISODIA tilde  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Diamond'    ]"></xsl:template>--><!-- #8900; =U22C4 alias ISOAMSB diam  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DotEqual'   ]"></xsl:template>--><!-- #8784; =U2250 alias ISOAMSR esdot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleContourIntegral' ]"></xsl:template>--><!-- #8751; =U222F alias ISOTECH Conint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleDot'  ]"></xsl:template>--><!-- #168; =U00A8 alias ISODIA die  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleDownArrow' ]"></xsl:template>--><!-- #8659; =U21D3 alias ISOAMSA dArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLeftArrow' ]"></xsl:template>--><!-- #8656; =U21D0 alias ISOTECH lArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLeftRightArrow' ]"></xsl:template>--><!-- #8660; =U21D4 alias ISOAMSA hArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLeftTee' ]"></xsl:template>--><!-- #58127; =UE30F alias for  &Dashv;   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLongLeftArrow' ]"></xsl:template>--><!-- #57856; =UE200 alias ISOAMSA xlArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLongLeftRightArrow' ]"></xsl:template>--><!-- #57858; =UE202 alias ISOAMSA xhArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleLongRightArrow' ]"></xsl:template>--><!-- #57860; =UE204 alias ISOAMSA xrArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleRightArrow' ]"></xsl:template>--><!-- #8658; =U21D2 alias ISOTECH rArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleRightTee' ]"></xsl:template>--><!-- #8872; =U22A8 alias ISOAMSR vDash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleUpArrow' ]"></xsl:template>--><!-- #8657; =U21D1 alias ISOAMSA uArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleUpDownArrow' ]"></xsl:template>--><!-- #8661; =U21D5 alias ISOAMSA vArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DoubleVerticalBar' ]"></xsl:template>--><!-- #8741; =U2225 alias ISOTECH par  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Downarrow'  ]"></xsl:template>--><!-- #8659; =U21D3 alias ISOAMSA dArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownArrow'  ]"></xsl:template>--><!-- #8595; =U2193 alias ISONUM darr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownArrowUpArrow' ]"></xsl:template>--><!-- #57878; =UE216 alias ISOAMSA duarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownLeftVector' ]"></xsl:template>--><!-- #8637; =U21BD alias ISOAMSA lhard  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownRightVector' ]"></xsl:template>--><!-- #8641; =U21C1 alias ISOAMSA rhard  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownTee'    ]"></xsl:template>--><!-- #8868; =U22A4 alias ISOTECH top  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='emptyset'   ]"></xsl:template>--><!-- #58067; =UE2D3 alias ISOAMSO empty  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqcirc'     ]"></xsl:template>--><!-- #8790; =U2256 alias ISOAMSR ecir  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqcolon'    ]"></xsl:template>--><!-- #8789; =U2255 alias ISOAMSR ecolon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqsim'      ]"></xsl:template>--><!-- #8770; =U2242 alias ISOAMSR esim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqslantgtr' ]"></xsl:template>--><!-- #8925; =U22DD alias ISOAMSR egs  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='eqslantless' ]"></xsl:template>--><!-- #8924; =U22DC alias ISOAMSR els  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Element'    ]"></xsl:template>--><!-- #8712; =U2208 alias ISOTECH isinv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='EqualTilde' ]"></xsl:template>--><!-- #8770; =U2242 alias ISOAMSR esim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Equilibrium' ]"></xsl:template>--><!-- #8652; =U21CC alias ISOAMSA rlhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Exists'     ]"></xsl:template>--><!-- #8707; =U2203 alias ISOTECH exist  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='fallingdotseq' ]"></xsl:template>--><!-- #8786; =U2252 alias ISOAMSR efDot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ForAll'     ]"></xsl:template>--><!-- #8704; =U2200 alias ISOTECH forall  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='geq'        ]"></xsl:template>--><!-- #8805; =U2265 alias ISOTECH ge  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='geqq'       ]"></xsl:template>--><!-- #8807; =U2267 alias ISOAMSR gE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='geqslant'   ]"></xsl:template>--><!-- #58102; =UE2F6 alias ISOAMSR ges  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gg'         ]"></xsl:template>--><!-- #8811; =U226B alias ISOAMSR Gt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ggg'        ]"></xsl:template>--><!-- #8921; =U22D9 alias ISOAMSR Gg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gnapprox'   ]"></xsl:template>--><!-- #58015; =UE29F alias ISOAMSN gnap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gneq'       ]"></xsl:template>--><!-- #8809; =U2269 alias ISOAMSN gne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gneqq'      ]"></xsl:template>--><!-- #8809; =U2269 alias ISOAMSN gnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtrapprox'  ]"></xsl:template>--><!-- #8819; =U2273 alias ISOAMSR gap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtrdot'     ]"></xsl:template>--><!-- #8919; =U22D7 alias ISOAMSR gtdot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtreqless'  ]"></xsl:template>--><!-- #8923; =U22DB alias ISOAMSR gel  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtreqqless' ]"></xsl:template>--><!-- #8923; =U22DB alias ISOAMSR gEl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtrless'    ]"></xsl:template>--><!-- #8823; =U2277 alias ISOAMSR gl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gtrsim'     ]"></xsl:template>--><!-- #8819; =U2273 alias ISOAMSR gsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='gvertneqq'  ]"></xsl:template>--><!-- #58017; =UE2A1 alias ISOAMSN gvnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterEqual' ]"></xsl:template>--><!-- #8805; =U2265 alias ISOTECH ge  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterEqualLess' ]"></xsl:template>--><!-- #8923; =U22DB alias ISOAMSR gel  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterFullEqual' ]"></xsl:template>--><!-- #8807; =U2267 alias ISOAMSR gE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterLess' ]"></xsl:template>--><!-- #8823; =U2277 alias ISOAMSR gl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterSlantEqual' ]"></xsl:template>--><!-- #58102; =UE2F6 alias ISOAMSR ges  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterTilde' ]"></xsl:template>--><!-- #8819; =U2273 alias ISOAMSR gsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hbar'       ]"></xsl:template>--><!-- #58069; =UE2D5 alias ISOAMSO plank  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='heartsuit'  ]"></xsl:template>--><!-- #9825; =U2661 ISOPUB    hearts   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hksearow'   ]"></xsl:template>--><!-- #57867; =UE20B alias ISOAMSA searhk  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hkswarow'   ]"></xsl:template>--><!-- #57866; =UE20A alias ISOAMSA swarhk  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hookleftarrow' ]"></xsl:template>--><!-- #8617; =U21A9 alias ISOAMSA larrhk  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hookrightarrow' ]"></xsl:template>--><!-- #8618; =U21AA alias ISOAMSA rarrhk  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='hslash'     ]"></xsl:template>--><!-- #8463; =U210F alias ISOAMSO plankv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hacek'      ]"></xsl:template>--><!-- #711; =U02C7 alias ISODIA caron  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Hat'        ]"></xsl:template>--><!-- #770; =U0302 circumflex accent (circ in ISODIA)  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='HumpDownHump' ]"></xsl:template>--><!-- #8782; =U224E alias ISOAMSR bump  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='HumpEqual'  ]"></xsl:template>--><!-- #8783; =U224F alias ISOAMSR bumpe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iiiint'     ]"></xsl:template>--><!-- #58232; =UE378 alias ISOTECH qint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='iiint'      ]"></xsl:template>--><!-- #8749; =U222D alias ISOTECH tint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='in'         ]"></xsl:template>--><!-- #8712; =U2208 ISOTECH   isin   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='intercal'   ]"></xsl:template>--><!-- #8890; =U22BA alias ISOAMSB intcal  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='intprod'    ]"></xsl:template>--><!-- #57945; =UE259 alias ISOAMSB iprod  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Im'         ]"></xsl:template>--><!-- #8465; =U2111 ISOAMSO   image    -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Implies'    ]"></xsl:template>--><!-- #8658; =U21D2 alias ISOTECH rArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Integral'   ]"></xsl:template>--><!-- #8747; =U222B alias ISOTECH int  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Intersection' ]"></xsl:template>--><!-- #8898; =U22C2 alias ISOAMSB xcap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='langle'     ]"></xsl:template>--><!-- #12296; =U3008 alias ISOTECH lang  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbrace'     ]"></xsl:template>--><!-- #123; =U007B alias ISONUM lcub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lbrack'     ]"></xsl:template>--><!-- #91;  =U005B alias ISONUM lsqb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftarrow'  ]"></xsl:template>--><!-- #8592; =U2190 alias ISONUM larr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftarrowtail' ]"></xsl:template>--><!-- #8610; =U21A2 alias ISOAMSA larrtl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftharpoondown' ]"></xsl:template>--><!-- #8637; =U21BD alias ISOAMSA lhard  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftharpoonup' ]"></xsl:template>--><!-- #8636; =U21BC alias ISOAMSA lharu  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftleftarrows' ]"></xsl:template>--><!-- #8647; =U21C7 alias ISOAMSA llarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftrightarrow' ]"></xsl:template>--><!-- #8596; =U2194 alias ISOAMSA harr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftrightarrows' ]"></xsl:template>--><!-- #8646; =U21C6 alias ISOAMSA lrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftrightharpoons' ]"></xsl:template>--><!-- #8651; =U21CB alias ISOAMSA lrhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftrightsquigarrow' ]"></xsl:template>--><!-- #8621; =U21AD alias ISOAMSA harrw  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leftthreetimes' ]"></xsl:template>--><!-- #8907; =U22CB alias ISOAMSB lthree  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leq'        ]"></xsl:template>--><!-- #8804; =U2264 alias ISOTECH le  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leqq'       ]"></xsl:template>--><!-- #8806; =U2266 alias ISOAMSR lE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='leqslant'   ]"></xsl:template>--><!-- #58106; =UE2FA alias ISOAMSR les  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lessapprox' ]"></xsl:template>--><!-- #8818; =U2272 alias ISOAMSR lap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lessdot'    ]"></xsl:template>--><!-- #8918; =U22D6 alias ISOAMSR ltdot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesseqgtr'  ]"></xsl:template>--><!-- #8922; =U22DA alias ISOAMSR leg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesseqqgtr' ]"></xsl:template>--><!-- #8922; =U22DA alias ISOAMSR lEg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lessgtr'    ]"></xsl:template>--><!-- #8822; =U2276 alias ISOAMSR lg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lesssim'    ]"></xsl:template>--><!-- #8818; =U2272 alias ISOAMSR lsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ll'         ]"></xsl:template>--><!-- #8810; =U226A alias ISOAMSR Lt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='llcorner'   ]"></xsl:template>--><!-- #8990; =U231E alias ISOAMSC dlcorn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lmoustache' ]"></xsl:template>--><!-- #58004; =UE294 alias ISOAMSC lmoust  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lnapprox'   ]"></xsl:template>--><!-- #58018; =UE2A2 alias ISOAMSN lnap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lneq'       ]"></xsl:template>--><!-- #8808; =U2268 alias ISOAMSN lne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lneqq'      ]"></xsl:template>--><!-- #8808; =U2268 alias ISOAMSN lnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='longleftarrow' ]"></xsl:template>--><!-- #57857; =UE201 alias ISOAMSA xlarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='longleftrightarrow' ]"></xsl:template>--><!-- #57859; =UE203 alias ISOAMSA xharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='longmapsto' ]"></xsl:template>--><!-- #57864; =UE208 alias ISOAMSA xmap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='longrightarrow' ]"></xsl:template>--><!-- #57861; =UE205 alias ISOAMSA xrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='looparrowleft' ]"></xsl:template>--><!-- #8619; =U21AB alias ISOAMSA larrlp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='looparrowright' ]"></xsl:template>--><!-- #8620; =U21AC alias ISOAMSA rarrlp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lozenge'    ]"></xsl:template>--><!-- #9674; =U25CA alias ISOPUB loz  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lrcorner'   ]"></xsl:template>--><!-- #8991; =U231F alias ISOAMSC drcorn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='lvertneqq'  ]"></xsl:template>--><!-- #58020; =UE2A4 alias ISOAMSN lvnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Leftarrow'  ]"></xsl:template>--><!-- #8656; =U21D0 alias ISOTECH lArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftAngleBracket' ]"></xsl:template>--><!-- #12296; =U3008 alias ISOTECH lang  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftArrow'  ]"></xsl:template>--><!-- #8592; =U2190 alias ISONUM larr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftArrowRightArrow' ]"></xsl:template>--><!-- #8646; =U21C6 alias ISOAMSA lrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftCeiling' ]"></xsl:template>--><!-- #8968; =U2308 alias ISOAMSC lceil  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftDoubleBracket' ]"></xsl:template>--><!-- #12314; =U301A left double bracket delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftDownVector' ]"></xsl:template>--><!-- #8643; =U21C3 alias ISOAMSA dharl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftFloor'  ]"></xsl:template>--><!-- #8970; =U230A alias ISOAMSC lfloor  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Leftrightarrow' ]"></xsl:template>--><!-- #8660; =U21D4 alias ISOAMSA hArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftRightArrow' ]"></xsl:template>--><!-- #8596; =U2194 alias ISOAMSA harr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTee'    ]"></xsl:template>--><!-- #8867; =U22A3 alias ISOAMSR dashv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTriangle' ]"></xsl:template>--><!-- #8882; =U22B2 alias ISOAMSR vltri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTriangleEqual' ]"></xsl:template>--><!-- #8884; =U22B4 alias ISOAMSR ltrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftUpVector' ]"></xsl:template>--><!-- #8639; =U21BF alias ISOAMSA uharl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftVector' ]"></xsl:template>--><!-- #8636; =U21BC alias ISOAMSA lharu  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessEqualGreater' ]"></xsl:template>--><!-- #8922; =U22DA alias ISOAMSR leg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessFullEqual' ]"></xsl:template>--><!-- #8806; =U2266 alias ISOAMSR lE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessGreater' ]"></xsl:template>--><!-- #8822; =U2276 alias ISOAMSR lg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessSlantEqual' ]"></xsl:template>--><!-- #58106; =UE2FA alias ISOAMSR les  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessTilde'  ]"></xsl:template>--><!-- #8818; =U2272 alias ISOAMSR lsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lleftarrow' ]"></xsl:template>--><!-- #8666; =U21DA alias ISOAMSA lAarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Longleftarrow' ]"></xsl:template>--><!-- #57856; =UE200 alias ISOAMSA xlArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Longleftrightarrow' ]"></xsl:template>--><!-- #57858; =UE202 alias ISOAMSA xhArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LongLeftArrow' ]"></xsl:template>--><!-- #57857; =UE201 alias ISOAMSA xlarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LongLeftRightArrow' ]"></xsl:template>--><!-- #57859; =UE203 alias ISOAMSA xharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Longrightarrow' ]"></xsl:template>--><!-- #57860; =UE204 alias ISOAMSA xrArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LongRightArrow' ]"></xsl:template>--><!-- #57861; =UE205 alias ISOAMSA xrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LowerLeftArrow' ]"></xsl:template>--><!-- #8601; =U2199 alias ISOAMSA swarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LowerRightArrow' ]"></xsl:template>--><!-- #8600; =U2198 alias ISOAMSA searr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Lsh'        ]"></xsl:template>--><!-- #8624; =U21B0 alias ISOAMSA lsh  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='maltese'    ]"></xsl:template>--><!-- #10016; =U2720 alias ISOPUB malt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mapsto'     ]"></xsl:template>--><!-- #8614; =U21A6 alias ISOAMSA map  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='measuredangle' ]"></xsl:template>--><!-- #8737; =U2221 alias ISOAMSO angmsd  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mp'         ]"></xsl:template>--><!-- #8723; =U2213 alias ISOTECH mnplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='multimap'   ]"></xsl:template>--><!-- #8888; =U22B8 alias ISOAMSA mumap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='MinusPlus'  ]"></xsl:template>--><!-- #8723; =U2213 alias ISOTECH mnplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='napprox'    ]"></xsl:template>--><!-- #8777; =U2249 alias ISOAMSN nap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='natural'    ]"></xsl:template>--><!-- #9838; =U266E alias ISOPUB natur  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nearrow'    ]"></xsl:template>--><!-- #8599; =U2197 alias ISOAMSA nearr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nexists'    ]"></xsl:template>--><!-- #8708; =U2204 alias ISOAMSO nexist  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngeq'       ]"></xsl:template>--><!-- #58022; =UE2A6 alias ISOAMSN nge  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngeqq'      ]"></xsl:template>--><!-- #8817; =U2271 alias ISOAMSN ngE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngeqslant'  ]"></xsl:template>--><!-- #8817; =U2271 alias ISOAMSN nges  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ngtr'       ]"></xsl:template>--><!-- #8815; =U226F alias ISOAMSN ngt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nleftarrow' ]"></xsl:template>--><!-- #8602; =U219A alias ISOAMSA nlarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nleftrightarrow' ]"></xsl:template>--><!-- #8622; =U21AE alias ISOAMSA nharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nleq'       ]"></xsl:template>--><!-- #58023; =UE2A7 alias ISOAMSN nle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nleqq'      ]"></xsl:template>--><!-- #8816; =U2270 alias ISOAMSN nlE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nleqslant'  ]"></xsl:template>--><!-- #8816; =U2270 alias ISOAMSN nles  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nless'      ]"></xsl:template>--><!-- #8814; =U226E alias ISOAMSN nlt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nLeftarrow' ]"></xsl:template>--><!-- #8653; =U21CD alias ISOAMSA nlArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nLeftrightarrow' ]"></xsl:template>--><!-- #8654; =U21CE alias ISOAMSA nhArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nparallel'  ]"></xsl:template>--><!-- #8742; =U2226 alias ISOAMSN npar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nprec'      ]"></xsl:template>--><!-- #8832; =U2280 alias ISOAMSN npr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='npreceq'    ]"></xsl:template>--><!-- #58844; =UE5DC alias ISOAMSN npre  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nrightarrow' ]"></xsl:template>--><!-- #8603; =U219B alias ISOAMSA nrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nRightarrow' ]"></xsl:template>--><!-- #8655; =U21CF alias ISOAMSA nrArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nshortmid'  ]"></xsl:template>--><!-- #58026; =UE2AA alias ISOAMSN nsmid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nshortparallel' ]"></xsl:template>--><!-- #58027; =UE2AB alias ISOAMSN nspar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsimeq'     ]"></xsl:template>--><!-- #8772; =U2244 alias ISOAMSN nsime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsubset'    ]"></xsl:template>--><!-- #8836; =U2284 alias ISOAMSN vnsub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsubseteq'  ]"></xsl:template>--><!-- #8840; =U2288 alias ISOAMSN nsube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsubseteqq' ]"></xsl:template>--><!-- #8840; =U2288 alias ISOAMSN nsubE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsucc'      ]"></xsl:template>--><!-- #8833; =U2281 alias ISOAMSN nsc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsucceq'    ]"></xsl:template>--><!-- #58865; =UE5F1 alias ISOAMSN nsce  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsupset'    ]"></xsl:template>--><!-- #8837; =U2285 alias ISOAMSN vnsup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsupseteq'  ]"></xsl:template>--><!-- #8841; =U2289 alias ISOAMSN nsupe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nsupseteqq' ]"></xsl:template>--><!-- #8841; =U2289 alias ISOAMSN nsupE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntriangleleft' ]"></xsl:template>--><!-- #8938; =U22EA alias ISOAMSN nltri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntrianglelefteq' ]"></xsl:template>--><!-- #8940; =U22EC alias ISOAMSN nltrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntriangleright' ]"></xsl:template>--><!-- #8939; =U22EB alias ISOAMSN nrtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ntrianglerighteq' ]"></xsl:template>--><!-- #8941; =U22ED alias ISOAMSN nrtrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nwarrow'    ]"></xsl:template>--><!-- #8598; =U2196 alias ISOAMSA nwarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NestedGreaterGreater' ]"></xsl:template>--><!-- #8811; =U226B alias ISOAMSR Gt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NestedLessLess' ]"></xsl:template>--><!-- #8810; =U226A alias ISOAMSR Lt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotCongruent' ]"></xsl:template>--><!-- #8802; =U2262 alias ISOAMSN nequiv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotDoubleVerticalBar' ]"></xsl:template>--><!-- #8742; =U2226 alias ISOAMSN npar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotElement' ]"></xsl:template>--><!-- #8713; =U2209 alias ISOTECH notin  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotEqual'   ]"></xsl:template>--><!-- #8800; =U2260 alias ISOTECH ne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotExists'  ]"></xsl:template>--><!-- #8708; =U2204 alias ISOAMSO nexist  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreater' ]"></xsl:template>--><!-- #8815; =U226F alias ISOAMSN ngt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterEqual' ]"></xsl:template>--><!-- #58022; =UE2A6 alias ISOAMSN nge  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterFullEqual' ]"></xsl:template>--><!-- #8816; =U2270 alias ISOAMSN nlE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterGreater' ]"></xsl:template>--><!-- #58060; =UE2CC alias ISOAMSN nGtv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterLess' ]"></xsl:template>--><!-- #8825; =U2279 alias ISOAMSN ntvgl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterSlantEqual' ]"></xsl:template>--><!-- #8817; =U2271 alias ISOAMSN nges  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotGreaterTilde' ]"></xsl:template>--><!-- #8821; =U2275 alias ISOAMSN ngsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLeftTriangle' ]"></xsl:template>--><!-- #8938; =U22EA alias ISOAMSN nltri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLeftTriangleEqual' ]"></xsl:template>--><!-- #8940; =U22EC alias ISOAMSN nltrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLess'    ]"></xsl:template>--><!-- #8814; =U226E alias ISOAMSN nlt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLessEqual' ]"></xsl:template>--><!-- #58023; =UE2A7 alias ISOAMSN nle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLessGreater' ]"></xsl:template>--><!-- #8824; =U2278 alias ISOAMSN ntvlg  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLessLess' ]"></xsl:template>--><!-- #58059; =UE2CB alias ISOAMSN nLtv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLessSlantEqual' ]"></xsl:template>--><!-- #8816; =U2270 alias ISOAMSN nles  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLessTilde' ]"></xsl:template>--><!-- #8820; =U2274 alias ISOAMSN nlsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotPrecedes' ]"></xsl:template>--><!-- #8832; =U2280 alias ISOAMSN npr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotPrecedesEqual' ]"></xsl:template>--><!-- #58844; =UE5DC alias ISOAMSN npre  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotPrecedesSlantEqual' ]"></xsl:template>--><!-- #8928; =U22E0 alias ISOAMSN nprcue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotReverseElement' ]"></xsl:template>--><!-- #8716; =U220C alias ISOTECH notniva  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotRightTriangle' ]"></xsl:template>--><!-- #8939; =U22EB alias ISOAMSN nrtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotRightTriangleEqual' ]"></xsl:template>--><!-- #8941; =U22ED alias ISOAMSN nrtrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSquareSubsetEqual' ]"></xsl:template>--><!-- #8930; =U22E2 alias ISOAMSN nsqsube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSquareSupersetEqual' ]"></xsl:template>--><!-- #8931; =U22E3 alias ISOAMSN nsqsupe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSubset'  ]"></xsl:template>--><!-- #8836; =U2284 alias ISOAMSN vnsub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSubsetEqual' ]"></xsl:template>--><!-- #8840; =U2288 alias ISOAMSN nsube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSucceeds' ]"></xsl:template>--><!-- #8833; =U2281 alias ISOAMSN nsc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSucceedsEqual' ]"></xsl:template>--><!-- #58865; =UE5F1 alias ISOAMSN nsce  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSucceedsSlantEqual' ]"></xsl:template>--><!-- #8929; =U22E1 alias ISOAMSN nsccue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSuperset' ]"></xsl:template>--><!-- #8837; =U2285 alias ISOAMSN vnsup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSupersetEqual' ]"></xsl:template>--><!-- #8841; =U2289 alias ISOAMSN nsupe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotTilde'   ]"></xsl:template>--><!-- #8769; =U2241 alias ISOAMSN nsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotTildeEqual' ]"></xsl:template>--><!-- #8772; =U2244 alias ISOAMSN nsime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotTildeFullEqual' ]"></xsl:template>--><!-- #8775; =U2247 alias ISOAMSN ncong  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotTildeTilde' ]"></xsl:template>--><!-- #8777; =U2249 alias ISOAMSN nap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotVerticalBar' ]"></xsl:template>--><!-- #8740; =U2224 alias ISOAMSN nmid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='oint'       ]"></xsl:template>--><!-- #8750; =U222E alias ISOTECH conint  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OpenCurlyDoubleQuote' ]"></xsl:template>--><!-- #8220; =U201C alias ISONUM ldquo  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OpenCurlyQuote' ]"></xsl:template>--><!-- #8216; =U2018 alias ISONUM lsquo  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='parallel'   ]"></xsl:template>--><!-- #8741; =U2225 alias ISOTECH par  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pitchfork'  ]"></xsl:template>--><!-- #8916; =U22D4 alias ISOAMSR fork  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='pm'         ]"></xsl:template>--><!-- #177; =U00B1 alias ISONUM plusmn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='prec'       ]"></xsl:template>--><!-- #8826; =U227A alias ISOAMSR pr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='precapprox' ]"></xsl:template>--><!-- #8830; =U227E alias ISOAMSR prap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='preccurlyeq' ]"></xsl:template>--><!-- #8828; =U227C alias ISOAMSR prcue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='preceq'     ]"></xsl:template>--><!-- #58110; =UE2FE alias ISOAMSR pre  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='precnapprox' ]"></xsl:template>--><!-- #8936; =U22E8 alias ISOAMSN prnap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='precneqq'   ]"></xsl:template>--><!-- #58035; =UE2B3 alias ISOAMSN prnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='precnsim'   ]"></xsl:template>--><!-- #8936; =U22E8 alias ISOAMSN prnsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='precsim'    ]"></xsl:template>--><!-- #8830; =U227E alias ISOAMSR prsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='propto'     ]"></xsl:template>--><!-- #8733; =U221D alias ISOTECH prop  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='PartialD'   ]"></xsl:template>--><!-- #8706; =U2202 alias ISOTECH part  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='PlusMinus'  ]"></xsl:template>--><!-- #177; =U00B1 alias ISONUM plusmn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Precedes'   ]"></xsl:template>--><!-- #8826; =U227A alias ISOAMSR pr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='PrecedesEqual' ]"></xsl:template>--><!-- #58110; =UE2FE alias ISOAMSR pre  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='PrecedesSlantEqual' ]"></xsl:template>--><!-- #8828; =U227C alias ISOAMSR prcue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='PrecedesTilde' ]"></xsl:template>--><!-- #8830; =U227E alias ISOAMSR prsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Proportion' ]"></xsl:template>--><!-- #8759; =U2237 alias ISOAMSR Colon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Proportional' ]"></xsl:template>--><!-- #8733; =U221D alias ISOTECH prop  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='questeq'    ]"></xsl:template>--><!-- #8799; =U225F alias ISOAMSR equest  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rangle'     ]"></xsl:template>--><!-- #12297; =U3009 alias ISOTECH rang  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbrace'     ]"></xsl:template>--><!-- #125; =U007D alias ISONUM rcub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rbrack'     ]"></xsl:template>--><!-- #93;  =U005D alias ISONUM rsqb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightarrow' ]"></xsl:template>--><!-- #8594; =U2192 alias ISONUM rarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightarrowtail' ]"></xsl:template>--><!-- #8611; =U21A3 alias ISOAMSA rarrtl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightharpoondown' ]"></xsl:template>--><!-- #8641; =U21C1 alias ISOAMSA rhard  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightharpoonup' ]"></xsl:template>--><!-- #8640; =U21C0 alias ISOAMSA rharu  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightleftarrows' ]"></xsl:template>--><!-- #8644; =U21C4 alias ISOAMSA rlarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightleftharpoons' ]"></xsl:template>--><!-- #8652; =U21CC alias ISOAMSA rlhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightrightarrows' ]"></xsl:template>--><!-- #8649; =U21C9 alias ISOAMSA rrarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightsquigarrow' ]"></xsl:template>--><!-- #8669; =U21DD alias ISOAMSA rarrw  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rightthreetimes' ]"></xsl:template>--><!-- #8908; =U22CC alias ISOAMSB rthree  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='risingdotseq' ]"></xsl:template>--><!-- #8787; =U2253 alias ISOAMSR erDot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rmoustache' ]"></xsl:template>--><!-- #58003; =UE293 alias ISOAMSC rmoust  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Re'         ]"></xsl:template>--><!-- #8476; =U211C ISOAMSO   real  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ReverseElement' ]"></xsl:template>--><!-- #8715; =U220B alias ISOTECH niv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ReverseEquilibrium' ]"></xsl:template>--><!-- #8651; =U21CB alias ISOAMSA lrhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ReverseUpEquilibrium' ]"></xsl:template>--><!-- #57879; =UE217 alias ISOAMSA duhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rightarrow' ]"></xsl:template>--><!-- #8658; =U21D2 alias ISOTECH rArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightAngleBracket' ]"></xsl:template>--><!-- #12297; =U3009 alias ISOTECH rang  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightArrow' ]"></xsl:template>--><!-- #8594; =U2192 alias ISONUM rarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightArrowLeftArrow' ]"></xsl:template>--><!-- #8644; =U21C4 alias ISOAMSA rlarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightCeiling' ]"></xsl:template>--><!-- #8969; =U2309 alias ISOAMSC rceil  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightDoubleBracket' ]"></xsl:template>--><!-- #12315; =U301B right double bracket delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightDownVector' ]"></xsl:template>--><!-- #8642; =U21C2 alias ISOAMSA dharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightFloor' ]"></xsl:template>--><!-- #8971; =U230B alias ISOAMSC rfloor  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTee'   ]"></xsl:template>--><!-- #8866; =U22A2 alias ISOAMSR vdash  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTeeArrow' ]"></xsl:template>--><!-- #8614; =U21A6 alias ISOAMSA map  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTriangle' ]"></xsl:template>--><!-- #8883; =U22B3 alias ISOAMSR vrtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTriangleEqual' ]"></xsl:template>--><!-- #8885; =U22B5 alias ISOAMSR rtrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightUpVector' ]"></xsl:template>--><!-- #8638; =U21BE alias ISOAMSA uharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightVector' ]"></xsl:template>--><!-- #8640; =U21C0 alias ISOAMSA rharu  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rrightarrow' ]"></xsl:template>--><!-- #8667; =U21DB alias ISOAMSA rAarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Rsh'        ]"></xsl:template>--><!-- #8625; =U21B1 alias ISOAMSA rsh  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='searrow'    ]"></xsl:template>--><!-- #8600; =U2198 alias ISOAMSA searr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='setminus'   ]"></xsl:template>--><!-- #8726; =U2216 alias ISOAMSB setmn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='shortmid'   ]"></xsl:template>--><!-- #58113; =UE301 alias ISOAMSR smid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='shortparallel' ]"></xsl:template>--><!-- #58114; =UE302 alias ISOAMSR spar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='simeq'      ]"></xsl:template>--><!-- #8771; =U2243 alias ISOTECH sime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='smallsetminus' ]"></xsl:template>--><!-- #59460; =UE844 alias ISOAMSB ssetmn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='spadesuit'  ]"></xsl:template>--><!-- #9824; =U2660 ISOPUB    spades   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsubset'   ]"></xsl:template>--><!-- #8847; =U228F alias ISOAMSR sqsub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsubseteq' ]"></xsl:template>--><!-- #8849; =U2291 alias ISOAMSR sqsube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsupset'   ]"></xsl:template>--><!-- #8848; =U2290 alias ISOAMSR sqsup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='sqsupseteq' ]"></xsl:template>--><!-- #8850; =U2292 alias ISOAMSR sqsupe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='straightepsilon' ]"></xsl:template>--><!-- #949; =U03B5 alias ISOGRK3 epsi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='straightphi' ]"></xsl:template>--><!-- #966; =U03C6 alias ISOGRK3 phi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subset'     ]"></xsl:template>--><!-- #8834; =U2282 alias ISOTECH sub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subseteq'   ]"></xsl:template>--><!-- #8838; =U2286 alias ISOTECH sube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subseteqq'  ]"></xsl:template>--><!-- #8838; =U2286 alias ISOAMSR subE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subsetneq'  ]"></xsl:template>--><!-- #8842; =U228A alias ISOAMSN subne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='subsetneqq' ]"></xsl:template>--><!-- #8842; =U228A alias ISOAMSN subnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succ'       ]"></xsl:template>--><!-- #8827; =U227B alias ISOAMSR sc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succapprox' ]"></xsl:template>--><!-- #8831; =U227F alias ISOAMSR scap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succcurlyeq' ]"></xsl:template>--><!-- #8829; =U227D alias ISOAMSR sccue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succeq'     ]"></xsl:template>--><!-- #8829; =U227D alias ISOAMSR sce  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succnapprox' ]"></xsl:template>--><!-- #8937; =U22E9 alias ISOAMSN scnap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succneqq'   ]"></xsl:template>--><!-- #58037; =UE2B5 alias ISOAMSN scnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succnsim'   ]"></xsl:template>--><!-- #8937; =U22E9 alias ISOAMSN scnsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='succsim'    ]"></xsl:template>--><!-- #8831; =U227F alias ISOAMSR scsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supset'     ]"></xsl:template>--><!-- #8835; =U2283 alias ISOTECH sup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supseteq'   ]"></xsl:template>--><!-- #8839; =U2287 alias ISOTECH supe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supseteqq'  ]"></xsl:template>--><!-- #8839; =U2287 alias ISOAMSR supE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supsetneq'  ]"></xsl:template>--><!-- #8843; =U228B alias ISOAMSN supne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='supsetneqq' ]"></xsl:template>--><!-- #8843; =U228B alias ISOAMSN supnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='swarrow'    ]"></xsl:template>--><!-- #8601; =U2199 alias ISOAMSA swarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ShortLeftArrow' ]"></xsl:template>--><!-- #57907; =UE233 alias ISOAMSA slarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ShortRightArrow' ]"></xsl:template>--><!-- #57906; =UE232 alias ISOAMSA srarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SmallCircle' ]"></xsl:template>--><!-- #8728; =U2218 alias ISOTECH compfn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sqrt'       ]"></xsl:template>--><!-- #8730; =U221A alias ISOTECH radic  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Square'     ]"></xsl:template>--><!-- #9633; =U25A1 alias for square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareIntersection' ]"></xsl:template>--><!-- #8851; =U2293 alias ISOAMSB sqcap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareSubset' ]"></xsl:template>--><!-- #8847; =U228F alias ISOAMSR sqsub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareSubsetEqual' ]"></xsl:template>--><!-- #8849; =U2291 alias ISOAMSR sqsube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareSuperset' ]"></xsl:template>--><!-- #8848; =U2290 alias ISOAMSR sqsup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareSupersetEqual' ]"></xsl:template>--><!-- #8850; =U2292 alias ISOAMSR sqsupe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SquareUnion' ]"></xsl:template>--><!-- #8852; =U2294 alias ISOAMSB sqcup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Star'       ]"></xsl:template>--><!-- #8902; =U22C6 alias ISOAMSB sstarf  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Subset'     ]"></xsl:template>--><!-- #8912; =U22D0 alias ISOAMSR Sub  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SubsetEqual' ]"></xsl:template>--><!-- #8838; =U2286 alias ISOTECH sube  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Succeeds'   ]"></xsl:template>--><!-- #8827; =U227B alias ISOAMSR sc  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SucceedsEqual' ]"></xsl:template>--><!-- #8829; =U227D alias ISOAMSR sce  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SucceedsSlantEqual' ]"></xsl:template>--><!-- #8829; =U227D alias ISOAMSR sccue  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SucceedsTilde' ]"></xsl:template>--><!-- #8831; =U227F alias ISOAMSR scsim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SuchThat'   ]"></xsl:template>--><!-- #8715; =U220B ISOTECH  ni  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Sum'        ]"></xsl:template>--><!-- #8721; =U2211 alias ISOAMSB sum  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Superset'   ]"></xsl:template>--><!-- #8835; =U2283 alias ISOTECH sup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='SupersetEqual' ]"></xsl:template>--><!-- #8839; =U2287 alias ISOTECH supe  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Supset'     ]"></xsl:template>--><!-- #8913; =U22D1 alias ISOAMSR Sup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='therefore'  ]"></xsl:template>--><!-- #8756; =U2234 alias ISOTECH there4  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='thickapprox' ]"></xsl:template>--><!-- #58118; =UE306 ISOAMSR   thkap   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='thicksim'   ]"></xsl:template>--><!-- #58409; =UE429 ISOAMSR   thksim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='toea'       ]"></xsl:template>--><!-- #57870; =UE20E alias ISOAMSA nesear  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='tosa'       ]"></xsl:template>--><!-- #57871; =UE20F alias ISOAMSA seswar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='triangle'   ]"></xsl:template>--><!-- #9653; =U25B5 alias ISOPUB utri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='triangledown' ]"></xsl:template>--><!-- #9663; =U25BF alias ISOPUB dtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='triangleleft' ]"></xsl:template>--><!-- #9667; =U25C3 alias ISOPUB ltri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='trianglelefteq' ]"></xsl:template>--><!-- #8884; =U22B4 alias ISOAMSR ltrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='triangleq'  ]"></xsl:template>--><!-- #8796; =U225C alias ISOAMSR trie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='triangleright' ]"></xsl:template>--><!-- #9657; =U25B9 alias ISOPUB rtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='trianglerighteq' ]"></xsl:template>--><!-- #8885; =U22B5 alias ISOAMSR rtrie  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='twoheadleftarrow' ]"></xsl:template>--><!-- #8606; =U219E alias ISOAMSA Larr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='twoheadrightarrow' ]"></xsl:template>--><!-- #8608; =U21A0 alias ISOAMSA Rarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Therefore'  ]"></xsl:template>--><!-- #8756; =U2234 alias ISOTECH there4  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ThinSpace'  ]"></xsl:template>--><!-- #8201; =U2009 space of width 3/18 em alias ISOPUB thinsp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tilde'      ]"></xsl:template>--><!-- #8764; =U223C alias ISOTECH sim  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TildeEqual' ]"></xsl:template>--><!-- #8771; =U2243 alias ISOTECH sime  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TildeFullEqual' ]"></xsl:template>--><!-- #8773; =U2245 alias ISOTECH cong  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TildeTilde' ]"></xsl:template>--><!-- #8776; =U2248 alias ISOTECH ap  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='TripleDot'  ]"></xsl:template>--><!-- #8411; =U20DB alias ISOTECH tdot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ulcorner'   ]"></xsl:template>--><!-- #8988; =U231C alias ISOAMSC ulcorn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='uparrow'    ]"></xsl:template>--><!-- #8593; =U2191 alias ISONUM uarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='updownarrow' ]"></xsl:template>--><!-- #8597; =U2195 alias ISOAMSA varr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='upharpoonleft' ]"></xsl:template>--><!-- #8639; =U21BF alias ISOAMSA uharl  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='upharpoonright' ]"></xsl:template>--><!-- #8638; =U21BE alias ISOAMSA uharr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='upsilon'    ]"></xsl:template>--><!-- #965; =U03C5 alias ISOGRK3 upsi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='upuparrows' ]"></xsl:template>--><!-- #8648; =U21C8 alias ISOAMSA uuarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='urcorner'   ]"></xsl:template>--><!-- #8989; =U231D alias ISOAMSC urcorn  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Union'      ]"></xsl:template>--><!-- #8899; =U22C3 alias ISOAMSB xcup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UnionPlus'  ]"></xsl:template>--><!-- #8846; =U228E alias ISOAMSB uplus  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Uparrow'    ]"></xsl:template>--><!-- #8657; =U21D1 alias ISOAMSA uArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpArrow'    ]"></xsl:template>--><!-- #8593; =U2191 alias ISONUM uarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpArrowDownArrow' ]"></xsl:template>--><!-- #8645; =U21C5 alias ISOAMSA udarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Updownarrow' ]"></xsl:template>--><!-- #8661; =U21D5 alias ISOAMSA vArr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpDownArrow' ]"></xsl:template>--><!-- #8597; =U2195 alias ISOAMSA varr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpEquilibrium' ]"></xsl:template>--><!-- #57880; =UE218 alias ISOAMSA udhar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpperLeftArrow' ]"></xsl:template>--><!-- #8598; =U2196 alias ISOAMSA nwarr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpperRightArrow' ]"></xsl:template>--><!-- #8599; =U2197 alias ISOAMSA nearr  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Upsilon'    ]"></xsl:template>--><!-- #978; =U03D2 alias ISOGRK3 Upsi  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpTee'      ]"></xsl:template>--><!-- #8869; =U22A5 alias ISOTECH perp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varepsilon' ]"></xsl:template>--><!-- #603; =U025B alias ISOGRK3 epsiv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varkappa'   ]"></xsl:template>--><!-- #1008; =U03F0 alias ISOGRK3 kappav  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varnothing' ]"></xsl:template>--><!-- #8709; =U2205 alias ISOAMSO emptyv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varphi'     ]"></xsl:template>--><!-- #981; =U03D5 alias ISOGRK3 phiv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varpi'      ]"></xsl:template>--><!-- #982; =U03D6 alias ISOGRK3 piv  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varpropto'  ]"></xsl:template>--><!-- #8733; =U221D alias ISOAMSR vprop  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varrho'     ]"></xsl:template>--><!-- #1009; =U03F1 alias ISOGRK3 rhov  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varsigma'   ]"></xsl:template>--><!-- #962; =U03C2 alias ISOGRK3 sigmav  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varsubsetneq' ]"></xsl:template>--><!-- #58041; =UE2B9 alias ISOAMSN vsubne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varsubsetneqq' ]"></xsl:template>--><!-- #58040; =UE2B8 alias ISOAMSN vsubnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varsupsetneq' ]"></xsl:template>--><!-- #58042; =UE2BA alias ISOAMSN vsupne  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='varsupsetneqq' ]"></xsl:template>--><!-- #58043; =UE2BB alias ISOAMSN vsupnE  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vartheta'   ]"></xsl:template>--><!-- #977; =U03D1 alias ISOGRK3 thetav  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vartriangleleft' ]"></xsl:template>--><!-- #8882; =U22B2 alias ISOAMSR vltri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vartriangleright' ]"></xsl:template>--><!-- #8883; =U22B3 alias ISOAMSR vrtri  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vee'        ]"></xsl:template>--><!-- #8744; =U2228 alias ISOTECH or  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='vert'       ]"></xsl:template>--><!-- #124; =U007C alias ISONUM verbar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Vee'        ]"></xsl:template>--><!-- #8897; =U22C1 alias ISOAMSB xvee  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Vert'       ]"></xsl:template>--><!-- #8214; =U2016 alias ISOTECH Verbar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='VerticalBar' ]"></xsl:template>--><!-- #8739; =U2223 alias ISOAMSR mid  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='VerticalTilde' ]"></xsl:template>--><!-- #8768; =U2240 alias ISOAMSB wreath  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='VeryThinSpace' ]"></xsl:template>--><!-- #8202; =U200A space of width 1/18 em alias ISOPUB hairsp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='wedge'      ]"></xsl:template>--><!-- #8743; =U2227 alias ISOTECH and  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='wp'         ]"></xsl:template>--><!-- #8472; =U2118 alias ISOAMSO weierp  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='wr'         ]"></xsl:template>--><!-- #8768; =U2240 alias ISOAMSB wreath  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Wedge'      ]"></xsl:template>--><!-- #8896; =U22C0 alias ISOAMSB xwedge  -->
<!-- 

     File mmlextra.ent produced by the dsssl script ent.dsl
     from input data in unicode.xml.

     Please report any errors to 
     David Carlisle <davidc@nag.co.uk>.

     The numeric character values assigned to each entity
     (should) match either official Unicode assignments
     or assignments in the STIX proposal for characters
     for Mathematics.

     The STIX assignments are temporary and will change if
     the proposal or some variant of it is adopted by the
     Unicode Consortium.

     Entity names in this file are derived from files carrying the
     following notice:

-->

<!--no expansion-->	<!-- <xsl:template match="symbol[@name='af'         ]"></xsl:template>--><!-- #59552; =UE8A0 short form of &ApplyFunction;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ApplyFunction' ]"></xsl:template>--><!-- #59552; =UE8A0 character showing function application in presentation tagging  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Assign'     ]"></xsl:template>--><!-- #59483; =UE85B assignment operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='BadBreak'   ]"></xsl:template>--><!-- #59540; =UE894 if a linebreak is needed, try to avoid breaking here  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='CapitalDifferentialD' ]"></xsl:template>--><!-- #63307; =UF74B D for use in differentials, e.g., within integrals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Cross'      ]"></xsl:template>--><!-- #58905; =UE619 cross or vector product  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='dd'         ]"></xsl:template>--><!-- #63308; =UF74C short form of &DifferentialD;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DD'         ]"></xsl:template>--><!-- #63307; =UF74B short form of CapitalDifferentialD  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DifferentialD' ]"></xsl:template>--><!-- #63308; =UF74C d for use in differentials, e.g., within integrals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownArrowBar' ]"></xsl:template>--><!-- #62724; =UF504 down arrow to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownBreve'  ]"></xsl:template>--><!-- #785; =U0311 breve, inverted (non-spacing)  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownLeftRightVector' ]"></xsl:template>--><!-- #62731; =UF50B left-down-right-down harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownLeftTeeVector' ]"></xsl:template>--><!-- #62734; =UF50E left-down harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownLeftVectorBar' ]"></xsl:template>--><!-- #62732; =UF50C left-down harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownRightTeeVector' ]"></xsl:template>--><!-- #62735; =UF50F right-down harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownRightVectorBar' ]"></xsl:template>--><!-- #62733; =UF50D right-down harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='DownTeeArrow' ]"></xsl:template>--><!-- #8615; =U21A7 alias for mapstodown  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ee'         ]"></xsl:template>--><!-- #63309; =UF74D short form of &ExponentialE;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='EmptySmallSquare' ]"></xsl:template>--><!-- #62759; =UF527 empty small square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='EmptyVerySmallSquare' ]"></xsl:template>--><!-- #62768; =UF530 empty small square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Equal'      ]"></xsl:template>--><!-- #62513; =UF431 two consecutive equal signs  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ExponentialE' ]"></xsl:template>--><!-- #63309; =UF74D e use for the exponential base of the natural logarithms  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='false'      ]"></xsl:template>--><!-- #59559; =UE8A7 logical constant false  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='FilledSmallSquare' ]"></xsl:template>--><!-- #62760; =UF528 filled small square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='FilledVerySmallSquare' ]"></xsl:template>--><!-- #62761; =UF529 filled very small square  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GoodBreak'  ]"></xsl:template>--><!-- #59539; =UE893 if a linebreak is needed, here is a good spot  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='GreaterGreater' ]"></xsl:template>--><!-- #58103; =UE2F7 alias for GT  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='HorizontalLine' ]"></xsl:template>--><!-- #59481; =UE859 short horizontal line   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ic'         ]"></xsl:template>--><!-- #59548; =UE89C short form of  &InvisibleComma;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ii'         ]"></xsl:template>--><!-- #63310; =UF74E short form of &ImaginaryI;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='it'         ]"></xsl:template>--><!-- #59550; =UE89E short form of &InvisibleTimes;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ImaginaryI' ]"></xsl:template>--><!-- #63310; =UF74E i for use as a square root of -1  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='IndentingNewLine' ]"></xsl:template>--><!-- #59537; =UE891 force a line break and indent appropriately on next line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='InvisibleComma' ]"></xsl:template>--><!-- #59548; =UE89C used as a separator, e.g., in indices  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='InvisibleTimes' ]"></xsl:template>--><!-- #59550; =UE89E marks multiplication when it is understood without a mark  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='larrb'      ]"></xsl:template>--><!-- #8676; =U21E4 leftwards arrow to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftArrowBar' ]"></xsl:template>--><!-- #8676; =U21E4 alias for larrb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftBracketingBar' ]"></xsl:template>--><!-- #62979; =UF603 left vertical delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftDoubleBracketingBar' ]"></xsl:template>--><!-- #62981; =UF605 left double vertical delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftDownTeeVector' ]"></xsl:template>--><!-- #62745; =UF519 down-left harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftDownVectorBar' ]"></xsl:template>--><!-- #62743; =UF517 down-left harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftRightVector'  ]"></xsl:template>--><!-- #62725; =UF505 left-up-right-up harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftSkeleton' ]"></xsl:template>--><!-- #59472; =UE850 start of missing information  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTeeArrow' ]"></xsl:template>--><!-- #8612; =U21A4 alias for mapstoleft  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTeeVector' ]"></xsl:template>--><!-- #62729; =UF509 left-up harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftTriangleBar' ]"></xsl:template>--><!-- #62480; =UF410 not left triangle, vertical bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftUpDownVector' ]"></xsl:template>--><!-- #62741; =UF515 up-left-down-left harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftUpTeeVector' ]"></xsl:template>--><!-- #62744; =UF518 up-left harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftUpVectorBar' ]"></xsl:template>--><!-- #62742; =UF516 up-left harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LeftVectorBar'  ]"></xsl:template>--><!-- #62727; =UF507 left-up harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='LessLess'   ]"></xsl:template>--><!-- #58107; =UE2FB alias for Lt  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mapstodown' ]"></xsl:template>--><!-- #8615; =U21A7 downwards arrow from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mapstoleft' ]"></xsl:template>--><!-- #8612; =U21A4 leftwards arrow from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='mapstoup'   ]"></xsl:template>--><!-- #8613; =U21A5 upwards arrow from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nbump'      ]"></xsl:template>--><!-- #58902; =UE616 not bumpy equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nbumpe'     ]"></xsl:template>--><!-- #59469; =UE84D not bumpy single equals  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='nesim'      ]"></xsl:template>--><!-- #59470; =UE84E not equal or similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NegativeMediumSpace' ]"></xsl:template>--><!-- #59546; =UE89A space of width -4/18 em  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NegativeThickSpace' ]"></xsl:template>--><!-- #59547; =UE89B space of width -5/18 em  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NegativeThinSpace' ]"></xsl:template>--><!-- #59545; =UE899 space of width -3/18 em  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NegativeVeryThinSpace' ]"></xsl:template>--><!-- #59544; =UE898 space of width -1/18 em  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NewLine'    ]"></xsl:template>--><!-- #10;  =U000A force a line break; line feed  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NoBreak'    ]"></xsl:template>--><!-- #59538; =UE892 never break line here  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotANumber' ]"></xsl:template>--><!-- #59562; =UE8AA  used in MML 4.3.2.9  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotCupCap'  ]"></xsl:template>--><!-- #8813; =U226D alias for &nasymp;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotEqualTilde' ]"></xsl:template>--><!-- #59470; =UE84E alias for  &nesim;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotHumpDownHump' ]"></xsl:template>--><!-- #58902; =UE616 alias for &nbump;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotHumpEqual' ]"></xsl:template>--><!-- #59469; =UE84D alias for &nbumpe;  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotLeftTriangleBar' ]"></xsl:template>--><!-- #62482; =UF412 not left triangle, vertical bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotNestedGreaterGreater' ]"></xsl:template>--><!-- #62504; =UF428 not double greater-than sign  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotNestedLessLess' ]"></xsl:template>--><!-- #62499; =UF423 not double less-than sign  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotRightTriangleBar' ]"></xsl:template>--><!-- #62483; =UF413 not vertical bar, right triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSquareSubset' ]"></xsl:template>--><!-- #58884; =UE604 square not subset  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSquareSuperset' ]"></xsl:template>--><!-- #58901; =UE615 negated set-like partial order operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='NotSucceedsTilde' ]"></xsl:template>--><!-- #59447; =UE837 not succeeds or similar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OverBar'    ]"></xsl:template>--><!-- #175; =U00AF over bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OverBrace'  ]"></xsl:template>--><!-- #62994; =UF612 over brace   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OverBracket' ]"></xsl:template>--><!-- #62996; =UF614 over bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='OverParenthesis' ]"></xsl:template>--><!-- #62992; =UF610 over parenthesis  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Product'    ]"></xsl:template>--><!-- #8719; =U220F alias for &prod  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='rarrb'      ]"></xsl:template>--><!-- #8677; =U21E5 leftwards arrow to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightArrowBar' ]"></xsl:template>--><!-- #8677; =U21E5 alias for rarrb  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightBracketingBar' ]"></xsl:template>--><!-- #62980; =UF604 right vertical delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightDoubleBracketingBar' ]"></xsl:template>--><!-- #62982; =UF606 right double vertical delimiter  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightDownTeeVector' ]"></xsl:template>--><!-- #62740; =UF514 down-right harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightDownVectorBar' ]"></xsl:template>--><!-- #62738; =UF512 down-right harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightSkeleton' ]"></xsl:template>--><!-- #59473; =UE851 end of missing information  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTeeVector' ]"></xsl:template>--><!-- #62730; =UF50A right-up harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightTriangleBar' ]"></xsl:template>--><!-- #62481; =UF411 vertical bar, right triangle  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightUpDownVector' ]"></xsl:template>--><!-- #62736; =UF510 up-right-down-right harpoon  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightUpTeeVector' ]"></xsl:template>--><!-- #62739; =UF513 up-right harpoon from bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightUpVectorBar' ]"></xsl:template>--><!-- #62737; =UF511 up-right harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RightVectorBar' ]"></xsl:template>--><!-- #62728; =UF508 up-right harpoon to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RoundImplies' ]"></xsl:template>--><!-- #62756; =UF524 round implies  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='RuleDelayed' ]"></xsl:template>--><!-- #62751; =UF51F rule-delayed (colon right arrow)  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ShortDownArrow' ]"></xsl:template>--><!-- #59519; =UE87F short down arrow  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ShortUpArrow' ]"></xsl:template>--><!-- #59520; =UE880 sort up arrow   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='true'       ]"></xsl:template>--><!-- #59563; =UE8AB logical constant true  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='Tab'        ]"></xsl:template>--><!-- #9; =U0009 tabulator stop; horizontal tabulation  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ThickSpace' ]"></xsl:template>--><!-- #59543; =UE897 space of width 5/18 em  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UnderBar'   ]"></xsl:template>--><!-- #818; =U0332 combining low line  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UnderBrace' ]"></xsl:template>--><!-- #62995; =UF613 under brace   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UnderBracket' ]"></xsl:template>--><!-- #62997; =UF615 under bracket  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UnderParenthesis' ]"></xsl:template>--><!-- #62993; =UF611 under parenthesis  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpArrowBar' ]"></xsl:template>--><!-- #62723; =UF503 up arrow to bar  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='UpTeeArrow' ]"></xsl:template>--><!-- #8613; =U21A5 Alias mapstoup  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='VerticalLine' ]"></xsl:template>--><!-- #59482; =UE85A short vertical line   -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='VerticalSeparator' ]"></xsl:template>--><!-- #59484; =UE85C vertical separating operator  -->
<!--no expansion-->	<!-- <xsl:template match="symbol[@name='ZeroWidthSpace' ]"></xsl:template>--><!-- #8203; =U200B zero width space  -->

<!--                               UNICODE                             -->

<xsl:template match="symbol[@name='U2261']"><img src="{$EntityPath}/U2261.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--IDENTICAL TO-->
<xsl:template match="symbol[@name='U25A4']"><img src="{$EntityPath}/U25A4.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH HORIZONTAL FILL-->
<xsl:template match="symbol[@name='U25A5']"><img src="{$EntityPath}/U25A5.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH VERTICAL FILL-->
<xsl:template match="symbol[@name='U25A6']"><img src="{$EntityPath}/U25A6.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH ORTHOGONAL CROSSHATCH FILL-->
<xsl:template match="symbol[@name='U25A7']"><img src="{$EntityPath}/U25A7.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH UPPER LEFT TO LOWER RIGHT FILL-->
<xsl:template match="symbol[@name='U25A8']"><img src="{$EntityPath}/U25A8.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH UPPER RIGHT TO LOWER LEFT FILL-->
<xsl:template match="symbol[@name='U25A9']"><img src="{$EntityPath}/U25A9.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--SQUARE WITH DIAGONAL CROSSHATCH FILL-->
<xsl:template match="symbol[@name='U25D0']"><img src="{$EntityPath}/U25D0.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH LEFT HALF BLACK-->
<xsl:template match="symbol[@name='U25D1']"><img src="{$EntityPath}/U25D1.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH RIGHT HALF BLACK-->
<xsl:template match="symbol[@name='U25D2']"><img src="{$EntityPath}/U25D2.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH LOWER HALF BLACK-->
<xsl:template match="symbol[@name='U25D3']"><img src="{$EntityPath}/U25D3.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH UPPER HALF BLACK-->
<xsl:template match="symbol[@name='U25D4']"><img src="{$EntityPath}/U25D4.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH UPPER RIGHT QUADRANT BLACK-->
<xsl:template match="symbol[@name='U25D5']"><img src="{$EntityPath}/U25D5.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--CIRCLE WITH ALL BUT UPPER LEFT QUADRANT BLACK-->
<xsl:template match="symbol[@name='U25D6']"><img src="{$EntityPath}/U25D6.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--LEFT HALF BLACK CIRCLE-->
<xsl:template match="symbol[@name='U25D7']"><img src="{$EntityPath}/U25D7.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--RIGHT HALF BLACK CIRCLE-->
<xsl:template match="symbol[@name='U25CF']"><img src="{$EntityPath}/U25CF.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--RIGHT HALF BLACK CIRCLE-->
<xsl:template match="symbol[@name='U20AC']"><img src="{$EntityPath}/U20AC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--EURO SIGN-->
<xsl:template match="symbol[@name='U2709']"><img src="{$EntityPath}/U2709.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--ENVELOPE-->


<!--        UNICODE CIRCLED NUMBERS              -->
<xsl:template match="symbol[@name='U2776']"><img src="{$EntityPath}/U2776.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT ONE-->
<xsl:template match="symbol[@name='U2777']"><img src="{$EntityPath}/U2777.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT TWO-->
<xsl:template match="symbol[@name='U2778']"><img src="{$EntityPath}/U2778.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT THREE-->
<xsl:template match="symbol[@name='U2779']"><img src="{$EntityPath}/U2779.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT FOUR-->
<xsl:template match="symbol[@name='U277A']"><img src="{$EntityPath}/U277A.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT FIVE-->
<xsl:template match="symbol[@name='U277B']"><img src="{$EntityPath}/U277B.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT SIX-->
<xsl:template match="symbol[@name='U277C']"><img src="{$EntityPath}/U277C.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT SEVEN-->
<xsl:template match="symbol[@name='U277D']"><img src="{$EntityPath}/U277D.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT EIGHT-->
<xsl:template match="symbol[@name='U277E']"><img src="{$EntityPath}/U277E.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED DIGIT NINE-->
<xsl:template match="symbol[@name='U277F']"><img src="{$EntityPath}/U277F.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED NUMBER TEN-->
<xsl:template match="symbol[@name='U2780']"><img src="{$EntityPath}/U2780.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT ONE-->
<xsl:template match="symbol[@name='U2781']"><img src="{$EntityPath}/U2781.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT TWO-->
<xsl:template match="symbol[@name='U2782']"><img src="{$EntityPath}/U2782.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT THREE-->
<xsl:template match="symbol[@name='U2783']"><img src="{$EntityPath}/U2783.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT FOUR-->
<xsl:template match="symbol[@name='U2784']"><img src="{$EntityPath}/U2784.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT FIVE-->
<xsl:template match="symbol[@name='U2785']"><img src="{$EntityPath}/U2785.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT SIX-->
<xsl:template match="symbol[@name='U2786']"><img src="{$EntityPath}/U2786.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT SEVEN-->
<xsl:template match="symbol[@name='U2787']"><img src="{$EntityPath}/U2787.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT EIGHT-->
<xsl:template match="symbol[@name='U2788']"><img src="{$EntityPath}/U2788.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF DIGIT NINE-->
<xsl:template match="symbol[@name='U2789']"><img src="{$EntityPath}/U2789.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT CIRCLED SANS SERIF NUMBER TEN-->
<xsl:template match="symbol[@name='U278A']"><img src="{$EntityPath}/U278A.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT ONE-->
<xsl:template match="symbol[@name='U278B']"><img src="{$EntityPath}/U278B.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT TWO-->
<xsl:template match="symbol[@name='U278C']"><img src="{$EntityPath}/U278C.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT THREE-->
<xsl:template match="symbol[@name='U278D']"><img src="{$EntityPath}/U278D.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT FOUR-->
<xsl:template match="symbol[@name='U278E']"><img src="{$EntityPath}/U278E.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT FIVE-->
<xsl:template match="symbol[@name='U278F']"><img src="{$EntityPath}/U278F.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT SIX-->
<xsl:template match="symbol[@name='U2790']"><img src="{$EntityPath}/U2790.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT SEVEN-->
<xsl:template match="symbol[@name='U2791']"><img src="{$EntityPath}/U2791.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT EIGHT-->
<xsl:template match="symbol[@name='U2792']"><img src="{$EntityPath}/U2792.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF DIGIT NINE-->
<xsl:template match="symbol[@name='U2793']"><img src="{$EntityPath}/U2793.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- DINGBAT NEGATIVE CIRCLED SANS SERIF NUMBER TEN-->


<!--                               BSL                             -->

<xsl:template match="symbol[@name='fsec']"><img src="{$EntityPath}/fsec.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='fdg']"><img src="{$EntityPath}/fdg.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='mcirc']"><img src="{$EntityPath}/mcircLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='Ncirc']"><img src="{$EntityPath}/NcircUC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='mtilde']"><img src="{$EntityPath}/mtildeLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='ptilde']"><img src="{$EntityPath}/ptildeLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='pcirc']"><img src="{$EntityPath}/pcircLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='qtilde']"><img src="{$EntityPath}/qtildeLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='Vtilde']"><img src="{$EntityPath}/VtildeUC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='farcs']"><img src="{$EntityPath}/farcs.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='Dmacr']"><img src="{$EntityPath}/DmacrUC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='pmacr']"><img src="{$EntityPath}/pmacrLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='wmacr']"><img src="{$EntityPath}/wmacrLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='xmacr']"><img src="{$EntityPath}/xmacrLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='ymacr']"><img src="{$EntityPath}/ymacrLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='dtdot']"><img src="{$EntityPath}/dtdot.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- triple dot, diagonal NW SE -->
<xsl:template match="symbol[@name='adot']"><img src="{$EntityPath}/adotLC.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='lobrk']"><img src="{$EntityPath}/lobrk.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='robrk']"><img src="{$EntityPath}/robrk.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->



<xsl:template match="symbol[@name='bsl00000']"><img src="{$EntityPath}/bsl00000.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 0-->
<xsl:template match="symbol[@name='bsl00001']"><img src="{$EntityPath}/bsl00001.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 1-->
<xsl:template match="symbol[@name='bsl00002']"><img src="{$EntityPath}/bsl00002.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 2-->
<xsl:template match="symbol[@name='bsl00003']"><img src="{$EntityPath}/bsl00003.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 3-->
<xsl:template match="symbol[@name='bsl00004']"><img src="{$EntityPath}/bsl00004.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 4-->
<xsl:template match="symbol[@name='bsl00005']"><img src="{$EntityPath}/bsl00005.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 5-->
<xsl:template match="symbol[@name='bsl00006']"><img src="{$EntityPath}/bsl00006.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 6-->
<xsl:template match="symbol[@name='bsl00007']"><img src="{$EntityPath}/bsl00007.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 7-->
<xsl:template match="symbol[@name='bsl00008']"><img src="{$EntityPath}/bsl00008.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 8-->
<xsl:template match="symbol[@name='bsl00009']"><img src="{$EntityPath}/bsl00009.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 9-->
<xsl:template match="symbol[@name='bsl00010']"><img src="{$EntityPath}/bsl00010.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 10-->
<xsl:template match="symbol[@name='bsl00011']"><img src="{$EntityPath}/bsl00011.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 11-->
<xsl:template match="symbol[@name='bsl00012']"><img src="{$EntityPath}/bsl00012.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 12-->
<xsl:template match="symbol[@name='bsl00013']"><img src="{$EntityPath}/bsl00013.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 13-->
<xsl:template match="symbol[@name='bsl00014']"><img src="{$EntityPath}/bsl00014.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 14-->
<xsl:template match="symbol[@name='bsl00015']"><img src="{$EntityPath}/bsl00015.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 15-->
<xsl:template match="symbol[@name='bsl00016']"><img src="{$EntityPath}/bsl00016.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 16-->
<xsl:template match="symbol[@name='bsl00017']"><img src="{$EntityPath}/bsl00017.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 17-->
<xsl:template match="symbol[@name='bsl00018']"><img src="{$EntityPath}/bsl00018.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 18-->
<xsl:template match="symbol[@name='bsl00019']"><img src="{$EntityPath}/bsl00019.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 19-->
<xsl:template match="symbol[@name='bsl00020']"><img src="{$EntityPath}/bsl00020.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 20-->
<xsl:template match="symbol[@name='bsl00021']"><img src="{$EntityPath}/bsl00021.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 21-->
<xsl:template match="symbol[@name='bsl00022']"><img src="{$EntityPath}/bsl00022.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 22-->
<xsl:template match="symbol[@name='bsl00023']"><img src="{$EntityPath}/bsl00023.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 23-->
<xsl:template match="symbol[@name='bsl00024']"><img src="{$EntityPath}/bsl00024.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 24-->
<xsl:template match="symbol[@name='bsl00025']"><img src="{$EntityPath}/bsl00025.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 25-->
<xsl:template match="symbol[@name='bsl00026']"><img src="{$EntityPath}/bsl00026.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 26-->
<xsl:template match="symbol[@name='bsl00027']"><img src="{$EntityPath}/bsl00027.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--cross in box-->
<xsl:template match="symbol[@name='bsl00028']"><img src="{$EntityPath}/bsl00028.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--4x4 dots-->
<xsl:template match="symbol[@name='bsl00029']"><img src="{$EntityPath}/bsl00029.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00030']"><img src="{$EntityPath}/bsl00030.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00031']"><img src="{$EntityPath}/bsl00031.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00032']"><img src="{$EntityPath}/bsl00032.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00033']"><img src="{$EntityPath}/bsl00033.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00034']"><img src="{$EntityPath}/bsl00034.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00035']"><img src="{$EntityPath}/bsl00035.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00036']"><img src="{$EntityPath}/bsl00036.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00037']"><img src="{$EntityPath}/bsl00037.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00038']"><img src="{$EntityPath}/bsl00038.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00039']"><img src="{$EntityPath}/bsl00039.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00040']"><img src="{$EntityPath}/bsl00040.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00041']"><img src="{$EntityPath}/bsl00041.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00042']"><img src="{$EntityPath}/bsl00042.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00043']"><img src="{$EntityPath}/bsl00043.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00044']"><img src="{$EntityPath}/bsl00044.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00045']"><img src="{$EntityPath}/bsl00045.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00046']"><img src="{$EntityPath}/bsl00046.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00047']"><img src="{$EntityPath}/bsl00047.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00048']"><img src="{$EntityPath}/bsl00048.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00049']"><img src="{$EntityPath}/bsl00049.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00050']"><img src="{$EntityPath}/bsl00050.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00051']"><img src="{$EntityPath}/bsl00051.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00052']"><img src="{$EntityPath}/bsl00052.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00053']"><img src="{$EntityPath}/bsl00054.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00055']"><img src="{$EntityPath}/bsl00055.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00056']"><img src="{$EntityPath}/bsl00056.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00057']"><img src="{$EntityPath}/bsl00057.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00058']"><img src="{$EntityPath}/bsl00058.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00059']"><img src="{$EntityPath}/bsl00059.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00060']"><img src="{$EntityPath}/bsl00060.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00061']"><img src="{$EntityPath}/bsl00061.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00062']"><img src="{$EntityPath}/bsl00062.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00063']"><img src="{$EntityPath}/bsl00063.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00064']"><img src="{$EntityPath}/bsl00065.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00066']"><img src="{$EntityPath}/bsl00066.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00067']"><img src="{$EntityPath}/bsl00067.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00068']"><img src="{$EntityPath}/bsl00068.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00069']"><img src="{$EntityPath}/bsl00069.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00070']"><img src="{$EntityPath}/bsl00070.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00071']"><img src="{$EntityPath}/bsl00071.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00072']"><img src="{$EntityPath}/bsl00072.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00073']"><img src="{$EntityPath}/bsl00073.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00074']"><img src="{$EntityPath}/bsl00074.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00075']"><img src="{$EntityPath}/bsl00075.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00076']"><img src="{$EntityPath}/bsl00076.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00077']"><img src="{$EntityPath}/bsl00077.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00078']"><img src="{$EntityPath}/bsl00078.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00079']"><img src="{$EntityPath}/bsl00079.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00080']"><img src="{$EntityPath}/bsl00080.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00081']"><img src="{$EntityPath}/bsl00081.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00082']"><img src="{$EntityPath}/bsl00082.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00083']"><img src="{$EntityPath}/bsl00083.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00084']"><img src="{$EntityPath}/bsl00084.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00085']"><img src="{$EntityPath}/bsl00085.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00086']"><img src="{$EntityPath}/bsl00086.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00087']"><img src="{$EntityPath}/bsl00087.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00088']"><img src="{$EntityPath}/bsl00088.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00089']"><img src="{$EntityPath}/bsl00089.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00090']"><img src="{$EntityPath}/bsl00090.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00091']"><img src="{$EntityPath}/bsl00091.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00092']"><img src="{$EntityPath}/bsl00092.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00093']"><img src="{$EntityPath}/bsl00093.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00094']"><img src="{$EntityPath}/bsl00094.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00095']"><img src="{$EntityPath}/bsl00095.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00096']"><img src="{$EntityPath}/bsl00096.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00097']"><img src="{$EntityPath}/bsl00097.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00098']"><img src="{$EntityPath}/bsl00098.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00099']"><img src="{$EntityPath}/bsl00099.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00100']"><img src="{$EntityPath}/bsl00100.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00101']"><img src="{$EntityPath}/bsl00101.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00102']"><img src="{$EntityPath}/bsl00102.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00103']"><img src="{$EntityPath}/bsl00103.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00104']"><img src="{$EntityPath}/bsl00104.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00105']"><img src="{$EntityPath}/bsl00105.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00106']"><img src="{$EntityPath}/bsl00106.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00107']"><img src="{$EntityPath}/bsl00107.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00108']"><img src="{$EntityPath}/bsl00108.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00109']"><img src="{$EntityPath}/bsl00109.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00110']"><img src="{$EntityPath}/bsl00110.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00111']"><img src="{$EntityPath}/bsl00111.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00112']"><img src="{$EntityPath}/bsl00112.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00113']"><img src="{$EntityPath}/bsl00113.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00114']"><img src="{$EntityPath}/bsl00114.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00115']"><img src="{$EntityPath}/bsl00115.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00116']"><img src="{$EntityPath}/bsl00116.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00117']"><img src="{$EntityPath}/bsl00117.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00118']"><img src="{$EntityPath}/bsl00118.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00119']"><img src="{$EntityPath}/bsl00119.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00120']"><img src="{$EntityPath}/bsl00120.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00121']"><img src="{$EntityPath}/bsl00121.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00122']"><img src="{$EntityPath}/bsl00122.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00123']"><img src="{$EntityPath}/bsl00123.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00124']"><img src="{$EntityPath}/bsl00124.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00125']"><img src="{$EntityPath}/bsl00125.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00126']"><img src="{$EntityPath}/bsl00126.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--shading pattern 26-->
<xsl:template match="symbol[@name='bsl00127']"><img src="{$EntityPath}/bsl00127.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--cross in box-->
<xsl:template match="symbol[@name='bsl00128']"><img src="{$EntityPath}/bsl00128.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!--4x4 dots-->
<xsl:template match="symbol[@name='bsl00129']"><img src="{$EntityPath}/bsl00129.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00130']"><img src="{$EntityPath}/bsl00130.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00131']"><img src="{$EntityPath}/bsl00131.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00132']"><img src="{$EntityPath}/bsl00132.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00133']"><img src="{$EntityPath}/bsl00133.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00134']"><img src="{$EntityPath}/bsl00134.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00135']"><img src="{$EntityPath}/bsl00135.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00136']"><img src="{$EntityPath}/bsl00136.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00137']"><img src="{$EntityPath}/bsl00137.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00138']"><img src="{$EntityPath}/bsl00138.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00139']"><img src="{$EntityPath}/bsl00139.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00140']"><img src="{$EntityPath}/bsl00140.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00141']"><img src="{$EntityPath}/bsl00141.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00142']"><img src="{$EntityPath}/bsl00142.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00143']"><img src="{$EntityPath}/bsl00143.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00144']"><img src="{$EntityPath}/bsl00144.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00145']"><img src="{$EntityPath}/bsl00145.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00146']"><img src="{$EntityPath}/bsl00146.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00147']"><img src="{$EntityPath}/bsl00147.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00148']"><img src="{$EntityPath}/bsl00148.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00149']"><img src="{$EntityPath}/bsl00149.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00150']"><img src="{$EntityPath}/bsl00150.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00151']"><img src="{$EntityPath}/bsl00151.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00152']"><img src="{$EntityPath}/bsl00152.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00153']"><img src="{$EntityPath}/bsl00153.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00154']"><img src="{$EntityPath}/bsl00154.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00155']"><img src="{$EntityPath}/bsl00155.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00156']"><img src="{$EntityPath}/bsl00156.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00157']"><img src="{$EntityPath}/bsl00157.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00158']"><img src="{$EntityPath}/bsl00158.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00159']"><img src="{$EntityPath}/bsl00159.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00160']"><img src="{$EntityPath}/bsl00160.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00161']"><img src="{$EntityPath}/bsl00161.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00162']"><img src="{$EntityPath}/bsl00162.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00163']"><img src="{$EntityPath}/bsl00163.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00164']"><img src="{$EntityPath}/bsl00164.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='bsl00165']"><img src="{$EntityPath}/bsl00165.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='euro']"><img src="{$EntityPath}/euro.GIF" BORDER="0" ALT="Hscr"/></xsl:template><!-- -->
<!--<xsl:template match="symbol[@name='ibar "[i with bar through]">--><!-- -->
<!--<xsl:template match="symbol[@name='Ibar "[I with bar through]">--><!-- -->

<!-- added by Richard & Thomas as a fix for the <mover> problem -->
<xsl:template match="symbol[@name='Acaron']"><img src="{$EntityPath}/Acaron_uc.gif" BORDER="0" ALT="Acaron"/></xsl:template>
<xsl:template match="symbol[@name='acaron']"><img src="{$EntityPath}/acaron_lc.gif" BORDER="0" ALT="acaron"/></xsl:template>
<xsl:template match="symbol[@name='Acedil']"><img src="{$EntityPath}/Acedil_uc.gif" BORDER="0" ALT="Acedil"/></xsl:template>
<xsl:template match="symbol[@name='acedil']"><img src="{$EntityPath}/acedil_lc.gif" BORDER="0" ALT="acedil"/></xsl:template>
<xsl:template match="symbol[@name='Adblac']"><img src="{$EntityPath}/Adblac_uc.gif" BORDER="0" ALT="Adblac"/></xsl:template>
<xsl:template match="symbol[@name='adblac']"><img src="{$EntityPath}/adblac_lc.gif" BORDER="0" ALT="adblac"/></xsl:template>
<xsl:template match="symbol[@name='Adie']"><img src="{$EntityPath}/Adie_uc.gif" BORDER="0" ALT="Adie"/></xsl:template>
<xsl:template match="symbol[@name='adie']"><img src="{$EntityPath}/adie_lc.gif" BORDER="0" ALT="adie"/></xsl:template>
<xsl:template match="symbol[@name='Adot']"><img src="{$EntityPath}/Adot_uc.gif" BORDER="0" ALT="Adot"/></xsl:template>
<xsl:template match="symbol[@name='adot']"><img src="{$EntityPath}/adot_lc.gif" BORDER="0" ALT="adot"/></xsl:template>
<xsl:template match="symbol[@name='Bacute']"><img src="{$EntityPath}/Bacute_uc.gif" BORDER="0" ALT="Bacute"/></xsl:template>
<xsl:template match="symbol[@name='bacute']"><img src="{$EntityPath}/bacute_lc.gif" BORDER="0" ALT="bacute"/></xsl:template>
<xsl:template match="symbol[@name='Bbreve']"><img src="{$EntityPath}/Bbreve_uc.gif" BORDER="0" ALT="Bbreve"/></xsl:template>
<xsl:template match="symbol[@name='bbreve']"><img src="{$EntityPath}/bbreve_lc.gif" BORDER="0" ALT="bbreve"/></xsl:template>
<xsl:template match="symbol[@name='Bcaron']"><img src="{$EntityPath}/Bcaron_uc.gif" BORDER="0" ALT="Bcaron"/></xsl:template>
<xsl:template match="symbol[@name='bcaron']"><img src="{$EntityPath}/bcaron_lc.gif" BORDER="0" ALT="bcaron"/></xsl:template>
<xsl:template match="symbol[@name='Bcedil']"><img src="{$EntityPath}/Bcedil_uc.gif" BORDER="0" ALT="Bcedil"/></xsl:template>
<xsl:template match="symbol[@name='bcedil']"><img src="{$EntityPath}/bcedil_lc.gif" BORDER="0" ALT="bcedil"/></xsl:template>
<xsl:template match="symbol[@name='Bcirc']"><img src="{$EntityPath}/Bcirc_uc.gif" BORDER="0" ALT="Bcirc"/></xsl:template>
<xsl:template match="symbol[@name='bcirc']"><img src="{$EntityPath}/bcirc_lc.gif" BORDER="0" ALT="bcirc"/></xsl:template>
<xsl:template match="symbol[@name='Bdblac']"><img src="{$EntityPath}/Bdblac_uc.gif" BORDER="0" ALT="Bdblac"/></xsl:template>
<xsl:template match="symbol[@name='bdblac']"><img src="{$EntityPath}/bdblac_lc.gif" BORDER="0" ALT="bdblac"/></xsl:template>
<xsl:template match="symbol[@name='Bdie']"><img src="{$EntityPath}/Bdie_uc.gif" BORDER="0" ALT="Bdie"/></xsl:template>
<xsl:template match="symbol[@name='bdie']"><img src="{$EntityPath}/bdie_lc.gif" BORDER="0" ALT="bdie"/></xsl:template>
<xsl:template match="symbol[@name='Bdot']"><img src="{$EntityPath}/Bdot_uc.gif" BORDER="0" ALT="Bdot"/></xsl:template>
<xsl:template match="symbol[@name='bdot']"><img src="{$EntityPath}/bdot_lc.gif" BORDER="0" ALT="bdot"/></xsl:template>
<xsl:template match="symbol[@name='Bgrave']"><img src="{$EntityPath}/Bgrave_uc.gif" BORDER="0" ALT="Bgrave"/></xsl:template>
<xsl:template match="symbol[@name='bgrave']"><img src="{$EntityPath}/bgrave_lc.gif" BORDER="0" ALT="bgrave"/></xsl:template>
<xsl:template match="symbol[@name='Bmacr']"><img src="{$EntityPath}/Bmacr_uc.gif" BORDER="0" ALT="Bmacr"/></xsl:template>
<xsl:template match="symbol[@name='bmacr']"><img src="{$EntityPath}/bmacr_lc.gif" BORDER="0" ALT="bmacr"/></xsl:template>
<xsl:template match="symbol[@name='Bogon']"><img src="{$EntityPath}/Bogon_uc.gif" BORDER="0" ALT="Bogon"/></xsl:template>
<xsl:template match="symbol[@name='bogon']"><img src="{$EntityPath}/bogon_lc.gif" BORDER="0" ALT="bogon"/></xsl:template>
<xsl:template match="symbol[@name='Bring']"><img src="{$EntityPath}/Bring_uc.gif" BORDER="0" ALT="Bring"/></xsl:template>
<xsl:template match="symbol[@name='bring']"><img src="{$EntityPath}/bring_lc.gif" BORDER="0" ALT="bring"/></xsl:template>
<xsl:template match="symbol[@name='Btilde']"><img src="{$EntityPath}/Btilde_uc.gif" BORDER="0" ALT="Btilde"/></xsl:template>
<xsl:template match="symbol[@name='btilde']"><img src="{$EntityPath}/btilde_lc.gif" BORDER="0" ALT="btilde"/></xsl:template>
<xsl:template match="symbol[@name='Buml']"><img src="{$EntityPath}/Buml_uc.gif" BORDER="0" ALT="Buml"/></xsl:template>
<xsl:template match="symbol[@name='buml']"><img src="{$EntityPath}/buml_lc.gif" BORDER="0" ALT="buml"/></xsl:template>
<xsl:template match="symbol[@name='Cbreve']"><img src="{$EntityPath}/Cbreve_uc.gif" BORDER="0" ALT="Cbreve"/></xsl:template>
<xsl:template match="symbol[@name='cbreve']"><img src="{$EntityPath}/cbreve_lc.gif" BORDER="0" ALT="cbreve"/></xsl:template>
<xsl:template match="symbol[@name='Cdblac']"><img src="{$EntityPath}/Cdblac_uc.gif" BORDER="0" ALT="Cdblac"/></xsl:template>
<xsl:template match="symbol[@name='cdblac']"><img src="{$EntityPath}/cdblac_lc.gif" BORDER="0" ALT="cdblac"/></xsl:template>
<xsl:template match="symbol[@name='Cdie']"><img src="{$EntityPath}/Cdie_uc.gif" BORDER="0" ALT="Cdie"/></xsl:template>
<xsl:template match="symbol[@name='cdie']"><img src="{$EntityPath}/cdie_lc.gif" BORDER="0" ALT="cdie"/></xsl:template>
<xsl:template match="symbol[@name='Cgrave']"><img src="{$EntityPath}/Cgrave_uc.gif" BORDER="0" ALT="Cgrave"/></xsl:template>
<xsl:template match="symbol[@name='cgrave']"><img src="{$EntityPath}/cgrave_lc.gif" BORDER="0" ALT="cgrave"/></xsl:template>
<xsl:template match="symbol[@name='Cmacr']"><img src="{$EntityPath}/Cmacr_uc.gif" BORDER="0" ALT="Cmacr"/></xsl:template>
<xsl:template match="symbol[@name='cmacr']"><img src="{$EntityPath}/cmacr_lc.gif" BORDER="0" ALT="cmacr"/></xsl:template>
<xsl:template match="symbol[@name='Cogon']"><img src="{$EntityPath}/Cogon_uc.gif" BORDER="0" ALT="Cogon"/></xsl:template>
<xsl:template match="symbol[@name='cogon']"><img src="{$EntityPath}/cogon_lc.gif" BORDER="0" ALT="cogon"/></xsl:template>
<xsl:template match="symbol[@name='Cring']"><img src="{$EntityPath}/Cring_uc.gif" BORDER="0" ALT="Cring"/></xsl:template>
<xsl:template match="symbol[@name='cring']"><img src="{$EntityPath}/cring_lc.gif" BORDER="0" ALT="cring"/></xsl:template>
<xsl:template match="symbol[@name='Ctilde']"><img src="{$EntityPath}/Ctilde_uc.gif" BORDER="0" ALT="Ctilde"/></xsl:template>
<xsl:template match="symbol[@name='ctilde']"><img src="{$EntityPath}/ctilde_lc.gif" BORDER="0" ALT="ctilde"/></xsl:template>
<xsl:template match="symbol[@name='Cuml']"><img src="{$EntityPath}/Cuml_uc.gif" BORDER="0" ALT="Cuml"/></xsl:template>
<xsl:template match="symbol[@name='cuml']"><img src="{$EntityPath}/cuml_lc.gif" BORDER="0" ALT="cuml"/></xsl:template>
<xsl:template match="symbol[@name='Dacute']"><img src="{$EntityPath}/Dacute_uc.gif" BORDER="0" ALT="Dacute"/></xsl:template>
<xsl:template match="symbol[@name='dacute']"><img src="{$EntityPath}/dacute_lc.gif" BORDER="0" ALT="dacute"/></xsl:template>
<xsl:template match="symbol[@name='Dbreve']"><img src="{$EntityPath}/Dbreve_uc.gif" BORDER="0" ALT="Dbreve"/></xsl:template>
<xsl:template match="symbol[@name='dbreve']"><img src="{$EntityPath}/dbreve_lc.gif" BORDER="0" ALT="dbreve"/></xsl:template>
<xsl:template match="symbol[@name='Dcedil']"><img src="{$EntityPath}/Dcedil_uc.gif" BORDER="0" ALT="Dcedil"/></xsl:template>
<xsl:template match="symbol[@name='dcedil']"><img src="{$EntityPath}/dcedil_lc.gif" BORDER="0" ALT="dcedil"/></xsl:template>
<xsl:template match="symbol[@name='Dcirc']"><img src="{$EntityPath}/Dcirc_uc.gif" BORDER="0" ALT="Dcirc"/></xsl:template>
<xsl:template match="symbol[@name='dcirc']"><img src="{$EntityPath}/dcirc_lc.gif" BORDER="0" ALT="dcirc"/></xsl:template>
<xsl:template match="symbol[@name='Ddblac']"><img src="{$EntityPath}/Ddblac_uc.gif" BORDER="0" ALT="Ddblac"/></xsl:template>
<xsl:template match="symbol[@name='ddblac']"><img src="{$EntityPath}/ddblac_lc.gif" BORDER="0" ALT="ddblac"/></xsl:template>
<xsl:template match="symbol[@name='Ddie']"><img src="{$EntityPath}/Ddie_uc.gif" BORDER="0" ALT="Ddie"/></xsl:template>
<xsl:template match="symbol[@name='ddie']"><img src="{$EntityPath}/ddie_lc.gif" BORDER="0" ALT="ddie"/></xsl:template>
<xsl:template match="symbol[@name='Ddot']"><img src="{$EntityPath}/Ddot_uc.gif" BORDER="0" ALT="Ddot"/></xsl:template>
<xsl:template match="symbol[@name='ddot']"><img src="{$EntityPath}/ddot_lc.gif" BORDER="0" ALT="ddot"/></xsl:template>
<xsl:template match="symbol[@name='Dgrave']"><img src="{$EntityPath}/Dgrave_uc.gif" BORDER="0" ALT="Dgrave"/></xsl:template>
<xsl:template match="symbol[@name='dgrave']"><img src="{$EntityPath}/dgrave_lc.gif" BORDER="0" ALT="dgrave"/></xsl:template>
<xsl:template match="symbol[@name='Dmacr']"><img src="{$EntityPath}/Dmacr_uc.gif" BORDER="0" ALT="Dmacr"/></xsl:template>
<xsl:template match="symbol[@name='dmacr']"><img src="{$EntityPath}/dmacr_lc.gif" BORDER="0" ALT="dmacr"/></xsl:template>
<xsl:template match="symbol[@name='Dogon']"><img src="{$EntityPath}/Dogon_uc.gif" BORDER="0" ALT="Dogon"/></xsl:template>
<xsl:template match="symbol[@name='dogon']"><img src="{$EntityPath}/dogon_lc.gif" BORDER="0" ALT="dogon"/></xsl:template>
<xsl:template match="symbol[@name='Dring']"><img src="{$EntityPath}/Dring_uc.gif" BORDER="0" ALT="Dring"/></xsl:template>
<xsl:template match="symbol[@name='dring']"><img src="{$EntityPath}/dring_lc.gif" BORDER="0" ALT="dring"/></xsl:template>
<xsl:template match="symbol[@name='Dtilde']"><img src="{$EntityPath}/Dtilde_uc.gif" BORDER="0" ALT="Dtilde"/></xsl:template>
<xsl:template match="symbol[@name='dtilde']"><img src="{$EntityPath}/dtilde_lc.gif" BORDER="0" ALT="dtilde"/></xsl:template>
<xsl:template match="symbol[@name='Duml']"><img src="{$EntityPath}/Duml_uc.gif" BORDER="0" ALT="Duml"/></xsl:template>
<xsl:template match="symbol[@name='duml']"><img src="{$EntityPath}/duml_lc.gif" BORDER="0" ALT="duml"/></xsl:template>
<xsl:template match="symbol[@name='Ebreve']"><img src="{$EntityPath}/Ebreve_uc.gif" BORDER="0" ALT="Ebreve"/></xsl:template>
<xsl:template match="symbol[@name='ebreve']"><img src="{$EntityPath}/ebreve_lc.gif" BORDER="0" ALT="ebreve"/></xsl:template>
<xsl:template match="symbol[@name='Ecedil']"><img src="{$EntityPath}/Ecedil_uc.gif" BORDER="0" ALT="Ecedil"/></xsl:template>
<xsl:template match="symbol[@name='ecedil']"><img src="{$EntityPath}/ecedil_lc.gif" BORDER="0" ALT="ecedil"/></xsl:template>
<xsl:template match="symbol[@name='Edblac']"><img src="{$EntityPath}/Edblac_uc.gif" BORDER="0" ALT="Edblac"/></xsl:template>
<xsl:template match="symbol[@name='edblac']"><img src="{$EntityPath}/edblac_lc.gif" BORDER="0" ALT="edblac"/></xsl:template>
<xsl:template match="symbol[@name='Edie']"><img src="{$EntityPath}/Edie_uc.gif" BORDER="0" ALT="Edie"/></xsl:template>
<xsl:template match="symbol[@name='edie']"><img src="{$EntityPath}/edie_lc.gif" BORDER="0" ALT="edie"/></xsl:template>
<xsl:template match="symbol[@name='Ering']"><img src="{$EntityPath}/Ering_uc.gif" BORDER="0" ALT="Ering"/></xsl:template>
<xsl:template match="symbol[@name='ering']"><img src="{$EntityPath}/ering_lc.gif" BORDER="0" ALT="ering"/></xsl:template>
<xsl:template match="symbol[@name='Etilde']"><img src="{$EntityPath}/Etilde_uc.gif" BORDER="0" ALT="Etilde"/></xsl:template>
<xsl:template match="symbol[@name='etilde']"><img src="{$EntityPath}/etilde_lc.gif" BORDER="0" ALT="etilde"/></xsl:template>
<xsl:template match="symbol[@name='Facute']"><img src="{$EntityPath}/Facute_uc.gif" BORDER="0" ALT="Facute"/></xsl:template>
<xsl:template match="symbol[@name='facute']"><img src="{$EntityPath}/facute_lc.gif" BORDER="0" ALT="facute"/></xsl:template>
<xsl:template match="symbol[@name='Fbreve']"><img src="{$EntityPath}/Fbreve_uc.gif" BORDER="0" ALT="Fbreve"/></xsl:template>
<xsl:template match="symbol[@name='fbreve']"><img src="{$EntityPath}/fbreve_lc.gif" BORDER="0" ALT="fbreve"/></xsl:template>
<xsl:template match="symbol[@name='Fcaron']"><img src="{$EntityPath}/Fcaron_uc.gif" BORDER="0" ALT="Fcaron"/></xsl:template>
<xsl:template match="symbol[@name='fcaron']"><img src="{$EntityPath}/fcaron_lc.gif" BORDER="0" ALT="fcaron"/></xsl:template>
<xsl:template match="symbol[@name='Fcedil']"><img src="{$EntityPath}/Fcedil_uc.gif" BORDER="0" ALT="Fcedil"/></xsl:template>
<xsl:template match="symbol[@name='fcedil']"><img src="{$EntityPath}/fcedil_lc.gif" BORDER="0" ALT="fcedil"/></xsl:template>
<xsl:template match="symbol[@name='Fcirc']"><img src="{$EntityPath}/Fcirc_uc.gif" BORDER="0" ALT="Fcirc"/></xsl:template>
<xsl:template match="symbol[@name='fcirc']"><img src="{$EntityPath}/fcirc_lc.gif" BORDER="0" ALT="fcirc"/></xsl:template>
<xsl:template match="symbol[@name='Fdblac']"><img src="{$EntityPath}/Fdblac_uc.gif" BORDER="0" ALT="Fdblac"/></xsl:template>
<xsl:template match="symbol[@name='fdblac']"><img src="{$EntityPath}/fdblac_lc.gif" BORDER="0" ALT="fdblac"/></xsl:template>
<xsl:template match="symbol[@name='Fdie']"><img src="{$EntityPath}/Fdie_uc.gif" BORDER="0" ALT="Fdie"/></xsl:template>
<xsl:template match="symbol[@name='fdie']"><img src="{$EntityPath}/fdie_lc.gif" BORDER="0" ALT="fdie"/></xsl:template>
<xsl:template match="symbol[@name='Fdot']"><img src="{$EntityPath}/Fdot_uc.gif" BORDER="0" ALT="Fdot"/></xsl:template>
<xsl:template match="symbol[@name='fdot']"><img src="{$EntityPath}/fdot_lc.gif" BORDER="0" ALT="fdot"/></xsl:template>
<xsl:template match="symbol[@name='Fgrave']"><img src="{$EntityPath}/Fgrave_uc.gif" BORDER="0" ALT="Fgrave"/></xsl:template>
<xsl:template match="symbol[@name='fgrave']"><img src="{$EntityPath}/fgrave_lc.gif" BORDER="0" ALT="fgrave"/></xsl:template>
<xsl:template match="symbol[@name='Fmacr']"><img src="{$EntityPath}/Fmacr_uc.gif" BORDER="0" ALT="Fmacr"/></xsl:template>
<xsl:template match="symbol[@name='fmacr']"><img src="{$EntityPath}/fmacr_lc.gif" BORDER="0" ALT="fmacr"/></xsl:template>
<xsl:template match="symbol[@name='Fogon']"><img src="{$EntityPath}/Fogon_uc.gif" BORDER="0" ALT="Fogon"/></xsl:template>
<xsl:template match="symbol[@name='fogon']"><img src="{$EntityPath}/fogon_lc.gif" BORDER="0" ALT="fogon"/></xsl:template>
<xsl:template match="symbol[@name='Fring']"><img src="{$EntityPath}/Fring_uc.gif" BORDER="0" ALT="Fring"/></xsl:template>
<xsl:template match="symbol[@name='fring']"><img src="{$EntityPath}/fring_lc.gif" BORDER="0" ALT="fring"/></xsl:template>
<xsl:template match="symbol[@name='Ftilde']"><img src="{$EntityPath}/Ftilde_uc.gif" BORDER="0" ALT="Ftilde"/></xsl:template>
<xsl:template match="symbol[@name='ftilde']"><img src="{$EntityPath}/ftilde_lc.gif" BORDER="0" ALT="ftilde"/></xsl:template>
<xsl:template match="symbol[@name='Fuml']"><img src="{$EntityPath}/Fuml_uc.gif" BORDER="0" ALT="Fuml"/></xsl:template>
<xsl:template match="symbol[@name='fuml']"><img src="{$EntityPath}/fuml_lc.gif" BORDER="0" ALT="fuml"/></xsl:template>
<xsl:template match="symbol[@name='Gacute']"><img src="{$EntityPath}/Gacute_uc.gif" BORDER="0" ALT="Gacute"/></xsl:template>
<xsl:template match="symbol[@name='Gcaron']"><img src="{$EntityPath}/Gcaron_uc.gif" BORDER="0" ALT="Gcaron"/></xsl:template>
<xsl:template match="symbol[@name='gcaron']"><img src="{$EntityPath}/gcaron_lc.gif" BORDER="0" ALT="gcaron"/></xsl:template>
<xsl:template match="symbol[@name='gcedil']"><img src="{$EntityPath}/gcedil_lc.gif" BORDER="0" ALT="gcedil"/></xsl:template>
<xsl:template match="symbol[@name='Gdblac']"><img src="{$EntityPath}/Gdblac_uc.gif" BORDER="0" ALT="Gdblac"/></xsl:template>
<xsl:template match="symbol[@name='Gdie']"><img src="{$EntityPath}/Gdie_uc.gif" BORDER="0" ALT="Gdie"/></xsl:template>
<xsl:template match="symbol[@name='gdie']"><img src="{$EntityPath}/gdie_lc.gif" BORDER="0" ALT="gdie"/></xsl:template>
<xsl:template match="symbol[@name='Ggrave']"><img src="{$EntityPath}/Ggrave_uc.gif" BORDER="0" ALT="Ggrave"/></xsl:template>
<xsl:template match="symbol[@name='ggrave']"><img src="{$EntityPath}/ggrave_lc.gif" BORDER="0" ALT="ggrave"/></xsl:template>
<xsl:template match="symbol[@name='Gmacr']"><img src="{$EntityPath}/Gmacr_uc.gif" BORDER="0" ALT="Gmacr"/></xsl:template>
<xsl:template match="symbol[@name='gmacr']"><img src="{$EntityPath}/gmacr_lc.gif" BORDER="0" ALT="gmacr"/></xsl:template>
<xsl:template match="symbol[@name='Gogon']"><img src="{$EntityPath}/Gogon_uc.gif" BORDER="0" ALT="Gogon"/></xsl:template>
<xsl:template match="symbol[@name='gogon']"><img src="{$EntityPath}/gogon_lc.gif" BORDER="0" ALT="gogon"/></xsl:template>
<xsl:template match="symbol[@name='Gring']"><img src="{$EntityPath}/Gring_uc.gif" BORDER="0" ALT="Gring"/></xsl:template>
<xsl:template match="symbol[@name='gring']"><img src="{$EntityPath}/gring_lc.gif" BORDER="0" ALT="gring"/></xsl:template>
<xsl:template match="symbol[@name='Gtilde']"><img src="{$EntityPath}/Gtilde_uc.gif" BORDER="0" ALT="Gtilde"/></xsl:template>
<xsl:template match="symbol[@name='gtilde']"><img src="{$EntityPath}/gtilde_lc.gif" BORDER="0" ALT="gtilde"/></xsl:template>
<xsl:template match="symbol[@name='Guml']"><img src="{$EntityPath}/Guml_uc.gif" BORDER="0" ALT="Guml"/></xsl:template>
<xsl:template match="symbol[@name='guml']"><img src="{$EntityPath}/guml_lc.gif" BORDER="0" ALT="guml"/></xsl:template>
<xsl:template match="symbol[@name='Hacute']"><img src="{$EntityPath}/Hacute_uc.gif" BORDER="0" ALT="Hacute"/></xsl:template>
<xsl:template match="symbol[@name='hacute']"><img src="{$EntityPath}/hacute_lc.gif" BORDER="0" ALT="hacute"/></xsl:template>
<xsl:template match="symbol[@name='Hbreve']"><img src="{$EntityPath}/Hbreve_uc.gif" BORDER="0" ALT="Hbreve"/></xsl:template>
<xsl:template match="symbol[@name='hbreve']"><img src="{$EntityPath}/hbreve_lc.gif" BORDER="0" ALT="hbreve"/></xsl:template>
<xsl:template match="symbol[@name='Hcaron']"><img src="{$EntityPath}/Hcaron_uc.gif" BORDER="0" ALT="Hcaron"/></xsl:template>
<xsl:template match="symbol[@name='hcaron']"><img src="{$EntityPath}/hcaron_lc.gif" BORDER="0" ALT="hcaron"/></xsl:template>
<xsl:template match="symbol[@name='Hcedil']"><img src="{$EntityPath}/Hcedil_uc.gif" BORDER="0" ALT="Hcedil"/></xsl:template>
<xsl:template match="symbol[@name='hcedil']"><img src="{$EntityPath}/hcedil_lc.gif" BORDER="0" ALT="hcedil"/></xsl:template>
<xsl:template match="symbol[@name='Hdblac']"><img src="{$EntityPath}/Hdblac_uc.gif" BORDER="0" ALT="Hdblac"/></xsl:template>
<xsl:template match="symbol[@name='hdblac']"><img src="{$EntityPath}/hdblac_lc.gif" BORDER="0" ALT="hdblac"/></xsl:template>
<xsl:template match="symbol[@name='Hdie']"><img src="{$EntityPath}/Hdie_uc.gif" BORDER="0" ALT="Hdie"/></xsl:template>
<xsl:template match="symbol[@name='hdie']"><img src="{$EntityPath}/hdie_lc.gif" BORDER="0" ALT="hdie"/></xsl:template>
<xsl:template match="symbol[@name='Hdot']"><img src="{$EntityPath}/Hdot_uc.gif" BORDER="0" ALT="Hdot"/></xsl:template>
<xsl:template match="symbol[@name='hdot']"><img src="{$EntityPath}/hdot_lc.gif" BORDER="0" ALT="hdot"/></xsl:template>
<xsl:template match="symbol[@name='Hgrave']"><img src="{$EntityPath}/Hgrave_uc.gif" BORDER="0" ALT="Hgrave"/></xsl:template>
<xsl:template match="symbol[@name='hgrave']"><img src="{$EntityPath}/hgrave_lc.gif" BORDER="0" ALT="hgrave"/></xsl:template>
<xsl:template match="symbol[@name='Hmacr']"><img src="{$EntityPath}/Hmacr_uc.gif" BORDER="0" ALT="Hmacr"/></xsl:template>
<xsl:template match="symbol[@name='hmacr']"><img src="{$EntityPath}/hmacr_lc.gif" BORDER="0" ALT="hmacr"/></xsl:template>
<xsl:template match="symbol[@name='Hogon']"><img src="{$EntityPath}/Hogon_uc.gif" BORDER="0" ALT="Hogon"/></xsl:template>
<xsl:template match="symbol[@name='hogon']"><img src="{$EntityPath}/hogon_lc.gif" BORDER="0" ALT="hogon"/></xsl:template>
<xsl:template match="symbol[@name='Hring']"><img src="{$EntityPath}/Hring_uc.gif" BORDER="0" ALT="Hring"/></xsl:template>
<xsl:template match="symbol[@name='hring']"><img src="{$EntityPath}/hring_lc.gif" BORDER="0" ALT="hring"/></xsl:template>
<xsl:template match="symbol[@name='Htilde']"><img src="{$EntityPath}/Htilde_uc.gif" BORDER="0" ALT="Htilde"/></xsl:template>
<xsl:template match="symbol[@name='htilde']"><img src="{$EntityPath}/htilde_lc.gif" BORDER="0" ALT="htilde"/></xsl:template>
<xsl:template match="symbol[@name='Huml']"><img src="{$EntityPath}/Huml_uc.gif" BORDER="0" ALT="Huml"/></xsl:template>
<xsl:template match="symbol[@name='huml']"><img src="{$EntityPath}/huml_lc.gif" BORDER="0" ALT="huml"/></xsl:template>
<xsl:template match="symbol[@name='Ibreve']"><img src="{$EntityPath}/Ibreve_uc.gif" BORDER="0" ALT="Ibreve"/></xsl:template>
<xsl:template match="symbol[@name='ibreve']"><img src="{$EntityPath}/ibreve_lc.gif" BORDER="0" ALT="ibreve"/></xsl:template>
<xsl:template match="symbol[@name='Icaron']"><img src="{$EntityPath}/Icaron_uc.gif" BORDER="0" ALT="Icaron"/></xsl:template>
<xsl:template match="symbol[@name='icaron']"><img src="{$EntityPath}/icaron_lc.gif" BORDER="0" ALT="icaron"/></xsl:template>
<xsl:template match="symbol[@name='Icedil']"><img src="{$EntityPath}/Icedil_uc.gif" BORDER="0" ALT="Icedil"/></xsl:template>
<xsl:template match="symbol[@name='icedil']"><img src="{$EntityPath}/icedil_lc.gif" BORDER="0" ALT="icedil"/></xsl:template>
<xsl:template match="symbol[@name='Idblac']"><img src="{$EntityPath}/Idblac_uc.gif" BORDER="0" ALT="Idblac"/></xsl:template>
<xsl:template match="symbol[@name='idblac']"><img src="{$EntityPath}/idblac_lc.gif" BORDER="0" ALT="idblac"/></xsl:template>
<xsl:template match="symbol[@name='Idie']"><img src="{$EntityPath}/Idie_uc.gif" BORDER="0" ALT="Idie"/></xsl:template>
<xsl:template match="symbol[@name='idie']"><img src="{$EntityPath}/idie_lc.gif" BORDER="0" ALT="idie"/></xsl:template>
<xsl:template match="symbol[@name='idot']"><img src="{$EntityPath}/idot_lc.gif" BORDER="0" ALT="idot"/></xsl:template>
<xsl:template match="symbol[@name='Iring']"><img src="{$EntityPath}/Iring_uc.gif" BORDER="0" ALT="Iring"/></xsl:template>
<xsl:template match="symbol[@name='iring']"><img src="{$EntityPath}/iring_lc.gif" BORDER="0" ALT="iring"/></xsl:template>
<xsl:template match="symbol[@name='Jacute']"><img src="{$EntityPath}/Jacute_uc.gif" BORDER="0" ALT="Jacute"/></xsl:template>
<xsl:template match="symbol[@name='jacute']"><img src="{$EntityPath}/jacute_lc.gif" BORDER="0" ALT="jacute"/></xsl:template>
<xsl:template match="symbol[@name='Jbreve']"><img src="{$EntityPath}/Jbreve_uc.gif" BORDER="0" ALT="Jbreve"/></xsl:template>
<xsl:template match="symbol[@name='jbreve']"><img src="{$EntityPath}/jbreve_lc.gif" BORDER="0" ALT="jbreve"/></xsl:template>
<xsl:template match="symbol[@name='Jcaron']"><img src="{$EntityPath}/Jcaron_uc.gif" BORDER="0" ALT="Jcaron"/></xsl:template>
<xsl:template match="symbol[@name='jcaron']"><img src="{$EntityPath}/jcaron_lc.gif" BORDER="0" ALT="jcaron"/></xsl:template>
<xsl:template match="symbol[@name='Jcedil']"><img src="{$EntityPath}/Jcedil_uc.gif" BORDER="0" ALT="Jcedil"/></xsl:template>
<xsl:template match="symbol[@name='jcedil']"><img src="{$EntityPath}/jcedil_lc.gif" BORDER="0" ALT="jcedil"/></xsl:template>
<xsl:template match="symbol[@name='Jdblac']"><img src="{$EntityPath}/Jdblac_uc.gif" BORDER="0" ALT="Jdblac"/></xsl:template>
<xsl:template match="symbol[@name='jdblac']"><img src="{$EntityPath}/jdblac_lc.gif" BORDER="0" ALT="jdblac"/></xsl:template>
<xsl:template match="symbol[@name='Jdie']"><img src="{$EntityPath}/Jdie_uc.gif" BORDER="0" ALT="Jdie"/></xsl:template>
<xsl:template match="symbol[@name='jdie']"><img src="{$EntityPath}/jdie_lc.gif" BORDER="0" ALT="jdie"/></xsl:template>
<xsl:template match="symbol[@name='Jdot']"><img src="{$EntityPath}/Jdot_uc.gif" BORDER="0" ALT="Jdot"/></xsl:template>
<xsl:template match="symbol[@name='jdot']"><img src="{$EntityPath}/jdot_lc.gif" BORDER="0" ALT="jdot"/></xsl:template>
<xsl:template match="symbol[@name='Jgrave']"><img src="{$EntityPath}/Jgrave_uc.gif" BORDER="0" ALT="Jgrave"/></xsl:template>
<xsl:template match="symbol[@name='jgrave']"><img src="{$EntityPath}/jgrave_lc.gif" BORDER="0" ALT="jgrave"/></xsl:template>
<xsl:template match="symbol[@name='Jmacr']"><img src="{$EntityPath}/Jmacr_uc.gif" BORDER="0" ALT="Jmacr"/></xsl:template>
<xsl:template match="symbol[@name='jmacr']"><img src="{$EntityPath}/jmacr_lc.gif" BORDER="0" ALT="jmacr"/></xsl:template>
<xsl:template match="symbol[@name='Jogon']"><img src="{$EntityPath}/Jogon_uc.gif" BORDER="0" ALT="Jogon"/></xsl:template>
<xsl:template match="symbol[@name='jogon']"><img src="{$EntityPath}/jogon_lc.gif" BORDER="0" ALT="jogon"/></xsl:template>
<xsl:template match="symbol[@name='Jring']"><img src="{$EntityPath}/Jring_uc.gif" BORDER="0" ALT="Jring"/></xsl:template>
<xsl:template match="symbol[@name='jring']"><img src="{$EntityPath}/jring_lc.gif" BORDER="0" ALT="jring"/></xsl:template>
<xsl:template match="symbol[@name='Jtilde']"><img src="{$EntityPath}/Jtilde_uc.gif" BORDER="0" ALT="Jtilde"/></xsl:template>
<xsl:template match="symbol[@name='jtilde']"><img src="{$EntityPath}/jtilde_lc.gif" BORDER="0" ALT="jtilde"/></xsl:template>
<xsl:template match="symbol[@name='Juml']"><img src="{$EntityPath}/Juml_uc.gif" BORDER="0" ALT="Juml"/></xsl:template>
<xsl:template match="symbol[@name='juml']"><img src="{$EntityPath}/juml_lc.gif" BORDER="0" ALT="juml"/></xsl:template>
<xsl:template match="symbol[@name='Kacute']"><img src="{$EntityPath}/Kacute_uc.gif" BORDER="0" ALT="Kacute"/></xsl:template>
<xsl:template match="symbol[@name='kacute']"><img src="{$EntityPath}/kacute_lc.gif" BORDER="0" ALT="kacute"/></xsl:template>
<xsl:template match="symbol[@name='Kbreve']"><img src="{$EntityPath}/Kbreve_uc.gif" BORDER="0" ALT="Kbreve"/></xsl:template>
<xsl:template match="symbol[@name='kbreve']"><img src="{$EntityPath}/kbreve_lc.gif" BORDER="0" ALT="kbreve"/></xsl:template>
<xsl:template match="symbol[@name='Kcaron']"><img src="{$EntityPath}/Kcaron_uc.gif" BORDER="0" ALT="Kcaron"/></xsl:template>
<xsl:template match="symbol[@name='kcaron']"><img src="{$EntityPath}/kcaron_lc.gif" BORDER="0" ALT="kcaron"/></xsl:template>
<xsl:template match="symbol[@name='Kcirc']"><img src="{$EntityPath}/Kcirc_uc.gif" BORDER="0" ALT="Kcirc"/></xsl:template>
<xsl:template match="symbol[@name='kcirc']"><img src="{$EntityPath}/kcirc_lc.gif" BORDER="0" ALT="kcirc"/></xsl:template>
<xsl:template match="symbol[@name='Kdblac']"><img src="{$EntityPath}/Kdblac_uc.gif" BORDER="0" ALT="Kdblac"/></xsl:template>
<xsl:template match="symbol[@name='kdblac']"><img src="{$EntityPath}/kdblac_lc.gif" BORDER="0" ALT="kdblac"/></xsl:template>
<xsl:template match="symbol[@name='Kdie']"><img src="{$EntityPath}/Kdie_uc.gif" BORDER="0" ALT="Kdie"/></xsl:template>
<xsl:template match="symbol[@name='kdie']"><img src="{$EntityPath}/kdie_lc.gif" BORDER="0" ALT="kdie"/></xsl:template>
<xsl:template match="symbol[@name='Kdot']"><img src="{$EntityPath}/Kdot_uc.gif" BORDER="0" ALT="Kdot"/></xsl:template>
<xsl:template match="symbol[@name='kdot']"><img src="{$EntityPath}/kdot_lc.gif" BORDER="0" ALT="kdot"/></xsl:template>
<xsl:template match="symbol[@name='Kgrave']"><img src="{$EntityPath}/Kgrave_uc.gif" BORDER="0" ALT="Kgrave"/></xsl:template>
<xsl:template match="symbol[@name='kgrave']"><img src="{$EntityPath}/kgrave_lc.gif" BORDER="0" ALT="kgrave"/></xsl:template>
<xsl:template match="symbol[@name='Kmacr']"><img src="{$EntityPath}/Kmacr_uc.gif" BORDER="0" ALT="Kmacr"/></xsl:template>
<xsl:template match="symbol[@name='kmacr']"><img src="{$EntityPath}/kmacr_lc.gif" BORDER="0" ALT="kmacr"/></xsl:template>
<xsl:template match="symbol[@name='Kogon']"><img src="{$EntityPath}/Kogon_uc.gif" BORDER="0" ALT="Kogon"/></xsl:template>
<xsl:template match="symbol[@name='kogon']"><img src="{$EntityPath}/kogon_lc.gif" BORDER="0" ALT="kogon"/></xsl:template>
<xsl:template match="symbol[@name='Kring']"><img src="{$EntityPath}/Kring_uc.gif" BORDER="0" ALT="Kring"/></xsl:template>
<xsl:template match="symbol[@name='kring']"><img src="{$EntityPath}/kring_lc.gif" BORDER="0" ALT="kring"/></xsl:template>
<xsl:template match="symbol[@name='Ktilde']"><img src="{$EntityPath}/Ktilde_uc.gif" BORDER="0" ALT="Ktilde"/></xsl:template>
<xsl:template match="symbol[@name='ktilde']"><img src="{$EntityPath}/ktilde_lc.gif" BORDER="0" ALT="ktilde"/></xsl:template>
<xsl:template match="symbol[@name='Kuml']"><img src="{$EntityPath}/Kuml_uc.gif" BORDER="0" ALT="Kuml"/></xsl:template>
<xsl:template match="symbol[@name='kuml']"><img src="{$EntityPath}/kuml_lc.gif" BORDER="0" ALT="kuml"/></xsl:template>
<xsl:template match="symbol[@name='Lbreve']"><img src="{$EntityPath}/Lbreve_uc.gif" BORDER="0" ALT="Lbreve"/></xsl:template>
<xsl:template match="symbol[@name='lbreve']"><img src="{$EntityPath}/lbreve_lc.gif" BORDER="0" ALT="lbreve"/></xsl:template>
<xsl:template match="symbol[@name='Lcirc']"><img src="{$EntityPath}/Lcirc_uc.gif" BORDER="0" ALT="Lcirc"/></xsl:template>
<xsl:template match="symbol[@name='lcirc']"><img src="{$EntityPath}/lcirc_lc.gif" BORDER="0" ALT="lcirc"/></xsl:template>
<xsl:template match="symbol[@name='Ldblac']"><img src="{$EntityPath}/Ldblac_uc.gif" BORDER="0" ALT="Ldblac"/></xsl:template>
<xsl:template match="symbol[@name='ldblac']"><img src="{$EntityPath}/ldblac_lc.gif" BORDER="0" ALT="ldblac"/></xsl:template>
<xsl:template match="symbol[@name='Ldie']"><img src="{$EntityPath}/Ldie_uc.gif" BORDER="0" ALT="Ldie"/></xsl:template>
<xsl:template match="symbol[@name='ldie']"><img src="{$EntityPath}/ldie_lc.gif" BORDER="0" ALT="ldie"/></xsl:template>
<xsl:template match="symbol[@name='Ldot']"><img src="{$EntityPath}/Ldot_uc.gif" BORDER="0" ALT="Ldot"/></xsl:template>
<xsl:template match="symbol[@name='ldot']"><img src="{$EntityPath}/ldot_lc.gif" BORDER="0" ALT="ldot"/></xsl:template>
<xsl:template match="symbol[@name='Lgrave']"><img src="{$EntityPath}/Lgrave_uc.gif" BORDER="0" ALT="Lgrave"/></xsl:template>
<xsl:template match="symbol[@name='lgrave']"><img src="{$EntityPath}/lgrave_lc.gif" BORDER="0" ALT="lgrave"/></xsl:template>
<xsl:template match="symbol[@name='Lmacr']"><img src="{$EntityPath}/Lmacr_uc.gif" BORDER="0" ALT="Lmacr"/></xsl:template>
<xsl:template match="symbol[@name='lmacr']"><img src="{$EntityPath}/lmacr_lc.gif" BORDER="0" ALT="lmacr"/></xsl:template>
<xsl:template match="symbol[@name='Logon']"><img src="{$EntityPath}/Logon_uc.gif" BORDER="0" ALT="Logon"/></xsl:template>
<xsl:template match="symbol[@name='logon']"><img src="{$EntityPath}/logon_lc.gif" BORDER="0" ALT="logon"/></xsl:template>
<xsl:template match="symbol[@name='Lring']"><img src="{$EntityPath}/Lring_uc.gif" BORDER="0" ALT="Lring"/></xsl:template>
<xsl:template match="symbol[@name='lring']"><img src="{$EntityPath}/lring_lc.gif" BORDER="0" ALT="lring"/></xsl:template>
<xsl:template match="symbol[@name='Ltilde']"><img src="{$EntityPath}/Ltilde_uc.gif" BORDER="0" ALT="Ltilde"/></xsl:template>
<xsl:template match="symbol[@name='ltilde']"><img src="{$EntityPath}/ltilde_lc.gif" BORDER="0" ALT="ltilde"/></xsl:template>
<xsl:template match="symbol[@name='Luml']"><img src="{$EntityPath}/Luml_uc.gif" BORDER="0" ALT="Luml"/></xsl:template>
<xsl:template match="symbol[@name='luml']"><img src="{$EntityPath}/luml_lc.gif" BORDER="0" ALT="luml"/></xsl:template>
<xsl:template match="symbol[@name='Macute']"><img src="{$EntityPath}/Macute_uc.gif" BORDER="0" ALT="Macute"/></xsl:template>
<xsl:template match="symbol[@name='macute']"><img src="{$EntityPath}/macute_lc.gif" BORDER="0" ALT="macute"/></xsl:template>
<xsl:template match="symbol[@name='Mbreve']"><img src="{$EntityPath}/Mbreve_uc.gif" BORDER="0" ALT="Mbreve"/></xsl:template>
<xsl:template match="symbol[@name='mbreve']"><img src="{$EntityPath}/mbreve_lc.gif" BORDER="0" ALT="mbreve"/></xsl:template>
<xsl:template match="symbol[@name='Mcaron']"><img src="{$EntityPath}/Mcaron_uc.gif" BORDER="0" ALT="Mcaron"/></xsl:template>
<xsl:template match="symbol[@name='mcaron']"><img src="{$EntityPath}/mcaron_lc.gif" BORDER="0" ALT="mcaron"/></xsl:template>
<xsl:template match="symbol[@name='Mcedil']"><img src="{$EntityPath}/Mcedil_uc.gif" BORDER="0" ALT="Mcedil"/></xsl:template>
<xsl:template match="symbol[@name='mcedil']"><img src="{$EntityPath}/mcedil_lc.gif" BORDER="0" ALT="mcedil"/></xsl:template>
<xsl:template match="symbol[@name='Mcirc']"><img src="{$EntityPath}/Mcirc_uc.gif" BORDER="0" ALT="Mcirc"/></xsl:template>
<xsl:template match="symbol[@name='Mdblac']"><img src="{$EntityPath}/Mdblac_uc.gif" BORDER="0" ALT="Mdblac"/></xsl:template>
<xsl:template match="symbol[@name='mdblac']"><img src="{$EntityPath}/mdblac_lc.gif" BORDER="0" ALT="mdblac"/></xsl:template>
<xsl:template match="symbol[@name='Mdie']"><img src="{$EntityPath}/Mdie_uc.gif" BORDER="0" ALT="Mdie"/></xsl:template>
<xsl:template match="symbol[@name='mdie']"><img src="{$EntityPath}/mdie_lc.gif" BORDER="0" ALT="mdie"/></xsl:template>
<xsl:template match="symbol[@name='Mdot']"><img src="{$EntityPath}/Mdot_uc.gif" BORDER="0" ALT="Mdot"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='mdot']"><img src="{$EntityPath}/mdot_lc.gif" BORDER="0" ALT="mdot"/></xsl:template><!-- -->
<xsl:template match="symbol[@name='Mgrave']"><img src="{$EntityPath}/Mgrave_uc.gif" BORDER="0" ALT="Mgrave"/></xsl:template>
<xsl:template match="symbol[@name='mgrave']"><img src="{$EntityPath}/mgrave_lc.gif" BORDER="0" ALT="mgrave"/></xsl:template>
<xsl:template match="symbol[@name='Mmacr']"><img src="{$EntityPath}/Mmacr_uc.gif" BORDER="0" ALT="Mmacr"/></xsl:template>
<xsl:template match="symbol[@name='mmacr']"><img src="{$EntityPath}/mmacr_lc.gif" BORDER="0" ALT="mmacr"/></xsl:template>
<xsl:template match="symbol[@name='Mogon']"><img src="{$EntityPath}/Mogon_uc.gif" BORDER="0" ALT="Mogon"/></xsl:template>
<xsl:template match="symbol[@name='mogon']"><img src="{$EntityPath}/mogon_lc.gif" BORDER="0" ALT="mogon"/></xsl:template>
<xsl:template match="symbol[@name='Mring']"><img src="{$EntityPath}/Mring_uc.gif" BORDER="0" ALT="Mring"/></xsl:template>
<xsl:template match="symbol[@name='mring']"><img src="{$EntityPath}/mring_lc.gif" BORDER="0" ALT="mring"/></xsl:template>
<xsl:template match="symbol[@name='Mtilde']"><img src="{$EntityPath}/Mtilde_uc.gif" BORDER="0" ALT="Mtilde"/></xsl:template>
<xsl:template match="symbol[@name='Muml']"><img src="{$EntityPath}/Muml_uc.gif" BORDER="0" ALT="Muml"/></xsl:template>
<xsl:template match="symbol[@name='muml']"><img src="{$EntityPath}/muml_lc.gif" BORDER="0" ALT="muml"/></xsl:template>
<xsl:template match="symbol[@name='Nbreve']"><img src="{$EntityPath}/Nbreve_uc.gif" BORDER="0" ALT="Nbreve"/></xsl:template>
<xsl:template match="symbol[@name='nbreve']"><img src="{$EntityPath}/nbreve_lc.gif" BORDER="0" ALT="nbreve"/></xsl:template>
<xsl:template match="symbol[@name='ncirc']"><img src="{$EntityPath}/ncirc_lc.gif" BORDER="0" ALT="ncirc"/></xsl:template>
<xsl:template match="symbol[@name='Ndblac']"><img src="{$EntityPath}/Ndblac_uc.gif" BORDER="0" ALT="Ndblac"/></xsl:template>
<xsl:template match="symbol[@name='ndblac']"><img src="{$EntityPath}/ndblac_lc.gif" BORDER="0" ALT="ndblac"/></xsl:template>
<xsl:template match="symbol[@name='Ndie']"><img src="{$EntityPath}/Ndie_uc.gif" BORDER="0" ALT="Ndie"/></xsl:template>
<xsl:template match="symbol[@name='ndie']"><img src="{$EntityPath}/ndie_lc.gif" BORDER="0" ALT="ndie"/></xsl:template>
<xsl:template match="symbol[@name='Ndot']"><img src="{$EntityPath}/Ndot_uc.gif" BORDER="0" ALT="Ndot"/></xsl:template>
<xsl:template match="symbol[@name='ndot']"><img src="{$EntityPath}/ndot_lc.gif" BORDER="0" ALT="ndot"/></xsl:template>
<xsl:template match="symbol[@name='Ngrave']"><img src="{$EntityPath}/Ngrave_uc.gif" BORDER="0" ALT="Ngrave"/></xsl:template>
<xsl:template match="symbol[@name='ngrave']"><img src="{$EntityPath}/ngrave_lc.gif" BORDER="0" ALT="ngrave"/></xsl:template>
<xsl:template match="symbol[@name='Nmacr']"><img src="{$EntityPath}/Nmacr_uc.gif" BORDER="0" ALT="Nmacr"/></xsl:template>
<xsl:template match="symbol[@name='nmacr']"><img src="{$EntityPath}/nmacr_lc.gif" BORDER="0" ALT="nmacr"/></xsl:template>
<xsl:template match="symbol[@name='Nogon']"><img src="{$EntityPath}/Nogon_uc.gif" BORDER="0" ALT="Nogon"/></xsl:template>
<xsl:template match="symbol[@name='nogon']"><img src="{$EntityPath}/nogon_lc.gif" BORDER="0" ALT="nogon"/></xsl:template>
<xsl:template match="symbol[@name='Nring']"><img src="{$EntityPath}/Nring_uc.gif" BORDER="0" ALT="Nring"/></xsl:template>
<xsl:template match="symbol[@name='nring']"><img src="{$EntityPath}/nring_lc.gif" BORDER="0" ALT="nring"/></xsl:template>
<xsl:template match="symbol[@name='Numl']"><img src="{$EntityPath}/Numl_uc.gif" BORDER="0" ALT="Numl"/></xsl:template>
<xsl:template match="symbol[@name='numl']"><img src="{$EntityPath}/numl_lc.gif" BORDER="0" ALT="numl"/></xsl:template>
<xsl:template match="symbol[@name='Obreve']"><img src="{$EntityPath}/Obreve_uc.gif" BORDER="0" ALT="Obreve"/></xsl:template>
<xsl:template match="symbol[@name='obreve']"><img src="{$EntityPath}/obreve_lc.gif" BORDER="0" ALT="obreve"/></xsl:template>
<xsl:template match="symbol[@name='Ocaron']"><img src="{$EntityPath}/Ocaron_uc.gif" BORDER="0" ALT="Ocaron"/></xsl:template>
<xsl:template match="symbol[@name='ocaron']"><img src="{$EntityPath}/ocaron_lc.gif" BORDER="0" ALT="ocaron"/></xsl:template>
<xsl:template match="symbol[@name='Ocedil']"><img src="{$EntityPath}/Ocedil_uc.gif" BORDER="0" ALT="Ocedil"/></xsl:template>
<xsl:template match="symbol[@name='ocedil']"><img src="{$EntityPath}/ocedil_lc.gif" BORDER="0" ALT="ocedil"/></xsl:template>
<xsl:template match="symbol[@name='Odie']"><img src="{$EntityPath}/Odie_uc.gif" BORDER="0" ALT="Odie"/></xsl:template>
<xsl:template match="symbol[@name='odie']"><img src="{$EntityPath}/odie_lc.gif" BORDER="0" ALT="odie"/></xsl:template>
<xsl:template match="symbol[@name='Odot']"><img src="{$EntityPath}/Odot_uc.gif" BORDER="0" ALT="Odot"/></xsl:template>
<xsl:template match="symbol[@name='Oogon']"><img src="{$EntityPath}/Oogon_uc.gif" BORDER="0" ALT="Oogon"/></xsl:template>
<xsl:template match="symbol[@name='oogon']"><img src="{$EntityPath}/oogon_lc.gif" BORDER="0" ALT="oogon"/></xsl:template>
<xsl:template match="symbol[@name='Oring']"><img src="{$EntityPath}/Oring_uc.gif" BORDER="0" ALT="Oring"/></xsl:template>
<xsl:template match="symbol[@name='oring']"><img src="{$EntityPath}/oring_lc.gif" BORDER="0" ALT="oring"/></xsl:template>
<xsl:template match="symbol[@name='Pacute']"><img src="{$EntityPath}/Pacute_uc.gif" BORDER="0" ALT="Pacute"/></xsl:template>
<xsl:template match="symbol[@name='pacute']"><img src="{$EntityPath}/pacute_lc.gif" BORDER="0" ALT="pacute"/></xsl:template>
<xsl:template match="symbol[@name='Pbreve']"><img src="{$EntityPath}/Pbreve_uc.gif" BORDER="0" ALT="Pbreve"/></xsl:template>
<xsl:template match="symbol[@name='pbreve']"><img src="{$EntityPath}/pbreve_lc.gif" BORDER="0" ALT="pbreve"/></xsl:template>
<xsl:template match="symbol[@name='Pcaron']"><img src="{$EntityPath}/Pcaron_uc.gif" BORDER="0" ALT="Pcaron"/></xsl:template>
<xsl:template match="symbol[@name='pcaron']"><img src="{$EntityPath}/pcaron_lc.gif" BORDER="0" ALT="pcaron"/></xsl:template>
<xsl:template match="symbol[@name='Pcedil']"><img src="{$EntityPath}/Pcedil_uc.gif" BORDER="0" ALT="Pcedil"/></xsl:template>
<xsl:template match="symbol[@name='pcedil']"><img src="{$EntityPath}/pcedil_lc.gif" BORDER="0" ALT="pcedil"/></xsl:template>
<xsl:template match="symbol[@name='Pcirc']"><img src="{$EntityPath}/Pcirc_uc.gif" BORDER="0" ALT="Pcirc"/></xsl:template>
<xsl:template match="symbol[@name='Pdblac']"><img src="{$EntityPath}/Pdblac_uc.gif" BORDER="0" ALT="Pdblac"/></xsl:template>
<xsl:template match="symbol[@name='pdblac']"><img src="{$EntityPath}/pdblac_lc.gif" BORDER="0" ALT="pdblac"/></xsl:template>
<xsl:template match="symbol[@name='Pdie']"><img src="{$EntityPath}/Pdie_uc.gif" BORDER="0" ALT="Pdie"/></xsl:template>
<xsl:template match="symbol[@name='pdie']"><img src="{$EntityPath}/pdie_lc.gif" BORDER="0" ALT="pdie"/></xsl:template>
<xsl:template match="symbol[@name='Pdot']"><img src="{$EntityPath}/Pdot_uc.gif" BORDER="0" ALT="Pdot"/></xsl:template>
<xsl:template match="symbol[@name='pdot']"><img src="{$EntityPath}/pdot_lc.gif" BORDER="0" ALT="pdot"/></xsl:template>
<xsl:template match="symbol[@name='Pgrave']"><img src="{$EntityPath}/Pgrave_uc.gif" BORDER="0" ALT="Pgrave"/></xsl:template>
<xsl:template match="symbol[@name='pgrave']"><img src="{$EntityPath}/pgrave_lc.gif" BORDER="0" ALT="pgrave"/></xsl:template>
<xsl:template match="symbol[@name='Pmacr']"><img src="{$EntityPath}/Pmacr_uc.gif" BORDER="0" ALT="Pmacr"/></xsl:template>
<xsl:template match="symbol[@name='Pogon']"><img src="{$EntityPath}/Pogon_uc.gif" BORDER="0" ALT="Pogon"/></xsl:template>
<xsl:template match="symbol[@name='pogon']"><img src="{$EntityPath}/pogon_lc.gif" BORDER="0" ALT="pogon"/></xsl:template>
<xsl:template match="symbol[@name='Pring']"><img src="{$EntityPath}/Pring_uc.gif" BORDER="0" ALT="Pring"/></xsl:template>
<xsl:template match="symbol[@name='pring']"><img src="{$EntityPath}/pring_lc.gif" BORDER="0" ALT="pring"/></xsl:template>
<xsl:template match="symbol[@name='Puml']"><img src="{$EntityPath}/Puml_uc.gif" BORDER="0" ALT="Puml"/></xsl:template>
<xsl:template match="symbol[@name='puml']"><img src="{$EntityPath}/puml_lc.gif" BORDER="0" ALT="puml"/></xsl:template>
<xsl:template match="symbol[@name='Qacute']"><img src="{$EntityPath}/Qacute.gif" BORDER="0" ALT="Qacute"/></xsl:template>
<xsl:template match="symbol[@name='qacute']"><img src="{$EntityPath}/qacute_lc.gif" BORDER="0" ALT="qacute"/></xsl:template>
<xsl:template match="symbol[@name='Qbreve']"><img src="{$EntityPath}/Qbreve.gif" BORDER="0" ALT="Qbreve"/></xsl:template>
<xsl:template match="symbol[@name='qbreve']"><img src="{$EntityPath}/qbreve_lc.gif" BORDER="0" ALT="qbreve"/></xsl:template>
<xsl:template match="symbol[@name='Qcaron']"><img src="{$EntityPath}/Qcaron.gif" BORDER="0" ALT="Qcaron"/></xsl:template>
<xsl:template match="symbol[@name='qcaron']"><img src="{$EntityPath}/qcaron_lc.gif" BORDER="0" ALT="qcaron"/></xsl:template>
<xsl:template match="symbol[@name='Ptilde']"><img src="{$EntityPath}/Ptilde_uc.gif" BORDER="0" ALT="Ptilde"/></xsl:template>
<xsl:template match="symbol[@name='Qcedil']"><img src="{$EntityPath}/Qcedil_uc.gif" BORDER="0" ALT="Qcedil"/></xsl:template>
<xsl:template match="symbol[@name='qcedil']"><img src="{$EntityPath}/qcedil_lc.gif" BORDER="0" ALT="qcedil"/></xsl:template>
<xsl:template match="symbol[@name='Qcirc']"><img src="{$EntityPath}/Qcirc_uc.gif" BORDER="0" ALT="Qcirc"/></xsl:template>
<xsl:template match="symbol[@name='qcirc']"><img src="{$EntityPath}/qcirc_lc.gif" BORDER="0" ALT="qcirc"/></xsl:template>
<xsl:template match="symbol[@name='Qdblac']"><img src="{$EntityPath}/Qdblac_uc.gif" BORDER="0" ALT="Qdblac"/></xsl:template>
<xsl:template match="symbol[@name='qdblac']"><img src="{$EntityPath}/qdblac_lc.gif" BORDER="0" ALT="qdblac"/></xsl:template>
<xsl:template match="symbol[@name='Qdie']"><img src="{$EntityPath}/Qdie_uc.gif" BORDER="0" ALT="Qdie"/></xsl:template>
<xsl:template match="symbol[@name='qdie']"><img src="{$EntityPath}/qdie_lc.gif" BORDER="0" ALT="qdie"/></xsl:template>
<xsl:template match="symbol[@name='Qdot']"><img src="{$EntityPath}/Qdot_uc.gif" BORDER="0" ALT="Qdot"/></xsl:template>
<xsl:template match="symbol[@name='qdot']"><img src="{$EntityPath}/qdot_lc.gif" BORDER="0" ALT="qdot"/></xsl:template>
<xsl:template match="symbol[@name='Qgrave']"><img src="{$EntityPath}/Qgrave_uc.gif" BORDER="0" ALT="Qgrave"/></xsl:template>
<xsl:template match="symbol[@name='qgrave']"><img src="{$EntityPath}/qgrave_lc.gif" BORDER="0" ALT="qgrave"/></xsl:template>
<xsl:template match="symbol[@name='Qmacr']"><img src="{$EntityPath}/Qmacr_uc.gif" BORDER="0" ALT="Qmacr"/></xsl:template>
<xsl:template match="symbol[@name='qmacr']"><img src="{$EntityPath}/qmacr_lc.gif" BORDER="0" ALT="qmacr"/></xsl:template>
<xsl:template match="symbol[@name='Qogon']"><img src="{$EntityPath}/Qogon_uc.gif" BORDER="0" ALT="Qogon"/></xsl:template>
<xsl:template match="symbol[@name='qogon']"><img src="{$EntityPath}/qogon_lc.gif" BORDER="0" ALT="qogon"/></xsl:template>
<xsl:template match="symbol[@name='Qring']"><img src="{$EntityPath}/Qring_uc.gif" BORDER="0" ALT="Qring"/></xsl:template>
<xsl:template match="symbol[@name='qring']"><img src="{$EntityPath}/qring_lc.gif" BORDER="0" ALT="qring"/></xsl:template>
<xsl:template match="symbol[@name='Quml']"><img src="{$EntityPath}/Quml_uc.gif" BORDER="0" ALT="Quml"/></xsl:template>
<xsl:template match="symbol[@name='quml']"><img src="{$EntityPath}/quml_lc.gif" BORDER="0" ALT="quml"/></xsl:template>
<xsl:template match="symbol[@name='Qtilde']"><img src="{$EntityPath}/Qtilde_uc.gif" BORDER="0" ALT="Qtilde"/></xsl:template>
<xsl:template match="symbol[@name='Rbreve']"><img src="{$EntityPath}/Rbreve_uc.gif" BORDER="0" ALT="Rbreve"/></xsl:template>
<xsl:template match="symbol[@name='rbreve']"><img src="{$EntityPath}/rbreve_lc.gif" BORDER="0" ALT="rbreve"/></xsl:template>
<xsl:template match="symbol[@name='Rcirc']"><img src="{$EntityPath}/Rcirc_uc.gif" BORDER="0" ALT="Rcirc"/></xsl:template>
<xsl:template match="symbol[@name='rcirc']"><img src="{$EntityPath}/rcirc_lc.gif" BORDER="0" ALT="rcirc"/></xsl:template>
<xsl:template match="symbol[@name='Rdblac']"><img src="{$EntityPath}/Rdblac_uc.gif" BORDER="0" ALT="Rdblac"/></xsl:template>
<xsl:template match="symbol[@name='rdblac']"><img src="{$EntityPath}/rdblac_lc.gif" BORDER="0" ALT="rdblac"/></xsl:template>
<xsl:template match="symbol[@name='Rdie']"><img src="{$EntityPath}/Rdie_uc.gif" BORDER="0" ALT="Rdie"/></xsl:template>
<xsl:template match="symbol[@name='rdie']"><img src="{$EntityPath}/rdie_lc.gif" BORDER="0" ALT="rdie"/></xsl:template>
<xsl:template match="symbol[@name='Rdot']"><img src="{$EntityPath}/Rdot_uc.gif" BORDER="0" ALT="Rdot"/></xsl:template>
<xsl:template match="symbol[@name='rdot']"><img src="{$EntityPath}/rdot_lc.gif" BORDER="0" ALT="rdot"/></xsl:template>
<xsl:template match="symbol[@name='Rgrave']"><img src="{$EntityPath}/Rgrave_uc.gif" BORDER="0" ALT="Rgrave"/></xsl:template>
<xsl:template match="symbol[@name='rgrave']"><img src="{$EntityPath}/rgrave_lc.gif" BORDER="0" ALT="rgrave"/></xsl:template>
<xsl:template match="symbol[@name='Rmacr']"><img src="{$EntityPath}/Rmacr_uc.gif" BORDER="0" ALT="Rmacr"/></xsl:template>
<xsl:template match="symbol[@name='rmacr']"><img src="{$EntityPath}/rmacr_lc.gif" BORDER="0" ALT="rmacr"/></xsl:template>
<xsl:template match="symbol[@name='Rogon']"><img src="{$EntityPath}/Rogon_uc.gif" BORDER="0" ALT="Rogon"/></xsl:template>
<xsl:template match="symbol[@name='rogon']"><img src="{$EntityPath}/rogon_lc.gif" BORDER="0" ALT="rogon"/></xsl:template>
<xsl:template match="symbol[@name='Rring']"><img src="{$EntityPath}/Rring_uc.gif" BORDER="0" ALT="Rring"/></xsl:template>
<xsl:template match="symbol[@name='rring']"><img src="{$EntityPath}/rring_lc.gif" BORDER="0" ALT="rring"/></xsl:template>
<xsl:template match="symbol[@name='Rtilde']"><img src="{$EntityPath}/Rtilde_uc.gif" BORDER="0" ALT="Rtilde"/></xsl:template>
<xsl:template match="symbol[@name='rtilde']"><img src="{$EntityPath}/rtilde_lc.gif" BORDER="0" ALT="rtilde"/></xsl:template>
<xsl:template match="symbol[@name='Ruml']"><img src="{$EntityPath}/Ruml_uc.gif" BORDER="0" ALT="Ruml"/></xsl:template>
<xsl:template match="symbol[@name='ruml']"><img src="{$EntityPath}/ruml_lc.gif" BORDER="0" ALT="ruml"/></xsl:template>
<xsl:template match="symbol[@name='Sbreve']"><img src="{$EntityPath}/Sbreve_uc.gif" BORDER="0" ALT="Sbreve"/></xsl:template>
<xsl:template match="symbol[@name='sbreve']"><img src="{$EntityPath}/sbreve_lc.gif" BORDER="0" ALT="sbreve"/></xsl:template>
<xsl:template match="symbol[@name='Sdblac']"><img src="{$EntityPath}/Sdblac_uc.gif" BORDER="0" ALT="Sdblac"/></xsl:template>
<xsl:template match="symbol[@name='sdblac']"><img src="{$EntityPath}/sdblac_lc.gif" BORDER="0" ALT="sdblac"/></xsl:template>
<xsl:template match="symbol[@name='Sdie']"><img src="{$EntityPath}/Sdie_uc.gif" BORDER="0" ALT="Sdie"/></xsl:template>
<xsl:template match="symbol[@name='sdie']"><img src="{$EntityPath}/sdie_lc.gif" BORDER="0" ALT="sdie"/></xsl:template>
<xsl:template match="symbol[@name='Sdot']"><img src="{$EntityPath}/Sdot_uc.gif" BORDER="0" ALT="Sdot"/></xsl:template>
<xsl:template match="symbol[@name='Sgrave']"><img src="{$EntityPath}/Sgrave_uc.gif" BORDER="0" ALT="Sgrave"/></xsl:template>
<xsl:template match="symbol[@name='sgrave']"><img src="{$EntityPath}/sgrave_lc.gif" BORDER="0" ALT="sgrave"/></xsl:template>
<xsl:template match="symbol[@name='Smacr']"><img src="{$EntityPath}/Smacr_uc.gif" BORDER="0" ALT="Smacr"/></xsl:template>
<xsl:template match="symbol[@name='smacr']"><img src="{$EntityPath}/smacr_lc.gif" BORDER="0" ALT="smacr"/></xsl:template>
<xsl:template match="symbol[@name='Sogon']"><img src="{$EntityPath}/Sogon_uc.gif" BORDER="0" ALT="Sogon"/></xsl:template>
<xsl:template match="symbol[@name='sogon']"><img src="{$EntityPath}/sogon_lc.gif" BORDER="0" ALT="sogon"/></xsl:template>
<xsl:template match="symbol[@name='Sring']"><img src="{$EntityPath}/Sring_uc.gif" BORDER="0" ALT="Sring"/></xsl:template>
<xsl:template match="symbol[@name='sring']"><img src="{$EntityPath}/sring_lc.gif" BORDER="0" ALT="sring"/></xsl:template>
<xsl:template match="symbol[@name='Stilde']"><img src="{$EntityPath}/Stilde_uc.gif" BORDER="0" ALT="Stilde"/></xsl:template>
<xsl:template match="symbol[@name='stilde']"><img src="{$EntityPath}/stilde_lc.gif" BORDER="0" ALT="stilde"/></xsl:template>
<xsl:template match="symbol[@name='Suml']"><img src="{$EntityPath}/Suml_uc.gif" BORDER="0" ALT="Suml"/></xsl:template>
<xsl:template match="symbol[@name='suml']"><img src="{$EntityPath}/suml_lc.gif" BORDER="0" ALT="suml"/></xsl:template>
<xsl:template match="symbol[@name='Tacute']"><img src="{$EntityPath}/Tacute_uc.gif" BORDER="0" ALT="Tacute"/></xsl:template>
<xsl:template match="symbol[@name='tacute']"><img src="{$EntityPath}/tacute_lc.gif" BORDER="0" ALT="tacute"/></xsl:template>
<xsl:template match="symbol[@name='Tbreve']"><img src="{$EntityPath}/Tbreve_uc.gif" BORDER="0" ALT="Tbreve"/></xsl:template>
<xsl:template match="symbol[@name='tbreve']"><img src="{$EntityPath}/tbreve_lc.gif" BORDER="0" ALT="tbreve"/></xsl:template>
<xsl:template match="symbol[@name='Tcirc']"><img src="{$EntityPath}/Tcirc_uc.gif" BORDER="0" ALT="Tcirc"/></xsl:template>
<xsl:template match="symbol[@name='tcirc']"><img src="{$EntityPath}/tcirc_lc.gif" BORDER="0" ALT="tcirc"/></xsl:template>
<xsl:template match="symbol[@name='Tdblac']"><img src="{$EntityPath}/Tdblac_uc.gif" BORDER="0" ALT="Tdblac"/></xsl:template>
<xsl:template match="symbol[@name='tdblac']"><img src="{$EntityPath}/tdblac_lc.gif" BORDER="0" ALT="tdblac"/></xsl:template>
<xsl:template match="symbol[@name='Tdie']"><img src="{$EntityPath}/Tdie_uc.gif" BORDER="0" ALT="Tdie"/></xsl:template>
<xsl:template match="symbol[@name='tdie']"><img src="{$EntityPath}/tdie_lc.gif" BORDER="0" ALT="tdie"/></xsl:template>
<xsl:template match="symbol[@name='Tdot']"><img src="{$EntityPath}/Tdot_uc.gif" BORDER="0" ALT="Tdot"/></xsl:template>
<xsl:template match="symbol[@name='Tgrave']"><img src="{$EntityPath}/Tgrave_uc.gif" BORDER="0" ALT="Tgrave"/></xsl:template>
<xsl:template match="symbol[@name='tgrave']"><img src="{$EntityPath}/tgrave_lc.gif" BORDER="0" ALT="tgrave"/></xsl:template>
<xsl:template match="symbol[@name='Tmacr']"><img src="{$EntityPath}/Tmacr_uc.gif" BORDER="0" ALT="Tmacr"/></xsl:template>
<xsl:template match="symbol[@name='tmacr']"><img src="{$EntityPath}/tmacr_lc.gif" BORDER="0" ALT="tmacr"/></xsl:template>
<xsl:template match="symbol[@name='Togon']"><img src="{$EntityPath}/Togon_uc.gif" BORDER="0" ALT="Togon"/></xsl:template>
<xsl:template match="symbol[@name='togon']"><img src="{$EntityPath}/togon_lc.gif" BORDER="0" ALT="togon"/></xsl:template>
<xsl:template match="symbol[@name='Tring']"><img src="{$EntityPath}/Tring_uc.gif" BORDER="0" ALT="Tring"/></xsl:template>
<xsl:template match="symbol[@name='tring']"><img src="{$EntityPath}/tring_lc.gif" BORDER="0" ALT="tring"/></xsl:template>
<xsl:template match="symbol[@name='Ttilde']"><img src="{$EntityPath}/Ttilde_uc.gif" BORDER="0" ALT="Ttilde"/></xsl:template>
<xsl:template match="symbol[@name='ttilde']"><img src="{$EntityPath}/ttilde_lc.gif" BORDER="0" ALT="ttilde"/></xsl:template>
<xsl:template match="symbol[@name='Tuml']"><img src="{$EntityPath}/Tuml_uc.gif" BORDER="0" ALT="Tuml"/></xsl:template>
<xsl:template match="symbol[@name='tuml']"><img src="{$EntityPath}/tuml_lc.gif" BORDER="0" ALT="tuml"/></xsl:template>
<xsl:template match="symbol[@name='Ucaron']"><img src="{$EntityPath}/Ucaron_uc.gif" BORDER="0" ALT="Ucaron"/></xsl:template>
<xsl:template match="symbol[@name='ucaron']"><img src="{$EntityPath}/ucaron_lc.gif" BORDER="0" ALT="ucaron"/></xsl:template>
<xsl:template match="symbol[@name='Ucedil']"><img src="{$EntityPath}/Ucedil_uc.gif" BORDER="0" ALT="Ucedil"/></xsl:template>
<xsl:template match="symbol[@name='ucedil']"><img src="{$EntityPath}/ucedil_lc.gif" BORDER="0" ALT="ucedil"/></xsl:template>
<xsl:template match="symbol[@name='Udie']"><img src="{$EntityPath}/Udie_uc.gif" BORDER="0" ALT="Udie"/></xsl:template>
<xsl:template match="symbol[@name='udie']"><img src="{$EntityPath}/udie_lc.gif" BORDER="0" ALT="udie"/></xsl:template>
<xsl:template match="symbol[@name='Udot']"><img src="{$EntityPath}/Udot_uc.gif" BORDER="0" ALT="Udot"/></xsl:template>
<xsl:template match="symbol[@name='udot']"><img src="{$EntityPath}/udot_lc.gif" BORDER="0" ALT="udot"/></xsl:template>
<xsl:template match="symbol[@name='Vacute']"><img src="{$EntityPath}/Vacute_uc.gif" BORDER="0" ALT="Vacute"/></xsl:template>
<xsl:template match="symbol[@name='vacute']"><img src="{$EntityPath}/vacute_lc.gif" BORDER="0" ALT="vacute"/></xsl:template>
<xsl:template match="symbol[@name='Vbreve']"><img src="{$EntityPath}/Vbreve_uc.gif" BORDER="0" ALT="Vbreve"/></xsl:template>
<xsl:template match="symbol[@name='vbreve']"><img src="{$EntityPath}/vbreve_lc.gif" BORDER="0" ALT="vbreve"/></xsl:template>
<xsl:template match="symbol[@name='Vcaron']"><img src="{$EntityPath}/Vcaron_uc.gif" BORDER="0" ALT="Vcaron"/></xsl:template>
<xsl:template match="symbol[@name='vcaron']"><img src="{$EntityPath}/vcaron_lc.gif" BORDER="0" ALT="vcaron"/></xsl:template>
<xsl:template match="symbol[@name='Vcedil']"><img src="{$EntityPath}/Vcedil_uc.gif" BORDER="0" ALT="Vcedil"/></xsl:template>
<xsl:template match="symbol[@name='vcedil']"><img src="{$EntityPath}/vcedil_lc.gif" BORDER="0" ALT="vcedil"/></xsl:template>
<xsl:template match="symbol[@name='Vcirc']"><img src="{$EntityPath}/Vcirc_uc.gif" BORDER="0" ALT="Vcirc"/></xsl:template>
<xsl:template match="symbol[@name='vcirc']"><img src="{$EntityPath}/vcirc_lc.gif" BORDER="0" ALT="vcirc"/></xsl:template>
<xsl:template match="symbol[@name='Vdblac']"><img src="{$EntityPath}/Vdblac_uc.gif" BORDER="0" ALT="Vdblac"/></xsl:template>
<xsl:template match="symbol[@name='vdblac']"><img src="{$EntityPath}/vdblac_lc.gif" BORDER="0" ALT="vdblac"/></xsl:template>
<xsl:template match="symbol[@name='Vdie']"><img src="{$EntityPath}/Vdie_uc.gif" BORDER="0" ALT="Vdie"/></xsl:template>
<xsl:template match="symbol[@name='vdie']"><img src="{$EntityPath}/vdie_lc.gif" BORDER="0" ALT="vdie"/></xsl:template>
<xsl:template match="symbol[@name='Vdot']"><img src="{$EntityPath}/Vdot_uc.gif" BORDER="0" ALT="Vdot"/></xsl:template>
<xsl:template match="symbol[@name='vdot']"><img src="{$EntityPath}/vdot_lc.gif" BORDER="0" ALT="vdot"/></xsl:template>
<xsl:template match="symbol[@name='Vgrave']"><img src="{$EntityPath}/Vgrave_uc.gif" BORDER="0" ALT="Vgrave"/></xsl:template>
<xsl:template match="symbol[@name='vgrave']"><img src="{$EntityPath}/vgrave_lc.gif" BORDER="0" ALT="vgrave"/></xsl:template>
<xsl:template match="symbol[@name='Vmacr']"><img src="{$EntityPath}/Vmacr_uc.gif" BORDER="0" ALT="Vmacr"/></xsl:template>
<xsl:template match="symbol[@name='vmacr']"><img src="{$EntityPath}/vmacr_lc.gif" BORDER="0" ALT="vmacr"/></xsl:template>
<xsl:template match="symbol[@name='Vogon']"><img src="{$EntityPath}/Vogon_uc.gif" BORDER="0" ALT="Vogon"/></xsl:template>
<xsl:template match="symbol[@name='vogon']"><img src="{$EntityPath}/vogon_lc.gif" BORDER="0" ALT="vogon"/></xsl:template>
<xsl:template match="symbol[@name='Vring']"><img src="{$EntityPath}/Vring_uc.gif" BORDER="0" ALT="Vring"/></xsl:template>
<xsl:template match="symbol[@name='vring']"><img src="{$EntityPath}/vring_lc.gif" BORDER="0" ALT="vring"/></xsl:template>
<xsl:template match="symbol[@name='vtilde']"><img src="{$EntityPath}/vtilde_lc.gif" BORDER="0" ALT="vtilde"/></xsl:template>
<xsl:template match="symbol[@name='Vuml']"><img src="{$EntityPath}/Vuml_uc.gif" BORDER="0" ALT="Vuml"/></xsl:template>
<xsl:template match="symbol[@name='vuml']"><img src="{$EntityPath}/vuml_lc.gif" BORDER="0" ALT="vuml"/></xsl:template>
<xsl:template match="symbol[@name='Wacute']"><img src="{$EntityPath}/Wacute_uc.gif" BORDER="0" ALT="Wacute"/></xsl:template>
<xsl:template match="symbol[@name='wacute']"><img src="{$EntityPath}/wacute_lc.gif" BORDER="0" ALT="wacute"/></xsl:template>
<xsl:template match="symbol[@name='Wbreve']"><img src="{$EntityPath}/Wbreve_uc.gif" BORDER="0" ALT="Wbreve"/></xsl:template>
<xsl:template match="symbol[@name='wbreve']"><img src="{$EntityPath}/wbreve_lc.gif" BORDER="0" ALT="wbreve"/></xsl:template>
<xsl:template match="symbol[@name='Wcaron']"><img src="{$EntityPath}/Wcaron_uc.gif" BORDER="0" ALT="Wcaron"/></xsl:template>
<xsl:template match="symbol[@name='wcaron']"><img src="{$EntityPath}/wcaron_lc.gif" BORDER="0" ALT="wcaron"/></xsl:template>
<xsl:template match="symbol[@name='Wcedil']"><img src="{$EntityPath}/Wcedil_uc.gif" BORDER="0" ALT="Wcedil"/></xsl:template>
<xsl:template match="symbol[@name='wcedil']"><img src="{$EntityPath}/wcedil_lc.gif" BORDER="0" ALT="wcedil"/></xsl:template>
<xsl:template match="symbol[@name='Wdblac']"><img src="{$EntityPath}/Wdblac_uc.gif" BORDER="0" ALT="Wdblac"/></xsl:template>
<xsl:template match="symbol[@name='wdblac']"><img src="{$EntityPath}/wdblac_lc.gif" BORDER="0" ALT="wdblac"/></xsl:template>
<xsl:template match="symbol[@name='Wdie']"><img src="{$EntityPath}/Wdie_uc.gif" BORDER="0" ALT="Wdie"/></xsl:template>
<xsl:template match="symbol[@name='wdie']"><img src="{$EntityPath}/wdie_lc.gif" BORDER="0" ALT="wdie"/></xsl:template>
<xsl:template match="symbol[@name='Wdot']"><img src="{$EntityPath}/Wdot_uc.gif" BORDER="0" ALT="Wdot"/></xsl:template>
<xsl:template match="symbol[@name='wdot']"><img src="{$EntityPath}/wdot_lc.gif" BORDER="0" ALT="wdot"/></xsl:template>
<xsl:template match="symbol[@name='Wgrave']"><img src="{$EntityPath}/Wgrave_uc.gif" BORDER="0" ALT="Wgrave"/></xsl:template>
<xsl:template match="symbol[@name='wgrave']"><img src="{$EntityPath}/wgrave_lc.gif" BORDER="0" ALT="wgrave"/></xsl:template>
<xsl:template match="symbol[@name='Wmacr']"><img src="{$EntityPath}/Wmacr_uc.gif" BORDER="0" ALT="Wmacr"/></xsl:template>
<xsl:template match="symbol[@name='Wogon']"><img src="{$EntityPath}/Wogon_uc.gif" BORDER="0" ALT="Wogon"/></xsl:template>
<xsl:template match="symbol[@name='wogon']"><img src="{$EntityPath}/wogon_lc.gif" BORDER="0" ALT="wogon"/></xsl:template>
<xsl:template match="symbol[@name='Wring']"><img src="{$EntityPath}/Wring_uc.gif" BORDER="0" ALT="Wring"/></xsl:template>
<xsl:template match="symbol[@name='wring']"><img src="{$EntityPath}/wring_lc.gif" BORDER="0" ALT="wring"/></xsl:template>
<xsl:template match="symbol[@name='Wtilde']"><img src="{$EntityPath}/Wtilde_uc.gif" BORDER="0" ALT="Wtilde"/></xsl:template>
<xsl:template match="symbol[@name='wtilde']"><img src="{$EntityPath}/wtilde_lc.gif" BORDER="0" ALT="wtilde"/></xsl:template>
<xsl:template match="symbol[@name='Wuml']"><img src="{$EntityPath}/Wuml_uc.gif" BORDER="0" ALT="Wuml"/></xsl:template>
<xsl:template match="symbol[@name='wuml']"><img src="{$EntityPath}/wuml_lc.gif" BORDER="0" ALT="wuml"/></xsl:template>
<xsl:template match="symbol[@name='Xacute']"><img src="{$EntityPath}/Xacute_uc.gif" BORDER="0" ALT="Xacute"/></xsl:template>
<xsl:template match="symbol[@name='xacute']"><img src="{$EntityPath}/xacute_lc.gif" BORDER="0" ALT="xacute"/></xsl:template>
<xsl:template match="symbol[@name='Xbreve']"><img src="{$EntityPath}/Xbreve_uc.gif" BORDER="0" ALT="Xbreve"/></xsl:template>
<xsl:template match="symbol[@name='xbreve']"><img src="{$EntityPath}/xbreve_lc.gif" BORDER="0" ALT="xbreve"/></xsl:template>
<xsl:template match="symbol[@name='Xcaron']"><img src="{$EntityPath}/Xcaron_uc.gif" BORDER="0" ALT="Xcaron"/></xsl:template>
<xsl:template match="symbol[@name='xcaron']"><img src="{$EntityPath}/xcaron_lc.gif" BORDER="0" ALT="xcaron"/></xsl:template>
<xsl:template match="symbol[@name='Xcedil']"><img src="{$EntityPath}/Xcedil_uc.gif" BORDER="0" ALT="Xcedil"/></xsl:template>
<xsl:template match="symbol[@name='xcedil']"><img src="{$EntityPath}/xcedil_lc.gif" BORDER="0" ALT="xcedil"/></xsl:template>
<xsl:template match="symbol[@name='Xcirc']"><img src="{$EntityPath}/Xcirc_uc.gif" BORDER="0" ALT="Xcirc"/></xsl:template>
<xsl:template match="symbol[@name='Xdblac']"><img src="{$EntityPath}/Xdblac_uc.gif" BORDER="0" ALT="Xdblac"/></xsl:template>
<xsl:template match="symbol[@name='xdblac']"><img src="{$EntityPath}/xdblac_lc.gif" BORDER="0" ALT="xdblac"/></xsl:template>
<xsl:template match="symbol[@name='Xdie']"><img src="{$EntityPath}/Xdie_uc.gif" BORDER="0" ALT="Xdie"/></xsl:template>
<xsl:template match="symbol[@name='xdie']"><img src="{$EntityPath}/xdie_lc.gif" BORDER="0" ALT="xdie"/></xsl:template>
<xsl:template match="symbol[@name='Xdot']"><img src="{$EntityPath}/Xdot_uc.gif" BORDER="0" ALT="Xdot"/></xsl:template>
<xsl:template match="symbol[@name='xdot']"><img src="{$EntityPath}/xdot_lc.gif" BORDER="0" ALT="xdot"/></xsl:template>
<xsl:template match="symbol[@name='Xgrave']"><img src="{$EntityPath}/Xgrave_uc.gif" BORDER="0" ALT="Xgrave"/></xsl:template>
<xsl:template match="symbol[@name='xgrave']"><img src="{$EntityPath}/xgrave_lc.gif" BORDER="0" ALT="xgrave"/></xsl:template>
<xsl:template match="symbol[@name='Xmacr']"><img src="{$EntityPath}/Xmacr_uc.gif" BORDER="0" ALT="Xmacr"/></xsl:template>
<xsl:template match="symbol[@name='Xogon']"><img src="{$EntityPath}/Xogon_uc.gif" BORDER="0" ALT="Xogon"/></xsl:template>
<xsl:template match="symbol[@name='xogon']"><img src="{$EntityPath}/xogon_lc.gif" BORDER="0" ALT="xogon"/></xsl:template>
<xsl:template match="symbol[@name='Xring']"><img src="{$EntityPath}/Xring_uc.gif" BORDER="0" ALT="Xring"/></xsl:template>
<xsl:template match="symbol[@name='xring']"><img src="{$EntityPath}/xring_lc.gif" BORDER="0" ALT="xring"/></xsl:template>
<xsl:template match="symbol[@name='Xtilde']"><img src="{$EntityPath}/Xtilde_uc.gif" BORDER="0" ALT="Xtilde"/></xsl:template>
<xsl:template match="symbol[@name='xtilde']"><img src="{$EntityPath}/xtilde_lc.gif" BORDER="0" ALT="xtilde"/></xsl:template>
<xsl:template match="symbol[@name='Xuml']"><img src="{$EntityPath}/Xuml_uc.gif" BORDER="0" ALT="Xuml"/></xsl:template>
<xsl:template match="symbol[@name='xuml']"><img src="{$EntityPath}/xuml_lc.gif" BORDER="0" ALT="xuml"/></xsl:template>
<xsl:template match="symbol[@name='Ybreve']"><img src="{$EntityPath}/Ybreve_uc.gif" BORDER="0" ALT="Ybreve"/></xsl:template>
<xsl:template match="symbol[@name='ybreve']"><img src="{$EntityPath}/ybreve_lc.gif" BORDER="0" ALT="ybreve"/></xsl:template>
<xsl:template match="symbol[@name='Ycaron']"><img src="{$EntityPath}/Ycaron_uc.gif" BORDER="0" ALT="Ycaron"/></xsl:template>
<xsl:template match="symbol[@name='ycaron']"><img src="{$EntityPath}/ycaron_lc.gif" BORDER="0" ALT="ycaron"/></xsl:template>
<xsl:template match="symbol[@name='Ycedil']"><img src="{$EntityPath}/Ycedil_uc.gif" BORDER="0" ALT="Ycedil"/></xsl:template>
<xsl:template match="symbol[@name='ycedil']"><img src="{$EntityPath}/ycedil_lc.gif" BORDER="0" ALT="ycedil"/></xsl:template>
<xsl:template match="symbol[@name='Ydblac']"><img src="{$EntityPath}/Ydblac_uc.gif" BORDER="0" ALT="Ydblac"/></xsl:template>
<xsl:template match="symbol[@name='ydblac']"><img src="{$EntityPath}/ydblac_lc.gif" BORDER="0" ALT="ydblac"/></xsl:template>
<xsl:template match="symbol[@name='Ydie']"><img src="{$EntityPath}/Ydie_uc.gif" BORDER="0" ALT="Ydie"/></xsl:template>
<xsl:template match="symbol[@name='ydie']"><img src="{$EntityPath}/ydie_lc.gif" BORDER="0" ALT="ydie"/></xsl:template>
<xsl:template match="symbol[@name='Ydot']"><img src="{$EntityPath}/Ydot_uc.gif" BORDER="0" ALT="Ydot"/></xsl:template>
<xsl:template match="symbol[@name='ydot']"><img src="{$EntityPath}/ydot_lc.gif" BORDER="0" ALT="ydot"/></xsl:template>
<xsl:template match="symbol[@name='Ygrave']"><img src="{$EntityPath}/Ygrave_uc.gif" BORDER="0" ALT="Ygrave"/></xsl:template>
<xsl:template match="symbol[@name='ygrave']"><img src="{$EntityPath}/ygrave_lc.gif" BORDER="0" ALT="ygrave"/></xsl:template>
<xsl:template match="symbol[@name='Ymacr']"><img src="{$EntityPath}/Ymacr_uc.gif" BORDER="0" ALT="Ymacr"/></xsl:template>
<xsl:template match="symbol[@name='Yogon']"><img src="{$EntityPath}/Yogon_uc.gif" BORDER="0" ALT="Yogon"/></xsl:template>
<xsl:template match="symbol[@name='yogon']"><img src="{$EntityPath}/yogon_lc.gif" BORDER="0" ALT="yogon"/></xsl:template>
<xsl:template match="symbol[@name='Yring']"><img src="{$EntityPath}/Yring_uc.gif" BORDER="0" ALT="Yring"/></xsl:template>
<xsl:template match="symbol[@name='yring']"><img src="{$EntityPath}/yring_lc.gif" BORDER="0" ALT="yring"/></xsl:template>
<xsl:template match="symbol[@name='Ytilde']"><img src="{$EntityPath}/Ytilde_uc.gif" BORDER="0" ALT="Ytilde"/></xsl:template>
<xsl:template match="symbol[@name='ytilde']"><img src="{$EntityPath}/ytilde_lc.gif" BORDER="0" ALT="ytilde"/></xsl:template>
<xsl:template match="symbol[@name='Zbreve']"><img src="{$EntityPath}/Zbreve_uc.gif" BORDER="0" ALT="Zbreve"/></xsl:template>
<xsl:template match="symbol[@name='zbreve']"><img src="{$EntityPath}/zbreve_lc.gif" BORDER="0" ALT="zbreve"/></xsl:template>
<xsl:template match="symbol[@name='Zcedil']"><img src="{$EntityPath}/Zcedil_uc.gif" BORDER="0" ALT="Zcedil"/></xsl:template>
<xsl:template match="symbol[@name='zcedil']"><img src="{$EntityPath}/zcedil_lc.gif" BORDER="0" ALT="zcedil"/></xsl:template>
<xsl:template match="symbol[@name='Zcirc']"><img src="{$EntityPath}/Zcirc_uc.gif" BORDER="0" ALT="Zcirc"/></xsl:template>
<xsl:template match="symbol[@name='zcirc']"><img src="{$EntityPath}/zcirc_lc.gif" BORDER="0" ALT="zcirc"/></xsl:template>
<xsl:template match="symbol[@name='Zdblac']"><img src="{$EntityPath}/Zdblac_uc.gif" BORDER="0" ALT="Zdblac"/></xsl:template>
<xsl:template match="symbol[@name='zdblac']"><img src="{$EntityPath}/zdblac_lc.gif" BORDER="0" ALT="zdblac"/></xsl:template>
<xsl:template match="symbol[@name='Zdie']"><img src="{$EntityPath}/Zdie_uc.gif" BORDER="0" ALT="Zdie"/></xsl:template>
<xsl:template match="symbol[@name='zdie']"><img src="{$EntityPath}/zdie_lc.gif" BORDER="0" ALT="zdie"/></xsl:template>
<xsl:template match="symbol[@name='Zgrave']"><img src="{$EntityPath}/Zgrave_uc.gif" BORDER="0" ALT="Zgrave"/></xsl:template>
<xsl:template match="symbol[@name='zgrave']"><img src="{$EntityPath}/zgrave_lc.gif" BORDER="0" ALT="zgrave"/></xsl:template>
<xsl:template match="symbol[@name='Zmacr']"><img src="{$EntityPath}/Zmacr_uc.gif" BORDER="0" ALT="Zmacr"/></xsl:template>
<xsl:template match="symbol[@name='zmacr']"><img src="{$EntityPath}/zmacr_lc.gif" BORDER="0" ALT="zmacr"/></xsl:template>
<xsl:template match="symbol[@name='Zogon']"><img src="{$EntityPath}/Zogon_uc.gif" BORDER="0" ALT="Zogon"/></xsl:template>
<xsl:template match="symbol[@name='zogon']"><img src="{$EntityPath}/zogon_lc.gif" BORDER="0" ALT="zogon"/></xsl:template>
<xsl:template match="symbol[@name='Zring']"><img src="{$EntityPath}/Zring_uc.gif" BORDER="0" ALT="Zring"/></xsl:template>
<xsl:template match="symbol[@name='zring']"><img src="{$EntityPath}/zring_lc.gif" BORDER="0" ALT="zring"/></xsl:template>
<xsl:template match="symbol[@name='Ztilde']"><img src="{$EntityPath}/Ztilde_uc.gif" BORDER="0" ALT="Ztilde"/></xsl:template>
<xsl:template match="symbol[@name='ztilde']"><img src="{$EntityPath}/ztilde_lc.gif" BORDER="0" ALT="ztilde"/></xsl:template>
<xsl:template match="symbol[@name='Zuml']"><img src="{$EntityPath}/Zuml_uc.gif" BORDER="0" ALT="Zuml"/></xsl:template>
<xsl:template match="symbol[@name='zuml']"><img src="{$EntityPath}/zuml_lc.gif" BORDER="0" ALT="zuml"/></xsl:template>

<!-- greek and other accented entities-->
<xsl:template match="symbol[@name='Nscrdot']"><img src="{$EntityPath}/Nscrdot_uc.gif" BORDER="0" ALT="Nscrdot"/></xsl:template>
<xsl:template match="symbol[@name='rhotilde']"><img src="{$EntityPath}/rhotilde_lc.gif" BORDER="0" ALT="rhotilde"/></xsl:template>
<xsl:template match="symbol[@name='deltatilde']"><img src="{$EntityPath}/deltatilde_lc.gif" BORDER="0" ALT="deltatilde"/></xsl:template>
<xsl:template match="symbol[@name='kappamacr']"><img src="{$EntityPath}/kappamacr_lc.gif" BORDER="0" ALT="kappamacr"/></xsl:template>
<xsl:template match="symbol[@name='rhomacr']"><img src="{$EntityPath}/rhomacr_lc.gif" BORDER="0" ALT="rhomacr"/></xsl:template>
<xsl:template match="symbol[@name='etatilde']"><img src="{$EntityPath}/etatilde_lc.gif" BORDER="0" ALT="etatilde"/></xsl:template>
<xsl:template match="symbol[@name='sigmatilde']"><img src="{$EntityPath}/sigmatilde_lc.gif" BORDER="0" ALT="sigmatilde"/></xsl:template>
<xsl:template match="symbol[@name='thetasmacr']"><img src="{$EntityPath}/thetasmacr_uc.gif" BORDER="0" ALT="thetasmacr"/></xsl:template>
<xsl:template match="symbol[@name='Omegacirc']"><img src="{$EntityPath}/Omegacirc_uc.gif" BORDER="0" ALT="Omegacirc"/></xsl:template>
<xsl:template match="symbol[@name='phiscirc']"><img src="{$EntityPath}/phiscirc_uc.gif" BORDER="0" ALT="phiscirc"/></xsl:template>
<xsl:template match="symbol[@name='Psimacr']"><img src="{$EntityPath}/Psimacr_uc.gif" BORDER="0" ALT="Psimacr"/></xsl:template>
<xsl:template match="symbol[@name='sigmamacr']"><img src="{$EntityPath}/sigmamacr_uc.gif" BORDER="0" ALT="sigmamacr"/></xsl:template>
<xsl:template match="symbol[@name='mumacr']"><img src="{$EntityPath}/mumacr_uc.gif" BORDER="0" ALT="mumacr"/></xsl:template>
<xsl:template match="symbol[@name='deltacirc']"><img src="{$EntityPath}/deltacirc_uc.gif" BORDER="0" ALT="deltacirc"/></xsl:template>
<xsl:template match="symbol[@name='deltadot']"><img src="{$EntityPath}/deltadot_lc.gif" BORDER="0" ALT="deltadot"/></xsl:template>
<xsl:template match="symbol[@name='gammacirc']"><img src="{$EntityPath}/gammacirc_lc.gif" BORDER="0" ALT="gammacirc"/></xsl:template>
<xsl:template match="symbol[@name='taudot']"><img src="{$EntityPath}/taudot_lc.gif" BORDER="0" ALT="taudot"/></xsl:template>
<xsl:template match="symbol[@name='thgrcirc']"><img src="{$EntityPath}/thgrcirc_lc.gif" BORDER="0" ALT="thgrcirc"/></xsl:template>
<xsl:template match="symbol[@name='gammatilde']"><img src="{$EntityPath}/gammatilde_lc.gif" BORDER="0" ALT="gammatilde"/></xsl:template>
<xsl:template match="symbol[@name='epsitilde']"><img src="{$EntityPath}/epsitilde_lc.gif" BORDER="0" ALT="epsitilde"/></xsl:template>
<xsl:template match="symbol[@name='epsimacr']"><img src="{$EntityPath}/epsimacr_uc.gif" BORDER="0" ALT="epsimacr"/></xsl:template>
<xsl:template match="symbol[@name='Qscrmacr']"><img src="{$EntityPath}/Qscrmacr_uc.gif" BORDER="0" ALT="Qscrmacr"/></xsl:template>
<xsl:template match="symbol[@name='thgrmacr']"><img src="{$EntityPath}/thgrmacr_lc.gif" BORDER="0" ALT="thgrmacr"/></xsl:template>
<xsl:template match="symbol[@name='phgrcirc']"><img src="{$EntityPath}/phgrcirc_lc.gif" BORDER="0" ALT="phgrcirc"/></xsl:template>
<xsl:template match="symbol[@name='Omegacirc']"><img src="{$EntityPath}/Omegacirc_uc.gif" BORDER="0" ALT="Omegacirc"/></xsl:template>
<xsl:template match="symbol[@name='mumacr']"><img src="{$EntityPath}/mumacr_lc.gif" BORDER="0" ALT="mumacr"/></xsl:template>
<xsl:template match="symbol[@name='Psidot']"><img src="{$EntityPath}/Psidot_uc.gif" BORDER="0" ALT="Psidot"/></xsl:template>
<xsl:template match="symbol[@name='sigmamacr']"><img src="{$EntityPath}/sigmamacr_uc.gif" BORDER="0" ALT="sigmamacr"/></xsl:template>


</xsl:stylesheet>

