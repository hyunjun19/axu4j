# AXU4J
=====

AXU(https://github.com/axisj-com/axu) for java

template/tag engine
악수(AXU)는 액시스제이에서 제공하는 '반응형 웹 애플리케이션 템플릿 패키지' 입니다.
axu4j는 악수를 좀 더 쉽게 사용할 수 있게 해주는 Java 개발 라이브러리 입니다.
axu4j는 템플릿 엔진[jsp-template-inheritance](https://github.com/kwon37xi/jsp-template-inheritance)을 내장하여 반복되는 레이아웃을 간단하게 정리하고 적용 가능하게 해줍니다.
또한 악수의 그리드시스템과 폼을 Tag로 만들어 사용함으로서 좀 더 적고 간결한 소스 작성이 가능하며 재사용성과 유지보수성에 있어서 기존 순수 HTML 작성보다 압도적인 이점을 제공합니다.

1. layout
![axu4j-layout](https://cloud.githubusercontent.com/assets/421863/5561293/fe5d3760-8e10-11e4-8a9a-a8b78a20a673.png)
2. axu tags
![axu4j-grid](https://cloud.githubusercontent.com/assets/421863/5561292/fe5c91de-8e10-11e4-9f9b-ab8d48628c4a.png)
![axu4j-form](https://cloud.githubusercontent.com/assets/421863/5561291/fe5c5caa-8e10-11e4-9c9d-025de8753644.png)
3. xml config
![axu4j-config](https://cloud.githubusercontent.com/assets/421863/5561290/fe46a45a-8e10-11e4-8d5d-0194f3c1e853.png)
4. HTML vs AXU4J
![axu4j-diff-table](https://cloud.githubusercontent.com/assets/421863/5561289/fe1c7e96-8e10-11e4-9b3c-375b8c6894c2.png)

## 사용기술
JSP Custom Tag Library

## spec
1. JSP 2.0
2. Tomcat 5
3. JDK 1.5

## 장점
1. AXU를 java IDE에서 자동완성기능으로 사용 가능
2. 중복코드의 최소화
3. 간단한 커스터 마이징
 - 단일 설정파일을 통해서 모듈 템플릿 수정 가능(axu4j.xml)
4. 템플릿 엔진 추가(https://github.com/kwon37xi/jsp-template-inheritance)
5. XML 설정과 mustache 문법 적용(http://mustache.github.io/)

## 사용방법
- download /dist/axu4j.xml (AXU4J config file)
- add pom.xml
```
<dependency>
	<groupId>com.axisj</groupId>
	<artifactId>axu4j</artifactId>
	<version>0.2.0-RELEASE</version>
</dependency>
```

진행 상황은 [issue](https://github.com/axisj-com/axu4j/issues)를 참조해 주세요.
