function loginCheck() {
	if (login.iId.value == "" || login.iPwd.value == "") {
		alert("ID & PASSWORD are required");
		login.iId.focus();
		return;
	}
	login.submit();
}

