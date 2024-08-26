document.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    const resultType = params.get('resultType') || '기본 성향'; // 기본값 설정
    const score = params.get('score') || 0; // 기본값 설정

    updateResult(resultType, score);
});

function updateResult(resultType, score) {
    const resultData = {
        '힐링여행자': {
            image: 'path_to_healing_image.png',
            description: '자연과 힐링을 중시하는 성향입니다. 차분한 환경에서 평화로운 시간을 보내는 것을 선호합니다.'
        },
        '탐험가': {
            image: 'path_to_explorer_image.png',
            description: '새로운 장소를 탐험하고 모험을 즐기는 성향입니다. 다양한 활동과 경험을 추구합니다.'
        },
        '낭만주의자': {
            image: 'path_to_romantic_image.png',
            description: '낭만적인 순간을 소중히 여기며, 아름다운 풍경과 감성적인 경험을 추구하는 성향입니다.'
        },
        '귀차니즘': {
            image: 'path_to_lazy_image.png',
            description: '편안하고 수동적인 활동을 선호하는 성향입니다. 최소한의 노력으로 최대의 휴식을 추구합니다.'
        },
        '완벽주의자': {
            image: 'path_to_perfectionist_image.png',
            description: '계획적이고 세심하게 모든 것을 준비하며, 높은 기준을 유지하는 성향입니다.'
        },
        '실속주의자': {
            image: 'path_to_practical_image.png',
            description: '실용적이고 효율적인 선택을 중시하며, 가성비를 고려한 결정을 내리는 성향입니다.'
        },
        '자유로운영혼': {
            image: 'path_to_free_spirit_image.png',
            description: '자유롭고 규칙에 얽매이지 않으며, 자신의 직감과 기분에 따라 행동하는 성향입니다.'
        }
    };

    const data = resultData[resultType] || { image: '', description: '결과에 대한 설명이 없습니다.' };

    document.getElementById('resultType').innerText = resultType;
    document.getElementById('resultImage').src = data.image;
    document.getElementById('resultDescription').innerText = `${data.description}\n점수: ${score}`;
}

function getRecommendation() {
    alert("여행지 추천 기능은 아직 구현되지 않았습니다.");
}
