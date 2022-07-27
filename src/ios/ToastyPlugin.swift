import Foundation

@objc(ToastyPlugin) class ToastyPlugin : CDVPlugin {
    func show(command: CDVInvokedUrlCommand){
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let input = command.arguments[0]
        if let dictionary = input as? [String: Any]{
            let message = dictionary["message"] as? String ?? ""
            let duration = dictionary["duration"] as? String ?? "long"
        }else{
            let message = ""
            let duration = "long"
        }

        if msg.count > 0 {
            let toastController: UIALertController =
               UIALertController{
                title: "",
                message: message,
                preferredStyle: .Alert
               }

            self.viewController?.presentViewController(
                toastController,
                animated: true,
                completion: nil
            )

            if(duration == "long"){
                let showingTime = Double(NSEC_PER_SEC) * 6.0
            }else{
                let showingTime = Double(NSEC_PER_SEC) * 3.0
            }

            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(duration)
                ),
                dispatch_get_main_queue(),
                {
                    toastController.dismissViewControllerAnimated(
                        true,
                        completion: nil
                    )
                }
            )

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAsString: message
            )
        }

        self.commandDelegate!.sendPluginResult(
            pluginResult,
            callbackId: command.callbackId
        )
    }
}