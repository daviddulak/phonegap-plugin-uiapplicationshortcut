var exec = cordova.require('cordova/exec');

var Shortcut = function(options) {
    this._handlers = {
        'registration': [],
        'notification': [],
        'error': []
    };

    // require options parameter
    if (typeof options === 'undefined') {
        throw new Error('The options argument is required.');
    }

    // store the options to this object instance
    this.options = options;
};


Shortcut.prototype.on = function(eventName, callback) {
    if (this._handlers.hasOwnProperty(eventName)) {
        this._handlers[eventName].push(callback);
    }
};


module.exports = {
    Shortcut: Shortcut
};