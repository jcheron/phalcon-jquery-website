var filesAdded=['js/bootstrap.min.js','/phalcon-jquery-website/css/bootstrap.min.css'];
 
function checkLoadAssetsFile(filename, filetype){
	if (fileLoaded(filename)===undefined){
		loadAssetsFile(filename, filetype);
		filesAdded.push(filename);
	}
}
function loadAssetsFile(filename, filetype){
	if (filetype=="js"){
		var fileref=document.createElement('script');
		fileref.setAttribute("type","text/javascript");
		fileref.setAttribute("src", filename);
	}
	else if (filetype=="css"){
		var fileref=document.createElement("link");
		fileref.setAttribute("rel", "stylesheet");
		fileref.setAttribute("type", "text/css");
		fileref.setAttribute("href", filename);
	}
	if (typeof fileref!="undefined")
		document.getElementsByTagName("head")[0].appendChild(fileref);
}

function removeAssetsFile(filename, filetype){
	var removed=false;
	var targetelement=(filetype=="js")? "script" : (filetype=="css")? "link" : "none";
	var targetattr=(filetype=="js")? "src" : (filetype=="css")? "href" : "none";
	var allsuspects=document.getElementsByTagName(targetelement);
	for (var i=allsuspects.length; i>=0; i--){
		if (allsuspects[i] && allsuspects[i].getAttribute(targetattr)!=null && allsuspects[i].getAttribute(targetattr).indexOf(filename)!=-1){
			allsuspects[i].parentNode.removeChild(allsuspects[i]);
			removed=true;
		}
    }
	if(removed===true){
		var index=fileLoaded(filename);
		if(index!=undefined)
		filesAdded.splice(index,1);
	}
}

function fileLoaded(fileName){
	for(var index in filesAdded){
		f=filesAdded[index];
		if(f.indexOf(fileName)!==-1){
			return index;
		}
	}
}