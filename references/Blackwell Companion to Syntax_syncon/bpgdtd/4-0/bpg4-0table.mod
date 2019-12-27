<!--bpg4-0table.mod-->

<!ELEMENT table          (legend?, tbl)+>
<!ATTLIST table          id      ID                                 #IMPLIED>

<!ELEMENT tbl            (tbltl?, tgroup+)>
<!ATTLIST tbl            id      ID                                 #IMPLIED
                         frame   (top|bottom|topbot|sides|all|none) #IMPLIED
                         colsep  %yesorno;                          #IMPLIED
                         rowsep  %yesorno;                          #IMPLIED
                         orient  (port |land)                       #IMPLIED
                         pgwide  %yesorno;                          #IMPLIED
                         type    (inline |icon |hscroll)            "inline" >

<!ELEMENT tbltl       (p+) >

<!ELEMENT tgroup       (colspec*, thead?, tfoot?, tbody+, tfoot?)>
<!ATTLIST tgroup        id        ID                                #IMPLIED
                        cols      CDATA                            #REQUIRED
                        tabstyle  CDATA                              #IMPLIED
                        colsep    %yesorno;                         #IMPLIED
                        rowsep    %yesorno;                         #IMPLIED
                        align     (left |right|center|justify|char) "left"
                        charoff   CDATA                           "50"
                        char      CDATA                             "">

<!ELEMENT thead        (colspec*, row+) >
<!ATTLIST thead         valign    (top |middle|bottom)              "bottom">

<!ELEMENT tbody        (row+) >
<!ATTLIST tbody         valign    (top |middle|bottom)              "top">

<!ELEMENT tfoot        (colspec*, row+)>
<!ATTLIST tfoot        valign     (top |middle|bottom)              "bottom">

<!ELEMENT colspec      EMPTY >
<!ATTLIST colspec      colnum     CDATA                             #IMPLIED
                       colname    NMTOKEN                            #IMPLIED
                       colsep     %yesorno;                          #IMPLIED
                       rowsep     %yesorno;                          #IMPLIED
                       align     (left|right|center|justify|char)    #IMPLIED
                       charoff    CDATA                            #IMPLIED
                       char       CDATA                              #IMPLIED
                       colwidth   CDATA                              #IMPLIED>



<!ELEMENT row          (entry+) >
<!ATTLIST row          rowsep    %yesorno;                           #IMPLIED>

<!ELEMENT entry        (#PCDATA | %data;)*>
<!ATTLIST entry         colname   NMTOKEN                               #IMPLIED
                        namest    NMTOKEN                               #IMPLIED
                        nameend   NMTOKEN                               #IMPLIED
                        morerows  CDATA                                "0"
                        colsep    %yesorno;                             #IMPLIED
                        rowsep    %yesorno;                             #IMPLIED
                        rotate    CDATA                                "0"
                        valign    (top |middle |bottom)                 #IMPLIED
                        align     (left |right |center |justify |char)  #IMPLIED
                        charoff   CDATA                               #IMPLIED
                        char      CDATA                                 #IMPLIED>
