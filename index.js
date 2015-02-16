var yelp = require("yelp").createClient({
  consumer_key: "u5lK2lrWU7IAR3QIEu04KQ",
  consumer_secret: "KwldfReN7JTQTjiufFOx9qXuRX4",
  token: "vsprJ9N-TfpqiJtYlYOG3EZFaWuaIrhC",
  token_secret: "2c-lwD9vE38DRiQYyRsqHWaSZC0"
});

// See http://www.yelp.com/developers/documentation/v2/search_api
yelp.search({term: "food", location: "San Francisco"}, function(error, data) {
  console.log(JSON.stringify(data));
});

// // See http://www.yelp.com/developers/documentation/v2/business
// yelp.business("yelp-san-francisco", function(error, data) {
//   console.log(error);
//   console.log(data);
// });