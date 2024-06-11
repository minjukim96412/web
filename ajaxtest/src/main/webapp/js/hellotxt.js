window.onload = function () {
    document.getElementById("btn").addEventListener(
        "click",
        function() {
            //1. XMLHttpReQuest 객체 생성
            const xhr = new XMLHttpRequest();

            //2. xhr 객체 초기화
            xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.txt", true);

            //3. 요청 전송
            xhr.send();

            //4. 콜백 함수
            xhr.onreadystatechange = function () {
                console.log(xhr.readyState);
            }

        }
    );
}