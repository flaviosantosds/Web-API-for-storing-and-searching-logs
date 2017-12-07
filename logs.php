<!DOCTYPE HTML>
<html lang="pt-br">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<title>Desafio Audora</title>

		<!-- bootstrap-->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>
	<body>
		<?php
			header("Content-Type: text/html; charset=ISO-8859-1",true);
			mysql_connect('localhost', 'root','') or die(mysql_error());
			mysql_select_db('db_desafio_audora') or die(mysql_error());
		?>
		
		<div class="container">
			<div class="jumbotron">
				<h1>Gerenciamento de Logs</h1>
			</div>

			<hr />
			
			<div class="row">
				<form method="POST" id="form">
					<div class="col-md-3">
						<label>Cliente:</label>
						<select id="cliente" class="form-control" name="selectCliente">
							<option value="">--Selecione um cliente</option>
							<?php

								$query = mysql_query("SELECT id_cliente, nome_cliente FROM tb_cliente");

								while ($cli = mysql_fetch_array($query)) {
							?>
							<option value="<?php echo $cli['id_cliente'] ?>"><?php echo $cli['nome_cliente']?></option>
							<?php } ?>
						</select>
					</div>

					<div class="col-md-3">
						<label>Produto:</label>
						<select id="produto" class="form-control" name="selectProduto">
							<option value="">--Selecione um produto</option>
							
							<?php

								$query = mysql_query("SELECT id_produto, nome_produto FROM tb_produto");
							
								while($prod = mysql_fetch_array($query)){
							?>
							<option value="<?php echo $prod['id_produto']?>"><?php echo $prod['nome_produto']?></option>
							<?php } ?>
						</select>
					</div>

					<div class="col-md-3">
						<label>Categoria:</label>
						<select id="categoria" class="form-control" name="selectCategoria" />
							<option value="">--Selecione uma categoria</option>
							<?php

								$query = mysql_query("SELECT id_categoria_log, nome_categoria_log FROM tb_categoria_log");
							
								while($cat = mysql_fetch_array($query)){
							?>
							<option value="<?php echo $cat['id_categoria_log']?>"><?php echo $cat['nome_categoria_log']?></option>
							<?php } ?>
						</select>
					</div>

					<div class="col-md-3">
						<span style="float: left;">
							<label>Entre:</label> <input type="datetime" class="form-control" name="data_inicial" style="width: 125px;" placeholder="aaaa-mm-dd" id="datainicial"/>
						</span>
						<span style="margin-top: 30px; margin-left:4px; float: left;">-</span>
						<span style="float: right;">
							<input type="datetime" class="form-control" name="data_final" style="width: 125px; margin-top: 25px;" placeholder="aaaa-mm-dd"/>
						</span>
					</div>
				</div>

				<hr />		 
				 
				<div class="row">
					<div class="col-md-4"></div>

					<div class="col-md-4"></div>

					<div class="col-md-4">
						<button type="submit" class="btn btn-lg btn-primary pull-right">Buscar</button>
					</div>
				</div>
			</form>

			<hr />

			<table class="table table-striped table-bordered table-hover table-condensed" style="display: none;">
		        <thead>
		          <tr>
		            <th style="text-align: center;">Cliente</th>
		            <th style="text-align: center;">Produto</th>
		            <th style="text-align: center;">Categoria</th>
		            <th style="text-align: center;">Data/Hora</th>
		          </tr>
		        </thead>

		        <tbody></tbody>
	      </table>
		</div>
	</body>
	<script language="javascript" src="scripts/jquery-3.2.1.js"></script>
	<script language="javascript" src="scripts/filtro.js"></script>
</html>