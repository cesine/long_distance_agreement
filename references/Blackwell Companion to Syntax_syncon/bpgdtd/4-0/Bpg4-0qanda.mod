<!--Bpg4-0qanda.mod-->

<!--QUESTION GROUPS-->

<!ELEMENT answer      (#PCDATA | %data;)*>
<!ATTLIST answer      id         ID            #IMPLIED
                      rid        IDREFS        #IMPLIED
                      veracity   (true | false | falsebut) #IMPLIED
                      format     (inline | display) "display">

<!ELEMENT feedback    (#PCDATA | %data;)*>
<!ATTLIST feedback    id         ID            #IMPLIED
                      rid        IDREFS        #IMPLIED
                      level      (1 | 2 | 3 | 4 | 5 | 6) #IMPLIED
                      veracity   (true | false | falsebut | trueorfalse) #IMPLIED
                      format     (inline | display) "display">

<!ELEMENT hint        (#PCDATA | %data;)*>
<!ATTLIST hint        id         ID            #IMPLIED
                      rid        IDREFS        #IMPLIED
                      format     (inline | display) "display">

<!ELEMENT question    (#PCDATA | %data;)*>
<!ATTLIST question    id         ID            #IMPLIED
                      rid        IDREFS        #IMPLIED
                      type       CDATA         #IMPLIED
                      format     (inline | display) "display">

<!ELEMENT questiongroup          (heading | p | table | question | hint | answer | feedback | footnote | subjectgroup)+>
<!ATTLIST questiongroup          level (basic | intermediate | advanced) #IMPLIED
                                 type   CDATA         #IMPLIED
				 id     ID     #IMPLIED>


