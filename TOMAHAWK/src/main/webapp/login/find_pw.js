var id = document.querySelector('#email');
var name1 = document.querySelector('#name');

var error = document.querySelectorAll('.error_next_box');

id.addEventListener("focusout", checkId);
name1.addEventListener("focusout", checkName);

let checkIdFlag = false;
let checkNameFlag = false;

function checkForm(event) {
	if(checkIdFlag == false){
		alert("이메일 확인해주세요.");
		event.preventDefault();
	}
	if(checkNameFlag == false){
		alert("이름 확인해주세요.");
		event.preventDefault();
	}
}

function checkId() {
	var idPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4&&xhr.status==200){
			if(xhr.responseText == "fail"){
				error[0].innerHTML = "이메일 확인되었습니다.";
				error[0].style.color = "#08A600";
				error[0].style.display = "block";
				checkIdFlag = true;
			}else if(xhr.responseText == "ok"){
				error[0].innerHTML = "이메일이 틀립니다.";
				error[0].style.color = "#FF0000";
				error[0].style.display = "block";
				checkIdFlag = false;
			}else if (!idPattern.test(id.value)) { 
				error[0].innerHTML = "올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.";
				error[0].style.display = "block";
				checkIdFlag = false;
			} else {
				error[0].innerHTML = "";
				checkIdFlag = false;
			}
		}
	}
	xhr.open("get","../CheckId.do?email="+id.value);
	xhr.send();
}
function checkName() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4&&xhr.status==200){
			if(xhr.responseText == "fail"){
				error[1].innerHTML = "이름 확인되었습니다.";
				error[1].style.color = "#08A600";
				error[1].style.display = "block";
				checkNameFlag = true;
			}else if(xhr.responseText == "ok"){
				error[1].innerHTML = "이름이 틀립니다.";
				error[1].style.color = "#FF0000";
				error[1].style.display = "block";
				checkNameFlag = false;
			}else{
				checkNameFlag =  false;
			}
		}
	}
	xhr.open("get","../FindPwCheck.do?email="+id.value+"&name="+name1.value);
	xhr.send();
}