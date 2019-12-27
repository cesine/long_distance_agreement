<!--bpg4-0math.mod-->

<!--
     Mathematical Markup Language (MathML(tm)) 
-->

<!ENTITY % basicmathelements			"(math | simplemath | file | tex)">
<!ENTITY % fullmathelements         		"(%basicmathelements;, alternativemath*)">

<!ENTITY % MathML             SYSTEM    "mathml.dtd">
%MathML;

<!ELEMENT alternativemath     (%basicmathelements;)>
<!ATTLIST alternativemath     type CDATA #REQUIRED>



<!ELEMENT formula		(number?, %fullmathelements;, x?, number?)>
<!ATTLIST formula		id       ID         #IMPLIED
				format (inline | display) "display"
				source   CDATA   #IMPLIED>

<!ELEMENT simplemath          (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT tex                 (#PCDATA)>
<!ATTLIST tex                 type      CDATA     #IMPLIED>

