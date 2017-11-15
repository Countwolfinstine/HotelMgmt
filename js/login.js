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
		if( data.length == 0 ){
			window.alert("Password or Email ID is wrong");
		}
		else{
			window.alert("successful Login");
		}
	});
});
