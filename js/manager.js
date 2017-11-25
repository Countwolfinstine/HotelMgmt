$(document).ready(function () {

		$.getJSON("/manager-api/onload1/", printIngredients);

		$("#btn_inventory_update_quantity").click(function(){
			var ingredientName = $("#update_ingredient_name").val();
			var ingredientQuantity = $("#update_ingredient_quantity").val();

			$.get("/manager-api/update-ingredient/"+ingredientName+"/"+ingredientQuantity, function(data,status){
				alert("updated");
				location.reload();
			});

		});
		$("#btn_inventory_add_new").click(function(){
			var ingredientName = $("#new_ingredient_name").val();
			var ingredientQuantity = $("#new_ingredient_quantity").val();

			$.get("/manager-api/add-ingredient/"+ingredientName+"/"+ingredientQuantity,function(data,status){
				console.log(data);
				console.log(status);
				location.reload();
			});

		});

		$("#btn_food_add_new").click(function(){
			var foodName = $("#food_name").val();
			var cost = $("#cost").val();
			$.get("/manager-api/add-food/"+foodName+"/"+cost);
			location.reload();
		});

		$("#btn_food_ingredient_add").click(function(){
			var foodName = $("#food_ingredient_fname").val();
			var ingName = $("#food_ingredient_iname").val();
			var ingQuantity = $("#food_ingredient_iquant").val();
			$.get("/manager-api/add-food-ingredient/"+foodName+"/"+ingName+"/"+ingQuantity);
			location.reload();
		});

		$('#btn_food_sold').click(function(){
			var startDate = $("#start_date").val();
			var endDate = $("#end_date").val();
			$.getJSON('/manager-api/duration-food-sold/'+startDate+'/'+endDate, printDuration);
			location.reload();
		});


	});

	function printIngredients(terms){
		//"<tr id = food"+term['item_id']+">"
		$.each(terms,function(index,term){
			$("#inventory_details_table").append("<tr id= ingredient"+term['ing_id']+">"+
			"<td>"+term["ing_name"]+"</td>"+
			"<td>"+term["quantity"]+"</td>"+
			"</tr>");
		});

		$.getJSON("/manager-api/onload2/", printIngredientsThreshold);
	}

	function printIngredientsThreshold(terms){
		//printIngredientsThreshold
		$.each(terms, function(index,term){
			console.log(term);
			$("#ingredient"+term['ing_id']).addClass('danger');
		})
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
