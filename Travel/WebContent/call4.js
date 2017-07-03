function logout()
{
//window.open("sucess.jsp","_self");
window.open("logout.jsp","_self");
}



function Edit()
{
//window.open("sucess.jsp","_self");
window.open("update.jsp","_self");
}


function save(pname,pid,address)
{
	console.log(pname);
	console.log(pid);
	
      console.log(address);
	var xmlhttp;
	
	if (window.XMLHttpRequest)
	  {
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	  {
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
		 var val=(xmlhttp.responseText);
	   alert(val);
	    }
	  }
	xmlhttp.open("POST","save.jsp",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("&pname="+pname+"&pid="+pid+"&address="+address);
	}


