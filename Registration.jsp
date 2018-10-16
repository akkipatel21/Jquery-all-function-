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
.error{
	color:red;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

 <script>
 
 function validateForm() { 
 	 
	 var fname = document.forms["myForm"]["fname"].value; 
	 var lname = document.forms["myForm"]["lname"].value; 
	 var homeno = document.forms["myForm"]["home"].value; 
	 var pin = document.forms["myForm"]["pincode"].value; 
	 var patt = /[0-9]/g; 
	 var result = fname.match(patt); 
	 var result1 = lname.match(patt);
	 var pinmatch= pin.match(patt);
	 var nomatch= homeno.match(patt);
	 if (fname == ""){
		 $('#errfname').text('Name Can not be Empty')
		 $('input[name=fname]').css('outline', '1px solid red');
	     return false;
	 } 
	 else if( (result)){ 
	     $('#errfname').text('First Name must be in Alphabetic')
	      return false; 
	 } 
	 else if (lname == ""){ 
	     $('#errlname').text('Name Can not be Empty')
	     return false; 
	         } 
	 else if( (result1)){ 
	     $('#errlname').text('Last Name must be in Alphabetic')
	     return false; 
	 } 
	 else if($('input[name=gender]:checked').length <= 0) {      
      $('input[name=gender]').css('outline', '1px solid red');
       $('#errgen').text('Please Select Gender')
       return false; 
     } /*   else {   $('input[name=gender]').css('outline', 'none');    }   */
     else if(document.forms["myForm"]["hobby"].value==0){
		 $('#errhobby').text('select atleast one hobby')
		 return false; 
	 }
     else if((document.forms["myForm"]["home"].value=="")||(!nomatch)) {
     	$('#errpin').text('Enter valid home no.')
  	    return false;   
     }  
     else if(document.forms["myForm"]["residency"].value==""){
 	     $('#errpin').text('(Enter Residency name)')
 		return false; 	 
 	}
     else if((document.forms["myForm"]["pincode"].value=="")||(!pinmatch)) {
    	$('#errpin').text('Enter correct pin')
 	    return false;   
    }  
     else if(document.forms["myForm"]["coun"].value==""){
	     $('#errcoun').text('select Country')
		return false; 	 
	}
   	else{
   		
   		alert("Your data is Submited");
   		return true;
   	}
 
 }  
 
 
 

</script> 

<body>

	<form name="myForm" id="myForm">
		<table>
		    <tr><td>First Name:</td><td><input type="text" name="fname" style=" width:80%;" ></td><td><span id="errfname"></span></td></tr>
		    <tr><td>Last Name:</td><td><input type="text" name="lname" style=" width:80%;"></td><td><span id="errlname"></span></td></tr>
			<tr><td>Gender:</td><td><input type="radio" name="gender" value="male">	Male
			  <input type="radio" name="gender" value="female">Female</td><td><span id="errgen"></span></td></tr>
			</table>
		
			Skills:
			<select id="hobby" name="hobby" multiple="multiple" style="width: 300px">
				<option value="read">Reading</option>
				<option value="mu">Music</option>
				<option value="sin">Singing</option>
				<option value="dan">Dancing</option>
				<option value="coock">Coocking</option>
				<option value="swim">Swimimg</option>
				<option value="gym">Gymimg</option>
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
					<option value="in">India</option>
					<option value="pa">Pakistan</option>
					<option value="Us">USA</option>
					<option value="uk">Canada</option>
					<option value="rus">Russia</option>
					<option value="ch">China</option>
				</select><span id="errcoun"></span>
			</div>
		
		<input type="submit" id="btnSubmit" onclick="return validateForm()" value="Submit">
	</form>
</body>

<script>
 $(document).ready(function() {
    $('#btnSubmit').click(function(e) {
        var isValid = true;
        $('input[type="text"]').each(function() {
            if ($.trim($(this).val()) == '') {
                isValid = false;
                $(this).css({
                    "border": "1px solid red",
                    "background": "#FFCECE"
                });
            }
            else {
                $(this).css({
                    "border": "",
                    "background": ""
                });
            }
        });
        if (isValid == false) 
            e.preventDefault();
       
    });
});



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