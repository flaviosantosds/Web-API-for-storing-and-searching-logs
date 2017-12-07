<?php
$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

mysql_connect('localhost', 'root','') or die(mysql_error());
mysql_select_db('db_desafio_audora') or die(mysql_error());

$result = mysql_query("SELECT * FROM tb_login WHERE tb_login.usuario = '$usuario' AND tb_login.senha= '$senha'");

$array = array('status'=>'');

if(mysql_num_rows($result)>0)
{
	$array['status']='logou';

	$cliente_produto = mysql_query("SELECT id_cliente_produto FROM tb_login WHERE tb_login.usuario = '$usuario' AND tb_login.senha= '$senha'");
	$cliente_produto1 = mysql_result($cliente_produto, 0);
	$cliente = mysql_query("SELECT id_cliente FROM tb_cliente_produto WHERE id_cliente_produto = '$cliente_produto1'");
	$cliente1 = mysql_result($cliente, 0);
	$hoje = date("Y-m-d H:i:s");
	
	mysql_query("INSERT INTO tb_registro_log (id_produto, id_cliente, id_categoria, datahora_registro_log) VALUES ('$cliente_produto1', '$cliente1', 3, '$hoje')");
}
else
	$array['status']="Erro";
echo json_encode($array);