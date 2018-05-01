const token = require('./args-process')

const exec = require('child_process').exec

const repos = require('./repos/')

let script = exec(`sh ./scripts/release.sh ${repos}`)
script.stdout.on('data', function(data){
    console.log(data)
})