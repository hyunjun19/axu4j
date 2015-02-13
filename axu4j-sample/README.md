## 이 프로젝트는 axu4j와 [Model1] 패턴의 JSP를 사용하는 예제입니다.

### 실행방법

1. [eclipse](http://eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/lunasr1a) 실행
2. File > Import
3. Existing Maven Projects > Next
4. Root Directory: axu4j-sample root 폴더 선택 > Finish
5. 프로젝트 Import가 완료될 때 까지 대기
6. Run > Run Configurations...
7. Maven Build > New
8. Name: `egov-sample ## run ##`
9. Base Directory: `${workspace_loc:/axu4j-sample}`
10. Goals: `tomcat7:run`
11. Run 클릭
12. http://localhost:6442 접속