<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
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
		var x = document.forms["myForm"]["fname"].value;
		var y = document.forms["myForm"]["lname"].value;
		var patt1 = /[0-9]/g;
		var result = x.match(patt1);
		var result1 = y.match(patt1);
		if (x == "" || y == "") {
			alert("Name must be filled out");
			return false;
		} else if (result) {

			alert("First name Must be in Alphabet")
			return false;
		} else if (result1) {
			alert("Last name Must be in Alphabet")
			return false;
		}

	}
</script>
<body>
	<form name="myForm">
		<table>
		    <tr><td>First Name:</td><td><input type="text" name="fname"></td></tr>
		    <tr><td>Last Name:</td><td><input type="text" name="lname"></td></tr>
			<tr><td>Gender:</td><td><input type="radio" name="gender" value="male">	Male
			  <input type="radio" name="gender" value="female">Female</td></tr>
		</table>
		Skills:	<select id="example" multiple="multiple" style="width: 300px">
    		<option value="read">Reading</option>
    		<option value="mu">Music</option>
   			 <option value="sin">Singing</option>
    		<option value="dan">Dancing</option>
  		  <option value="coock">Coocking</option>
    		<option value="swim">Swimimg</option>
     		<option value="gym">Gymimg</option>
	    </select>
		<div class="input_fields_wrap">	Address:<button class="add_field_button btn btn-info">+</button>
			<div id="copy" style="height: 20px; width: 2000px;">Home no:<input type="text"> Recedency:<input type="text">
								Pincode:<input type="text">
			</div>
		</div>
		<div>
			Select Country: <select id="state" name="state">
				<option value=""></option>
				<option value="in">India</option>
				<option value="pa">Pakistan</option>
				<option value="Us">USA</option>
				<option value="uk">Canada</option>
				<option value="rus">Russia</option>
				<option value="ch">China</option>
			</select>
		</div>

		<input type="submit" onclick="return validateForm()" value="Submit">
</body>
<script type="text/javascript"	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript"	src="https://rawgit.com/select2/select2/master/dist/js/select2.js"></script>
<script type="text/javascript"  src="https://rawgit.com/select2/select2/master/dist/css/select2.min.css"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet"/>
<script>
	$(document).ready(function() {
						var max_fields = 4;
						var x = 1;
						$(".add_field_button").on("click",function(e) {
							e.preventDefault();
							if (x < max_fields) {x++;
								$(".input_fields_wrap").append('<div id="copy" style="height: 20px; width: 2000px;">Home no:<input type="text"/> Recedency:<input type="text"/>	Pincode:<input type="text"/>&nbsp;&nbsp;<button class="remove_field">-</button></div>'); //add input box
											}
										});

						$(".input_fields_wrap").on("click", ".remove_field",
								function(e) {
									e.preventDefault();
									$(this).parent('div').remove();
									x--;
								})
						$(document).ready(function() {
							$('#state').combobox();
					});
						$('#example').select2({
						    placeholder: 'Add your Skills'
						});
	});
</script>
</html>