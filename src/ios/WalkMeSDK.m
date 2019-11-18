#import "WalkMeSDK.h"

@implementation WalkMeSDK

- (void)start:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;

    if (command.arguments.count < 2) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSString *key = [command.arguments objectAtIndex:0];
        NSString *secret = [command.arguments objectAtIndex:1];

        if (key && secret) {
            [ABBI start:key withSecretKey:secret andApplicationType:ABBI_APP_HYBRID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)restart:(CDVInvokedUrlCommand *)command {
    [ABBI restart];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)stop:(CDVInvokedUrlCommand *)command {
    [ABBI stop];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)sendGoal:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount == 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSString *goalName = [command.arguments objectAtIndex:0];

        if (argCount == 1) {
            [ABBI sendGoal:goalName withProperites:nil];
        }
        else if (argCount == 2) {
            NSDictionary *properties = [command.arguments objectAtIndex:1];
            [ABBI sendGoal:goalName withProperites:properties];
        }

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserAttribute:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount < 2) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSString *key = [command.arguments objectAtIndex:0];
        id value = [command.arguments objectAtIndex:1];

        [ABBI setUserAttributeWithKey:key andValue:value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserAttributes:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount < 1) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSDictionary *attributes = [command.arguments objectAtIndex:0];

        [ABBI setUserAttributes:attributes];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setPrivateUserAttribute:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount < 2) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSString *key = [command.arguments objectAtIndex:0];
        id value = [command.arguments objectAtIndex:1];

        [ABBI setPrivateUserAttributeWithKey:key andValue:value];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setPrivateUserAttributes:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount < 1) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSDictionary *attributes = [command.arguments objectAtIndex:0];

        [ABBI setPrivateUserAttributes:attributes];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)clearPrivateUserAttributes:(CDVInvokedUrlCommand *)command {
    [ABBI clearPrivateUserAttributes];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)setFlag:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = nil;
    NSInteger argCount = command.arguments.count;

    if (argCount < 1) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    else {
        NSNumber *num = [command.arguments objectAtIndex:0];

        [ABBI setFlag:num.intValue];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)trigger:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSInteger argCount = command.arguments.count;

    if (argCount > 0) {
        NSString *trigger = [command.arguments objectAtIndex:0];

        if ([trigger isKindOfClass:[NSString class]]) {
            [ABBI trigger:trigger];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserID:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSInteger argCount = command.arguments.count;

    if (argCount > 0) {
        NSString *userId = [command.arguments objectAtIndex:0];

        if ([userId isKindOfClass:[NSString class]]) {
            [ABBI setUserID:userId];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setEventsFilter:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSInteger argCount = command.arguments.count;

    if (argCount > 0) {
        NSArray<NSNumber *> *events = [command.arguments objectAtIndex:0];

        if ([events isKindOfClass:[NSArray class]]) {
            [ABBI setEventsFilter:events];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setScreenID:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSInteger argCount = command.arguments.count;

    if (argCount > 0) {
        NSString *screenID = [command.arguments objectAtIndex:0];

        if ([screenID isKindOfClass:[NSString class]]) {
            [ABBI setScreenID:screenID];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setLanguage:(CDVInvokedUrlCommand *)command {
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSInteger argCount = command.arguments.count;

    if (argCount > 0) {
        NSString *language = [command.arguments objectAtIndex:0];

        if ([language isKindOfClass:[NSString class]]) {
            [ABBI setLanguage:language];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
