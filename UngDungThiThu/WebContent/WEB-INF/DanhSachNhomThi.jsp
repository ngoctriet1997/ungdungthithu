<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sufee Admin - HTML5 Admin Template</title>
  <meta name="description" content="Sufee Admin - HTML5 Admin Template">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="apple-touch-icon" href="apple-icon.png">
  <link rel="shortcut icon" href="favicon.ico">

  <link rel="stylesheet" href="NoiDungWeb/assets/css/normalize.css">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/font-awesome.min.css">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/themify-icons.css">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/flag-icon.min.css">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/cs-skin-elastic.css">
  <link rel="stylesheet" href="NoiDungWeb/QuanLyThiSinh/thisinh.css">
  
  <link rel="stylesheet" href="NoiDungWeb/assets/scss/style.css">
  <link href="NoiDungWebassets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="NoiDungWeb/assets/css/lib/datatable/dataTables.bootstrap.min.css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

  <style>

  .QLDT .btnE,.btnV ,.btnD{
   padding:5px;
   color:darkgreen;
   font-size:18px;
 }

</style>

</head>
<body>


  <!-- Left Panel -->

  <aside id="left-panel" class="left-panel">
   <nav class="navbar navbar-expand-sm navbar-default">

    <div class="navbar-header">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fa fa-bars"></i>
      </button>


    </div>

    <div id="main-menu" class="main-menu collapse navbar-collapse">
      <ul class="nav navbar-nav">

        <h3 class="menu-title">Quản lý nhóm thi</h3><!-- /.menu-title -->
        <li class="active">
          <a  href="DanhSachThiSinh"> <i class="menu-icon ti-email"></i>Sinh viên</a>
        </li>
        <li>
          <a href="DanhSachNhomThi"> <i class="menu-icon ti-email"></i>Nhóm thi</a>
        </li>
        <li>
          <a href="DanhSachTSNT"> <i class="menu-icon ti-email"></i>Danh Sách thí sinh trong nhóm thi</a>
        </li>
       	<li class="nav-item float-sm-right mt-1 menuitem">
							<a  data-toggle="modal" data-target="#modalDangXuat" class="nav-link" href="#">Đăng xuất</a>
						</li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </nav>
</aside><!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">



  <div class="breadcrumbs">
    <div class="col-sm-4">
      <div class="page-header float-left">
        <div class="page-title">
          <h1>Quản lý nhóm thi</h1>
        </div>
      </div>
    </div>

  </div>

  <div class="content mt-3"><!--phần nội dung bảng để trong div này-->
   <div class="QLDT container">
     <div class="formDeThi card">
      <div class="card-header">
        <strong class="card-title">Nhóm thi</strong>
        <button type="text" class="btnadd" data-toggle="modal" data-target="#ModalThem">Thêm mới</button>

      </div>
      <div class="card-body">

       <table class="table table-bordered" id="dataTable" >
        <thead>
          <tr>
            <th>Mã</th>
            <th>Tên nhóm</th>                  
          </tr>
        </thead>
        <tbody>
         <c:forEach items="${danhSachNhomThi}" var="item">
         <tr>
          <td>${item.ma}</td>
          <td>${item.ten}</td>
          <td>
           <a class="btnV" data-toggle="modal" data-target="#ModalXem" id="showTable"><i class="fa fa-eye"></i></a>
                 <a class="btnE" href="#"data-toggle="modal" data-target="#ModalSua"><i class="fa fa-edit"></i></a>
                  <a class="btnD" href="DeleteNT?Ma=${item.ma}"><i class="fa fa-trash"></i></a>
          </td>
        </tr>
      </c:forEach>

    </tbody>
  </table>
  
  
</div>
</div>
</div>
</div>
</div>
<!-- Right Panel -->
<!--Model Them-->
<div class="modal fade" id="ModalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm nhóm thi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddNhom" method="POST">
          
          <div class="form-group">
            <label for="Ten" class="col-form-label">Tên:</label>
            <input type="text" class="form-control" id="TenNhom" name="Ten">
          </div>
          
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" ">Thêm</button>
        <span id="mylocation"></span>
      </div>
      </form>
    </div>
  </div>
</div>
<!--Model Sua-->
<div class="modal fade" id="ModalSua" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sửa nhóm thi</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="SuaNhom" method="POST">
          <div class="form-group">
            <label for="Ma" class="col-form-label">Mã:</label>
            <input type="text" class="form-control" id="Ma" name="Ma" readonly/>
          </div>

          <div class="form-group">
            <label for="Ten" class="col-form-label">Tên:</label>
            <input type="text" class="form-control" id="Ten" name="Ten">
          </div>
          
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
        <button type="submit" class="btn btn-primary">Sửa</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!--Model Xem-->
<div class="modal fade" id="ModalXem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Xem thí sinh trong nhóm thi:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="bootstrap-data-table" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Mã</th>
										<th>Số điện thoại</th>
										<th>Tên</th>
										<th>Mật khẩu</th>
									</tr>
								</thead>
								<tbody id="resAjax">
									

								</tbody>
							</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="thoat">Thoát</button>
      </div>
    </div>
  </div>
</div>


<script src="NoiDungWeb/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="NoiDungWeb/assets/js/plugins.js"></script>
<script src="NoiDungWeb/assets/js/main.js"></script>


<script src="NoiDungWeb/assets/js/lib/data-table/datatables.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/jszip.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/pdfmake.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/vfs_fonts.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/buttons.html5.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/buttons.print.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/buttons.colVis.min.js"></script>
<script src="NoiDungWeb/assets/js/lib/data-table/datatables-init.js"></script>

<script>
 $(document).ready(function() {
  $('#bootstrap-data-table-export').DataTable();

});
 $(document).ready(function() {
	  $('#bootstrap-data-table-export').DataTable();

	});
	   
 $(document).ready(function() {
     $('#bootstrap-data-table-export').DataTable();
			
		 });
        $(".btnE").click(function(){
       	 
       	 var id=$(this).parent().siblings().eq(0).text();
       	 console.log(id);
       	   $.ajax({
             	url:"SuaNhom",
             	data:{
             		id:id
             	},
       	   success:function(res){
       		   var kq=JSON.parse(res);
       		   $("#ModalSua input[name='Ma']").val(kq.ma);  
       		   $("#ModalSua input[name='Ten']").val(kq.ten);
       		  
       	   }
             }) 
        })
        $(".btnV").click(function(){
            	 
            	 
            	 var id=$(this).parent().siblings().eq(0).text();
            	 console.log(id);
            	   $.ajax({
                  	url:"GetInfoTS",
                  	data:{
                  		id:id
                  	},
            	   success:function(res){
            		   var kq=JSON.parse(res);
            		  
            		   $("#ModalXem #resAjax").empty();
						for (var i in kq) {
							
							var temp = "<tr>" +
								"<td>" + kq[i].ma + "</td>" +
								"<td>" + kq[i].sdt + "</td>" +
								"<td>" + kq[i].ten + "</td>" +
								"<td>" + kq[i].matKhau + "</td>" +
								
								"</tr>";

							$("#ModalXem #resAjax").append(temp);
						}
            	   }
                  }) 
             })
             $("#thoat").click( function(){
        //alert("fegf");
    	 $("#ModalXem #resAjax").empty();
    });


</script>
<!-- Modal DangXuat -->
			<div id="modalDangXuat" class="modal fade" role="dialog">
			  <div class="modal-dialog modal-sm">
			
			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			     
			        <h4 class="modal-title">Đăng xuất</h4>
			      </div>
			      <div class="modal-body">
			        <p>Bạn có chắc chắn đăng xuất</p>
			      </div>
			      <div class="modal-footer">
			      <a href="DangXuat">  <button type="button" class="btn btn-danger" >Đồng ý</button></a>
			      </div>
			    </div>
			
			  </div>
			</div>
			<!-- het Modal DangXuat -->
</body>
</html>
