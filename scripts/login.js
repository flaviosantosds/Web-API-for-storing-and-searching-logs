$(function()
{
	$('#form').bind('submit', function(e)
	{
		e.preventDefault();
		var txt = $(this).serialize();
		
		$.ajax({
			type:'POST',
			url: 'login.php',
			data: txt,
			dataType: 'json',
			success: function(json){
				if (json.status == "logou") 
				{
					alert("Bem vindo ao gerenciamento de logs!");
					window.location.replace("logs.php");
				}
				else
					alert("Insira usuário e senha válidos!");
			}
		});
	});
});