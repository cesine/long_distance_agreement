<!--bpg4-0toc.mod-->

<!ELEMENT toc (title?, section+)>

<!ELEMENT tocentry           ((subjectgroup | idgroup | contentcode | tocheading | date | pagedetails | titlegroup | namegroup | p | externallink)+)>
<!ATTLIST tocentry           id                   CDATA #IMPLIED
                             type                 CDATA #REQUIRED
                             supplementarycontent CDATA #IMPLIED
                             sequence             CDATA #IMPLIED>

