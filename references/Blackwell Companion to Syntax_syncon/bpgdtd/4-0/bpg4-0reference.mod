<!--bpg4-0reference.mod-->

<!ELEMENT newspaper            (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT reference            (number?, (address | corporatename | date | documentid | edition | etal | event | inpress | issue | miscellaneoustext | name | namegroup | newspaper | page | title | publisher | supplement | thesis | translated | volume | x | link | externallink)+, reference*)>
<!ATTLIST reference            id     ID    #IMPLIED
                               type   CDATA #REQUIRED
                               format (inline | display) "display">

<!ELEMENT thesis               (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT translated           (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT inpress              (#PCDATA | %formatting; | %linksetc;)*>
