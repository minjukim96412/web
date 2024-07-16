//1. 처음에 한번만 데이터 로딩해서 배열에 저장
//2. 기능들을 메소드로 분리
//	1) 데이터 로딩해서 배열에 저장하는 기능
//	2) 게시일/수정일 출력형식을 변경하느 기능
//	3) 검색기능
// 	4) 카테고리 추출 기능
//	5) 카테고리 별 출력 기능

//데이터 로딩해서 배열에 저장하는 기능
let datas = [];

$(function(){
	
	getposts();
	
});


//AJAX 호출해서 결과를 배열로 리턴하는 함수
function getposts(){
	$.ajax({
		method : "GET",
		url: "https://jsonplaceholder.org/posts"
	}).done(function(posts, result){
		if(result == "success"){
			datas = posts;
			printPosts(posts);
		}
		setupSearch(posts);
		setupCategorySelect(posts);
	})
}


// 배열을 전달받으면 테이블에 출력하는 함수
function printPosts(posts) {
	$("tbody").empty();
	const postsLeng = posts.length;
	for (let i=0; i<postsLeng; i++) {
    	const tr = $("<tr></tr>");
		tr.append("<td>" + posts[i].id + "</td>");
		tr.append("<td>" + posts[i].title + "</td>");
		tr.append("<td><img src='" + posts[i].thumbnail + "'></td>");
		tr.append("<td>" + posts[i].status + "</td>");
		tr.append("<td>" + posts[i].category + "</td>");
        tr.append("<td>" + getDateStr(posts[i].publishedAt)+ "</td>");
		tr.append("<td>" + getDateStr(posts[i].updatedAt) + "</td>");
		$("tbody").append(tr);
        }
}
    
//게시일/수정일 출력형식을 변경하는 기능
function getDateStr(str){
	return moment(str, "DD/MM/YYYY HH:mm:ss").format("YY/MM/DD HH:mm");
}

// 검색 기능
function printSearchPosts(posts) {
        const selectedCategory = $("#categorySelect").val();
        const title = $("#title").val().trim().toLowerCase();

        const filteredPosts = posts.filter(function(post) {
            const matchesCategory = selectedCategory === "" || post.category === selectedCategory;
            const matchesTitle = title === "" || post.title.toLowerCase().includes(title);
            return matchesCategory && matchesTitle;
        });

         printPosts(filteredPosts);
    }
    
// 검색 버튼 설정    
function setupSearch(posts) {
    $("#searchBtn").click(function(){
		printSearchPosts(posts);
	});
}    

 // 카테고리 선택 박스 설정   
function setupCategorySelect(posts) {
        const categorySelect = $("#categorySelect");
        let categories = [];

        posts.forEach(function(post) {
            if (!categories.includes(post.category)) {
                categories.push(post.category);
                categorySelect.append($("<option>").attr("value", post.category).text(post.category));
            }
        });

        categorySelect.change(function() {
            printSearchPosts(posts);
        });
}