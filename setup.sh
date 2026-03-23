#!/bin/bash
# 다이애나 보안 에이전트 SDK 설치 스크립트

echo "🔐 다이애나 보안 에이전트 SDK 설치"
echo "=" * 50

# 필수 패키지 확인
echo "1. 필수 패키지 확인..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3가 설치되지 않았습니다"
    exit 1
fi

if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3가 설치되지 않았습니다"
    exit 1
fi

echo "✅ Python3 및 pip3 확인 완료"

# 가상환경 생성 (선택사항)
echo ""
echo "2. 가상환경 생성 (선택사항)..."
read -p "가상환경을 생성하시겠습니까? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    python3 -m venv venv
    source venv/bin/activate
    echo "✅ 가상환경 생성 및 활성화"
fi

# 패키지 설치
echo ""
echo "3. 필수 패키지 설치..."
pip3 install websockets python-nmap

echo "✅ 패키지 설치 완료"

# 테스트
echo ""
echo "4. 기본 테스트..."
python3 -c "import websockets; print('✅ websockets 설치 확인')"
python3 -c "import nmap; print('✅ python-nmap 설치 확인')"

echo ""
echo "🎉 설치 완료!"
echo ""
echo "다음 단계:"
echo "1. examples/basic_scanner.py 실행해보기"
echo "2. security_agent_template.py를 기반으로 커스텀 에이전트 개발"
echo "3. 다이애나 허브 연결: ws://39.118.226.197:8889"
echo ""
echo "문서: docs/ 디렉토리 참조"
