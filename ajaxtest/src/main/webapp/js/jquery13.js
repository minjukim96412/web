$(function(){
    $("#btn").click(function(){
        // 입력 필드에서 postId 값 가져오기
        const postId = parseInt($("#postId").val());

        // postId 값이 유효한 정수인지 확인
        if (Number.isInteger(postId)) {
            // AJAX 요청 보내기
            $.ajax({
                url: "https://jsonplaceholder.typicode.com/comments?postId=" + postId,
                method: "GET",
                dataType: "json"
            })
            .done(function(data) {
                // 댓글 데이터 처리
                const tableBody = $("tbody");
                tableBody.empty();
                data.forEach(function(comment) {
                    const row1 = $("<tr></tr>");
                    row1.append($("<td>" + comment.postId + "</td>"));
                    row1.append($("<td>" + comment.id + "</td>"));
                    row1.append($("<td>" + comment.name + "</td>"));
                    row1.append($("<td>" + comment.email + "</td>"));
                    const row2 = $("<tr></tr>");
                    row2.append($("<td colspan='4'>" + comment.body + "</td>"));
                    tableBody.append(row1);
                    tableBody.append(row2);
                });
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                // 오류 메시지 표시
                console.error("AJAX 요청 실패: ", textStatus, errorThrown);
            });
        } else {
            console.error("유효하지 않은 postId 값입니다.");
        }
    });
});


/*
$(function(){
  	//https://jsonplaceholder.typicode.com/comments?postId=1
  	$("#btn").click(function(){
		$("tbody").empty();
		const postIdVal = $("#postId").val();
		$.ajax({
			method: "GET",
			url:"https://jsonplaceholder.typicode.com/comments?postId="+postIdVal
		}).done(function(jsonArr, result){
			if(result == "success"){
				const jsonArrLeng = jsonArr.length;
				for (let i = 0; i < jsonArrLeng; i++){
					const tr1 = $("<tr></tr>");
					tr1.append("<td>"+ jsonArr[i].postId +"</td>");
					tr1.append("<td>"+ jsonArr[i].id +"</td>");
					tr1.append("<td>"+ jsonArr[i].name +"</td>");
					tr1.append("<td>"+ jsonArr[i].email +"</td>");
					const tr2 = $("<tr></tr>");
					tr2.append("<td colspan = '4'>"+ jsonArr[i].body +"</td>");
					$("tbody").append(tr1);
					$("tbody").append(tr2);
				}
			}
		});
	});
});
 */