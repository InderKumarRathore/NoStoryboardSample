//
//  Log.swift
//  CoreDataTest
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import SwiftyBeaver

class Log {
  
  open class func initializeLogger() {
    // log to Xcode Console
    SwiftyBeaver.addDestination(ConsoleDestination())
  }
  
  public static func verbose(_ message: @autoclosure () -> Any, _
    file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    SwiftyBeaver.custom(level: .verbose, message: message, file: file, function: function, line: line, context: context)
  }
  
  /// log something which help during debugging (low priority)
  public static func debug(_ message: @autoclosure () -> Any, _
    file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    SwiftyBeaver.custom(level: .debug, message: message, file: file, function: function, line: line, context: context)
  }
  
  /// log something which you are really interested but which is not an issue or error (normal priority)
  public static func info(_ message: @autoclosure () -> Any, _
    file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    SwiftyBeaver.custom(level: .info, message: message, file: file, function: function, line: line, context: context)
  }
  
  /// log something which may cause big trouble soon (high priority)
  public static func warning(_ message: @autoclosure () -> Any, _
    file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    SwiftyBeaver.custom(level: .warning, message: message, file: file, function: function, line: line, context: context)
  }
  
  /// log something which will keep you awake at night (highest priority)
  public static func error(_ message: @autoclosure () -> Any, _
    file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
    SwiftyBeaver.custom(level: .error, message: message, file: file, function: function, line: line, context: context)
  }
}
