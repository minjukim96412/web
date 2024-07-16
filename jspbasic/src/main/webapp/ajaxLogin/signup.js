/*
($)=>{
	class Signup {
		init(){
			this.signForm();
		}
		signForm(){
			//회원가입 전송 폼
			$('.submit-btn').on({
				click(e){
					e.preventDefault();
					//입력상자 전송값 가져오기
					const userId = $(#userId).val();
					const userPw = $(#userPw).val();
					const userName = $(#userName).val();
					const userEmail = $(#userEmail).val();
					const userHp = $(#useHp).val();
					const userGender = $(#userGender).val();
					const userAddress = $(#userAddress).val();
					
					$.ajax({
						url : './signup-action.jsp',
						type : 'POST',
						data : {
							userId : userId,
							userPw : userPw,
							userName : userName,
							userEmail : userEmail,
							userHp : userHp,
							userGender : userGender,
							userAddress : userAddress
						},
							success(res){
						console.log(res);
						console.log("ajax 연결성공!");
						
						const result = JSON.parse(res);
						console.log(result);
						
						let txt = '';
						txt += "<tr>"
						txt += "<td>" + result.아이디 + "</td>";
						txt += "<td>" + result.비밀번호 + "</td>";
						txt += "<td>" + result.이름 + "</td>";
						txt += "<td>" + result.이메일 + "</td>";
						txt += "<td>" + result.휴대폰 + "</td>";
						txt += "<td>" + result.성별 + "</td>";
						txt += "<td>" + result.주소 + "</td>";
						txt += "</tr>"
						
						$('.signup-List').append(txt);
						},
						error(err){
							console.log(err);
							console.log("Ajax 연결 실패!")
						}
					})
				}
			});
		}
	}
	const signup = new Signup();
	signup.init();

}
*/
