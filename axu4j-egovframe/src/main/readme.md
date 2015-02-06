#GruntJS 사용법

### GruntJS 설치
http://gruntjs.com/getting-started 에가서
```
npm install -g grunt-cli
```
하면 되는데. nodeJS를 설치 하지 않은 사용자 라면
http://www.nodejs.org/ 에서 nodeJS를 설치 해야 합니다.

자세한 설명은 생략 하겠습니다. 정말 모르겠다면 이슈에 질문 하세요.

### 작동
cmd나 터미널에
```
$ /usr/local/bin/grunt --gruntfile /Users/tom/Works/AXISJ/axu4j/axu4j-egovframe/src/main/Gruntfile.js 시작
```

> {그런트 설치 경로(grunt 명령어가 작동할 수 있는 위치 path가 설정된 경우 grunt만 입력)} --gruntfile {gruntfile.js경로} {task명}

### Gruntfile.js
```js
module.exports = function(grunt) {
  // sample code 빌드

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		watch: {
			scripts: {
				files: 'webapp/*.jsp',
				options: {
					event: ['added', 'deleted']
				}
			}
		}
	});

	grunt.event.on('watch', function(action, filepath, target) {
		grunt.log.writeln(target + ': ' + filepath + ' has ' + action);

		var filename = filepath.substr(filepath.lastIndexOf("/")).replace('.jsp', '.js'),
			make_path = 'webapp/page-js',
			sample_js = 'grunt/page-sample.js',
			deleted_path = 'grunt/deleted-js';

		if (action == "added") {
			grunt.file.copy(sample_js, make_path + filename);
		}else if(action == "deleted"){
			grunt.file.copy(make_path + filename, deleted_path + filename);
			grunt.file.delete(make_path + filename);
		}
	});
	grunt.loadNpmTasks('grunt-contrib-watch');

	grunt.registerTask('시작', ['watch']);
};
```
* watch>scripts>files : 감시 대상
* event.on 에서 js파일 생성 위치, 샘플JS파일위치, 삭제시 복제 경로를 설정 할 수 있습니다.
