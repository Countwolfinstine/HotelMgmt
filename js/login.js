// function printTerms(gg){
//     $("#inputPassword").val("") ;
//     $("#retypePassword").val("") ;
// };

function successfulLogin(){
	window.alert("Successfully logged in");
}

// $("#reset").click(function(){
//     $("#userName").val() = "";
//     $("#inputEmail").val() = "";
//     $("#inputPassword").val() = "";
//     $("#retypePassword").val() = "";
// });

$('form').submit(function (e) {
	e.preventDefault();
	$.post('/login-api', {  password: $('#inputPassword3').val(), email:$("#inputEmail3").val()}, function(data){
		console.log(data);
		if( data.length == 0 || data=="no"){
			window.alert("Password or Email ID is wrong");
		}
		else{
			console.log(data[0].autorization);
			if(data[0].autorization == "Customer"){
				console.log("Customer has logged in" + data);					
				window.alert("successful Login");
				window.open("index.html","_self");
			}
			else if(data[0].autorization == "Waiter"){
				console.log("Waiter has logged in");
				window.open("waiter2.html","_self")
			}

			else if(data[0].autorization == "Manager"){	
				window.alert("successful Login");
				window.open("manager.html","_self")
			}
		}
	});
});
