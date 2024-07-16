$(function(){
	
    function addPostRow(post, postTable) {
        const row = $("<tr></tr>");
        row.append($("<td>"+ post.id +"</td>"));
        row.append($("<td>"+ post.title +"</td>"));
        if (post.thumbnail) {
            const thumbnailImg = $("<img src='" + post.thumbnail + "' alt='Thumbnail'>");
            row.append($("<td>").append(thumbnailImg));
        } else {
            row.append($("<td></td>"));
        }
        row.append($("<td>"+ post.status +"</td>"));
        row.append($("<td>"+ post.category +"</td>"));

        const publishedStr = moment(post.publishedAt, "DD/MM/YYYY HH:mm:ss").format("YY/MM/DD HH:mm");
        row.append($("<td>"+ publishedStr +"</td>"));

        const updatedStr = moment(post.updatedAt, "DD/MM/YYYY HH:mm:ss").format("YY/MM/DD HH:mm");
        row.append($("<td>"+ updatedStr +"</td>"));

        postTable.append(row);
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
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("게시물을 가져오는 중 오류가 발생했습니다.");
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

    fetchPosts(); // 페이지 로드 시 포스트를 불러옵니다.
});
