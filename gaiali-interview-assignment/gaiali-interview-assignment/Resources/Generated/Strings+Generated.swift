// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum FileError {
    /// File with name: %@ is not found.
    internal static func fileNotFoundFor(_ p1: Any) -> String {
      return Strings.tr("Localizable", "fileError.fileNotFoundFor", String(describing: p1))
    }
    /// Can't read file named: %@
    internal static func readingFileFailed(_ p1: Any) -> String {
      return Strings.tr("Localizable", "fileError.readingFileFailed", String(describing: p1))
    }
  }

  internal enum ForecastList {
    /// Weather Forecast
    internal static let title = Strings.tr("Localizable", "forecastList.title")
    internal enum City {
      /// Type city name
      internal static let placeholder = Strings.tr("Localizable", "forecastList.city.placeholder")
    }
    internal enum Segment {
      /// JSON File
      internal static let json = Strings.tr("Localizable", "forecastList.segment.json")
      /// Web API
      internal static let web = Strings.tr("Localizable", "forecastList.segment.web")
    }
  }

  internal enum General {
    /// ok
    internal static let ok = Strings.tr("Localizable", "general.ok")
  }

  internal enum PresentableError {
    /// Something went south. Please try again.
    internal static let general = Strings.tr("Localizable", "presentableError.general")
    /// Server communication error. Please try again.
    internal static let serverCommunicationError = Strings.tr("Localizable", "presentableError.serverCommunicationError")
    /// Error
    internal static let title = Strings.tr("Localizable", "presentableError.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
