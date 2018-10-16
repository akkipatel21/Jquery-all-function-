<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"	src="https://rawgit.com/select2/select2/master/dist/js/select2.js"></script>
<script type="text/javascript"  src="https://rawgit.com/select2/select2/master/dist/css/select2.min.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet"/>

<style>
span{
color:red
}
#results td,th{
    border: 1px solid black;
    width:120px;
   padding:2px;
   }
input[type=text], select {
    width: 10%;
    padding: 4px 4px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 10%;
    background-color: #4CAF50;
    color: white;
    padding: 4px 10px;
    margin: 4px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}
div {
    border-radius: 5px;
    background-color: #ffff99;
   
}
.red-border{
    border: 1px solid red;
}
.ui-combobox {
	display: inline-block;
	margin: 0;
	margin-right: 1.8em;
	position: relative;
}
.ui-combobox-input {
	padding: 0.2em;
	margin: 0;
}
.ui-combobox-button {
	position: absolute;
	width: 1.8em !important;
	margin: 0;
	margin-left: -1px;
	top: 0;
	bottom: 0;
}
.ui-combobox-button .ui-button-text {
	padding: 0em;
}
.ui-combobox .ui-autocomplete {
	max-height: 10em;
	overflow-y: auto;
	overflow-x: hidden;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

 <script>
 
  function validateForm() { 
 	 var valid = true;
	 var fname = document.forms["myForm"]["fname"].value; 
	 var lname = document.forms["myForm"]["lname"].value; 
	 var homeno = document.forms["myForm"]["home"].value; 
	 var pin = document.forms["myForm"]["pincode"].value; 
	 var patt = /[0-9]/g; 
	 var pinvalid= /^\d{6}$/;
	 var result = fname.match(patt); 
	 var result1 = lname.match(patt);
	 var pinmatch= pin.match(pinvalid);
	 var nomatch= homeno.match(patt);
	if((fname == "") || (result)){
		 $('#errfname').text('Enter a valid name/ ');
		 <!-- $('input[name=fname]').css('outline', '1px solid red'); -->
	     valid = false;
	 }else{
		 $('#errfname').text('');
		 valid = true;
	 }
	 if((lname == "") || (result1)){ 
	     $('#errlname').text('enter a valid last name/ ');
	     valid = false;
	 }else{
		$('#errlname').text('');
	     valid = true;
	 }
	 
	 if($('input[name=gender]:checked').length <= 0) { 
       $('#errgen').text('please Select Gender/  ');
       valid = false;
     } else{
		$('#errgen').text('');
       valid = true;
	 }
     if(document.forms["myForm"]["hobby"].value==0){
		 $('#errhobby').text('select atleast one hobby/ ');
		 valid = false; 
	 }else{
		$('#errhobby').text('');
		 valid = true; 
	 }
     if((document.forms["myForm"]["home"].value=="")||(!nomatch)) {
     	$('#errhom').text('Enter valid home no./ ');
  	    valid = false;   
     }else{
		$('#errhom').text('');
  	    valid = true;
	 }
     if(document.forms["myForm"]["residency"].value==""){
 	     $('#errres').text('Enter Residency name/ ');
 		valid = false;	 
 	}else{
		 $('#errres').text('');
 		valid = true;	 
	}
    if(!pinmatch) {
    	$('#errpin').text('Enter Six digits pin/ ');
 	    valid = false;  
    } else{
		$('#errpin').text('');
 	    valid = true;  
	} 
    if(document.forms["myForm"]["coun"].value==""){
	     $('#errcoun').text('select Country/ ');
		valid = false;  	 
	}else{
		$('#errcoun').text('');
		valid = true;
	}
    if((fname=="") ||(lname=="") ||(result)||(result1)||(!nomatch)|| ($('input[name=gender]:checked').length <= 0)||(document.forms["myForm"]["hobby"].value==0)||(document.forms["myForm"]["home"].value=="")
			||(document.forms["myForm"]["residency"].value=="")||(pin=="")||(!pinmatch)||(document.forms["myForm"]["coun"].value=="")){
		$("#btnSubmit").prop('disabled', false);
		return false;
	} else {
		updateForm();
		/* $("#btnSubmit").prop('disabled', false); */
	}
	
 }  

 $(document).ready(function(){
	$('#btnSubmit').click(function(){
		validateForm();
		
	}); 
	$('#resetbtn').click(function(){
		$('#input1').focus();
		
	}); 
	 $('#input1,#input2').on('keypress', function(e) {
	        if (e.which == 32)
	            return false;
	    });
 }); 
  
 
</script> 

<body>
	<div id="getFromDetails" style="width: 1400px; height: 350px; background-color:  #ffff99; color: black; float: left;">
	<form name="myForm" id="myForm">
		<div style="width: 375px; height: 350px; background-color:  #ffff99; color: black; float: left;"><table>
		    <tr><td>First Name:</td><td><input type="text" name="fname" id="input1" style=" width:80%;" autofocus></td><td></td></tr>
		    <tr><td>Last Name:</td><td><input type="text" name="lname" id="input2" style=" width:80%;"></td><td></td></tr>
			<tr><td>Gender:</td><td><input type="radio" id="gen" name="gender" value="male">	Male
			  <input type="radio" name="gender" id="gen" value="female">Female</td><td></td></tr>
			  
			  
			
		<tr>	<td colspan="2">Skills:
			<select id="hobby" name="hobby" multiple="multiple" style="width: 200px">
				<option value="Reading">Reading</option>
				<option value="Music">Music</option>
				<option value="Singing">Singing</option>
				<option value="Dancing">Dancing</option>
				<option value="Coocking">Coocking</option>
				<option value="Swimimg">Swimimg</option>
				<option value="Gymimg">Gymimg</option>
			</select></tr><br>
			</table>
		</div>
			<div style="width: 375px; height: 350px; background-color:  #ffff99; color: black; float: left;"  class="input_fields_wrap" ><br><br>	Address:<!-- <button class="add_field_button btn btn-info">+</button> --><br><br>
				<div id="copy" style="height: 1px; width: 1375px;">
					Home no:<input type="text" id="hom" name="home">
					Residency:<input type="text" id="res"name="residency">
					Pincode:<input type="text" id="pin" name="pincode">
				</div>
				
			<br>
			<div><br>
				Select Country: <select id="Country" name="coun" style="width: 100px">
					<option value=""></option>
					<option value="india">India</option>
					<option value="Pakistan">Pakistan</option>
					<option value="USA">USA</option>
					<option value="Canada">Canada</option>
					<option value="Russia">Russia</option>
					<option value="China">China</option>
				</select>
			</div>
		</div>
		<div style="width: 500px; height: 120px; background-color: #ffff99; position: absolute; left: 422px; bottom: 270px;color: black; text-align: center; float: right">
			<span id="errfname"></span><span id="errlname"></span><br>
			<span id="errgen"></span><span id="errhobby"></span><br><span id="errhom"></span><br><span id="errres"></span><br>
			<span id="errpin"></span><br><span id="errcoun"></span>
			
		
		</div>
		<div style="width: 1400px; height: 250px; background-color: #ffffff; color: black; text-align: center; float: right">
		<input style="position: absolute; left: 572px; bottom: 400px;" type="button" value="Save" id="btnSubmit"onClick="ValidateForm();" />  <input style="position: absolute; left: 652px; bottom: 400px;"  type="reset" name="reset" id="resetbtn" class="resetbtn" value="Reset" />
		<table id="results"  class="result"width="1260" float="center">
        <thead>
        <tr  style="border: 1px solid black;">
            <th>First Name</th>
            <th>Last Name</th>
            <th>Sex</th>
            <th>Hobby</th>
            <th>Home no.</th>
            <th>Residency</th>
            <th>Pincode</th>
            <th>Country</th>
            
        </tr>
        </thead>
    </table>
 
	</div>
	</form>
	</div>
	

</body>

<script>
function updateForm() {
    var first = document.getElementById("input1").value;
    var last = document.getElementById("input2").value;
    var gen = document.getElementById("gen").value;    
    var hob = document.getElementById("hobby").value;
    var hno = document.getElementById("hom").value;
    var resi = document.getElementById("res").value; 
    var pinno = document.getElementById("pin").value; 
    var country = document.getElementById("Country").value; 
    var table=document.getElementById("results");
    var row=table.insertRow(-1);
    var cell1=row.insertCell(0);
    var cell2=row.insertCell(1);
    var cell3=row.insertCell(2);
    var cell4=row.insertCell(3);
    var cell5=row.insertCell(4);
    var cell6=row.insertCell(5);
    var cell7=row.insertCell(6);
    var cell8=row.insertCell(7);
    cell1.innerHTML=first;
    cell2.innerHTML=last;        
    cell3.innerHTML=gen;    
    cell4.innerHTML=hob;
    cell5.innerHTML=hno;        
    cell6.innerHTML=resi;   
    cell7.innerHTML=pinno; 
    cell8.innerHTML=country;
    
}



	$(document).ready(function() {
		var max_fields = 3;
		var x = 1;
		$(".add_field_button").on("click",function(e) {
			e.preventDefault();
			if (x < max_fields) {x++;
				$(".input_fields_wrap").append('<div id="copy" style="height: 10px; width: 1000px;">Home no:<input type="text"/> Residency:<input type="text" />	Pincode:<input type="text"/>&nbsp;&nbsp;<button style= "width: 1.5%; border: none;  margin-top: 2px;  color: white;  background-color: #ff4d4d;  border-radius: 5px;  padding: 5px;" class="remove_field"><b>-</b></button></div>'); //add input box
							}
						});
		$(".input_fields_wrap").on("click", ".remove_field",
				function(e) {
					e.preventDefault();
					$(this).parent('div').remove();
					x--;
				})
		$(document).ready(function() {
			$('#Country').combobox();
	           });
		$('#hobby').select2({
		    placeholder: 'Add your Skills'
		});
	});
</script>
</html>