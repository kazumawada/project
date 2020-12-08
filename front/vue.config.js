module.exports = {
  "transpileDependencies": [
    "vuetify"
  ],
  devServer: {
    proxy: 'http://localhost:3000'
  }
}


// module.exports = {
//   //...
//   devServer: {
//     proxy: {
//       '/api': 'http://localhost:3000'
//     }
//   }
// };
