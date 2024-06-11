//페이지가 완전히 로드된 후 실행될 함수를 정의합니다.
window.onload = function(){
	document.getElementById("btn").addEventListener( //버튼 클릭 시 실행될 함수를 설정합니다.
		"click",
		function(){
			const xhr = new XMLHttpRequest();// 새로운 XMLHttpRequest 객체를 생성합니다.
			//GET 요청을 설정하고 비동기적으로 요청을 보낼 준비
			xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.csv", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200){
					const csv = xhr.responseText;
					const csvArr = csv.split(",");
					const csvArrleng = csvArr.length;
					let printStr = "";
					for(let i = 0; i < csvArrleng; i++){
						printStr += csvArr[i] + " ";
					}
					document.getElementById("result").innerHTML = printStr;
				}
			}
		}
	)
}

