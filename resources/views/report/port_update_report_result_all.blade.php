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
					<table id="" class="table table-bordered table-striped" style="width:900px;margin: 0px auto;text-align: center;font-size:16px">
						<thead style="background:#ddd">
							<tr>
			                  <th>Serial</th>
			                  <th>Date</th>
			                  <th>Approved</th>
			                  <th>Rejected</th>
			                  <th>Pending</th>
			                </tr>
						</thead>
						<tbody>
					<?php 
					$count = 1;
					while (strtotime($form_date) <= strtotime($to_date))
					{
					$sql = 
					"
					SELECT
						(SELECT COUNT(`approve_status`) FROM tbl_port_update WHERE CAST(`approve_date` AS DATE) = '$form_date' AND `approve_status` = 'Approved') as accept_total,

						(SELECT COUNT(`approve_status`) FROM tbl_port_update WHERE CAST(`approve_date` AS DATE) = '$form_date' AND `approve_status` = 'Rejected') as reject_total,

						(SELECT COUNT(`approve_status`)l FROM tbl_port_update WHERE CAST(`approve_date` AS DATE) = '$form_date' AND `approve_status` = 'Pending') as pending_total
					";
					$result = DB::select($sql);	
					?>
					<tr>
	                  <th><?php echo $count; ?></th>
	                  <th><?php echo $form_date; ?></th>
	                  <th><?php echo $result[0]->accept_total; ?></th>
	                  <th><?php echo $result[0]->reject_total; ?></th>
	                  <th><?php echo $result[0]->pending_total; ?></th>
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