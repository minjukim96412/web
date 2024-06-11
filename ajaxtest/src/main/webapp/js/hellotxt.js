
// 페이지가 로드되면 실행될 함수를 설정합니다.
window.onload = function () {
//"btn"인 요소에 대한 클릭 이벤트 리스너를 추가합니다. 이벤트가 발생하면 함수가 실행됩니다.
    document.getElementById("btn").addEventListener(
        "click",
        function() {
            //1. XMLHttpRequest 객체를 생성
            const xhr = new XMLHttpRequest();

            //2. xhr 객체 초기화, 서버에 GET 요청을 보냅니다.
            xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.txt", true);

            //3. 요청 전송
            xhr.send();

            //4. 콜백 함수 : 서버로부터 응답을 받을 때마다 `xhr.onreadystatechange` 이벤트 핸들러가 호출
            xhr.onreadystatechange = function () {
				//응답이 완료되고 상태 코드가 200인 경우에만 서버 응답을 가져와서 "result"라는 id를 가진 요소의 내부 HTML로 설정합니다.
				if(xhr.readyState == 4 && xhr.status == 200){
					document.getElementById("result").innerHTML = xhr.responseText;
				}
            }
		
        }
    );
}