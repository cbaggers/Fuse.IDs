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

var getDeviceID = function() {
	console.log("getID Called");
	IDs.deviceID().then(function(result) {
		console.log("ID: " + result);
		info.value = result;
	}).catch(function(e) {
		info.value = "Validate Failed:\n" + e;
	});
};

module.exports = {
	getAdID: getAdID,
	getDeviceID: getDeviceID,
	info: info
};
