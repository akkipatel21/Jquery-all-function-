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
input[type=text], select {
    width: 10%;
    padding: 12px 20px;
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
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: #45a049;
}
div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
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
		 $('#errfname').text('Enter First Name ( Alphabets only )');
		 <!-- $('input[name=fname]').css('outline', '1px solid red'); -->
	     valid = false;
	 }else{
		 $('#errfname').text('');
		 valid = true;
	 }
	 if((lname == "") || (result1)){ 
	     $('#errlname').text('Enter Last Name ( Alphabets only )');
	     valid = false;
	 }else{
		$('#errlname').text('');
	     valid = true;
	 }
	 
	 if($('input[name=gender]:checked').length <= 0) { 
       $('#errgen').text('Please Select Gender');
       valid = false;
     } else{
		$('#errgen').text('');
       valid = true;
	 }
     if(document.forms["myForm"]["hobby"].value==0){
		 $('#errhobby').text('Select atleast one hobby');
		 valid = false; 
	 }else{
		$('#errhobby').text('');
		 valid = true; 
	 }
     if((document.forms["myForm"]["home"].value=="")||(!nomatch)) {
     	$('#errhom').text('Enter valid home no.');
  	    valid = false;   
     }else{
		$('#errhom').text('');
  	    valid = true;
	 }
     if(document.forms["myForm"]["residency"].value==""){
 	     $('#errres').text('(Enter Residency name)');
 		valid = false;	 
 	}else{
		 $('#errres').text('');
 		valid = true;	 
	}
    if(!pinmatch) {
    	$('#errpin').text('Should Must have Six digit');
 	    valid = false;  
    } else{
		$('#errpin').text('');
 	    valid = true;  
	} 
    if(document.forms["myForm"]["coun"].value==""){
	     $('#errcoun').text('select Country');
		valid = false;  	 
	}else{
		$('#errcoun').text('');
		valid = true;
	}
    
	if((fname=="") ||(lname=="") || ($('input[name=gender]:checked').length <= 0)||(document.forms["myForm"]["hobby"].value==0)||(document.forms["myForm"]["home"].value=="")
			||(document.forms["myForm"]["residency"].value=="")||(pin=="")||(document.forms["myForm"]["coun"].value=="")){
		$("#btnSubmit").prop('disabled', true);
	} else {
		$("#btnSubmit").prop('disabled', false);
	}
	
 }  
 

 $(document).ready(function(){
	$('#myForm').change(function(){
		validateForm();
	}); 
	 $('#input1,#input2').on('keypress', function(e) {
	        if (e.which == 32)
	            return false;
	    });
 }); 
 
 
</script> 

<body>
	<div id="getFromDetails">
	<form name="myForm" id="myForm">
		<table>
		    <tr><td>First Name:</td><td><input type="text" name="fname" id="input1" style=" width:80%;"  autofocus></td><td><span id="errfname"></span></td></tr>
		    <tr><td>Last Name:</td><td><input type="text" name="lname" id="input2" style=" width:80%;"></td><td><span id="errlname"></span></td></tr>
			<tr><td>Gender:</td><td><input type="radio" name="gender" value="male">	Male
			  <input type="radio" name="gender" value="female">Female</td><td><span id="errgen"></span></td></tr>
			</table>
		
			Skills:
			<select id="hobby" name="hobby" multiple="multiple" style="width: 300px">
				<option value="Reading">Reading</option>
				<option value="Music">Music</option>
				<option value="Singing">Singing</option>
				<option value="Dancing">Dancing</option>
				<option value="Coocking">Coocking</option>
				<option value="Swimimg">Swimimg</option>
				<option value="Gymimg">Gymimg</option>
			</select><span id="errhobby"></span><br><br>
			<div class="input_fields_wrap">	Address:<button class="add_field_button btn btn-info">+</button><br><br>
				<div id="copy" style="height: 20px; width: 2000px;">
					Home no:<input type="text" id="hom" name="home"> <span id="errhom"></span>
					Residency:<input type="text" id="res"name="residency"><span id="errres"></span>
					Pincode:<input type="text" id="pin" name="pincode"><span id="errpin"></span>
				</div>
			</div><br>
			<div>
				Select Country: <select id="Country" name="coun">
					<option value=""></option>
					<option value="India">India</option>
					<option value="Pakistan">Pakistan</option>
					<option value="USA">USA</option>
					<option value="Canada">Canada</option>
					<option value="Russia">Russia</option>
					<option value="China">China</option>
				</select><span id="errcoun"></span>
			</div>
		
		<input type="button" id="btnSubmit"  onclick="submitForm();ValidateForm()"disabled value="Submit">
	</form>
	</div>
	<div id="printFromDetails" style="display:none">
    <p id="pfname"></p>
    <p id="plname"></p>
    <p id="pgender"></p>
    <p id="phobby"></p>
     <p id="phome"></p>
    <p id="pres"></p>
    <p id="ppin"></p>
    <p id="pcon"></p>
    
   <input type="button" onclick="backToForm()" value="Fill New Form"> 
</div>
</body>

<script>

function submitForm() {
	
    var formDataObj = {};
   
    var myForm = document.getElementById("myForm");
    formDataObj.fname = myForm.fname.value;
    formDataObj.lname = myForm.lname.value;
    formDataObj.gender = myForm.gender.value;
    formDataObj.hobby = myForm.hobby.value;
    formDataObj.home = myForm.home.value;
    formDataObj.residency = myForm.residency.value;
    formDataObj.pincode = myForm.pincode.value;
    formDataObj.coun = myForm.coun.value;
    printMyData(formDataObj);

};

function resetForm() {
    document.getElementById("myForm").reset();  
}


function printMyData(formDataObj){
    document.getElementById("getFromDetails").style.display = "none";
    document.getElementById("printFromDetails").style.display = "block";
    document.getElementById("pfname").innerHTML  = "First Name : "+formDataObj.fname;
    document.getElementById("plname").innerHTML  = "Last Name : "+formDataObj.lname;
    document.getElementById("pgender").innerHTML  = "Sex : "+formDataObj.gender;
    document.getElementById("phobby").innerHTML  = "Hobby : "+ formDataObj.hobby
    document.getElementById("phome").innerHTML  = "Home no. : "+formDataObj.home;
    document.getElementById("pres").innerHTML  = "Residency :"+formDataObj.residency;
    document.getElementById("ppin").innerHTML  = "Pincode : "+formDataObj.pincode;
    document.getElementById("pcon").innerHTML  = "Country : "+formDataObj.coun;
   
}

function backToForm(){
    document.getElementById("printFromDetails").style.display = "none";
    document.getElementById("getFromDetails").style.display = "block";
    resetForm();  
}




	$(document).ready(function() {
		var max_fields = 3;
		var x = 1;
		$(".add_field_button").on("click",function(e) {
			e.preventDefault();
			if (x < max_fields) {x++;
				$(".input_fields_wrap").append('<div id="copy" style="height: 20px; width: 2000px;">Home no:<input type="text"/> Residency:<input type="text" />	Pincode:<input type="text"/>&nbsp;&nbsp;<button style= "width: 1.5%; border: none;  margin-top: 2px;  color: white;  background-color: #ff4d4d;  border-radius: 5px;  padding: 5px;" class="remove_field"><b>-</b></button></div>'); //add input box
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