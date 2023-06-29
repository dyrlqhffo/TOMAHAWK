var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var error = document.querySelectorAll('.error_next_box');

let checkPassword1Flag = false;
let checkPassword2Flag = false;

function checkForm(event) {
	if(checkPassword1Flag == false){
		alert("비밀번호 확인해주세요.");
		event.preventDefault();
	}
	if(checkPassword2Flag == false){
		alert("비밀번호 확인해주세요.");
		event.preventDefault();
	}
}


pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);

function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[0].innerHTML = "비밀번호를 반드시 입력해주세요..";
        error[0].style.display = "block";
		checkPassword1Flag = false;
    } else if(!pwPattern.test(pw1.value)) {
        error[0].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "X";
        pwMsgArea.style.paddingRight = "93px";
        error[0].style.display = "block";
        pwMsg.style.display = "block";
        pwImg1.src = "${pageContext.request.contextPath}/images/m_icon_not_use.png";
		checkPassword1Flag = false;
    } else {
        error[0].style.display = "none";
        pwMsg.innerHTML = "";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "${pageContext.request.contextPath }/images/m_icon_safe.png";
		checkPassword1Flag = true;
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "${pageContext.request.contextPath }/images/m_icon_check_enable.png";
        error[1].style.display = "none";
        checkPassword2Flag = true;
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "${pageContext.request.contextPath }/images/m_icon_check_disable.png";
        error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[1].style.display = "block";
        checkPassword2Flag = false;
    } 

    if(pw2.value === "") {
        error[1].innerHTML = "비밀번호를 반드시 입력해주세요.";
        error[1].style.display = "block";
        checkPassword2Flag = false;
    }
}
function sendit() {
	f.action = "${pageContext.request.contextPath }/main.jsp"
    f.submit();
}

function confirmUpdatePassword(event) {
    event.preventDefault();
    swal({
        title: "비밀번호 수정!",
        text: "정말로 수정하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willUpdate) => {
        if (willUpdate) {
            swal("비밀번호 수정이 완료되었습니다!", {
                icon: "success",
            })
            .then(() => {
                document.querySelector("form[action$='Update.do']").submit();
            });
        } else {
            swal("수정이 취소되었습니다!");
        }
    });
}