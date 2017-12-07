$(function(){
	$('#form').bind('submit', function(e){
		/*preventDefault evita que o
		formulário seja enviado de forma
		padronizada (recarregando a página).
		O envio/requisição será feito via
		ajax.*/
		e.preventDefault();
		/*serialize() pega todos os dados
		e formata para um padrão que o ajax
		consiga utilizar (json).*/
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
					alert("Usuário/Senha inseridos não existe!");
			}
		});
	});
});