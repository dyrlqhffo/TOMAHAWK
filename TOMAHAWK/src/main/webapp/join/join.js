var id = document.querySelector('#email');
var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');
var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');
var userName = document.querySelector('#name');
var mobile = document.querySelector('#mobile');
var nick = document.querySelector('#nick')
var error = document.querySelectorAll('.error_next_box');

let checkIdFlag = false;
let checkPassword1Flag = false;
let checkPassword2Flag = false;
let checkNameFlag = false;
let checkNickFlag = false;
let checkTelFlag = false;

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
};

function checkForm(event) {
	if (checkIdFlag == false) {
		alert("이메일 확인해주세요.");
		event.preventDefault();
	}
	if (checkPassword1Flag == false) {
		alert("비밀번호 확인해주세요.");
		event.preventDefault();
	}
	if (checkPassword2Flag == false) {
		alert("비밀번호 확인해주세요.");
		event.preventDefault();
	}
	if (checkNameFlag == false) {
		alert("이름 확인해주세요.");
		event.preventDefault();
	}
	if (checkTelFlag == false) {
		alert("전화번호 확인해주세요.");
		event.preventDefault();
	}
	if (checkNickFlag == false) {
		alert("닉네임 확인해주세요.");
		event.preventDefault();
	}
}


id.addEventListener("focusout", checkId);
nick.addEventListener("focusout", checkNick);
pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
userName.addEventListener("focusout", checkName);
mobile.addEventListener("focusout", checkPhoneNum);

function checkId() {
	var idPattern = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/g;
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if (xhr.responseText == "fail") {
				error[0].innerHTML = "이메일이 중복됩니다.";
				error[0].style.display = "block";
				checkIdFlag = false;
			} else if (id.value === "") {
				error[0].innerHTML = "이메일을 입력해주세요.";
				error[0].style.display = "block";
				checkIdFlag = false;
			} else if (!idPattern.test(id.value)) {
				error[0].innerHTML = "이메일 형식으로 입력해주세요.";
				error[0].style.display = "block";
				checkIdFlag = false;
			} else {
				error[0].innerHTML = "사용가능한 이메일입니다.";
				error[0].style.color = "#08A600";
				error[0].style.display = "block";
				checkIdFlag = true;
			}
		}
	}
	xhr.open("get", "../CheckId.do?email=" + id.value);
	xhr.send();
}

function checkPw() {
	var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
	if (pw1.value === "") {
		error[1].innerHTML = "비밀번호를 반드시 입력해주세요..";
		error[1].style.display = "block";
		checkPassword1Flag = false;
	} else if (!pwPattern.test(pw1.value)) {
		error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
		pwMsg.innerHTML = "X";
		pwMsgArea.style.paddingRight = "93px";
		error[1].style.display = "block";
		pwMsg.style.display = "block";
		pwImg1.src = getContextPath() + "/images/m_icon_not_use.png";
		checkPassword1Flag = false;
	} else {
		error[1].style.display = "none";
		pwMsg.innerHTML = "";
		pwMsg.style.display = "block";
		pwMsg.style.color = "#03c75a";
		pwImg1.src = getContextPath() + "/images/m_icon_safe.png";
		checkPassword1Flag = true;
	}
}

function comparePw() {
	if (pw2.value === pw1.value && pw2.value != "") {
		pwImg2.src = getContextPath() + "/images/m_icon_check_enable.png";
		error[2].style.display = "none";
		checkPassword2Flag = true;
	} else if (pw2.value !== pw1.value) {
		pwImg2.src = getContextPath() + "/images/m_icon_check_disable.png";
		error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
		error[2].style.display = "block";
		checkPassword2Flag = false;
	}

	if (pw2.value === "") {
		error[2].innerHTML = "비밀번호를 반드시 입력해주세요.";
		error[2].style.display = "block";
		checkPassword2Flag = false;
	}
}

function checkName() {
	var namePattern = /[a-zA-Z가-힣]/;
	if (userName.value === "") {
		error[3].innerHTML = "이름을 입력해주세요.";
		error[3].style.display = "block";
		checkNameFlag = false;
	} else if (!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
		error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
		error[3].style.display = "block";
		checkNameFlag = false;
	} else {
		error[3].style.display = "none";
		checkNameFlag = true;
	}
}

function checkNick() {
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			if (xhr.responseText == "fail") {
				error[4].innerHTML = "닉네임이 중복됩니다.";
				error[4].style.display = "block";
				checkNickFlag = false;
			} else if (nick.value === "") {
				error[4].innerHTML = "닉네임을 입력해주세요.";
				error[4].style.display = "block";
				checkNickFlag = false;
			} else {
				error[4].innerHTML = "사용가능한 닉네임입니다.";
				error[4].style.color = "#08A600";
				error[4].style.display = "block";
				checkNickFlag = true;
			}
		}
	}
	xhr.open("get", "../CheckNick.do?nick=" + nick.value);
	xhr.send();
}

function checkPhoneNum() {
	var isPhoneNum = /^[0-9]{3}[0-9]{4}[0-9]{4}/;
	if (mobile.value === "") {
		error[5].innerHTML = "전화번호를 입력해주세요.";
		error[5].style.display = "block";
		checkTelFlag = false;
	} else if (!isPhoneNum.test(mobile.value)) {
		error[5].innerHTML = "잘못된 형식입니다.";
		error[5].style.display = "block";
		checkTelFlag = false;
	} else {
		error[5].style.display = "none";
		checkTelFlag = true;
	}
}

function confirmDeleteMember(event) {
	event.preventDefault();
	swal({
		title: "회원 탈퇴!",
		text: "정말로 탈퇴하시겠습니까?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				document.getElementById("deleteMember").submit();
				swal("회원 탈퇴가 완료되었습니다!", {
					icon: "success",
				});
			} else {
				swal("탈퇴가 취소되었습니다!");
			}
		});
}

function confirmUpdateMemberInfo(event) {
    event.preventDefault();
    swal({
        title: "회원정보 수정!",
        text: "정말로 수정하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willUpdate) => {
        if (willUpdate) {
            document.querySelector("form[action$='Update.do']").submit();
            swal("회원정보 수정이 완료되었습니다!", {
                icon: "success",
            });
        } else {
            swal("수정이 취소되었습니다!");
        }
    });
}


