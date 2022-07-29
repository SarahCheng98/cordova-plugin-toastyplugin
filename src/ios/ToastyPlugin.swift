import Foundation
import UIKit

@objc(ToastyPlugin) class ToastyPlugin : CDVPlugin {
    func show(command: CDVInvokedUrlCommand){
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let input = command.arguments[0] as! NSObject
        var message = input.value(forKey: "message") as? String ?? ""
        var duration = input.value(forKey: "duration") as? String ?? "long"
        var seconds = 4.0
        if duration == "short"{
            seconds = 2.0
        }

        if message.count > 0{
            let toastLabel = UILabel(frame: CGRect(x: self.viewController.view.frame.size.width/2 - 75, y: self.viewController.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center;
            toastLabel.font = .systemFont(ofSize: 12.0);
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds = true
            self.viewController.view.addSubview(toastLabel)
            UIView.animate(withDuration: seconds, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: message
            )
        }

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )

    }
}