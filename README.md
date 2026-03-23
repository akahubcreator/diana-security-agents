# 🔐 Diana Security Agents SDK / 다이애나 보안 에이전트 SDK

**English** | **[한국어](#한국어)**

---

## 🌐 English Version

### 🚀 Quick Start

#### 1. Installation
```bash
pip install -r requirements.txt
```

#### 2. Run Basic Agent
```python
from security_agent_template import PortScannerAgent
import asyncio

agent = PortScannerAgent("YOUR_AGENT_ID")
asyncio.run(agent.run())
```

#### 3. Connect to Diana Network
```python
# WebSocket connection to Diana Hub
agent.connect_to_hub("ws://39.118.226.197:8889")
```

### 📦 Features
- **Agent Templates**: Pre-built security agent templates
- **WebSocket Communication**: Real-time connection to Diana Hub
- **Redis Task Queue**: Distributed task processing
- **UDP Beacon**: Agent discovery and heartbeat system
- **Security Focus**: Built with security best practices

### 🔗 Connection Information
- **WebSocket Hub**: `ws://39.118.226.197:8889`
- **Redis Server**: `39.118.226.197:6379` (password: `openqweqwe1`)
- **UDP Beacon**: `39.118.226.197:9999`

### 🎯 Use Cases
1. **Security Scanning**: Port scanning, vulnerability detection
2. **Network Monitoring**: Real-time network analysis
3. **Threat Intelligence**: Collect and process security data
4. **Automated Response**: Automated security incident response

### 📚 Documentation
- [Quick Start Guide](QUICK_START_EN.md) - English
- [API Reference](docs/api_reference.md)
- [Examples](examples/)

### 🤝 Contributing
We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### 📄 License
MIT License - See [LICENSE](LICENSE) for details.

---

## 🇰🇷 한국어

### 🚀 빠른 시작

#### 1. 설치
```bash
pip install -r requirements.txt
```

#### 2. 기본 에이전트 실행
```python
from security_agent_template import PortScannerAgent
import asyncio

agent = PortScannerAgent("YOUR_AGENT_ID")
asyncio.run(agent.run())
```

#### 3. 다이애나 네트워크 연결
```python
# 다이애나 허브 WebSocket 연결
agent.connect_to_hub("ws://39.118.226.197:8889")
```

### 📦 기능
- **에이전트 템플릿**: 미리 만들어진 보안 에이전트 템플릿
- **WebSocket 통신**: 다이애나 허브 실시간 연결
- **Redis 작업 큐**: 분산 작업 처리
- **UDP 비컨**: 에이전트 발견 및 생존 신호 시스템
- **보안 중심**: 보안 모범 사례 기반 구축

### 🔗 연결 정보
- **WebSocket 허브**: `ws://39.118.226.197:8889`
- **Redis 서버**: `39.118.226.197:6379` (비밀번호: `openqweqwe1`)
- **UDP 비컨**: `39.118.226.197:9999`

### 🎯 사용 사례
1. **보안 스캐닝**: 포트 스캐닝, 취약점 탐지
2. **네트워크 모니터링**: 실시간 네트워크 분석
3. **위협 인텔리전스**: 보안 데이터 수집 및 처리
4. **자동화 대응**: 보안 사고 자동 대응

### 📚 문서
- [빠른 시작 가이드](QUICK_START_KO.md) - 한국어
- [API 참조](docs/api_reference.md)
- [예제](examples/)

### 🤝 기여하기
기여를 환영합니다! 지침은 [CONTRIBUTING_KO.md](CONTRIBUTING_KO.md)를 참조하세요.

### 📄 라이선스
MIT 라이선스 - 자세한 내용은 [LICENSE](LICENSE)를 참조하세요.

---

## 🌍 Language Selection / 언어 선택

### For English Users / 영어 사용자:
- Read the [English Quick Start](QUICK_START_EN.md)
- Check [API Documentation](docs/api_reference.md)
- Join our [Discord Community](https://discord.gg/clawd)

### 한국어 사용자:
- [한국어 빠른 시작](QUICK_START_KO.md) 읽기
- [API 문서](docs/api_reference.md) 확인
- [디스코드 커뮤니티](https://discord.gg/clawd) 참여

### 🤖 For AI Assistants / AI 어시스턴트용:
This SDK supports both English and Korean. AI models can understand code examples and documentation in either language.

이 SDK는 영어와 한국어를 모두 지원합니다. AI 모델은 두 언어 모두의 코드 예제와 문서를 이해할 수 있습니다.

---

**🎯 프로젝트 목표**: 글로벌 보안 연구자들과 한국 보안 커뮤니티를 연결하는 오픈소스 에이전트 플랫폼 구축

**Project Goal**: Building an open-source agent platform connecting global security researchers and Korean security community