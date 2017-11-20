$(document).ready(function () {
		// $.getJSON('/manager-api/',printTerms);
		$("#btn_inventory_update_quantity").click(function(){
			var ingredientName = $("#update_ingredient_name").val();
			var ingredientQuantity = $("#update_ingredient_quantity").val();

			$.get("/manager-api/update-ingredient/"+ingredientName+"/"+ingredientQuantity, function(data,status){
				alert("Data");
			});

		});
		$("#btn_inventory_add_new").click(function(){
			var ingredientName = $("#new_ingredient_name").val();
			var ingredientQuantity = $("#new_ingredient_quantity").val();

			$.get("/manager-api/add-ingredient/"+ingredientName+"/"+ingredientQuantity,function(data,status){
				console.log(data);
				console.log(status);
			});
		});

		$("#btn_food_add_new").click(function(){
			var foodName = $("#food_name").val();
			var cost = $("#cost").val();
			$.get("/manager-api/add-food/"+foodName+"/"+cost);
		});

		$("#btn_food_ingredient_add").click(function(){
			var foodName = $("#food_ingredient_fname").val();
			var ingName = $("#food_ingredient_iname").val();
			var ingQuantity = $("#food_ingredient_iquant").val();
			$.get("/manager-api/add-food-ingredient/"+foodName+"/"+ingName+"/"+ingQuantity);
		});

		$('#btn_food_sold').click(function(){
			var startDate = $("#start_date").val();
			var endDate = $("#end_date").val();
			$.getJSON('/manager-api/duration-food-sold/'+startDate+'/'+endDate, printDuration);
		});


	});

	function printTerms(terms){
		var recommendedItems = terms[0];
		var inventoryItems = terms[1];
		$.each(recommendedItems,function(index,term){
			$("#recommender_menu_table").append("<tr>"+
			"<td>"+term[0]+"</td>"+
			"<td>"+term[1]+"</td>"+
			"<td>"+term[2]+"</td>"+
			"<td>"+term[3]+"</td>"+
			"</tr>");
		});
		$.each(inventoryItems,function(index,term){
			$("#inventory_details_table").append("<tr>"+
			"<td>"+term[0]+"</td>"+
			"<td>"+term[1]+"</td>"+
			"</tr>");
		});
		console.log('blue');

	}

	function printDuration(terms){
		$.each(terms,function(index,term){
			$('food_sold').append("<tr>"+
			"<td>"+term['foodName']+"</td>"+
			"<td>"+term['foodQuantity']+"</td>"+
			"<td>"+term['foodAmount']+"</td>"+
			"</tr>");
		});
	}

	function shdiv()
	{
		var ele = document.getElementById("inventory_update_quantity");
		ele.style.display = "block";

	}
	function shdiv2()
	{
		var ele = document.getElementById("inventory_add_new");
		ele.style.display = "block";

	}
	function shdiv3()
	{
		var ele = document.getElementById("food_add_new");
		ele.style.display = "block";

	}
	function shdiv4()
	{
		var ele = document.getElementById("food_ingredient_add");
		ele.style.display = "block";

	}
	function shdiv5()
	{
		var ele = document.getElementById("food_sold");
		ele.style.display = "block";

	}

	$("#logout").click(function(){
	  console.log("logging out");
	  $.get("/logout-api");
	  window.open("login.html","_self")


	});
