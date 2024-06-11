window.onload = function(){
	document.getElementById("btn").addEventListener(
		"click",
		function(){
			const xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.xml", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200){
					const xmlObj = xhr.responseXML;
					const persons = xmlObj.getElementsByTagName("persons")[0];
					const personsLeng = persons.childNodes.length;
					let printStr = "";
					for (let i = 0; i < personsLeng; i++){
						if(persons.childNodes[i].nodeType == 1){
							const person = persons.childNodes[i];
							const name = person.getElementsByTagName("name")[0];
							const nameText = name.firstChild.nodeValue;
							const age = person.getElementsByTagName("age")[0];
							const ageText = age.firstChild.nodeValue;
							
							printStr += "이름: " + nameText + ", 나이: " + ageText + "<br />";
						}
					}
					document.getElementById("result").innerHTML = printStr;
				}
			}
		}
	)
}

/*
이 코드는 AJAX 요청을 통해 XML 파일을 가져와서 해당 XML 데이터를 파싱하고, 웹 페이지에 동적으로 표시하는 예제입니다. 코드의 구조와 기능은 잘 작성되어 있으며, 아래는 각 부분의 설명입니다:

1. **`window.onload` 이벤트 핸들러**:
   - 페이지가 완전히 로드된 후에 실행될 코드를 정의합니다.

2. **버튼 클릭 이벤트 리스너**:
   - `document.getElementById("btn").addEventListener("click", function() { ... })` 코드를 통해 버튼이 클릭되었을 때 실행될 함수를 설정합니다.

3. **XMLHttpRequest 객체 생성 및 초기화**:
   - `const xhr = new XMLHttpRequest();`을 통해 새로운 XMLHttpRequest 객체를 생성합니다.
   - `xhr.open("GET", "http://localhost:8888/ajaxtest/assets/hello.xml", true);`을 통해 GET 요청을 설정하고, 비동기적으로 요청을 보낼 준비를 합니다.
   - `xhr.send();`를 통해 요청을 전송합니다.

4. **`onreadystatechange` 이벤트 핸들러**:
   - `xhr.onreadystatechange = function() { ... }` 코드를 통해 readyState가 변경될 때마다 실행될 함수를 정의합니다.
   - `if (xhr.readyState == 4 && xhr.status == 200)` 조건을 통해 응답이 완료되고, 서버의 응답 상태가 200(성공)인 경우에만 응답을 처리합니다.

5. **XML 응답 파싱 및 결과 출력**:
   - `const xmlObj = xhr.responseXML;`을 통해 응답 XML을 XMLDocument 객체로 가져옵니다.
   - `const persons = xmlObj.getElementsByTagName("persons")[0];`을 통해 `<persons>` 태그를 가져옵니다.
   - `const personsLeng = persons.childNodes.length;`를 통해 `<persons>` 태그의 자식 노드 수를 구합니다.
   - `for` 루프를 통해 각 `<person>` 태그를 순회하며 데이터를 추출합니다.
   - 각 `<person>` 태그에서 `<name>`과 `<age>` 태그의 값을 추출하여 문자열로 만듭니다.
   - 최종적으로 `document.getElementById("result").innerHTML = printStr;`을 통해 결과 문자열을 웹 페이지에 표시합니다.

이 코드는 XML 파일을 성공적으로 가져와서 파싱하고, 그 결과를 HTML로 출력하는 예제입니다. 전체적으로 잘 작성되었으며, 특히 데이터 파싱과 DOM 조작 부분이 명확합니다.

### 예제 XML 파일 (`hello.xml`)

```xml
<persons>
    <person>
        <name>홍길동</name>
        <age>30</age>
    </person>
    <person>
        <name>김철수</name>
        <age>25</age>
    </person>
</persons>
```

이 XML 구조를 기반으로 위의 코드가 잘 작동할 것입니다. 코드는 각 `<person>` 요소의 `<name>`과 `<age>` 값을 읽어와서 웹 페이지에 출력합니다.
 */