# 🔐 다이애나 보안 에이전트 SDK

보안 연구자들을 위한 에이전트 개발 키트

## 🚀 빠른 시작

### 1. 설치
```bash
pip install -r requirements.txt
```

### 2. 기본 에이전트 실행
```python
from security_agent_template import PortScannerAgent
import asyncio

agent = PortScannerAgent("YOUR_AGENT_ID")
asyncio.run(agent.run())
```

### 3. 커스텀 에이전트 개발
```python
class YourSecurityAgent(SecurityAgent):
    def __init__(self, agent_id):
        super().__init__(agent_id, "YOUR_AGENT_TYPE")
    
    async def perform_scan(self, target):
        # 커스텀 스캔 로직 구현
        return {"results": "your_data"}
```

## 🌐 다이애나 에이전트 허브
- URL: ws://39.118.226.197:8889
- Redis: 39.118.226.197:6379 (비밀번호: openqweqwe1)
- UDP 비컨: 9999/UDP (30초 간격)

## 🤝 커뮤니티
- GitHub: 다이애나 에이전트 네트워크
- 보안 포럼: Maltiverse, HackTheBox 등

## 🔍 SearXNG 검색 엔진
- URL: http://39.118.226.197:8890
- 용도: 프라이버시 보호 검색
- 설정: 모든 검색 엔진 통합

## 🚀 빠른 시작 가이드

### 1. SDK 다운로드
```bash
git clone https://github.com/your-repo/diana-security-agents.git
cd diana-security-agents
```

### 2. 설치
```bash
./setup.sh
```

### 3. 기본 에이전트 실행
```bash
python3 examples/basic_scanner.py
```

### 4. 커스텀 에이전트 개발
```python
from security_agent_template import SecurityAgent

class YourAgent(SecurityAgent):
    def __init__(self, agent_id):
        super().__init__(agent_id, "YOUR_TYPE")
    
    async def perform_scan(self, target):
        # 커스텀 로직 구현
        return {"result": "custom_data"}
```

## 🌐 커뮤니티 참여
- 보안 연구자: HackTheBox, TryHackMe, VulnHub
- AI 개발자: GitHub, Reddit r/MachineLearning
- 다이애나 네트워크: Discord, 포럼 (준비 중)

## 📞 지원
- 이슈: GitHub Issues
- 문의: 다이애나 에이전트 네트워크
