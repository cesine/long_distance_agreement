<!--bpg4-0formatting.mod-->

<!ELEMENT accent            (ac, am)> 
<!ELEMENT ac                (#PCDATA | %formatting; | %linksetc;)*>
<!ELEMENT am                (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT accolade          (#PCDATA | %data;)*>
<!ATTLIST accolade          type   CDATA #REQUIRED
                            side   CDATA #REQUIRED
                            offset CDATA #REQUIRED>

<!ELEMENT b                 (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT fill              EMPTY>
<!ATTLIST fill              type   CDATA #REQUIRED
                            length CDATA #IMPLIED>

<!ELEMENT font              (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST font              name    CDATA #REQUIRED>

<!ELEMENT highlight         (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST highlight         bgcolor  CDATA #REQUIRED> 


<!ELEMENT i                    (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT openface             (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT overline             (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT roman                (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT smallcapitals        (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT scriptface           (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT slanted              (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT span                 (#PCDATA | %formatting; | %linksetc; | related | formula | object)*> 
<!ATTLIST span                 id      ID     #REQUIRED>

<!ELEMENT sansserif            (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT strike               (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT sub                  (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT sup                  (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT tt                   (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT u                    (#PCDATA | %formatting; | %linksetc;)*> 

<!ELEMENT uu                   (#PCDATA | %formatting; | %linksetc;)*> 

