@extends('admin.master')
<!--Page Title-->
@section('page-title')
	R.A.P / P.A.P 
@endsection 

<!--Page Header-->
@section('page-header')
	R.A.P./P.A.P. Receive Summary Report
@endsection 

<!--Page Content Start Here-->
@section('page-content')
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="main_part">
					<br>
					<!-- Code Here.... -->
					<div id="">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<h3 class="text-center">{{$page_title}}</h3>
								<p class="text-center"><?php echo $form_date ?> To <?php echo $to_date; ?></p>
							</div>
							<div class="col-md-3"></div>
						</div>
						<!-- /.panel-heading -->
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<div class="panel-body">
									<table width="100%" class="table-bordered table" style="font-size:13px;">
										<thead style="background: #ddd">
										<tr>
											<th>SL</th>
											<th>Date</th>
											<th>Quantity</th>
										</tr>
										</thead>
										<tbody>
										<?php
										$count = 1;
										while (strtotime($form_date) <= strtotime($to_date))
										{
										$sql = "SELECT COUNT(`ServiceType`) as total FROM tbl_port_update WHERE CAST(`rec_cen_time` AS DATE) = '$form_date' AND `ServiceType` = '$serviceType' ";
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
									<!-- /.table-responsive -->
								</div>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</section>
@endsection 
<!--Page Content End Here-->
