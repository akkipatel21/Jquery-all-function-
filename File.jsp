<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button {
	margin: 2px;
	background-color: #66a3ff; /* Green */
	border: none;
	color: white;
	padding: 6px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin-left: 4px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
	border-radius: 4px;
}


.selected {
	color: white;
	background: green
}

.button {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
}

.button:hover {
	background-color: #f44336;
	color: white;
}

.active {
	background-color: lime;
}
.visited{
	background-color: blue;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div
		style="width: 1330px; height: 50px; background-color: green; color: white; text-align: center;">
		<h2>Activity Module</h2>

	</div>
	<script>
		var elm_selected = 'question';
		var que = '';
		var ansA = '';
		var ansB = '';
		var ansC = '';
		var ansD = '';
		var solu = '';
		function go() {
			var value = $('#edit').html();
			writeData(value, elm_selected);
			if(que !="" && ansA !="" && ansB !="" && ansC !="" && ansD !=""){
				$("#btn1").prop('disabled', false);
			}else{
				$("#btn1").prop('disabled', true);
			}
		}
		function writeData(value, elm) {

			if (elm == 'question') {
				$('#input').html(value);
				que = value;
				if(value != ""){
					$('#que').addClass('visited');
				}else{
					$('#que').removeClass('visited');
				}
			} else if (elm == 'optionA') {
				$('#opA').html(value)
					ansA = value;
				if(value != ""){
					$('#ansA').addClass('visited');
				}else{
					$('#ansA').removeClass('visited');
				}
			} else if (elm == 'optionB') {
				$('#opB').html(value);
				ansB = value;
				if(value != ""){
					$('#ansB').addClass('visited');
				}else{
					$('#ansB').removeClass('visited');
				}
			} else if (elm == 'optionC') {
				$('#opC').html(value);
				ansC = value;
				if(value != ""){
					$('#ansC').addClass('visited');
				}else{
					$('#ansC').removeClass('visited');
				}
			} else if (elm == 'optionD') {
				$('#opD').html(value);
				ansD = value;
				if(value != ""){
					$('#ansD').addClass('visited');
				}else{
					$('#ansD').removeClass('visited');
				}
			} else if (elm == 'solution') {
				$('#sol').html(value);
				solu = value;
			}
		}
		function selectEle(ele) {
			elm_selected = ele;
			if (elm_selected == 'question') {
				$('#input').html(que);
				$('#edit').html(que);
			} else if (elm_selected == 'optionA') {
				$('#opA').html(ansA);
				$('#edit').html(ansA);
			} else if (elm_selected == 'optionB') {
				$('#opB').html(ansB);
				$('#edit').html(ansB);
			} else if (elm_selected == 'optionC') {
				$('#opC').html(ansC);
				$('#edit').html(ansC);
			} else if (elm_selected == 'optionD') {
				$('#opD').html(ansD);
				$('#edit').html(ansD);
			} else if (elm_selected == 'solution') {
				$('#sol').html(solu);
				$('#edit').html(solu);
			}
		}
	</script>
	<div contenteditable="true" id="edit" onblur="go()"
		style="width: 575px; height: 350px; background-color: white; color: black; float: left;"></div>

	<div
		style="width: 80px; height: 350px; background-color: white; color: white; float: left">
		<button class="button" id="que" onclick="selectEle('question')">Question</button>
		<button class="button" id="ansA" onclick="selectEle('optionA')">Option:A</button>
		<button class="button" id="ansB" onclick="selectEle('optionB')">Option:B</button>
		<button class="button" id="ansC" onclick="selectEle('optionC')">Option:C</button>
		<button class="button" id="ansD" onclick="selectEle('optionD')">Option:D</button>
		<button class="button">Option:E</button>
		<button class="button">Option:F</button>
		<button class="button">Option:G</button>
		<button class="button">Option:H</button>
		<button class="button" onclick="selectEle('solution')">Solution:</button>



	</div>
	<div id="editor"
		style="width: 675px; height: 350px; overflow-wrap: break-word; background-color: white; color: Black; float: left">
		<b>Question:<b>
				<p id="input"></p>

				<div>
					<div style="width: 250px; height: 70px; float: left">
						<b>(A)<b>
								<p id="opA"></p>
					</div>
					<div style="width: 250px; height: 70px; float: right">
						<b>(B)<b>
								<p id="opB"></p>
					</div>
					<div style="width: 250px; height: 70px; float: left">
						<b>(C)<b>
								<p id="opC"></p>
					</div>
					<div style="width: 250px; height: 70px; float: right">
						<b>(D)<b>
								<p id="opD"></p>
					</div>
					<div style="width: 250px; height: 70px; float: left">
						<b>Ans:<b>
								<p id="sol"></p>
					</div>

				</div>
	</div>
	<div
		style="width: 1330px; height: 150px; background-color: #f2f2f2; color: black; text-align: center; float: left">
		<button id="btn1" value="save"
			style="position: absolute; left: 252px; bottom: 240px;" disabled>Save</button>
		<p id="copy"></p>
	</div>




	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#btn1").click(function() {
				var textValue = $("#editor").text();
				$("#copy").text(textValue);
			});
			$(".button").click(function() {
				$(".button").removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>
</body>
</html>