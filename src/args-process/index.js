
const processArgv = process.argv.slice(2)
let token = ''
let split = []
processArgv.forEach((val, index) => {
  split = val.split('=')
  if (split[0] === '--token') {
    token = split[1]
  }
})

module.exports = token

