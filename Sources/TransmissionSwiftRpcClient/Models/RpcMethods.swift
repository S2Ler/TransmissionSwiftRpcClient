import Foundation

internal enum RpcMethod: Encodable {
  case addTorrent
  case custom(String)

  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(rawValue)
  }
}

private extension RpcMethod {
  var rawValue: String {
    switch self {
    case .addTorrent:
      return "torrent-add"
    case .custom(let customMethod):
      return customMethod
    }
  }
}