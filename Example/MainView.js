var Observable = require("FuseJS/Observable");
var AdID = require("FuseJS/AdID");
var info = Observable("");

var getID = function() {
	console.log("getID Called");
	AdID.get().then(function(result) {
		console.log("ID: " + result);
		info.value = result;
	}).catch(function(e) {
		info.value = "Validate Failed:\n" + e;
	});
};

module.exports = {
	getID: getID,
	info: info
};
