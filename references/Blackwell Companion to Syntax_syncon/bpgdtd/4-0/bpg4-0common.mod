<!--bpg4-0common.mod-->

<!ELEMENT abstractinfo              (#PCDATA | %linksetc; | %formatting; | p)*>
<!ATTLIST abstractinfo              format (inline | display) "display">

<!ELEMENT alternativeformat         (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST alternativeformat         type  CDATA  #REQUIRED>

<!ELEMENT br                        EMPTY>

<!ELEMENT symbol                    (#PCDATA)>
<!ATTLIST symbol                    name CDATA #REQUIRED
                                    ascii CDATA #IMPLIED
                                    unicode CDATA #IMPLIED
                                    description CDATA #IMPLIED
                                    type CDATA #IMPLIED>

<!ELEMENT comment                  (#PCDATA | %linksetc; | %formatting;)*>
<!ATTLIST comment                  id     ID     #REQUIRED
                                   type   CDATA  #REQUIRED>


<!ELEMENT commentgroup             (comment)+>

<!ELEMENT definitionpair           (term | definition | link | x | br)+>
<!ATTLIST definitionpair           id     ID     #IMPLIED>

<!ELEMENT definitiongroup          (heading | p | definitionpair | link | x | br)+>
<!ATTLIST definitiongroup          type CDATA #REQUIRED>


<!ELEMENT definition                (#PCDATA | %data;)*>

<!ELEMENT event                     (#PCDATA | %linksetc; | %formatting; | date | title | name | namegroup | address | corporatename | miscellaneoustext | p)*> 
<!ATTLIST event                     id   ID #IMPLIED>

<!ELEMENT footnotegroup             (keywordgroup | definitiongroup | correspondent | history | footnote | abstractinfo | link | br)+>

<!ELEMENT footnote                  (p | link)+>     
<!ATTLIST footnote                  id     ID     #IMPLIED
                                    type   CDATA  #IMPLIED>


<!ELEMENT genesequence              (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT heading                   (#PCDATA | %data;)*>     
<!ATTLIST heading                   id       ID     #REQUIRED
                                    level    (0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8) #REQUIRED
                                    format   (inline | display) "display"
                                    implicit (yes | no) "no">

<!ELEMENT history                   (heading | p)+>

<!ELEMENT indexentry                (reference | name | page | subject | keyword | x)+>
<!ATTLIST indexentry                id     ID     #REQUIRED>

<!ELEMENT indexgroup                (heading | indexentry)+>
<!ATTLIST indexgroup                type     CDATA     #REQUIRED>


<!ELEMENT keyword                   (#PCDATA | %data;)*>
<!ATTLIST keyword                   level   (1 | 2 | 3 | 4 | 5 | 6) #IMPLIED>

<!ELEMENT keywordgroup              (heading | keyword | link | x | br)+>
<!ATTLIST keywordgroup              class              CDATA #IMPLIED 
                                    language           %isolang; "en"
                                    format             (inline | display) "display"
                                    databasesearch     CDATA #IMPLIED>


<!ELEMENT layeredtext                 (#PCDATA | %data;)*>
<!ATTLIST layeredtext                 type      CDATA   #IMPLIED
                                      id        ID      #IMPLIED
                                      sequence  CDATA   #IMPLIED
                                      rid       IDREFS  #IMPLIED>

<!ELEMENT li                          (number?, p+)>
<!ATTLIST li                          level (1 | 2 | 3 | 4 | 5 | 6) "1"
                                      padding-bottom     CDATA     #IMPLIED>

<!ELEMENT listgroup                   (li)+>
<!ATTLIST listgroup                   id    ID     #IMPLIED
                                      type  CDATA  #IMPLIED>

<!ELEMENT miscellaneoustext           (#PCDATA | %data;)*>

<!ELEMENT notegroup                   (heading | footnote | link)+>

<!ELEMENT number                      (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT p                           (#PCDATA | %data; | shortlegend | bookdetails)*>

<!ELEMENT price                       (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST price			      currency  CDATA  #IMPLIED
                                      value     CDATA  #IMPLIED>

<!ELEMENT quotation                   (heading | p | source)+>
<!ATTLIST quotation                   type      CDATA #IMPLIED >

<!ELEMENT softbr                      EMPTY>

<!ELEMENT source                      (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT summary                     (heading | abstractinfo | title | %bodytext; | link | x | br)+>
<!ATTLIST summary                     language %isolang; "en">

<!ELEMENT term                        (#PCDATA | %data;)*>

<!ELEMENT x                           (#PCDATA | %linksetc; | %formatting;)*>
<!ATTLIST x                           xml:space (default|preserve) 'preserve'>	
