//실습)
// score.jsp파일에 3명의 성적데이터(이름,국어,영어,수학)를 보내서
//이름,국어,영어,수학,총점 JSON을 응답으로 보내 클라이언트 테이블에 출력하는 프로그램

window.onload = function(){
	
	document.getElementById("btn").addEventListener(
		"click",
		function(){
			
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
			
			const xhr = new XMLHttpRequest();
			xhr.open("POST", "http://localhost:8888/ajaxtest/score.jsp", true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send(`name=${s1name}&age=${s1kor}`);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const jsonText = xhr.responseText;
					const jsonObj = JSON.parse(jsonText);
					const jsonObjLeng = jsonObj.length;
					let trs = "";
					for(let i = 0; i < jsonObjLeng; i++){
						const sum = jsonObj[i].s1kor + jsonObj[i].s1eng + jsonObj[i].s1math
            			trs += `
            				<tr>
            					<td>${jsonObj[i].s1name}</td>
            					<td>${jsonObj[i].s1kor}</td>
            					<td>${jsonObj[i].s1eng}</td>
            					<td>${jsonObj[i].s1math}</td>
            					<td>${sum}</td>
            				</tr>
            			`;
					}
					const tbody = document.getElementsByTagName("tbody")[0];
        			tbody.innerHTML = trs;
				}
			}
		}
	)
	
}
