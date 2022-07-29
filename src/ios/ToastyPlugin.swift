import Foundation
import UIKit

@objc(ToastyPlugin) class ToastyPlugin : CDVPlugin {
    func show(command: CDVInvokedUrlCommand){
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let input = command.arguments[0]
        var message = ""
        var duration = "long"
        var seconds = 4.0
        if let dictionary = input as? [String: Any]{
            message = dictionary["message"] as? String ?? ""
            duration = dictionary["duration"] as? String ?? "long"
            if duration == "short"{
                seconds = 2.0
            }
        }else{
            message = ""
            duration = "long"
        }

        if message.count > 0{
            let toastLabel = UILabel(frame: CGRect(x: self.viewController.view.frame.size.width/2 - 75, y: self.viewController.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.font = .systemFont(ofSize: 12.0);
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.cornerRadius = 10;
            toastLabel.clipsToBounds = true
            self.viewController.view.addSubview(toastLabel)
            UIView.animate(withDuration: seconds, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAsString: message
            )
        }

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )

    }
}