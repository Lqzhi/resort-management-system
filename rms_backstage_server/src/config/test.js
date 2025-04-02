// const {host} = require("./default.json").pool_config

// console.log(JSON.stringify(host));
// // const file = require("fs").readFileSync('./default.json','utf-8')
// // console.log(file);

// const err = require('./errorTypes.json')
// console.log(JSON.stringify(err));

const {CN_ERR} = require('./errorTypes.json')

const err = new Error(CN_ERR.NO_PERMISION)  

  
