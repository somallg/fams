/**
 * 
 */

$(document)
		.ready(
				function() {
					$("#signin")
							.submit(
									function() {
										var userNameVal = $("#userNameId")
												.val();
										var passwordVal = $("#passwordId")
												.val();
										var rememberVal = $("#rememberId").is(
												":checked");

										var illegalRegex = /[^A-Za-z0-9_]/;
										var messageUser = "", messagePassword = "", messages = "";

										if ((userNameVal == "")
												|| (userNameVal == null)
												|| (userNameVal.length == 0)) {
											messageUser += "User name field cannot be null.\n";
										} else if (illegalRegex
												.test(userNameVal)) {
											messageUser += "User name field illegal format.\n";
										}

										if (messageUser != "") {
											$("#userNameId").addClass(
													"iDATA_Error");
										} else {
											$("#userNameId").removeClass(
													"iDATA_Error");
										}

										if ((passwordVal == "")
												|| (passwordVal == null)
												|| (passwordVal.length == 0)) {
											messagePassword += "Password field cannot be null.\n";
										} else if (illegalRegex
												.test(passwordVal)) {
											messagePassword += "Password field illegal format.\n";
										}

										if (messagePassword != "") {
											$("#passwordId").addClass(
													"iDATA_Error");
										} else {
											$("#passwordId").removeClass(
													"iDATA_Error");
										}
										messages += messageUser
												+ messagePassword;

										if (messages != "") {
											alert(messages);
											return false;
										}

										else
											return true;

									});
					$("#userNameId").keyup(function() {
						$("#userNameId").removeClass("iDATA_Error");
					});
					$("#passwordId").keyup(function() {
						$("#passwordId").removeClass("iDATA_Error");
					});					
				});