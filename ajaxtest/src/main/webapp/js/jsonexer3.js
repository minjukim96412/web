
window.onload = function(){
	
	document.getElementById("btn").addEventListener(
		"click",
		function(){
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8888/ajaxtest/person.jsp?name=kim&age=00", true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					const jsonText = xhr.responseText;
					const jsonObj = JSON.parse(jsonText);
					document.getElementById("result").innerHTML 
					= "이름 : " + jsonObj.name + ", 나이: " + jsonObj.age ;
				}
			}
		}
	)
	
}

