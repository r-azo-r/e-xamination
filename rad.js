// JavaScript Documentfunction a()
function a()
{
	
    var op1=document.getElementById("ra");
    var op2=document.getElementById("rb");
    var op3=document.getElementById("rc");
    var op4=document.getElementById("rd");
	
    if(op1.checked==true)
        document.getElementById("subans").value="a";
	 
    else if(op2.checked==true)
        document.getElementById("subans").value="b";
	  
    else if(op3.checked==true)
        document.getElementById("subans").value="c";
	  
    else if(op4.checked==true)
        document.getElementById("subans").value="d";

//alert	(document.getElementById("subans").value);
//alert("sub:"+document.getElementById("subans").value+"  qid:"+document.getElementById("qid").value);
}

var it=0;
function showadd()
{

    var a=document.getElementById("regformbox");
    //a.style.visibility="visible";
    if(it%2==0)
        a.style.visibility="visible";
    else
        a.style.visibility="hidden";
    it=(it+1)%2;
}
flag=false;
function isempty() 
{
    if(document.getElementById("regname").value=="")
        {document.getElementById("errorname").style.visibility="visible";return false;}
    else 
        {
            document.getElementById("errorname").style.visibility="hidden";return true;
        }
}
function confirmpwd()
{
    var a=document.getElementById("regpwd");
    var b=document.getElementById("regcpwd");
    
    if(a.value!=b.value || a.value=="")
        {document.getElementById("errorpwd").style.visibility="visible";return false;}
    else
        {document.getElementById("errorpwd").style.visibility="hidden";return true;
        }
}

 function submitcontrol()
 {
     if (isempty() && confirmpwd())
         {
            document.getElementById("submit").disabled=false;
         }
         else
             document.getElementById("submit").disabled=true;
 }

 function remques()
 {
     var a=document.getElementById("qlbx");
     //alert(a);
     document.getElementById("qid").value=a.selectedIndex;


       document.getElementById("aqid").value=document.remqform.qlbx.options[a.selectedIndex].value;

     //alert(a);
    
 }
  function edtques()
 {
     var a=document.getElementById("qlbx");
     //alert(a);
     document.getElementById("qid").value=a.selectedIndex;


       document.getElementById("aqid").value=a.options[a.selectedIndex].value;
  //alert(a.options[a.selectedIndex].value);
     //alert(a);

 }
   function remuser()
 {
     var a=document.getElementById("ulbx");
     //alert(a);
     document.getElementById("name").value=a.selectedIndex;
    

      document.getElementById("name").value=a.options[a.selectedIndex].value;
  //alert(a.options[a.selectedIndex].value);
     //alert(a);

 }