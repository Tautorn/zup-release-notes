const token = require('./args-process');

const exec = require('child_process').exec;


const repos = require('./repos/')


repos.map((repo) => {
  let script = exec(`sh ./scripts/release.sh ${repo}`);
  script.stdout.on('data', function(data){
      console.log(data)
  })
})