import SPMUtility
import Foundation

// We drop the first argument as this is always the execution path. In our case: "banner"
let arguments = ProcessInfo.processInfo.arguments.dropFirst()

let parser = ArgumentParser(usage: "<options>", overview: "A Swift command-line tool to create blog post banners")
let titleArgument = parser.add(option: "--title", shortName: "-t", kind: String.self, usage: "The title of the blog post")
let weekArgument = parser.add(option: "--week", shortName: "-w", kind: Int.self, usage: "The week of the blog post as used in the file name")

do {
    let parsedArguments = try parser.parse(Array(arguments))
    let title = parsedArguments.get(titleArgument)!
    let week = parsedArguments.get(weekArgument)!
    print("Creating a banner for title \(title) and week \(week)")

    // .. Writing code to actually create the banner
} catch {
    print("Banner creation failed with \(error)")
}
