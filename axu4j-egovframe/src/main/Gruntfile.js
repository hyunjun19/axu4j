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