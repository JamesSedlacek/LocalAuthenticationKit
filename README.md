# LocalAuthenticationKit

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/LocalAuthenticationKit.svg)](https://github.com/JamesSedlacek/LocalAuthenticationKit/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/LocalAuthenticationKit.svg?color=blue)](https://github.com/JamesSedlacek/LocalAuthenticationKit/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/LocalAuthenticationKit.svg?color=blue)](https://github.com/JamesSedlacek/LocalAuthenticationKit/network)
<a href="https://github.com/JamesSedlacek/LocalAuthenticationKit/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/LocalAuthenticationKit" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/LocalAuthenticationKit/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/LocalAuthenticationKit" alt="Issues Badge"/></a>


<p align="left">
  <img src = "https://github.com/JamesSedlacek/LocalAuthenticationKit/blob/main/Assets/PrivacyLock.png" height="250">
</p>

## Description
`LocalAuthenticationKit` is a SwiftUI library for handling local authentication. <br>

<br>

## Requirements

- **iOS**: 17.0 or later.
- **macOS**: 14.0 or later.

<br>

## Installation

You can install `LocalAuthenticationKit` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/JamesSedlacek/LocalAuthenticationKit.git
```
4. Xcode will fetch the repository & the "LocalAuthenticationKit" library will be added to your project.

<br>

## Usage

1. Add `.authenticateIfEnabled()` to the root view in your project.
```swift
import LocalAuthenticationKit
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        ContentView()
            .authenticateIfEnabled()
    }
}
```

<br>

2. Use a `LocalAuthToggle()` in the settings screen in your project.
```swift
import LocalAuthenticationKit
import SwiftUI

struct SettingsView {
    var body: some View {
        VStack {
            LocalAuthToggle()
        }
    }
}
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)


