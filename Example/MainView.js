var Observable = require("FuseJS/Observable");
var IDs = require("FuseJS/IDs");
var info = Observable("");

var getAdID = function() {
	console.log("getID Called");
	IDs.adID().then(function(result) {
		console.log("ID: " + result);
		info.value = result;
	}).catch(function(e) {
		info.value = "Validate Failed:\n" + e;
	});
};

var getAppDeviceID = function() {
	console.log("getID Called");
	IDs.appDeviceID().then(function(result) {
		console.log("ID: " + result);
		info.value = result;
	}).catch(function(e) {
		info.value = "Validate Failed:\n" + e;
	});
};

module.exports = {
	getAdID: getAdID,
	getAppDeviceID: getAppDeviceID,
	info: info
};
