//실습)
// score.jsp파일에 3명의 성적데이터(이름,국어,영어,수학)를 보내서
//이름,국어,영어,수학,총점 JSON을 응답으로 보내 클라이언트 테이블에 출력하는 프로그램

window.onload = function() {
    console.log("JavaScript loaded"); // JavaScript가 로드되었는지 확인

    document.getElementById("btn").addEventListener("click", function() {
        console.log("Button clicked"); // 버튼이 클릭되었는지 확인

        const s1name = document.getElementById("s1name").value;
		const s1kor = document.getElementById("s1kor").value;
		const s1eng = document.getElementById("s1eng").value;
		const s1math = document.getElementById("s1math").value;
		const s2name = document.getElementById("s2name").value;
		const s2kor = document.getElementById("s2kor").value;
		const s2eng = document.getElementById("s2eng").value;
		const s2math = document.getElementById("s2math").value;
		const s3name = document.getElementById("s3name").value;
		const s3kor = document.getElementById("s3kor").value;
		const s3eng = document.getElementById("s3eng").value;
		const s3math = document.getElementById("s3math").value;
		const params = `s1name=${s1name}&s1kor=${s1kor}&s1eng=${s1eng}&s1math=${s1math}&` +
		               `s2name=${s2name}&s2kor=${s2kor}&s2eng=${s2eng}&s2math=${s2math}&` +
		               `s3name=${s3name}&s3kor=${s3kor}&s3eng=${s3eng}&s3math=${s3math}`;
		
		console.log("params: ", params); // 디버깅용 로그
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "http://localhost:8888/score.jsp", true);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
		
		xhr.onreadystatechange = function() {
		    if (xhr.readyState == 4 && xhr.status == 200) {
		        console.log("response: ", xhr.responseText); // 응답 확인
		        const jsonText = xhr.responseText;
		        const jsonObj = JSON.parse(jsonText);
		        let trs = "";
		        for (let i = 0; i < jsonObj.length; i++) {
		            const sum = parseInt(jsonObj[i].kor) + parseInt(jsonObj[i].eng) + parseInt(jsonObj[i].math);
		            trs += `
		                <tr>
		                    <td>${jsonObj[i].name}</td>
		                    <td>${jsonObj[i].kor}</td>
		                    <td>${jsonObj[i].eng}</td>
		                    <td>${jsonObj[i].math}</td>
		                    <td>${sum}</td>
		                </tr>
		            `;
		        }
		        const tbody = document.getElementsByTagName("tbody")[0];
		        tbody.innerHTML = trs;
		    }
		};

    });
};
