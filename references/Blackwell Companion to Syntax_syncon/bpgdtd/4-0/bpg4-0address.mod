<!--bpg4-0address.mod-->

<!ELEMENT address           (#PCDATA | %formatting; | %linksetc; | roles | room | building | institution | street | city | state | zip | country | tel | fax)*> 
<!ATTLIST address           id     ID    #IMPLIED
                            type   CDATA #IMPLIED
                            format (inline | display) "inline">

<!ELEMENT building          (#PCDATA | %formatting;)*>

<!ELEMENT city              (#PCDATA | %formatting;)*>

<!ELEMENT country           (#PCDATA | %formatting;)*>
<!ATTLIST country	    countrycode CDATA #IMPLIED><!-- see http://www.w3.org/International/O-misc-iso3166.html -->

<!ELEMENT fax               (#PCDATA | %formatting;)*>

<!ELEMENT institution       (#PCDATA | %formatting;)*>

<!ELEMENT room              (#PCDATA | %formatting;)*>

<!ELEMENT state             (#PCDATA | %formatting;)*>

<!ELEMENT street            (#PCDATA | %formatting;)*>

<!ELEMENT tel               (#PCDATA | %formatting;)*>

<!ELEMENT zip               (#PCDATA | %formatting;)*>

