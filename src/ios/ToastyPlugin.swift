import Foundation
import UIKit

@objc(ToastyPlugin) class ToastyPlugin : CDVPlugin {
    func show(command: CDVInvokedUrlCommand){


        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: message
            )
        

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )

    }
}