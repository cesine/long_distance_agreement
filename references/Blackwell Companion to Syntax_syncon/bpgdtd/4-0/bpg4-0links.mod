<!--bpg4-0links.mod-->

<!ELEMENT externallink       (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST externallink       type   CDATA #REQUIRED
                             id     CDATA #IMPLIED>  


<!ELEMENT link              (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST link              rid     IDREFS        #REQUIRED
                            type    CDATA         #IMPLIED
                            callin  IDREFS        #IMPLIED>


<!ELEMENT related           (file | externallink | reference)+>
<!ATTLIST related           relationship CDATA #REQUIRED
                            type         CDATA #REQUIRED>


<!ELEMENT relatedgroup        (related)+>

