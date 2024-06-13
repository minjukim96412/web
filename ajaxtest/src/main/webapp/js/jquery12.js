$(function(){
  	// 실습 jquery ajax
  	// https://jsonplaceholder.typicode.com/albums
  	// 테이블에 출력
  	$("#btn").click(function(){
		$.ajax({
			method: "GET", 
			url: "https://jsonplaceholder.typicode.com/albums",
			dataType: "json"
		}).done(function(data, result){
			const dataLeng = data.length;
			const table = $("#album");
			for(let i = 0; i < dataLeng; i++){
				const tr = $("<tr></tr>");
				tr.append("<td>" + data[i].userId + "</td>");
				tr.append("<td>" + data[i].id + "</td>");
				tr.append("<td>" + data[i].title + "</td>");
				table.append(tr);
			}
		});
		
	});
});
