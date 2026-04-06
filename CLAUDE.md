# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 응답 지침

- 모든 답변, 설명, 설정값, 결과물은 **한국어**로 작성한다.

## 프로젝트 개요

Jekyll 기반 개인 이력서/포트폴리오 정적 사이트. GitHub Pages로 배포됨.
[A.P 테마](https://github.com/kssim/about-portfolio/) 기반으로 커스터마이징됨.

## 개발 명령어

```bash
# 의존성 설치
bundle install

# 로컬 서버 실행 (http://localhost:4000)
bundle exec jekyll serve

# 빌드만 (결과물은 _site/ 에 생성)
bundle exec jekyll build

# 초안 포함 실행
bundle exec jekyll serve --drafts
```

### 빠른 실행 — `start.bat`

Windows 환경에서 더블클릭으로 서버를 바로 시작할 수 있는 배치 파일.

1. 기존 빌드 파일 정리 (`jekyll clean`)
2. 증분 빌드 모드로 서버 시작 (`jekyll serve --incremental`)

> `--incremental` 옵션은 변경된 파일만 다시 빌드하므로 개발 중 재빌드 속도가 빠름.

## 아키텍처

### 설정의 중심 — `_config.yml`
사이트 전반의 정보(이름, 직책, 이메일, SNS 계정)가 모두 여기에 있음.
About 페이지에 표시되는 프로필 정보도 `author` 섹션에서 가져옴.

### 레이아웃 구조
```
base.html          ← 공통 nav + footer 포함 (모든 레이아웃의 기반)
  ├── about.html   ← 메인 페이지: 프로필 사진 + 소개 + SNS 아이콘
  ├── portfolio.html ← 포트폴리오 목록 (jekyll-paginate 사용)
  └── post.html    ← 포트폴리오 개별 항목
```

### 포트폴리오 항목 추가 방법
`_posts/` 디렉터리에 `YYYY-MM-DD-제목.md` 형식으로 파일 생성.
front matter에 아래 필드를 사용:

```yaml
---
layout: post
title: "프로젝트명"
info: "프로젝트 한줄 설명"
tech: "사용 기술 스택"
type: Open Source   # 또는 다른 카테고리
git-url: https://github.com/...
---
```

포트폴리오 목록 클릭 시 `post.url` 대신 `git-url`로 이동함 (`_layouts/portfolio.html:8` 참고).

### SNS 아이콘 (`_includes/icons.html`)
`_config.yml`의 `social` 섹션에서 값이 있는 항목만 렌더링됨.
새 SNS를 추가하려면 `_config.yml`에 값 입력 + `icons.html`에 해당 아이콘 블록 추가 필요.

### 스타일
- `assets/css/main.scss` → 전체 SCSS 진입점
- `_sass/layouts/` → 페이지별 레이아웃 스타일
- `_sass/base/` → 공통 변수, 코드 하이라이팅 등
- FontAwesome (로컬 번들), Google Fonts (Libre Baskerville) 사용
