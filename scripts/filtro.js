$(function()
{
	$('#form').bind('submit', function(e)
	{
		e.preventDefault();
		var txt = $(this).serialize();

		$.ajax({
			type:'POST',
			url: 'filtro.php',
			data: txt,
			success: function(consulta)
			{
				$('table').css('display', 'table');
				$('tbody').html(consulta);

			},
			error: function()
				alert('Não foi possível realizar a busca com os parâmetros informados!');
		});
	});
});