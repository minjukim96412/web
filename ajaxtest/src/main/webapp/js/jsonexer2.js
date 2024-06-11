
window.onload = function(){
	
	//AJAX JSON 실습2)
	//https://jsonplaceholder.typicode.com/photos
	//URL에서 JSON 데이터를 받아서
	//jsonexer2.html에 테이블 만들어서 출력
	document.getElementById("btn").addEventListener(
		"click",
		function(){
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "https://jsonplaceholder.typicode.com/photos", true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const jsonText = xhr.responseText;
					const jsonObj = JSON.parse(jsonText);
					const jsonObjLeng = jsonObj.length;
					let trs = "";
					for(let i = 0; i < jsonObjLeng; i++){
						/*
						trs += "<tr>";
            			trs += "<td>" + jsonObj[i].albumId + "</td>"
            			trs += "<td>" + jsonObj[i].id + "</td>"
            			trs += "<td>" + jsonObj[i].title + "</td>"
            			trs += "<td>" + jsonObj[i].url + "</td>"
            			trs += "<td>" + jsonObj[i].thumbnailUrl + "</td>"
            			trs += "</tr>";
            			*/
            			trs += `
            				<tr>
            					<td>${jsonObj[i].albumId}</td>
            					<td>${jsonObj[i].id}</td>
            					<td>${jsonObj[i].title}</td>
            					<td>${jsonObj[i].url}</td>
            					<td>${jsonObj[i].thumbnailUrl}</td>
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

