<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<title>DOG #</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<style>
		body{
			padding-top : 70px;
		}
	</style>
	
	<script type="text/javascript">
		function fncUpdateProduct(){
			//Form ��ȿ�� ����
			var name = $('input[name="prodName"]').val();
			var detail = $('input[name="prodDetail"]').val();
			var manuDate = $('input[name="manuDate"]').val();
			var price = $('input[name="price"]').val();
			var stock = $('input[name="stock"]').val();
			var formData = new FormData();
			formData.append('file',$('input[name="file"]')[0].files[0]);
			
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��ؾ� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�� �������� �ݵ�� �Է��ؾ� �մϴ�.");
				return;
			}
			if(stock == null || stock == ''){
				stock = 0;
				$('input[name="stock"]').val(0);
			}
			if(stock != ''){
				if(!$.isNumeric(stock)){
					alert('������ ���ڷ� �Է����ּ���.');
					return;
				}
			}
			if(manuDate == null || manuDate.length<1){
				alert("�������� �ݵ�� �Է��ؾ� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ؾ� �մϴ�.");
				return;
			}
			if(!$.isNumeric(price)){
				alert('������ ���ڷ� �Է����ּ���.');
				return;
			}

			<%-- ��ǰ ������ ���â --%>
			$('#myModal').modal('show');
			if($('input[name="file"]')[0].files[0] != null){
				$.ajax({
					url : 'json/uploadFile',
					method : 'post',
					data : formData,
					contentType:false,
					processData:false,
					success : function(){
						window.setTimeout(modalOut,5000);
						window.setTimeout(sendForm,5000);
					},
					error : function(jqXHR, status, error){
						modalOut();
						alert('��Ͽ� �����߽��ϴ�. ��� �� �ٽ� �õ��� �ּ���..');
					},
					statusCode : {
						404 : function(){
							console.log("�߸��� ����Դϴ�");
						},
						400 : function(){
							console.log("�߸��� ��û�Դϴ�");
						}
					}
				});
			}else{
				modalOut();
				sendForm();
			}
			
		}
	
	
		$(function(){
			$('button:contains("����")').on('click', function(){
				fncUpdateProduct();
			});
			
			$('#inputManuDate').datepicker({
				dateFormat : 'yymmdd'
			})
		})
		
		function modalOut(){
			$('#myModal').modal('hide');
		}
		
		function sendForm(){
			$('form.update-product').attr('method','post').attr('action','updateProduct').attr('enctype','multipart/form-data').submit();
		}
		

	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="../layout/menubar.jsp">
		<jsp:param name="uri" value="../"/>
	</jsp:include>

<div class="container">

	<div class="page-header col-sm-offset-2 col-sm-10">
		<h1>��ǰ ���� ����</h1>
	</div>
	<form class="update-product form-horizontal">
		<div class="form-group">
			<input type="hidden" name="prodNo" value="${product.prodNo }"/>
			<div class="row">
				<label for="inputProdName" class="col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputProdName" name="prodName" value="${product.prodName}" placeholder="��ǰ��">
				</div>
				<span class="col-sm-6"></span>
			</div>
			<br/>
			<div class="row">
				<label for="inputProdDetail" class="col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="inputProdDetail" name="prodDetail" value="${product.prodDetail}" placeholder="������">
				</div>
			</div>
			<br/>
			<div class="row">
				<label for="inputStock" class="col-sm-3 control-label">�߰�����</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputStock" name="stock" >
				</div>
				<span class="col-sm-6">(���� ���� : ${product.stock})</span>
			</div>
			<br/>
			<div class="row">
				<label for="inputManuDate" class="col-sm-3 control-label">������</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputManuDate" name="manuDate" value="${product.manuDate}" readonly>
				</div>
				<span class="col-sm-6"></span>
			</div>
			<br/>
			<div class="row">
				<label for="inputPrice" class="col-sm-3 control-label">����</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="inputPrice" name="price" value="${product.price}">
				</div>
				<span class="col-sm-6"></span>
			</div>
			<br/>
			<div class="row">
				<label for="inputFile" class="col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="inputFile" name="file">
				</div>
				<span class="col-sm-3"></span>
			</div>
			<div class="row">
				<label for="inputCurrent" class="col-sm-3 control-label">���� �̹���</label>
				<div class="col-sm-6">
					<c:if test="${!empty product.fileName}">
						<img src="/images/uploadFiles/${product.fileName}" style="height: 200px; width: 100%;"/>
					</c:if>
					<c:if test="${empty product.fileName}">
						��ϵ� ������ �����ϴ�.
					</c:if>
				</div>
				<span class="col-sm-3"></span>
			</div>
			<br/>
			<div class="row">
				<div class="col-sm-offset-3 col-sm-9">
					<button type="button" class="btn btn-success">
						����
					</button>
					
					<!-- ���� �� ���â���� ǥ�� -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
									<h4 class="modal-title" id="myModalLabel">��ø� ��ٷ��ּ���! �������Դϴ�</h4>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
</div>

</body>
</html>