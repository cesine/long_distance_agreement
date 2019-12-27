// ClientScripts.js

	var iversion = -1;
	var iversion_minor = 0;
	var is_ie = false
	var is_ns = false
	var popupwindow = new Object();
	
	function version() {
	  var vn=0
	  if(iversion != -1) return iversion;
	  is_ie = (navigator.appName.indexOf("Internet Explorer") != -1);
	  is_ns = (navigator.appName.indexOf("Netscape") != -1);
	  iversion = parseInt(navigator.appVersion);
	  iversion_minor = parseFloat(navigator.appVersion); 
	  if(is_ns) {
	    vn = navigator.userAgent.indexOf ( "/" );
	    if ( vn >=0 )vn+=1;
	  } else if(is_ie){
	    vn = navigator.userAgent.indexOf ( "MSIE " );
	    if ( vn >=0 )vn+=5;
	  }
	  if(vn >=0)iversion = parseInt(navigator.userAgent.substring (vn, navigator.userAgent.indexOf (".", vn )))
	  return iversion;
	}

	var bv = version();
		
	function OnUnload(){
	for(type in popupwindow)popupwindow[type].close();
	}
	
	function img_act(imgName) {
	if (3 <= iversion) {
	imgOn = eval(imgName + "on.src");
	document [imgName].src = imgOn;
	}
	}
	
	function img_inact(imgName) {
	if (3 <= iversion) {
	imgOff = eval(imgName + "off.src");
	document [imgName].src = imgOff;
	}
	}

	function treplace(s,s1,s2){
		var p;
		while(p=s.indexOf(s1),p>=0) {
			s = s.substring(0,p) + s2 + s.substring(p+s1.length,s.length);}
		return s;
		}

	function makewindow(url) {
	window.open(url,"","scrollbars,resizable,height=550,width=750")
	return;
	}

	function extLink(url) { window.open(url);}
	

	function gotoTarget(name) {
		var dest_href ='';
		dst_name = name + '_NavString';
		if(asp[dst_name] && asp[dst_name].indexOf('>')< 0) {
			dest_href=asp[dst_name]
		} else {
			if(name=='pdf') {
				dest_href=src['base-filename'] + ".pdf";
			} else if(name='fulltext') {
				dest_href=src['base-filename'] + ".htm";
			} else {
				dest_href=src['base-filename'] + "_" + name + ".htm";
			}
		}
		if(!dest_href.length)return;
		if(name=='pdf') {
			open(dest_href,"","scrollbars,resizable,height=550,width=750")
		} else {
			location=dest_href;
		}
	}
	

	function mkImg(name) {
	return "<img border='0' src='" + ImagePath + "/" + name + ".gif'>";
	}


	popuphdr1  = "<table border='0' cellspacing='0' cellpadding='0' width='100%'>\n";
	if(is_ns) {
	popuphdr1 += "<tr><td colspan='2'>&nbsp;</td></tr>"; 
	}
	popuphdr1 += "<tr><td>";
	popuphdr1 += "<a href='javascript:closethis()'>" + mkImg("leftarrow") + " Close this Window</a>&nbsp;&nbsp;&nbsp;&nbsp;";
	popuphdr2  = "<a href='javascript:gotobottom()'>" + mkImg("downarrow") + " Legend</a>";
	popuphdr3  = "</td><td align='right'>" + mkImg("SynLogsm") + "</td></tr>\n";
	popuphdr3 += "<tr class='HeaderBar'><td colspan='2'><div class='HeaderBarDiv'>&nbsp;</div></td></tr>\n";
	popuphdr3 += "</table>\n";
	popuphdr3 += "<font size='-1'><br></font>\n";
	popupftr = "\n";
	popupftr += "<table border='0' cellspacing='0' cellpadding='0' width='100%'>\n";
	popupftr += "<tr><td colspan='2'>&nbsp;</td></tr>\n";
	popupftr += "<tr class='HeaderBar'><td Width='100%' colspan='2'><div class='HeaderBarDiv'>&nbsp;</div></td></tr>\n";
	popupftr += "<tr>";
	popupftr += "<td width='80%'><font size='-1'>" + CitationText + "</font></td>\n";
	popupftr += "<td align='right'><a href='javascript:gototop()'>" + mkImg("uparrow") + " Top</a></td>\n";
	popupftr += "</tr>";
	popupftr += "</table>\n";

	function popuprefs(ids){
		popupids(ids,'')
	}

	
	function popupids(ids,type){
		var newArray = ids.split(" ");
		var text = ""
		if (version()>=4){
			// create array of ref numbers.
			var refs = ""
			refs += "<head>\n"
			refs += "<title>" + src["document-reference-text"]
			if(type.indexOf("book:")!=-1) refs += " Book";
			if(type.indexOf("journal:")!=-1) refs += " Journal";
			if(type.indexOf(":figure")!=-1) refs += " Figure";
			if(type.indexOf(":table")!=-1) refs += " Table";
			if(type.indexOf(":reference")!=-1) refs += " Reference";
			refs += "</title>\n"
			refs += "<link rel='stylesheet' type='text/css' href='" + src['style-sheet-path'] + "/SStyleSheet.css'>\n"
			refs += "</head>"
											
			for (var i = 0; i < newArray.length; i++){
				if(sect[newArray[i]]) {
					text += sect[newArray[i]]
					}
				else if(is_ie && document.anchors(newArray[i])){
					text += document.anchors(newArray[i]).outerHTML
					}
			}
		}
		if (text.length > 10) {
			if(popupwindow[type] && !popupwindow[type].closed) {
				popupwindow[type].document.open()
			} else {
				popupwindow[type] = window.open("","","scrollbars,resizable,dependent,height=300,width=550");
			}
			var all;
			var w = popupwindow[type]
			all=refs + "<body>" + popuphdr1;
			all += popuphdr3 + text + popupftr +"\n</body>\n";
			w.focus()
			w.document.write(all)
			w.makewindow = function(theUrl) { makewindow(theUrl);}
			w.extLink = function(theUrl) { extLink(theUrl);}
			w.searchkeyword = function(terms) { searchkeyword(terms)}
			w.searchauthor = function(terms) { searchauthor(terms)} 
			w.searchpubmedid =function(id) { searchpubmedid(id)}
			w.searchgenbankid =function(id) { searchgenbankid(id)}
			w.searchads =function(id) { searchads(id)}
			w.closethis = function() { w.close();}
			w.gotobottom =function() {w.scrollTo(0,9999);}
			w.gototop = function() {w.scrollTo(0,0);}
			w.gotoanchor = function(anchor) {
				if(anchor.indexOf(" ")!=-1)
					anchor=anchor.substring(0,anchor.indexOf(" "))
				if(is_ie) {if(!w.document.anchors(anchor))return false;}
				else {if(!w.document.anchors[anchor])return false;}
				if(is_ns) {w.scrollTo(0,w.document.anchors[anchor].y);}
				else { w.location = "#" + anchor }
				return true;
				}
			w.popupids = function(ids,type) {
				if(!w.gotoanchor(ids))popupids(ids,type)
				}
			w.popuprefs = function(refnumber){
				if(!w.gotoanchor(refnumber))gotoanchor(refnumber)
				}
			w.document.close()
		}else{
			location = "#" + newArray[0]
		}
	}
	
	
	function searchkeyword(terms) {
		if(src["search-engine"] == "ADS") {
		return makewindow('http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?return_req=no_params&text=' + terms);
		} else {
		return makewindow('http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=PubMed&term=' + treplace(terms,":",".."));
		}}

	function searchauthor(terms) {
		if(src["search-engine"] == "ADS") {
		return makewindow('http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?return_req=no_params&author=' + treplace(terms,'+',', '));
		} else {
		return makewindow('http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=search&db=PubMed&term=' + terms + '[Author%20Name]');
		}}
	function searchpubmedid(sid) {
		return makewindow('http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&dopt=Abstract&list_uids=' + sid);
		}

	function searchads(sid) {
		return makewindow('http://adsabs.harvard.edu/cgi-bin/bib_query?db_key=ALL&bibcode=' + sid);
		}

	function searchgenbankid(sid) {
		return makewindow('http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Search&db=Nucleotide&dopt=GenBank&term=' + sid);
		}


	
	function searchform(myform) {
		var s = "";
		for(var i=0 ; i < myform.search.length ; i++) {
			if(is_ie) {
				if(myform.search(i).checked)s += " AND " + myform.search(i).value;
				} else {
				if(myform.search[i].checked)s += " AND " + myform.search[i].value;
				}
			}
		searchkeyword(escape(s.substring(5)));
		}
