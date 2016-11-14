$(document).ready(function(){
	$('form[name="register"]').validate({
	    rules: {
	        u_email: { required: true, email:true, remote:{
		        	type:"post",
		        	url:"/register/chkId"
	        	} 
	        },
	        u_fname: { required: true },
	        u_lname: { required: true },
	        u_pwd: { required: true, minlength:4},
	        pwdconfirm: { equalTo: "#u_pwd" }
	    },
	    messages: {
	        u_email: {
	            required: "Check Your Email",
	            email: "Enter Right Email Form",
	            remote: "Duplicated. Enter Another Email"
	        },
	        u_fname:{ required:"Check Your Fastname" },
	        u_lname:{ required:"Check Your Lastname" },
	        u_pwd: { required: "Check Your Password" },
	        pwdconfirm: { equalTo: "Password Not Matched" }
	    },
	    submitHandler: function (form) {
	    	event.preventDefault();
			
	    	var form = $('form[name="register"]');
	    	var data = form_to_json(form);
	    	
	    	$.ajax({
	    		type:'POST',
	    		url: '/register',
	    		headers : {
	    			"Content-Type" : "application/json",
	    			"X-HTTP-Method-Override" : "POST"
	    		},
	    		dateType: 'json',
	    		data: JSON.stringify(form_to_json(form)),
	    		success : function(result){
	    			if(result == "Success"){
	    				window.location.replace('/registerSuccess');
	    			}else if(result == "Fail"){
	    				$('#registerModal').show();
	    				$('.errmsg').html('<span>REGISTER FAILED. CHECK YOUR REGISTER FORM</span>').fadeIn('slow').fadeOut('slow');
	    			}
	    		}
	    		,
	    	 	error: function(request,status,error){
	    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	    }
	    	});
	    },
	    success: function (e) {
	    	
	    }
	});
	
	$('form[name="login"]').validate({
	    rules: {
	        email: { required: true, email:true },
	        pw: { required: true}
	    },
	    messages: {
	        email: { required: "Check Your Email"},
	        pw: { required: "Check Your Password" }
	        
	    },
	    submitHandler: function(form, event) {
	    	event.preventDefault();
			
	    	var form = $('form[name="login"]');
	    	var data = form_to_json(form);
	    	
	    	$.ajax({
	    		type:'POST',
	    		url: '/login',
	    		headers : {
	    			"Content-Type" : "application/json",
	    			"X-HTTP-Method-Override" : "POST"
	    		},
	    		dateType: 'json',
	    		data: JSON.stringify(form_to_json(form)),
	    		success : function(result){
	    			if(result == "Fail"){
	    				$('#loginModal').modal();
	    				$('.errmsg').html('<span>EMAIL & PASSWORD NOT CORRECT</span>').fadeIn('slow').fadeOut('slow');
	    			}else{
		    			var dest = (result != null ? result : '/index');
		    			window.location.replace(dest);
	    			}
	    		}
	    		,
	    	 	error: function(request,status,error){
	    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	    }
	    	});
	    	
	//    	############# query String method ############
	    	
	//    	event.preventDefault();
	//    	
	//    	$(form).ajaxSubmit({
	//    		type:'POST',
	//    		url: '/login',
	//    		headers : {
	//    			"Content-Type" : "application/x-www-form-urlencoded",
	//    			"X-HTTP-Method-Override" : "POST"
	//			},
	//    		dateType: 'text',
	//    		data: $(form).serialize(),
	//			success : function(result){
	//				
	//				if(result == "Success"){
	//					window.location.reload();
	//				}else if(result == "Fail"){
	//					alert(result);
	//					$('#loginModal').show();
	//				}
	//			}
	//			,
	//    	 	error: function(request,status,error){
	//    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	//    	    }
	//    	});
	    }
	});
	
	$('form[name="mgrlogin"]').validate({
	    rules: {
	        email: { required: true, email:true },
	        pw: { required: true}
	    },
	    messages: {
	        email: { required: "Check Your Email"},
	        pw: { required: "Check Your Password" }
	        
	    },
	    submitHandler: function(form) {
			form.submit();
	    }
	});
	
	$('form[name="uupdate"]').validate({
	    rules: {
	        u_fname: { required: true },
	        u_lname: { required: true },
	        u_pwd: { required: true, minlength:4},
	        pwdconfirm: { equalTo: '[name="u_pwd"]' }
	    },
	    messages: {
	        u_fname:{ required:"REQUIRED" },
	        u_lname:{ required:"REQUIRED" },
	        u_pwd: { required: "Check Your Password" },
	        pwdconfirm: { equalTo: "Password Not Matched" }
	    },
	    submitHandler: function (form) {
	    	form.submit();
	    }
	});
	
	$('form[name="umupdate"]').validate({
	    rules: {
	        u_fname: { required: true },
	        u_lname: { required: true },
	        u_pwd: { required: true, minlength:4}
	    },
	    messages: {
	        u_fname:{ required:"REQUIRED" },
	        u_lname:{ required:"REQUIRED" },
	        u_pwd: { required: "Check Your Password" }
	    },
	    submitHandler: function (form) {
	    	form.submit();
	    }
	});
	
	$('form[name="omupdate"]').validate({
	    rules: {
	        o_price: { required: true },
	        o_rfname: { required: true },
	        o_rlname: { required: true },
	        o_phone: { required: true },
	        o_postcode: { required: true },
	        o_addr: { required: true }
	    },
	    messages: {
	    	o_price: { required: "REQUIRED" },
	        o_rfname: { required: "REQUIRED" },
	        o_rlname: { required: "REQUIRED" },
	        o_phone: { required: "REQUIRED" },
	        o_postcode: { required: "REQUIRED" },
	        o_addr: { required: "REQUIRED" }
	    },
	    submitHandler: function (form) {
	    	form.submit();
	    }
	});

	$('form[name="pmupdate"]').validate({
	    rules: {
	        o_price: { required: true },
	        o_rfname: { required: true },
	        o_rlname: { required: true },
	        o_phone: { required: true },
	        o_postcode: { required: true },
	        o_addr: { required: true }
	    },
	    messages: {
	    	o_price: { required: "REQUIRED" },
	        o_rfname: { required: "REQUIRED" },
	        o_rlname: { required: "REQUIRED" },
	        o_phone: { required: "REQUIRED" },
	        o_postcode: { required: "REQUIRED" },
	        o_addr: { required: "REQUIRED" }
	    },
	    submitHandler: function (form) {
	    	form.submit();
	    }
	});
	
	
	jQuery.validator.addMethod("phone", function(phone_number, element) {
	    phone_number = phone_number.replace(/\s+/g, "");
	    return this.optional(element) || phone_number.length > 9 && 
	    phone_number.match(/[0-9]{10}/);
	}, "Please specify a valid phone number");
	
	$('form[name="order"]').validate({
	    rules: {
	    	o_rfname: { required: true },
	    	o_rlname: { required: true },
	    	o_postcode: { required: true},
	    	o_addr: { required: true},
	    	o_phone: {required: true, phone:true, minlength:10, maxlength:10}
	    },
	    messages: {
	    	o_rfname:{ required:"REQUIRED" },
	    	o_rlname:{ required:"REQUIRED" },
	    	o_postcode: { required: "REQUIRED" },
	    	o_addr : { required: "REQUIRED" },
	    	o_phone: { required:"REQUIRED", phone: "NUMBER EXCLUDE '-' OR SPACE" }
	    },
	    submitHandler: function (form, event) {
	    	form.submit();
	    }
	});
	
	
	$('form[name="uresign"]').submit(function(event){
		event.preventDefault();
		
		var form = $('form[name="uresign"]');
    	var data = form_to_json(this);
    	
    	$.ajax({
    		type:'POST',
    		url: '/user/resign',
    		headers : {
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "POST"
    		},
    		dateType: 'json',
    		data: JSON.stringify(data),
    		success : function(result){
    			if(result == "Success"){
    				window.location.replace('/user/urcompl');
    			}else if(result == "Fail"){
    				$('.errmsg').html('<span>PASSWORD IS INCORRECT.</span>').fadeIn('slow').fadeOut('slow');
    			}
    		}
    		,
    	 	error: function(request,status,error){
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	    }
    	});
	});
	
	
});


function form_to_json (form) {
	var arr = $(form).serializeArray();
	var obj = {};
	for (var i = 0; i < arr.length; i++) obj[arr[i].name] = arr[i].value;
	return obj;
}