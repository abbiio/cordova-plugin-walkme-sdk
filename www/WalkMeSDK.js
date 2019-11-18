var exec = require('cordova/exec');

exports.start = function (key, secret, success, error) {
    exec(success, error, 'WalkMeSDK', 'start', [key, secret]);
};

exports.restart = function (success, error) {
    exec(success, error, 'WalkMeSDK', 'restart');
};

exports.stop = function (success, error) {
    exec(success, error, 'WalkMeSDK', 'stop');
};

exports.startWithApplicationType = function (key, secret, appType, success, error) {
    exec(success, error, 'WalkMeSDK', 'startWithApplicationType', [key, secret, appType]);
};

exports.sendGoal = function (goalName, properties, success, error) {
    exec(success, error, 'WalkMeSDK', 'sendGoal', [goalName, properties]);
};

exports.setUserAttribute = function (key, value, success, error) {
    exec(success, error, 'WalkMeSDK', 'setUserAttribute', [key, value]);
};

exports.setUserAttributes = function (attributes, success, error) {
    exec(success, error, 'WalkMeSDK', 'setUserAttributes', [attributes]);
};

exports.setPrivateUserAttribute = function (key, value, success, error) {
    exec(success, error, 'WalkMeSDK', 'setPrivateUserAttribute', [key, value]);
};

exports.setPrivateUserAttributes = function (attributes, success, error) {
    exec(success, error, 'WalkMeSDK', 'setPrivateUserAttributes', [attributes]);
};

exports.clearPrivateUserAttributes = function (success, error) {
    exec(success, error, 'WalkMeSDK', 'clearPrivateUserAttributes');
};

exports.setFlag = function (flag, success, error) {
    exec(success, error, 'WalkMeSDK', 'setFlag', [flag]);
};

exports.trigger = function (trigger, deepLink, success, error) {
    exec(success, error, 'WalkMeSDK', 'trigger', [trigger, deepLink]);
};

exports.setUserID = function (userID, success, error) {
    exec(success, error, 'WalkMeSDK', 'setUserID', [userID]);
};

exports.setEventsFilter = function (events, success, error) {
    exec(success, error, 'WalkMeSDK', 'setEventsFilter', [events]);
};

exports.setScreenID = function (screenID, success, error) {
    exec(success, error, 'WalkMeSDK', 'setScreenID', [screenID]);
};

exports.setLanguage = function (language, success, error) {
    exec(success, error, 'WalkMeSDK', 'setLanguage', [language]);
};

exports.openURL = function (url, options, success, error) {
    exec(success, error, 'WalkMeSDK', 'openURL', [url, options]);
};
