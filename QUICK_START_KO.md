# 🚀 빠른 시작 가이드 (한국어)

## 📋 목차
1. [시작하기](#시작하기)
2. [기본 에이전트 실행](#기본-에이전트-실행)
3. [다이애나 네트워크 연결](#다이애나-네트워크-연결)
4. [커스텀 에이전트 개발](#커스텀-에이전트-개발)
5. [문제 해결](#문제-해결)

## 🏁 시작하기

### 시스템 요구사항
- Python 3.8 이상
- 인터넷 연결
- 기본적인 Python 지식

### 1. 저장소 클론
```bash
git clone https://github.com/akahubcreator/diana-security-agents.git
cd diana-security-agents
```

### 2. 의존성 설치
```bash
pip install -r requirements.txt
```

### 3. 환경 변수 설정 (선택사항)
```bash
# 다이애나 허브 연결 정보
export DIANA_WEBSOCKET_URL="ws://39.118.226.197:8889"
export DIANA_REDIS_HOST="39.118.226.197"
export DIANA_REDIS_PORT="6379"
export DIANA_REDIS_PASSWORD="openqweqwe1"
```

## 🤖 기본 에이전트 실행

### 포트 스캐너 에이전트
```python
# basic_scanner.py
from security_agent_template import PortScannerAgent
import asyncio

async def main():
    # 에이전트 생성
    agent = PortScannerAgent("my_scanner_001")
    
    # 에이전트 실행
    await agent.run()

if __name__ == "__main__":
    asyncio.run(main())
```

실행 방법:
```bash
python examples/basic_scanner.py
```

### 실행 결과 예시
```
[INFO] 에이전트 'my_scanner_001' 시작됨
[INFO] 포트 스캔 시작: 127.0.0.1
[INFO] 열린 포트 발견: 22(SSH), 80(HTTP), 443(HTTPS)
[INFO] 스캔 완료: 3개의 열린 포트 발견
```

## 🔗 다이애나 네트워크 연결

### WebSocket 연결 테스트
```python
# websocket_test.py
import asyncio
import websockets

async def test_connection():
    try:
        async with websockets.connect("ws://39.118.226.197:8889") as websocket:
            await websocket.send("HELLO_DIANA")
            response = await websocket.recv()
            print(f"서버 응답: {response}")
    except Exception as e:
        print(f"연결 실패: {e}")

asyncio.run(test_connection())
```

### Redis 작업 게시
```python
# redis_publisher.py
import redis
import json

# Redis 연결
r = redis.Redis(
    host="39.118.226.197",
    port=6379,
    password="openqweqwe1",
    decode_responses=True
)

# 작업 게시
task = {
    "agent_id": "my_agent_001",
    "task_type": "port_scan",
    "target": "example.com",
    "priority": "high"
}

r.publish("agent_tasks", json.dumps(task))
print("작업이 성공적으로 게시되었습니다")
```

## 🛠️ 커스텀 에이전트 개발

### 기본 에이전트 템플릿
```python
# custom_agent.py
from security_agent_template import SecurityAgent
import asyncio

class CustomSecurityAgent(SecurityAgent):
    def __init__(self, agent_id):
        super().__init__(agent_id, "CUSTOM_SCANNER")
    
    async def perform_scan(self, target):
        """커스텀 스캔 로직 구현"""
        # 여기에 스캔 로직 작성
        results = {
            "target": target,
            "status": "scanned",
            "findings": ["취약점 1", "취약점 2"],
            "timestamp": self.get_current_time()
        }
        return results
    
    async def run(self):
        """에이전트 메인 실행 루프"""
        print(f"[{self.agent_id}] 커스텀 에이전트 시작")
        
        while True:
            # 주기적 작업 수행
            scan_result = await self.perform_scan("example.com")
            print(f"스캔 결과: {scan_result}")
            
            # WebSocket으로 결과 보고
            if self.websocket_connected:
                await self.send_to_hub(scan_result)
            
            await asyncio.sleep(60)  # 60초 대기

# 실행
agent = CustomSecurityAgent("custom_agent_001")
asyncio.run(agent.run())
```

### 에이전트 등록 및 관리
```python
# agent_manager.py
from security_agent_template import AgentManager

manager = AgentManager()

# 에이전트 등록
manager.register_agent(PortScannerAgent("scanner_001"))
manager.register_agent(CustomSecurityAgent("custom_001"))

# 모든 에이전트 실행
manager.run_all()
```

## 🚨 문제 해결

### 일반적인 문제

#### 1. 연결 실패
```
문제: WebSocket 연결 실패
해결:
1. 방화벽 확인: 포트 8889 열려있는지 확인
2. 네트워크 확인: 인터넷 연결 상태 확인
3. URL 확인: ws://39.118.226.197:8889 정확한지 확인
```

#### 2. Redis 연결 실패
```
문제: Redis 서버 연결 실패
해결:
1. 비밀번호 확인: openqweqwe1 정확한지 확인
2. 포트 확인: 6379 포트 열려있는지 확인
3. 호스트 확인: 39.118.226.217 정확한지 확인
```

#### 3. 모듈 임포트 오류
```bash
# requirements.txt에 있는 모든 패키지 설치 확인
pip list | grep -E "(websocket|redis|asyncio)"

# 누락된 패키지 설치
pip install websockets redis asyncio
```

### 디버깅 모드
```python
# debug_mode.py
import logging

# 상세 로깅 설정
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

# 디버그 모드로 에이전트 실행
agent = PortScannerAgent("debug_agent", debug=True)
```

## 📞 지원

### 도움말 얻는 방법
1. **GitHub Issues**: 버그 리포트 및 기능 요청
2. **Discord 커뮤니티**: 실시간 도움 및 토론
3. **이메일**: arkahub@naver.com

### 유용한 명령어
```bash
# 에이전트 상태 확인
python -c "from security_agent_template import check_agent_status; check_agent_status()"

# 네트워크 연결 테스트
python -c "import socket; s=socket.socket(); s.connect(('39.118.226.197', 8889)); print('WebSocket 연결 가능'); s.close()"

# Redis 연결 테스트
python -c "import redis; r=redis.Redis(host='39.118.226.197', port=6379, password='openqweqwe1'); print('Redis 응답:', r.ping())"
```

## 🎯 다음 단계

### 학습 자료
1. [보안 에이전트 디자인 패턴](docs/design_patterns.md)
2. [고급 WebSocket 사용법](docs/advanced_websocket.md)
3. [분산 작업 처리](docs/distributed_tasks.md)

### 프로젝트 참여
1. 기존 에이전트 개선
2. 새로운 에이전트 유형 개발
3. 문서화 및 번역 참여
4. 버그 리포트 및 테스트

---

**📢 참고**: 이 가이드는 한국어 사용자를 위해 작성되었습니다. 영어 버전은 [QUICK_START_EN.md](QUICK_START_EN.md)에서 확인하실 수 있습니다.

**👨‍💻 개발자**: 다이애나 보안 에이전트 팀  
**🌐 웹사이트**: https://github.com/akahubcreator/diana-security-agents  
**💬 문의**: 디스코드 커뮤니티 또는 GitHub Issues