#!/home/pi/miniforge3/envs/searx_env/bin/python
"""
기본 보안 스캐너 에이전트 예제
다이애나 에이전트 네트워크에 연결하는 방법 보여주기
"""

import asyncio
import sys
import os

# 상위 디렉토리에서 템플릿 임포트
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

try:
    from security_agent_template import PortScannerAgent
except ImportError:
    print("에러: security_agent_template.py를 찾을 수 없습니다")
    print("상위 디렉토리에 있는지 확인하세요")
    sys.exit(1)

async def main():
    """기본 에이전트 실행 예제"""
    print("🔐 다이애나 보안 에이전트 예제")
    print("=" * 50)
    
    # 에이전트 생성
    agent = PortScannerAgent("EXAMPLE_SCANNER_001")
    
    print(f"에이전트 ID: {agent.agent_id}")
    print(f"에이전트 타입: {agent.agent_type}")
    print(f"기능: {', '.join(agent.capabilities[:3])}...")
    print(f"허브 URL: {agent.hub_url}")
    print("=" * 50)
    
    try:
        # 에이전트 실행
        print("에이전트 시작 중... (Ctrl+C로 종료)")
        await agent.run()
    except KeyboardInterrupt:
        print("\n에이전트 종료")
    except Exception as e:
        print(f"에이전트 실행 오류: {e}")

if __name__ == "__main__":
    asyncio.run(main())
