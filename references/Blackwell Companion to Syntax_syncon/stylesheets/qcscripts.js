function list_files() {
   var fso, f, f1, fc, s, temp, files;
   //get path of current folder
   var folderspec = location.pathname.substring(1);
   var thisfile = folderspec.substring(folderspec.lastIndexOf('\\')+1);
   folderspec = folderspec.substring(0, folderspec.lastIndexOf('\\'));
   fso = new ActiveXObject("Scripting.FileSystemObject");
   f = fso.GetFolder(folderspec);
   //get names of all files in current folder
   fc = new Enumerator(f.files);
   s = "";
   temp="";
   for (; !fc.atEnd(); fc.moveNext())
   {
     temp = fc.item().name;
     if (temp.substring(temp.lastIndexOf('.')+1) == 'xml' && temp != thisfile) {
	     s += temp;
	     s += "&";
     }
   }
   
   files = s.split('&');
   
   for (var i = 0; i < files.length; i++) {
	document.write("<a href=\"javascript:makeHTML('" + files[i] + "', '" + this_style_sheet + "')\">" + files[i].substring(0, files[i].lastIndexOf('.')) + "</a><br />");
   		document.close();
   	}
   return;
}


function makeHTMLx(xmlfile,stylesheet) {
	//alert(xmlfile + ", " + src['style-sheet-path'] + "/" + stylesheet);
	var XMLDoc = new ActiveXObject("Msxml2.DOMDocument");
	XMLDoc.async = false;
	XMLDoc.validateOnParse = false;
	XMLDoc.load(xmlfile);
	
	var XSLDoc = new ActiveXObject("Msxml2.DOMDocument");
	XSLDoc.async = false;
	XSLDoc.validateOnParse = false;
	//XSLDoc.load(src['style-sheet-path'] + "/" + stylesheet);
	XSLDoc.load(stylesheet);
	
	var XSLoutput = XMLDoc.transformNode(XSLDoc);
	var abstract_win = window.open('','_self', 'resizable,status,width=500,height=300,scrollbars=yes');
	var abstract_doc = abstract_win.document;
	abstract_win.sect = new Object();
	abstract_doc.write(XSLoutput);
	abstract_doc.close();
}

function makeHTML(xmlfile,stylesheet) {
	//alert(xmlfile + ", " + src['style-sheet-path'] + "/" + stylesheet);
	var XMLDoc = new ActiveXObject("Msxml2.DOMDocument");
	XMLDoc.async = false;
	XMLDoc.validateOnParse = false;
	XMLDoc.load(xmlfile);
	
	var XSLDoc = new ActiveXObject("Msxml2.DOMDocument");
	XSLDoc.async = false;
	XSLDoc.validateOnParse = false;
	//XSLDoc.load(src['style-sheet-path'] + "/" + stylesheet);
	XSLDoc.load(stylesheet);
	
	var XSLoutput = XMLDoc.transformNode(XSLDoc);
	saveHTML(XSLoutput);
	var abstract_win = window.open('qc_temp_qc.htm','_self', 'resizable,status,width=500,height=300,scrollbars=yes');
	/*var abstract_doc = abstract_win.document;
	abstract_win.sect = new Object();
	abstract_doc.write(XSLoutput);
	abstract_doc.close();*/
}

function saveHTML(text)
{
	var folderspec = location.pathname.substring(1);
	folderspec = folderspec.substring(0, folderspec.lastIndexOf('\\'));
	alert(folderspec);
		
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var a = fso.CreateTextFile(folderspec + "\\qc_temp_qc.htm", true);
	a.Write(text);
	a.Close();
}
