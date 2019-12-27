<!--bpg4-0content.mod-->

<!ELEMENT content           (publisherinfo, contentinfo, (documentgroup+ | document))>
<!ATTLIST content           docfmt    (xml)      "xml"
                            dtdver    (4.0)      "4.0">

<!ELEMENT contentinfo       (contentcode, titlegroup, edition?, namegroup?, ((issn, eissn?, coden?) | (isbn, eisbn?))?, copyright*, date*, idgroup?)>
<!ATTLIST contentinfo       language %isolang; "en"
                            type  CDATA #IMPLIED>


<!ELEMENT document          (header, section*, objectgroup?, commentgroup?)+>
<!ATTLIST document          sequence      CDATA #REQUIRED
                            type          CDATA #REQUIRED
                            referencetype (harvard | vancouver) #IMPLIED>


<!ELEMENT documentgroup              (header, document+)>
<!ATTLIST documentgroup              type CDATA #IMPLIED>


<!ELEMENT documentinfo               (idgroup, relatedgroup?, date+, pagedetails?, countgroup?, copyright?, trackinghistory?, tocheading*, readergroup?, subjectgroup?, ratinggroup?, runningheadgroup?, history?, namegroup?)>
<!ATTLIST documentinfo               language %isolang; "en">


<!ELEMENT header                     (documentinfo, (titlegroup | namegroup | summary | keywordgroup | definitiongroup | correspondent | footnotegroup | history | abstractinfo | copyright | bookdetails)+)>

<!ELEMENT section                    (%bodytext; | correspondent | definitiongroup | history | indexgroup | keywordgroup | namegroup | notegroup | questiongroup | subsection | summary | titlegroup | contents | tocentry | bookdetails)+>
<!ATTLIST section                    id       ID         #REQUIRED
                                     type     CDATA      #IMPLIED
                                     language %isolang;  "en">



<!ELEMENT subsection        (%bodytext; | heading | definitiongroup | namegroup | notegroup | questiongroup | subsection | tocentry | bookdetails)+>
<!ATTLIST subsection        id            ID                                             #REQUIRED
                            level         (0 | 1 | 2 | 3 | 4 | 5 | 6)                    #REQUIRED
                            type          CDATA                                          #IMPLIED
                            relativesize  CDATA                                          #IMPLIED
                            border        CDATA                                          #IMPLIED
                            bgcolor       CDATA                                          #IMPLIED
                            language      %isolang;                                      "en">




