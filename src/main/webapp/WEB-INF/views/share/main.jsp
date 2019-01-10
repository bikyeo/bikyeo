<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="text-center container">
	<div class="row">
		<select class="form-control col-2">
			<option>지역구</option>
			<option>대여소</option>
		</select>
		<div class="input-group col-10 search-padding">
			<input type="text" class="input-group form-control" placeholder="검색창">
			<button type="button" class="input-group-prepend btn btn-danger">검색</button>
		</div>
	</div>
	<div class="row">
		<div class="font-weight-bold cycle-background col-12 text-center">
			<span class="img-circle bg-dark text-white bg-circle">0대</span> 
			<span	class="img-circle bg-red text-dark bg-circle">1~3대</span> 
			<span class="img-circle bg-orange text-dark bg-circle">4~6대</span> 
			<span	class="img-circle bg-green text-dark bg-circle">7대 이상</span>

		</div>
	</div>
</div>
