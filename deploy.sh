#!/bin/bash
# ────────────────────────────────────────────────────────────
#  포트폴리오 사이트 배포 스크립트
#  터미널에서 ./deploy.sh 를 실행하면 GitHub에 올라가고
#  1~2분 뒤 https://hanuriii.github.io/portfolio/ 에 반영됩니다.
#
#  커밋 메시지를 직접 쓰고 싶으면:  ./deploy.sh "메시지 내용"
# ────────────────────────────────────────────────────────────
set -e
cd "$(dirname "$0")"

MSG="${1:-Update portfolio site ($(date '+%Y-%m-%d %H:%M'))}"

if [ -z "$(git status --porcelain)" ]; then
  echo "✓ 변경된 내용이 없습니다."
  exit 0
fi

git add -A
git commit -m "$MSG"
git push origin main

echo ""
echo "✓ 배포 완료 — 1~2분 뒤 아래 주소에 반영됩니다."
echo "  https://hanuriii.github.io/portfolio/"
