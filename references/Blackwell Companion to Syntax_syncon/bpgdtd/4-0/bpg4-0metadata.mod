<!--bpg4-0metadata.mod-->

<!ELEMENT coden               (#PCDATA)>

<!ELEMENT contentcode         (#PCDATA)>

<!ELEMENT copyright           (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST copyright           type CDATA #IMPLIED>


<!ELEMENT count               EMPTY>
<!ATTLIST count               type  CDATA #REQUIRED
                              count CDATA #REQUIRED>


<!ELEMENT countgroup          (count)+>

<!ELEMENT division            (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT documentid          (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST documentid          type   CDATA #REQUIRED
                              id     CDATA  #REQUIRED
                              status (live|notlive) "live">


<!ELEMENT edition             (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT eisbn                (#PCDATA)>

<!ELEMENT eissn               (#PCDATA)>

<!ELEMENT idgroup             (documentid)+>

<!ELEMENT isbn                (#PCDATA)>

<!ELEMENT issn                (#PCDATA)>

<!ELEMENT issue               (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST issue               number  CDATA #IMPLIED
                              sequence CDATA #IMPLIED>

<!ELEMENT office              (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT page                (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST page                type CDATA #REQUIRED>

<!ELEMENT pagedetails         (volume?, (issue | supplement)?, page*)>

<!ELEMENT publisher           (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT publisherinfo       (publisher, address, division?, office?)>

<!ELEMENT ratinggroup         (rating)+>
<!ATTLIST ratinggroup         type  CDATA #IMPLIED>

<!ELEMENT rating              (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST rating              level (0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10) #REQUIRED
                              type  CDATA  #IMPLIED>

<!ELEMENT readergroup         (readership)+>

<!ELEMENT readership          (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST readership          type CDATA #IMPLIED>


<!ELEMENT runninghead         (#PCDATA | %formatting; | %linksetc;)*> 
<!ATTLIST runninghead         type  CDATA #REQUIRED>


<!ELEMENT runningheadgroup    (runninghead | link)+>

<!ELEMENT subject             (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST subject             level   (1 | 2 | 3 | 4 | 5 | 6) #IMPLIED
                              type CDATA #IMPLIED>

<!ELEMENT subjectgroup        (subject+)>
<!ATTLIST subjectgroup        type CDATA #IMPLIED>

<!ELEMENT supplement          (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST supplement          number  CDATA #IMPLIED>

<!ELEMENT titlegroup          (title)+>

<!ELEMENT title               (#PCDATA | %data;)*> 
<!ATTLIST title               type      CDATA     #IMPLIED
                              language  %isolang; #IMPLIED>


<!ELEMENT tocheading          (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST tocheading          level   CDATA #IMPLIED>

<!ELEMENT volume              (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST volume              number  CDATA #IMPLIED>

