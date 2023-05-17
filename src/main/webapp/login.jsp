<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js" rel="stylesheet"/>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet"/>
	<link rel="stylesheet" href="<c:url value='/template/user/login/login.css'/>"/>
</head>
<body>
	<div class ="row">
		<div class="col-md-6 mx-auto p-0">
			<div class="card">
				<div class="login-box">
					<div class="login-snip">
						<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
						<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
						<div class="login-space">
							<form action="user-login" method="post">
								<div class="login">
									<div class="group">
										<label for="user" class="label">Username</label>
										<input id="user" type="text" class="input"  name="login-email" placeholder="Enter your username">
									</div>
									<div class="group">
										<label for="pass" class="label">Password</label>
										<input id="pass" type="password" class="input" data-type="password" name="login-password" placeholder="Enter your password">
									</div>
									<div class="group">
										<input id="check" type="checkbox" class="check" checked>
										<label for="check"><span class="icon"></span> Keep me Signed in</label>
									</div>
									<div class="group">
										<button type="submit" class="button">Sing In</button>
									</div>
									<div class="hr"></div>
										<div class="foot">
											<a href="#">Forgot Password?</a>
										</div>
									</div>
								</form>
							<form action="user-singup" method="post">
									<div class="sign-up-form">
											<div class="group">
												<label for="user" class="label">Username</label>
												<input id="user" type="text" name="register-name" class="input" placeholder="Create your Username">
											</div>
											<div class="group">
												<label for="pass" class="label">Password</label>
												<input id="pass" type="password" name="register-password" class="input" data-type="password" placeholder="Create your password">
											</div>
											<div class="group">
												<label for="pass" class="label">Repeat Password</label>
												<input id="pass" type="password" name="register-repass" class="input" data-type="password" placeholder="Repeat your password" >
											</div>
											<div class="group">
												<label for="pass" class="label">Email Address</label>
												<input id="pass" type="text" name="register-email" class="input" placeholder="Enter your email address">
											</div>
											<div class="group">
												<button type="submit" class="button">Sing up</button>
											</div>
											<div class="hr"></div>
											<div class="foot">
												<label for="tab-1">Already Member?</label>
											</div>
									</div>
							</form>
					</div>
				</div>
			</div>
		</div>   
	</div>
</body>
</html>