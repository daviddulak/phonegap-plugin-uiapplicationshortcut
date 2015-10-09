var exec = cordova.require('cordova/exec');

function Shortcut() {};

Shortcut.prototype.check = function(success, fail) {
    cordova.exec(success, fail, 'Shortcut', 'check', []);
};


module.exports = new Shortcut();