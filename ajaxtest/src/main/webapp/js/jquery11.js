$(function(){
  	// 실습 jquery ajax
  	// https://jsonplaceholder.typicode.com/todos
  	// 테이블에 출력
  	$("#btn").click(function(){
		$.ajax({
			method: "GET", // mathod를 method로 수정
			url: "https://jsonplaceholder.typicode.com/todos",
			dataType: "json"
		}).done(function(data, textStatus){
			const dataLength = data.length;
			const tableBody = $("#todos-table tbody");
			tableBody.empty(); // 기존 데이터를 지우고 새 데이터를 추가합니다.

			for(let i = 0; i < dataLength; i++){
				const tr = $("<tr></tr>");
				tr.append("<td>" + data[i].userId + "</td>");
				tr.append("<td>" + data[i].id + "</td>");
				tr.append("<td>" + data[i].title + "</td>");
				tr.append("<td>" + (data[i].completed ? "완료" : "미완료") + "</td>");
				tableBody.append(tr);
			}
		}).fail(function(jqXHR, textStatus, errorThrown) {
			console.error("데이터를 가져오는 도중 오류 발생: " + textStatus, errorThrown);
		});
	});
});
