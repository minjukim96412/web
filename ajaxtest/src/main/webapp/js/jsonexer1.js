
window.onload = function(){
	
	//AJAX JSON 실습 1)
	//https://jsonplaceholder.typicode.com/todos
	//URL에서 JSON 데이터를 받아서
	//사용자아이디 : 1, 할일아이디:1, 할일제목:~~~~, 완료여부:완료 
	//형식으로 전체데이터출력하는 프로그램
	document.getElementById("btn").addEventListener(
		"click",
		function(){
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "https://jsonplaceholder.typicode.com/todos", true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const jsonText = xhr.responseText;
					const jsonObj = JSON.parse(jsonText);
					const jsonObjLeng = jsonObj.length;
					let printStr = "";
					for(let i = 0; i < jsonObjLeng; i++){
						//const user = jsonObj[i];
						//printStr += "사용자아이디: " + user.userId + " , 할일아이디: " + user.id 
						// + ", 할일제목: " + user.title + ", 완료여부: " + (user.completed == true ? "완료" : "미완료") + "<br />";
						printStr += `사용자아이디:${jsonObj[i].userId}, `;
						printStr += `할일아이디:${jsonObj[i].id}, `;
						printStr += `할일제목:${jsonObj[i].title}, `;
						printStr += `완료여부:${jsonObj[i].completed == true ? "완료" : "미완료"}, <br /> `;
					}
					document.getElementById("result").innerHTML = printStr;
				}
			}
		}
	)
	
}

