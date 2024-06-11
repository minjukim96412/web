//페이지가 완전히 로드된 후 실행될 함수를 정의합니다.
window.onload = function(){
	document.getElementById("btn").addEventListener( //버튼 클릭 시 실행될 함수를 설정합니다.
		"click",
		function(){
			const xhr = new XMLHttpRequest();// 새로운 XMLHttpRequest 객체를 생성합니다.
			//GET 요청을 설정하고 비동기적으로 요청을 보낼 준비
			xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.json", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200){
					const jsonText = xhr.responseText;
					//const jsonObj = eval("(" + jsonText + ")");
					const jsonObj = JSON.parse(jsonText);//SON 문자열을 JavaScript 객체로 파싱
					const jsonObjLeng = jsonObj.length;
					let printStr = "";
					for(let i = 0; i < jsonObjLeng; i++){
						const person = jsonObj[i];
						printStr += "이름: " + person.name + " , 나이: " + person.age + "<br />";
					}
					document.getElementById("result").innerHTML = printStr;
				}
			}
		}
	)
}

