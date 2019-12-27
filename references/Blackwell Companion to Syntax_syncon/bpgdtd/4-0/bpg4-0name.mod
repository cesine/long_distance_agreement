<!--bpg4-0name.mod-->

<!ENTITY % nameelements		"(nametitle | forenames | surnameprefix | surname | qualifications | pedigree | roles | fullname | link | x | br)+">


<!ELEMENT alternativename	(%nameelements;)>
<!ATTLIST alternativename	type CDATA #IMPLIED
				language %isolang; #IMPLIED>

<!ELEMENT correspondent         (#PCDATA | %formatting; | %linksetc; | heading | name | address)*> 
<!ATTLIST correspondent         id   ID    #IMPLIED
				type CDATA #IMPLIED>

<!ELEMENT corporatename         (#PCDATA | %formatting; | %linksetc;)*>
<!ATTLIST corporatename         type   CDATA #IMPLIED
                                format (inline | display) #IMPLIED>

<!ELEMENT etal                  (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT forenames             (#PCDATA | %formatting; | %linksetc; | file)*>
<!ATTLIST forenames             type CDATA #IMPLIED>

<!ELEMENT fullname		(#PCDATA | %formatting; | %linksetc; | file)*>

<!ELEMENT name                  (%nameelements; | alternativename)+>
<!ATTLIST name                  type CDATA #IMPLIED>



<!ELEMENT namegroup             (heading | name | corporatename | address | etal | miscellaneoustext | link | x | br)+>
<!ATTLIST namegroup             type           CDATA              #IMPLIED
                                format         (inline | display) #IMPLIED
                                databasesearch CDATA              #IMPLIED>


<!ELEMENT nametitle             (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT pedigree              (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT qualifications        (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT roles                 (#PCDATA | %formatting; | %linksetc;)*>

<!ELEMENT surname               (#PCDATA | surnameprefix | %formatting; | %linksetc; | file)*>

<!ELEMENT surnameprefix         (#PCDATA | %formatting; | %linksetc;)*>

