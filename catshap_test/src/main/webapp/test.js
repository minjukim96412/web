let currentQuestion = 1;
const results = {
    힐링여행자: 0,
    탐험가: 0,
    낭만주의자: 0,
    귀차니즘: 0,
    완벽주의자: 0,
    실속주의자: 0,
    자유로운영혼: 0
};

function showQuestion(questionNumber) {
    document.querySelectorAll('.question').forEach((q) => {
        q.classList.remove('active');
    });
    document.getElementById(`question${questionNumber}`).classList.add('active');
}

function selectAnswer(answer, questionNumber) {
    const values = answer.split(',');
    values.forEach(value => {
        const [type, score] = value.split(':');
        if (results[type] !== undefined) {
            results[type] += parseInt(score);
        }
    });

    if (questionNumber < 7) {
        currentQuestion++;
        showQuestion(currentQuestion);
    } else {
        calculateResult();
    }
}

function calculateResult() {
    // 점수를 기준으로 결과를 내림차순 정렬
    const sortedResults = Object.entries(results)
        .sort((a, b) => b[1] - a[1] || a[0].localeCompare(b[0]));

    // 가장 높은 점수를 얻은 결과
    const [topType, topScore] = sortedResults[0];

    // 결과 페이지로 리디렉션하며 성향 정보를 URL 쿼리 파라미터로 전달
    window.location.href = `testResult.jsp?resultType=${encodeURIComponent(topType)}&score=${topScore}`;
}

