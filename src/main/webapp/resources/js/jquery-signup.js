/**
 * 
 */
$(document)
		.ready(
				function() {
					$("#signup")
							.submit(
									function() {
										var first_name = $("#first_name").val();
										var last_name = $("#last_name").val();
										var email = $("#email").val();
										var password = $("#password").val();
										var confirm_pass = $("#confirm_pass")
												.val();
										var illegal = /[^A-Za-z ]/;
										var illegalRegex = /[^A-Za-z0-9_]/;
										var email_regex = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/;
										var messageFirstName = "", messageLastName = "", messageEmail = "", messagePassword = "", messagePasswordConfirm = "", messages = "";

										if ((first_name == "")
												|| (first_name == null)
												|| (first_name.length == 0)) {
											messageFirstName += "First name field cannot be null.\n";
										} else if (illegal.test(first_name)) {
											messageFirstName += "First name field illegal format.\n";
										}

										if (messageFirstName != "") {
											$("#first_name").addClass(
													"siDATA_Error");
										} else {
											$("#first_name").removeClass(
													"siDATA_Error");
										}

										if ((last_name == "")
												|| (last_name == null)
												|| (last_name.length == 0)) {
											messageLastName += "Last name field cannot be null.\n";
										} else if (illegal.test(last_name)) {
											messageLastName += "Last name field illegal format.\n";
										}

										if (messageLastName != "") {
											$("#last_name").addClass(
													"siDATA_Error");
										} else {
											$("#last_name").removeClass(
													"siDATA_Error");
										}

										if ((email == "") || (email == null)
												|| (email.length == 0)) {
											messageEmail += "Email field cannot be null.\n";
										} else if (!email_regex.test(email)) {
											messageEmail += "Email field illegal format.\n";
										}

										if (messageEmail != "") {
											$("#email")
													.addClass("siDATA_Error");
										} else {
											$("#email").removeClass(
													"siDATA_Error");
										}

										if ((password == "")
												|| (password == null)
												|| (password.length == 0)) {
											messagePassword += "Password field cannot be null.\n";
										} else if (illegalRegex
												.test(password)) {
											messagePassword += "Password field illegal format.\n";
										}

										if (messagePassword != "") {
											$("#password").addClass(
													"siDATA_Error");
										} else {
											$("#password").removeClass(
													"siDATA_Error");
										}

										if ((confirm_pass == "")
												|| (confirm_pass == null)
												|| (confirm_pass.length == 0)) {
											messagePasswordConfirm += "Confirm password field cannot be null.\n";
										} else if (illegalRegex
												.test(confirm_pass)) {
											messagePasswordConfirm += "Confirm password field illegal format.\n";
										}

										if (messagePasswordConfirm != "") {
											$("#confirm_pass").addClass(
													"siDATA_Error");
										} else {
											$("#confirm_pass").removeClass(
													"siDATA_Error");
										}

										if (password !== confirm_pass) {
											messagePassword += "Password confirm not fit.\n";
											$("#password").addClass(
													"siDATA_Error");
											$("#confirm_pass").addClass(
													"siDATA_Error");
										}

										messages += messageFirstName
												+ messageLastName
												+ messageEmail
												+ messagePassword
												+ messagePasswordConfirm;

										if (messages != "") {
											alert(messages);
											return false;
										} else
											return true;
									});
					
					$("#first_name").keyup(function() {
						$("#first_name").removeClass("siDATA_Error");
					});
					$("#last_name").keyup(function() {
						$("#last_name").removeClass("siDATA_Error");
					});
					$("#email").keyup(function() {
						$("#email").removeClass("siDATA_Error");
					});
					$("#password").keyup(function() {
						$("#password").removeClass("siDATA_Error");
					});
					$("#confirm_pass").keyup(function() {
						$("#confirm_pass").removeClass("siDATA_Error");
					});
				});