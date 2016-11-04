function loginCheck() {
	var flag = true;
	$(".errmsg").html("");
	var login = $('form[name="login"]')
	
	if (login.email.value == ""){
		$(".errmsg").append("<span>CHECK YOUR ID</span>");
		flag = false;
	}
	if(login.pw.value == ""){
		$(".errmsg").append("<span>CHECK YOUR PASSWORD</span>");
		flag = false;
	}
	if(flag == false){
		return;
	}
	login.submit();
}

function registerCheck() {
	var flag = true;
	$(".errmsg").html("");
	var register = $('form[name="register"]')
	
	if (login.email.value == ""){
		$(".errmsg").append("<span>CHECK YOUR ID</span>");
		flag = false;
	}
	if(login.pw.value == ""){
		$(".errmsg").append("<span>CHECK YOUR PASSWORD</span>");
		flag = false;
	}
	if(login.fname.value == ""){
		$(".errmsg").append("<span>CHECK YOUR FIRST NAME</span>");
		flag = false;
	}
	if(login.lname.value == ""){
		$(".errmsg").append("<span>CHECK YOUR LAST NAME</span>");
		flag = false;
	}
	if(login.pw != login.pwconfirm){
		$(".errmsg").append("<span>PASSWORD NOT MATCHED</span>")
		flag = false;
	}
	
	if(flag == false){
		return;
	}
	
	register.submit();
}