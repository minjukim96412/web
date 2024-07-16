/*
  {
    "id": 1,
    "slug": "lorem-ipsum",
    "url": "https://jsonplaceholder.org/posts/lorem-ipsum",
    "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "content": "Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.",
    "image": "https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    "thumbnail": "https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    "status": "published",
    "category": "lorem",
    "publishedAt": "04/02/2023 13:25:21",
    "updatedAt": "14/03/2023 17:22:20",
    "userId": 1
  }
  
  1)url posts데이터 100건을 읽어서 테이블에 출력 (id,title,thumbnail,status,category,publishedAt,updatedAt)
  2)이미지는 이미지를 표현,게시일, 수정일은 24/04/02 13:35 형식으로 출력
  3)HTML 상단에 INPUT  과 BUTTON 만들어서 제목으로 검색하는 긴능
  4)HTML 상단에 SELECT 만들어서 카테고리별로 테이블에 출력하는 기능 (https://jsonplaceholder.org/posts)

*/
$(function(){

    fetchPosts(); // 페이지 로드 시 포스트를 불러옵니다.
});
	
    function addPostRow(post, postTable) {
       const row = $("<tr></tr>");
        row.append($("<td>"+ post.id +"</td>"));
        row.append($("<td>"+ post.title +"</td>"));
        if (post.thumbnail) {
            const thumbnailImg = $("<img src='" + post.thumbnail + "' alt='Thumbnail'>");
            row.append($("<td>").append(thumbnailImg));
        } 
        row.append($("<td>"+ post.status +"</td>"));
        row.append($("<td>"+ post.category +"</td>"));  
        row.append($("<td>"+ getDateStr(post.publishedAt) +"</td>"));
        row.append($("<td>"+ getDateStr(post.updatedAt) +"</td>"));
        postTable.append(row);
    }

	//게시일/수정일 출력형식을 변경하는 기능
	function getDateStr(str){
		return moment(str, "DD/MM/YYYY HH:mm:ss").format("YY/MM/DD HH:mm");
	}

    function fetchPosts() {
        $.ajax({
            method: "GET",
            url: "https://jsonplaceholder.org/posts",
            success: function (data) {
                const postTable = $("tbody");
                postTable.empty();

                data.forEach(function(post){
                    addPostRow(post, postTable);
                });

                setupCategorySelect(data);
                setupSearch(data);
            }
        });
    }

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
            filterPosts(posts);
        });
    }

    function setupSearch(posts) {
        $("#searchBtn").click(function () {
            filterPosts(posts);
        });
    }

    function filterPosts(posts) {
        const selectedCategory = $("#categorySelect").val();
        const title = $("#title").val().trim().toLowerCase();

        const filteredPosts = posts.filter(function(post) {
            const matchesCategory = selectedCategory === "" || post.category === selectedCategory;
            const matchesTitle = title === "" || post.title.toLowerCase().includes(title);
            return matchesCategory && matchesTitle;
        });

        const postTable = $("tbody");
        postTable.empty();

        filteredPosts.forEach(function(post) {
            addPostRow(post, postTable);
        });
    }



/*

### 기능 설명

1. **페이지 로드 시 fetchPosts() 함수 실행**
   - `$(function(){ ... });` 는 문서가 준비되면 실행되는 jQuery의 준비 함수입니다. 이 안에 전역 함수들이 정의되어 있습니다.
   - `fetchPosts()` 함수는 AJAX를 사용하여 외부 서버에서 포스트 데이터를 가져오고, 성공 시에는 `data` 배열을 받아와 `addPostRow()` 함수를 통해 각 포스트를 테이블에 추가합니다.

2. **addPostRow(post, postTable) 함수**
   - 각 포스트 객체와 테이블(`postTable`)을 인자로 받아 한 줄(row)을 생성하여 테이블에 추가합니다.
   - 포스트의 각 속성들을 테이블 셀(`<td>`)에 추가하며, 이미지가 있는 경우 썸네일을 추가합니다.
   - `moment.js`를 사용하여 날짜 포맷을 변환하여 등록일과 수정일을 표시합니다.

3. **setupCategorySelect(posts) 함수**
   - 포스트 데이터 배열을 받아와 카테고리 선택(`categorySelect`) 드롭다운 메뉴를 설정합니다.
   - `categories` 배열을 사용하여 각 카테고리를 중복 없이 추출하고, 드롭다운 메뉴에 옵션으로 추가합니다.
   - 카테고리를 선택하면 `categorySelect.change()` 이벤트가 발생하며, `filterPosts()` 함수가 호출되어 선택된 카테고리에 맞게 포스트를 필터링합니다.

4. **setupSearch(posts) 함수**
   - 검색 버튼(`#searchBtn`)을 클릭할 때 실행되는 함수입니다.
   - `filterPosts()` 함수를 호출하여 선택된 카테고리와 검색어에 따라 포스트를 필터링합니다.

5. **filterPosts(posts) 함수**
   - 선택된 카테고리와 입력된 제목을 기준으로 포스트를 필터링합니다.
   - `Array.filter()` 메서드를 사용하여 필터링 조건에 맞는 포스트를 새로운 배열(`filteredPosts`)에 저장합니다.
   - 테이블의 내용을 비우고(`postTable.empty()`) 필터링된 포스트들을 `addPostRow()` 함수를 통해 테이블에 추가합니다.

 */