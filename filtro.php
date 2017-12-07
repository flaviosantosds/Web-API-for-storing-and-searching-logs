<?php
	//codificação de caracteres
	header("Content-Type: text/html; charset=ISO-8859-1",true);

	$x = $_POST['selectCliente'];
	$y = $_POST['selectProduto'];
	$z = $_POST['selectCategoria'];
	$data_inicial = $_POST['data_inicial'];
	$data_final = $_POST['data_final'];

	if ($x>=1) 
	{
		if($y>=1)
		{
			if ($z>=1) 
			{
				if($data_inicial<>"" AND $data_final<>"")
					$filtro="WHERE tb_cliente.id_cliente =".$x." AND tb_produto.id_produto=".$y. " AND tb_categoria_log.id_categoria_log=".$z. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
				else
					$filtro="WHERE tb_cliente.id_cliente =".$x." AND tb_produto.id_produto=".$y. " AND tb_categoria_log.id_categoria_log=".$z;
			}
			elseif($data_inicial<>"" AND $data_final<>"")
				$filtro="WHERE tb_cliente.id_cliente =".$x." AND tb_produto.id_produto=".$y. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
			else
				$filtro="WHERE tb_cliente.id_cliente =".$x." AND tb_produto.id_produto=".$y;
		}
		elseif ($z>=1) 
		{
			if($data_inicial<>"" AND $data_final<>"")
				$filtro="WHERE tb_cliente.id_cliente =".$x. " AND tb_categoria_log.id_categoria_log=".$z. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
			else
				$filtro="WHERE tb_cliente.id_cliente =".$x." AND tb_categoria_log.id_categoria_log=".$z;
		}
		elseif($data_inicial<>"" AND $data_final<>"")
			$filtro="WHERE tb_cliente.id_cliente =".$x. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
		else
			$filtro="WHERE tb_cliente.id_cliente =".$x;
	}
			
	elseif ($y>=1)
	{
		if ($z>=1) 
		{
			if($data_inicial<>"" AND $data_final<>"")
				$filtro="WHERE tb_produto.id_produto =".$y. " AND tb_categoria_log.id_categoria_log=".$z. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
			else
				$filtro="WHERE  tb_produto.id_produto =".$y." AND tb_categoria_log.id_categoria_log=".$z;
		}
		elseif($data_inicial<>"" AND $data_final<>"")
			$filtro="WHERE tb_produto.id_produto =".$y. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
		else
			$filtro="WHERE tb_produto.id_produto =".$y;	
	}
	elseif($z>=1)
	{
		if($data_inicial<>"" AND $data_final<>"")
			$filtro="WHERE tb_categoria_log.id_categoria_log=".$z. " AND tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
		else
			$filtro="WHERE tb_categoria_log.id_categoria_log=".$z;
	}
	elseif($data_inicial<>"" AND $data_final<>"")
		$filtro="WHERE tb_registro_log.datahora_registro_log BETWEEN "."'".$data_inicial."' AND "."'".$data_final."'";
	else
		$filtro="";

	mysql_connect('localhost', 'root','') or die(mysql_error());
	mysql_select_db('db_desafio_audora') or die(mysql_error());

	$query = mysql_query("SELECT tb_cliente.nome_cliente, tb_produto.nome_produto,tb_categoria_log.nome_categoria_log, tb_registro_log.datahora_registro_log FROM tb_categoria_log INNER JOIN (tb_cliente INNER JOIN (tb_produto INNER JOIN tb_registro_log ON tb_produto.id_produto = tb_registro_log.id_produto) ON tb_cliente.id_cliente = tb_registro_log.id_cliente) ON tb_categoria_log.id_categoria_log = tb_registro_log.id_categoria ".$filtro);

	while($logs = mysql_fetch_array($query)){
		echo '<tr class="default">';
		echo '<td>'.$logs["nome_cliente"].'</td>';
		echo '<td>'.$logs["nome_produto"].'</td>';
		echo '<td>'.$logs["nome_categoria_log"].'</td>';
		echo '<td>'.$logs["datahora_registro_log"].'</td>';
		echo '</tr>';
	}
?>