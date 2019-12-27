<!--bpg4-0bpms.mod-->

<!ELEMENT answercode            (#PCDATA)>

<!ELEMENT binding               (#PCDATA)>

<!ELEMENT bindinggroup          (#PCDATA | %formatting; | %linksetc; | isbn | eisbn | binding | date | answercode | inspectioncopy | wwwexcludeflag | price)*>

<!ELEMENT bookdetails           (#PCDATA | %formatting; | %linksetc; | address | bindinggroup | bpmsid | contents | date | division | edition | isbn | eisbn | binding | countgroup | imprint | marketingblurb | namegroup | title | readergroup | reviewquotes | specialfeatures | subject | technicalrequirements | corporatename | documentid | etal | event | inpress | issue | miscellaneoustext | name | page | publisher | supplement | thesis | translated | volume)*>

<!ELEMENT bpmsid                (#PCDATA)>

<!ELEMENT contents              (#PCDATA | %data;)*>

<!ELEMENT imprint               (#PCDATA | %data;)*>

<!ELEMENT inspectioncopy        (#PCDATA)>

<!ELEMENT marketingblurb        ANY>

<!ELEMENT reviewquotes          ANY>

<!ELEMENT specialfeatures       ANY>

<!ELEMENT technicalrequirements ANY>

<!ELEMENT wwwexcludeflag        (#PCDATA)>

<!ELEMENT wwwlist               (bookdetails*)>

