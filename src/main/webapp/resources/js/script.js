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
	    				$('.errmsg').html('<span>REGISTER FAILED. CHECK YOUR REGISTER FORM</span>');
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
    			if(result == "Success"){
    				window.location.reload();
    			}else if(result == "Fail"){
    				$('#loginModal').show();
    				$('.errmsg').html('<span>EMAIL & PASSWORD NOT CORRECT</span>');
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

function form_to_json (form) {
	var arr = $(form).serializeArray();
	var obj = {};
	for (var i = 0; i < arr.length; i++) obj[arr[i].name] = arr[i].value;
	return obj;
}