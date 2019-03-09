@extends('admin.master')
<!--Page Title-->
@section('page-title')
    R.A.P / P.A.P
    @endsection

            <!--Page Header-->
@section('page-header')
    R.A.P. / P.A.P. Approval Detail Report
    @endsection

            <!--Page Content Start Here-->
@section('page-content')

<?php 
$form_date = $_POST['from_date'];
$to_date = $_POST['to_date'];
$approved_status = $_POST['approved_status'];

 ?>
	<div class="row">
		<div class="col-md-12">
			<div class="main_part">
				<!-- Code Here.... -->
				<div class="table_view" style="padding: 10px">
					<h3 align="center">R.A.P./P.A.P. Approval Summary Report</h3>
					<h4 align="center"><?php echo $form_date ?> To <?php echo $to_date; ?></h4>
					<br>
					<table id="" class="table table-bordered table-striped" style="width: 500px;margin: 0px auto">
						<thead>
							<tr>
			                  <th>Serial</th>
			                  <th>Date</th>
			                  <th>Pending</th>
			                </tr>
						</thead>
						<tbody>
					<?php 
					$count = 1;
					while (strtotime($form_date) <= strtotime($to_date))
					{
					$sql = "SELECT COUNT(`approve_status`) as total FROM tbl_port_update WHERE CAST(`approve_date` AS DATE) = '$form_date' AND `approve_status` = 'Pending' ";
					 $pending = DB::select($sql);
					 //echo '<pre>';print_r($total);
					?>
					<tr>
	                  <th><?php echo $count; ?></th>
	                  <th><?php echo $form_date; ?></th>
	                  <th><?php echo $pending[0]->total; ?></th>
	                </tr>
					<?php	
					$form_date = date ("Y-m-d", strtotime("+1 day", strtotime($form_date)));
					$count++;
					}

					?>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

@endsection