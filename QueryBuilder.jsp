<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<%@ taglib prefix="dandelion" uri="http://github.com/dandelion"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<dandelion:asset cssExcludes="datatables" />
<dandelion:asset jsExcludes="datatables" />
<dandelion:asset jsExcludes="jquery" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <script src="js/buttons/buttons.js"></script> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<script src="js/buttons/buttons.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!-- <link href="js/Responsive/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="js/Responsive/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
<script src="js/bootstrap/bootstrap.min.js" type="text/javascript"></script> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
.headerButton {
	position: relative;
	left: 550px;
	border: 2px solid #ffffff;
	background-color: #4d4dff ;
	border: white;
	color: white;
	padding: 5px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 115px;
	font-size: 15px;
	margin: 1px 1px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button {
	background-color: #69a1fa;
	border: none;
	color: white;
	padding: 5px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	border-radius: 5px;
	font-size: 15px;
	margin: 1px 1px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	font-size: 13px;
	border-radius: 25px;
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	font-size: 13px;
	background-color: #4CAF50;
	color: white;
}

.button2 {
	border-radius: 25px;
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}
#popup{
    display: none;
    border: 1px solid black;
}

.cell-which-triggers-popup{
    cursor: pointer;    
}

.cell-which-triggers-popup:hover{
    background-color: yellow;    
}
</style>
<script type="text/javascript">
  $( document ).ready(function() {
	  
	 
	  $("input[name='submit']").attr('disabled',true);
	  $("input[name='seeAll']").attr('disabled',true);
	  reset();
	  
	});
  
  $("input:checkbox").click(function(){
	    var column = "."+$(this).attr("name");
	    $(column).toggle();
	});
</script>
</head>
<body>

	<div align="center"
		style="background-color: #4d4dff ; font-weight: bolder; font-size: 135%; font-family: Verdana; color: white;">
		<b>Query Builder</b><span><button onClick="home();"
				class="headerButton">Home</button>&nbsp;
			<button onClick="logout();" class="headerButton">Logout</button>
	</div>
	<div align="center" style="width: 100%; height: 250px;">


		<table style="width:100%;align:center" class="table table-bordered">

			<tr>

				<th style="width:208px" >Type of Land</th>
<!-- 				<th class="hid">Type of SubLand</th> -->
				<th style="width:208px">Operator</th>
				<th style="width: 208px" >Size of Land(Ha)</th>
				<!-- <th>
 	Clause
 	</th> -->
				<th style="width:208px" >Distance From</th>
				<th style="width:208px" >Operator</th>
				<th style="width:208px">Distance(Km)</th>
				<!-- <th>
 	Clause 
 	</th> -->

			</tr>
			<tr>
				<td > Private Industrial Park <input type="checkbox" id="priInd" class="check"
					name="vehicle1" value="Bike"><br>
					Private Textile Park <input type="checkbox" id="priText" class="check"
					name="vehicle1" value="Bike"><br>Private Logistic Park <input type="checkbox" id="priLogi" class="check"
					name="vehicle1" value="Bike"><br>
					
					  Government Land
					<input type="checkbox" id="GovLand" class="check" name="hid" ><br>
					 SEZ <input id ="sez" type="checkbox" name="" class="check" ><br>
					 SIR <input id="sir" type="checkbox" class="check" value=""><br>
					 GIDC <input id="gidc" type="checkbox" class="check" value=""><br>
					 Salt Pan <input id="saltPan" type="checkbox" class="check" value=""><br>
				
				</td>
				<!-- <td class="hid"><div id="roro">(i) Industrial park <input type="radio" id="radio" name="optradio"
					value="size_of_pa" style="margin-left: 5px;"><br> (ii)
					Textile Park <input type="radio"  id="radio" name="optradio"
					style="margin-left: 5px;"><br> (iii) Logistic Park<input
					type="radio"  id="radio" name="optradio" style="margin-left: 5px;"><br></div>
				</td> -->
				 <td><select id="landoperator" class="form-control"
					style="padding: 0px;">
						<option value="Between">Between</option>
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>

				</select>
				</td> 
				<td><input type="text" name="distant" id="sland" value="" class="textarea form-control" distance>
				<div style="size:100%;" class="hid"> 
				<b>Between :</b><input style="width: 105px;size:50%;" type="text" name="distant" onkeyup="fromSize()" id="fromSizeOfPa" value=""
					class="form-control" distance><b>To :</b>
				<input style="width: 105px;size:50%;" type="text" name="distant" id="toSizeOfPa" value=""
					class="form-control" distance>
				</div>	
					
					
					</td> 
				<!-- <td>
 	<select  class="form-control" style="padding: 0px;">
 		  <option >select</option>
  <option value=" AND ">AND</option>
   <option value=" OR ">OR</option>
  </select> 
 	</td> -->


				<td>Port <input type="checkbox" id="port" name="chk"
					value="Port"> <br>Minor Port <input type="checkbox" id="minorport" name="chk"
					value="Port"> <br> Air Port <input type="checkbox"
					id="airport" onclick="fairportland('distance_from_near_airport')"
					name="chk" value="Port"><br> Railway Station <input
					type="checkbox" id="RlyStation"
					onclick="frsland('distance_from_near_railway')" name="chk"
					value="Port"><br> National Highway <input
					type="checkbox" id="NationalHighway"
					onclick="fnhland('distance_from_national_highway')" name="chk"
					value="Port"><br> State Highway <input type="checkbox"
					id="StateHighway" onclick="fshland('distance_from_state_highway')"
					name="chk" value="Port"><br> Gas Grid <input
					type="checkbox" id="Gasgrid"
					onclick="fgasland('distance_from_gas_grid')" name="chk"
					value="Port"><br> Power Grid <input type="checkbox"
					id="Powergrid" onclick="fpowerland('distance_from_power_grid')"
					name="chk" value="Port"><br>Water Grid <input
					type="checkbox" id="Watergrid"
					onclick="fwaterland('distance_from_water_grid')" name="chk"
					value="Port"><br>

				</td>
				<td><select id="portoperator" class="form-control"
					style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select><select id="minorportoperator" class="form-control"
					style="padding: 0px;">
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select>
				
				 <select id="airportoperator" class="form-control"
					style="padding: 0px;">
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="rsoperator" class="form-control" style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="nhoperator" class="form-control" style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="shoperator" class="form-control" style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="gasoperator" class="form-control" style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="poweroperator" class="form-control"
					style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select> <select id="waterroperator" class="form-control"
					style="padding: 0px;">
						
						<option value="=">=</option>
						<option value=">">></option>
						<option value="<"><</option>


				</select></td>

				<td><input type="text" id="tport"  onKeyUp="return bar();" name="fromdistance"
					class="form-control" value="" style="height: 25px;"> <input type="text" id="tminorport" 
					 onKeyUp="return bar();" name="fromdistance"
					class="form-control" value="" style="height: 25px;"> <input onKeyUp="return bar();"
					type="text" id="tairport" name="fromdistance" class="form-control"
					value="" style="height: 25px;"> <input  onKeyUp="return bar();"type="text" id="trs"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"> <input  onKeyUp="return bar();" type="text" id="tnh"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"> <input onKeyUp="return bar();" type="text" id="tsh"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"> <input onKeyUp="return bar();" type="text" id="tgas"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"> <input onKeyUp="return bar();"type="text" id="tpower"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"> <input onKeyUp="return bar();" type="text" id="twater"
					name="fromdistance" class="form-control" value=""
					style="height: 25px;"></td>

			</tr>
		</table>
		
		<input type="button" class="btn btn-success"
			style="left: 768px; position: absolute;" name="submit" value="submit"
			onclick=submit()>
		<button type="button" class="btn btn-info"
			style="left: 845px; position: absolute; " onclick=reset()>Reset</button>
		 
	</div>

	<c:url value="viewOnMap" var="viewMap" />
	<form:form action="${viewMap}"  method="post" id="viewMapForm" name="viewMapForm" modelAttribute="viewMap">
		<input type="hidden" name="viewMap" id="viewMap" value="0"/>
	</form:form>
	
	<c:url value="viewOnMap2" var="viewMap2" />
	<form:form action="${viewMap2}"  method="post" id="viewMapForm2" name="viewMapForm2" modelAttribute="viewMap">
		<input type="hidden" name="viewMap2" id="viewMap2" value="0"/>
		<input type="hidden" name="tbl" id="tbl" value="0"/>
	</form:form>

	<c:url value="/logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<c:url value="/admin/gisModule" var="home" />
	<form action="${home}" method="get" id="home">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
           <h3> Connectivity</h3>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel"></h4>

            </div>
            <div class="modal-body">
            <table	class="table  table-striped  table-hover  table-bordered tblData_inner"  id="popupTable">
		    </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
   </div>
	<div class="modal fade" id="dataerror" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div style="width:350px; height: 70px; align: center; "><h3>&emsp;&emsp;&emsp;&emsp;&emsp;No Records Found ! </h3></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
   </div>
	

	<div style="height: 100px"></div>
	
	
	<table	style="width: 100%" class="table  table-striped  table-hover  table-bordered tblData_inner"
		id="table">
	</table>
	
	
	
</body>

	<script>
	var query;
	var subland;
	var landoperator;
	var distance;
	var fromSizeOfPa;
	var toSizeOfPa;
	var sizeofland;
	var portland;
	var portoperator;
	var minorportland;
	var minorportoperator;
	var airportland;
	var airportoperator;
	var rsland;
	var rsoperator;
	var nhland;
	var nhoperator;
	var shland;
	var shoperator;
	var gasland;
	var gasoperator;
	var powerland;
	var poweroperator;
	var waterland;
	var waterroperator;
	var dport;
	var dminorport;
	var dairport;
	var drs;
	var dnh;	
	var dsh;
	var dgas;
	var dpower;
	var dwater;
	var tblNo;
	var tblName;
	
	
	// --------------First checkbox List Management--------------------------//
	
	$('input.check').on('change', function() {
	    $('input.check').not(this).prop('checked', false);  
	});
	
	$('#priInd').change(function(){
		    if(this.checked){
		     	$("#landoperator").prop('disabled',false);
		     	subland="industrial_park_boundary_iiis ";
		     	tblNo=1;
		     	$("input[name='submit']").attr('disabled',false);
		     	
		    }
		    else{
		    	reset();
		    }
		});
	 $('#priText').change(function(){
		 if(this.checked){
		    	$("input[name='submit']").attr('disabled',false);
		     	$("#landoperator").prop('disabled',false);
		     	subland="textilepark_boundary ";
		     	tblNo=2;
		    }
		    else{
		    	reset();
		    }
		});
	$('#priLogi').change(function(){
		 if(this.checked){
			    $("input[name='submit']").attr('disabled',false);
		     	$("#landoperator").prop('disabled',false);
		     	subland="logisticpark_boundary ";
		     	tblNo=3;
		    }
		    else{
		    	reset();
		    }
		});
	$('#GovLand').change(function(){
		 if(this.checked){
			    $("input[name='submit']").attr('disabled',false);
		     	$("#landoperator").prop('disabled',false);
		     	subland="land_bank_gcs_iiis ";
		     	tblNo=4;
		    }
		    else{
		    	reset();
		    }
		});
	$('#sez').change(function(){
		 if(this.checked){
			 $("input[name='submit']").attr('disabled',false);
			 $("#landoperator").prop('disabled',false);
		     	subland="sez_boundary ";
		     	tblNo=5;
		    }
		    else{
		    	reset();
		    }
		});
	$('#sir').change(function(){
		 if(this.checked){
			    $("input[name='submit']").attr('disabled',false);
		    	$('select').val('select');
		     	$("#landoperator").prop('disabled',false);
		     	subland="sir_boundary_iiis ";
		     	tblNo=6;
		    }
		    else{
		    	reset();
		    }
		});
	$('#gidc').change(function(){
		 if(this.checked){
			    $("input[name='submit']").attr('disabled',false);
		    	$('select').val('select');
		     	$("#landoperator").prop('disabled',false);
		     	subland="estate_boundary ";
		     	tblNo=7;
		    }
		    else{
		    	reset();
		    }
		});
	$('#saltPan').change(function(){
		 if(this.checked){
			    $("input[name='submit']").attr('disabled',false);
		    	$('select').val('select');
		     	$("#landoperator").prop('disabled',false);
		     	subland="salt_pan ";
		     	tblNo=8;
		    }
		    else{
		    	reset();
		    }
		});
	
	
	
	
	
	
	
	
	function bar() {
		$("input[name='submit']").attr('disabled',false);
	 }
   
	
	
	 $("#landoperator").change(function (event) {
		 landoperator=$(this).val();
		if(landoperator=='Between'){
			$('.hid').show();
			$('.textarea').hide();
			document.getElementById("fromSizeOfPa").value= "";
			document.getElementById("toSizeOfPa").value= "";
			document.getElementById("sland").value= "";
			$('#fromSizeOfPa').prop("disabled", false);
			$('#toSizeOfPa').prop("disabled", true);
			landoperator = "size_of_pa";
		}
		else{
		 document.getElementById("fromSizeOfPa").value= "";
		 document.getElementById("toSizeOfPa").value= "";	
		 $('.hid').hide();
		 $('.textarea').show();
		 landoperator = "size_of_pa "+landoperator;
		 $("#sland").prop('disabled',false);
		 $("input[name='submit']").attr('disabled',false); 
		}
     });
	 
	 $("#fromSizeOfPa").keyup(function(){
			fromSizeOfPa = $('#fromSizeOfPa').val();
			
	        $('#toSizeOfPa').prop("disabled", false); 
	    });
	 $("#toSizeOfPa").keyup(function(){
		 $('#fromSizeOfPa').prop("disabled", true);
		 fromSizeOfPa=$('#fromSizeOfPa').val();
		 toSizeOfPa=$('#toSizeOfPa').val();
		 sizeofland="BETWEEN "+fromSizeOfPa+" And "+""+toSizeOfPa+" AND" ;
		 $("input[name='submit']").attr('disabled',false); 
	    });
	 /* $("#fromSizeOfPa").change(function(event){
		 $('#toSizeOfPa').prop("disabled", false);
	 });
	 
	 $("#toSizeOfPa").change(function(event){
		 $('#fromSizeOfPa').prop("disabled", true);
		 fromSizeOfPa=$('#fromSizeOfPa').val();
		 toSizeOfPa=$('#toSizeOfPa').val();
		 sizeofland="Between "+fromSizeOfPa+" And "+""+toSizeOfPa+" AND" ;
		 $("input[name='submit']").attr('disabled',false);
	 }); */
	 
	 $("#sland").change(function(event){
		 distance=$('#sland').val();
		 $('#tosland').prop('disabled',false);
		 sizeofland=" "+distance+" AND" ;
		 
	 });
	 
	 
	 $("#portoperator").change(function (event) {
		 portoperator=$(this).val();
		 $('#tport').prop('disabled',false);
     });
	 
	 $("#minorportoperator").change(function (event) {
		 minorportoperator=$(this).val();
		 $('#tminorport').prop('disabled',false);
     });
	 
	 $("#airportoperator").change(function (event) {
		 airportoperator=$(this).val();
		 $('#tairport').prop('disabled',false);
     });
	 
	 $("#rsoperator").change(function (event) {
		 rsoperator=$(this).val();
		 $('#trs').prop('disabled',false);
     });
	 
	 $("#nhoperator").change(function (event) {
		 nhoperator=$(this).val();
		 $('#tnh').prop('disabled',false);
		 
     });
	 
	 $("#shoperator").change(function (event) {
		 shoperator=$(this).val();
		 $('#tsh').prop('disabled',false);
		 
     });
	 
	 $("#gasoperator").change(function (event) {
		 gasoperator=$(this).val();
		 $('#tgas').prop('disabled',false);
		 
     });
	 
	 $("#poweroperator").change(function (event) {
		 poweroperator=$(this).val();
		 $('#tpower').prop('disabled',false);
		 
     });
	 
	 $("#waterroperator").change(function (event) {
		 waterroperator=$(this).val();
		 $('#twater').prop('disabled',false);
		 
     });
	 
	 
	
	    
	 $("#tosland").change(function(event){
		 todistance=$('#tosland').val() + " AND";
		 $("input[name='submit']").attr('disabled',false);
	 });
	 
	 ////////////////////////////////////////   Distance From Ports        ///////////////////////////////////////////////////////////////
	 
	 $('#port').change(function(){
		    if(this.checked){
		    	$('#portoperator').prop('disabled',false);
				 portland='distance_from_near_port';
		    }
		    else{
		    	document.getElementById("tport").value= "";
		    	$('#tport').prop('disabled',true);
		    	$('#portoperator').prop('disabled',true);
		    	portland='';
		    	dport='';
		    	portoperator='';
		    }
		    
		});
	 $('#minorport').change(function(){
		    if(this.checked){
		    	$('#minorportoperator').prop('disabled',false);
				 minorportland='distance_from_near_port_minor';
		    }
		    else{
		    	document.getElementById("tminorport").value= "";
		    	$('#tminorport').prop('disabled',true);
		    	$('#minorportoperator').prop('disabled',true);
		    	minorportland='';
		    	dminorport='';
		    	minorportoperator='';
		    }
		    
		});
	 $('#airport').change(function(){
		    if(this.checked){
		    	$("#airportoperator").prop('disabled',false);
		    	airportland='distance_from_near_airport';
		    	
		    }
		    else{
		    	document.getElementById("tairport").value= "";
		    	$('#tairport').prop('disabled',true);
		    	$('#airportoperator').prop('disabled',true);
		    	airportland='';
		    	airportoperator='';
		    	dairport='';
		    }
		});
	 $('#RlyStation').change(function(){
		    if(this.checked){
		    	$('#rsoperator').prop('disabled',false);
		    	rsland='distance_from_near_railway';
		    	
		    }
		    else{
		    	document.getElementById("trs").value= "";
		    	$('#trs').prop('disabled',true);
		    	$('#rsoperator').prop('disabled',true);
		    	rsoperator='';
		    	rsland='';
		    	drs='';
		    }
		    
		});
	 $('#NationalHighway').change(function(){
		    if(this.checked){
		    	$('#nhoperator').prop('disabled',false);
		    	nhland='distance_from_national_highway';
		    	
		    }
		    else{
		    	document.getElementById("tnh").value= "";
		    	$('#tnh').prop('disabled',true);
		    	$('#nhoperator').prop('disabled',true);
		    	nhland='';
		    	nhoperator='';
		    	dnh='';
		    }
		    
		});
	 $('#StateHighway').change(function(){
		    if(this.checked){
		    	$('#shoperator').prop('disabled',false);
		    	shland='distance_from_state_highway';
		    	
		    }
		    else{
		    	document.getElementById("tsh").value= "";
		    	$('#tsh').prop('disabled',true);
		    	$('#shoperator').prop('disabled',true);
		    	shland='';
		    	shoperator='';
		    	dsh='';
		    }
		    
		});
	 $('#Gasgrid').change(function(){
		    if(this.checked){
		    	$('#gasoperator').prop('disabled',false);
		    	gasland='distance_from_gas_grid';
		    	
		    }
		    else{
		    	document.getElementById("tgas").value= "";
		    	$('#tgas').prop('disabled',true);
		    	$('#gasoperator').prop('disabled',true);
		    	gasland='';
		    	dgas='';
		    	gasoperator='';
		    }
		    
		});
	 $('#Powergrid').change(function(){
		    if(this.checked){
		    	$('#poweroperator').prop('disabled',false);
				 powerland='distance_from_power_grid';
		    	
		    }
		    else{
		    	document.getElementById("tpower").value= "";
		    	$('#tpower').prop('disabled',true);
		    	$('#poweroperator').prop('disabled',true);
		    	powerland='';
		    	poweroperator='';
		    	dpower='';
		    }
		    
		});
	 $('#Watergrid').change(function(){
		    if(this.checked){
		    	$('#waterroperator').prop('disabled',false);
		    	waterland='distance_from_water_grid';
		    	
		    }
		    else{
		    	document.getElementById("waterroperator").value='select';
		    	document.getElementById("twater").value= "";
		    	$('#twater').prop('disabled',true);
		    	$('#waterroperator').prop('disabled',true);
		    	waterland='';
		    	dwater='';
		    	waterroperator='';
		    }
		    
		});
	 

	 
	 $("#tport").change(function(event){
		 dport=$('#tport').val() +" AND";
     });
	 $("#tminorport").change(function(event){
		 dminorport=$('#tminorport').val() +" AND";
     });
	 $("#tairport").change(function(event){
		  
		 dairport=$('#tairport').val() +" AND";
     });
	 $("#trs").change(function(event){
		 drs=$('#trs').val() +" AND";
     });
	 $("#tnh").change(function(event){
		  
		 dnh=$('#tnh').val() +" AND";
     });
	 $("#tsh").change(function(event){
		 dsh=$('#tsh').val() +" AND";
	
     });
	 $("#tgas").change(function(event){
		 dgas=$('#tgas').val() +" AND";
	
     });
	 $("#tpower").change(function(event){
		 dpower=$('#tpower').val() +" AND";
	
     });
	 $("#twater").change(function(event){
		 dwater=$('#twater').val() +" AND";
	
     });
	   	    
	  
	   function submit()
	   {   
		   
		    query="SELECT * FROM " +subland +" WHERE "+ landoperator +" "+ sizeofland +"  "+ portland +" " +	portoperator   +" " +	dport    +"  "+ minorportland +" " +minorportoperator   +" " +	dminorport    +" " +airportland +" " +airportoperator  +" " +	dairport   +" " +rsland  +" "  +rsoperator  +" " +	drs  +" " +nhland  +" " +nhoperator   +" " +	dnh +" " +shland +" " +shoperator
			+" " +	dsh +" " +gasland +" " +gasoperator  +" " +	dgas  +" " +powerland +" " +poweroperator  +" " +	dpower  +" " +waterland  +" " +waterroperator  +" " +	dwater 	;
		    query=query.trim();
		    var lastIndex = query.lastIndexOf(" ");
		    q = query.substring(0, lastIndex);
		    alert( q);
				
			if(q==''){
				alert("Query Is Wrong!!");
				return false;
			}
			else{
				$.ajax({
					type : "GET",
					url : "queryBuilderList",
					dataType: "json",
		 		    data: {sql: q , tblNo:tblNo },
					success : function(data) {
						var rows = '';
						var sr = 1;
						$('#table').show();
						if($.trim(data)==""){
							$('#dataerror').modal('show');
							$('#table').hide();
							return false;
						}
						switch (tblNo) {
						  case 1:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th >Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	 $.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="new1(\'' + item.indName + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 2:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 3:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 4:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Survey No.</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
								    $.each(data, function(index, item) {
											rows += '<tr><td >' + sr + '</td>';
											rows += '<td>' + item.sNo + '</td>';
											rows += '<td >' + item.district + '</td>';
											rows += '<td>' + item.taluka + '</td>';
											rows += '<td>' + item.village + '</td>';
											rows += '<td>' + item.size + '</td>';
											rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
											rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
											sr++;
										   });
							  $('#table').html(rows);
						    break;
						  case 5:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 6:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 7:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						  case 8:
							  rows+='<thead ><tr id="cssTable"><th>Sr No.</th><th>Industry Name</th><th>District</th><th>Taluka</th><th>Village</th><th>Area(Hec.)</th><th>Map</th><th>Connectivity</th></tr></thead>'
							    	$.each(data, function(index, item) {
										rows += '<tr><td >' + sr + '</td>';
										rows += '<td>' + item.indName + '</td>';
										rows += '<td >' + item.district + '</td>';
										rows += '<td>' + item.taluka + '</td>';
										rows += '<td>' + item.village + '</td>';
										rows += '<td>' + item.size + '</td>';
										rows += '<td ><button onclick="viewOnMap2('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										rows += '<td ><button onclick="popup('+item.gid+',\'' + subland + '\');" class="button button2">View</button></td>';
										sr++;
									   });
							  $('#table').html(rows);
						    break;
						}
						
		 		    },
					error : function(xmlHttpRequest, textStatus, errorThrown) {
						alert("error");
					}
				});
		     }
	   } 
	   
		   
	   function new1(name)
	   {
		//  zoom_idustryName1(name);
		//  window.opener.zoom_idustryName1(name);
		   window.open("gisModule?name="+name);
	   }
	   function reset()
	   {	
		   $('.hid').hide();
		   $('.textarea').show();
		   $('select').val('');
		   document.getElementById("sland").value= "";
		   document.getElementById("tport").value= "";
		   document.getElementById("tairport").value= "";
		   document.getElementById("trs").value= "";
		   document.getElementById("tnh").value= "";
		   document.getElementById("tsh").value= "";
		   document.getElementById("tgas").value= "";
		   document.getElementById("tpower").value= "";
		   document.getElementById("twater").value= "";
		   $('input[name="optradio"]').attr('disabled',false);
		   $("input[type='radio']:checked").value="";
		   	subland='';
		   	query='';
		   	//land='';
			landoperator='';
			sizeofland='';
			portland='';
			portoperator='';
		    minorportland='';
			minorportoperator='';
			airportland='';
			airportoperator='';
			rsland='';
			rsoperator='';
			nhland='';
			nhoperator='';
			shland='';
			shoperator='';
			gasland='';
			gasoperator='';
			powerland='';
			poweroperator='';
			waterland='';
			waterroperator='';
			dport='';
			dminorport='';
			dairport='';
			drs='';
			dnh='';	
			dsh='';
			dgas='';
			dpower='';
			dwater='';
			query='';
		    $('input[type="checkbox"]').prop('checked',false);
			$('input[type="radio"]').prop('checked',false);
			$(":text").prop("disabled", true);
		    $("select").attr('disabled', true);
			$('#table').hide();
			$("input[name='submit']").attr('disabled',true);
			$("input[name='seeAll']").attr('disabled',true);
	   }
		  function popup(gid,tbl) {
			    $.ajax({
					type : "GET",
					url : "connectivity",
					dataType: "json",
		 		    data: {gid: gid ,tbl: tbl},
					success : function(data) { 
						var rows = '';
							rows += '<tr><td><h4>Distance From </h4></td><td> <h4> Km  </h4></td></tr>';
							rows += '<tr><td>National Highway </td><td>' + data.nh + '</td></tr>';
							rows += '<tr><td>State Highway</td><td>' + data.sh + '</td></tr>';
							rows += '<tr><td>Railway Station</td><td>' + data.rail + '</td></tr>';
							rows += '<tr><td>Near Minor Port</td><td>' + data.nearMinorPort + '</td></tr>';
							rows += '<tr><td>Near Port</td><td>' + data.nearPort + '</td></tr>';
							rows += '<tr><td>Near Airport</td><td>' + data.nearAirport + '</td></tr>';
							rows += '<tr><td>Power Grid</td><td>' + data.power + '</td></tr>';
							rows += '<tr><td>Water Grid</td><td>' + data.water + '</td></tr>';
							rows += '<tr><td>Gas Grid</td><td>' + data.gas + '</td></tr>';
							$('#popupTable').html(rows);
							$('#myModal').modal('show');
					},
					error : function(xmlHttpRequest, textStatus, errorThrown) {
						alert("error");
					}
				});  
			 
		} 
	   function logout() {			
			document.getElementById("logoutForm").submit();
		}	
		function home() {			
			document.getElementById("home").submit();
		}	
	
		 function viewOnMap(id) {
			document.getElementById('viewMap').value=id;
			document.getElementById('viewMapForm').submit();
		}  
		  function viewOnMap2(id,tbl) {
			 alert(id);
			 alert(tbl);
			document.getElementById('viewMap2').value=id;
			document.getElementById('tbl').value=tbl;
			document.getElementById('viewMapForm2').submit();
		 } 
	</script>

</html>

