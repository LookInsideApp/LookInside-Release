# LookInside-Release

This repo gives your app the LookInside debug server. Add it to the app you want to inspect, then open LookInside on your Mac.

Website: [lookinside-app.com](https://lookinside-app.com)

## Swift Package Manager

```swift
// Package.swift
dependencies: [
    .package(url: "https://github.com/LookInsideApp/LookInside-Release.git", from: "X.Y.Z"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(
                name: "LookInsideServer",
                package: "LookInside-Release"
            ),
        ]
    ),
]
```

For Release builds, open your app target's Build Settings and set **Excluded Source File Names** to:

```text
LookInsideServer*
```

Keep direct `LookInsideServer` API calls inside Debug-only code paths.

## CocoaPods

```ruby
target "YourApp" do
  pod "LookInsideServer",
      :git => "https://github.com/LookInsideApp/LookInside-Release.git",
      :tag => "X.Y.Z",
      :configurations => ["Debug"]
end
```

The CocoaPods snippet scopes `LookInsideServer` to Debug builds through `:configurations => ["Debug"]`.

## XCFramework

Download and unzip `LookInsideServer.xcframework.zip` from the latest release, then drag `LookInsideServer.xcframework` into your Xcode project. In your debug target's **General** tab → **Frameworks, Libraries, and Embedded Content**, set it to **Embed & Sign**.

For Release builds, open your app target's Build Settings and set **Excluded Source File Names** to:

```text
LookInsideServer*
```

## Product

| Name | What it does |
| ---- | ------------ |
| `LookInsideServer` | Starts the local debug server inside your app. |

Use the latest semver tag from this repository.

## Server Logging

Set logging environment variables on the app target that embeds `LookInsideServer`, for example in Xcode through **Edit Scheme** -> **Run** -> **Arguments** -> **Environment Variables**. Leave these variables unset for normal debugging sessions.

### `0.2.7` and later

`LOOKINSIDE_SERVER_LOG_LEVEL` controls the minimum server log level. Higher values are quieter. Missing or invalid values default to `2`.

| Value | Minimum level | What prints |
| ----- | ------------- | ----------- |
| `0` | Debug | Debug, info, default, warning, and error logs. Enables frame-level diagnostics. |
| `1` | Info | Info, default, warning, and error logs. Includes high-volume frame summaries. |
| `2` | Default | Default, warning, and error logs. This is the default. |
| `3` | Warning | Warning and error logs. |
| `4` | Error | Error logs only. |

`LOOKINSIDE_SERVER_FRAME_DEBUG` is no longer used by `0.2.7` and later.

### `0.2.5` and `0.2.6`

These versions do not support `LOOKINSIDE_SERVER_LOG_LEVEL`. Use `LOOKINSIDE_SERVER_FRAME_DEBUG` only when you need frame-level diagnostics.

| Version | Environment variable | Enabled value |
| ------- | -------------------- | ------------- |
| `0.2.5` | `LOOKINSIDE_SERVER_FRAME_DEBUG` | `1`, `YES`, or `TRUE` |
| `0.2.6` | `LOOKINSIDE_SERVER_FRAME_DEBUG` | `1` |

## License

Release binaries inherit their upstream license.
