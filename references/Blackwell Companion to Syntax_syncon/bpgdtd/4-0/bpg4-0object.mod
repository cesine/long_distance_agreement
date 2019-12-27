<!--bpg4-0object.mod-->

<!ELEMENT alternativeversion      (objectsource, legend?)>

<!ELEMENT file                    (copyright | parameter)*>
<!ATTLIST file                    name        CDATA    #REQUIRED
                                  type        CDATA    #REQUIRED
                                  id          ID       #IMPLIED
                                  colour      CDATA    #IMPLIED
                                  width       CDATA    #IMPLIED
                                  height      CDATA    #IMPLIED
                                  filesize    CDATA    #IMPLIED
                                  dpi         CDATA    #IMPLIED
                                  sequence    (1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10) #IMPLIED
                                  note        CDATA    #IMPLIED>


<!ELEMENT filegroup               (file+)>
<!ATTLIST filegroup               id        ID                #REQUIRED>


<!ELEMENT insitu                  ANY>
<!ATTLIST insitu                  id        ID                #REQUIRED>

<!ELEMENT legend                  (p | formula | table)+>
<!ATTLIST legend                  id        ID                #IMPLIED
                                  type      CDATA             #IMPLIED
				  language %isolang; "en">

<!ELEMENT object                  (objectsource | keywordgroup | subjectgroup | heading | legend | objectnote | alternativeversion)+>
<!ATTLIST object                  id       ID                 #REQUIRED
                                  type     CDATA              #REQUIRED
                                  position (fixed | floating) #REQUIRED
                                  format   (inline | display) "display">



<!ELEMENT objectgroup        (object | objectsubgroup)+>

<!ELEMENT objectsubgroup     (object | objectsource | keywordgroup | subjectgroup | heading | legend | objectnote | alternativeversion)+>
<!ATTLIST objectsubgroup     id       ID                 #REQUIRED>

<!ELEMENT objectnote         (p+)>

<!ELEMENT parameter          (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST parameter          type        CDATA       #REQUIRED
                             name        CDATA       #REQUIRED>

<!ELEMENT shortlegend        (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT objectsource             ((filegroup | file) | insitu)>
