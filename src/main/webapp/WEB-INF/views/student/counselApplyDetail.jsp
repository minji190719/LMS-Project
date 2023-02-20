<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="#" method="post" novalidate="novalidate">
                                    	<div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="cnsla_type">유형선택 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <select class="form-control" id="cnsla_type" name="cnsla_type">
                                                    <option value="0">대면</option>
                                                    <option value="1">비대면</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="cnsla_sub">상담주제 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="cnsla_sub" name="cnsla_sub">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="cnsla_content">상담내용 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea rows="4" cols="10" class="form-control" name="" id="val-password"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
</body>
</html>