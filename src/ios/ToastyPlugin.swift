import Foundation
import UIKit

@objc(ToastyPlugin) class ToastyPlugin : CDVPlugin {
    func show(command: CDVInvokedUrlCommand){


        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )

    }
}