<!-- bpg4-0date.mod-->

<!ELEMENT date             (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST date             date    CDATA #REQUIRED
                           dateend CDATA #IMPLIED
                           type    CDATA #IMPLIED>


<!ELEMENT trackinghistory       (#PCDATA | %formatting; | %linksetc; | trackingdate)*>

<!ELEMENT trackingdate          EMPTY>
<!ATTLIST trackingdate          type       CDATA   #REQUIRED
                                date       CDATA   #REQUIRED
                                by         CDATA   #IMPLIED
                                software   CDATA   #IMPLIED
                                version    CDATA   #IMPLIED>



