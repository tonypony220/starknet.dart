// Autogenerated from Pigeon (v8.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol StarknetInterface {
  func storeSecret(key: String, privateKey: FlutterStandardTypedData, completion: @escaping (Result<Void, Error>) -> Void)
  func removeSecret(key: String, completion: @escaping (Result<Void, Error>) -> Void)
  func getSecret(key: String, completion: @escaping (Result<FlutterStandardTypedData, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class StarknetInterfaceSetup {
  /// The codec used by StarknetInterface.
  /// Sets up an instance of `StarknetInterface` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: StarknetInterface?) {
    let storeSecretChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.StarknetInterface.storeSecret", binaryMessenger: binaryMessenger)
    if let api = api {
      storeSecretChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let privateKeyArg = args[1] as! FlutterStandardTypedData
        api.storeSecret(key: keyArg, privateKey: privateKeyArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      storeSecretChannel.setMessageHandler(nil)
    }
    let removeSecretChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.StarknetInterface.removeSecret", binaryMessenger: binaryMessenger)
    if let api = api {
      removeSecretChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        api.removeSecret(key: keyArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      removeSecretChannel.setMessageHandler(nil)
    }
    let getSecretChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.StarknetInterface.getSecret", binaryMessenger: binaryMessenger)
    if let api = api {
      getSecretChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        api.getSecret(key: keyArg) { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getSecretChannel.setMessageHandler(nil)
    }
  }
}