<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function loadBoardDetail(bid) {
            $.ajax({
                url: 'BoardDetailServlet',
                type: 'GET',
                data: { bid: bid },
                success: function(data) {
                    $("#boardDetail").html(data);
                    increaseViewCount(bid);
                }
            });
        }

        function increaseViewCount(bid) {
            $.ajax({
                url: 'IncreaseViewCountServlet',
                type: 'POST',
                data: { bid: bid },
                success: function() {
                    console.log("조회수 증가");
                }
            });
        }
    </script>
</head>