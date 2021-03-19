# SwiftIO-Projects

My projects built for the MadMachine.io SwiftIO board, using their [Swift package](https://github.com/madmachineio/SwiftIO) (currently using [my fork](https://github.com/armcknight/SwiftIO) including modifications from [kimar's fork](https://github.com/kimar/SwiftIO)) and the [`mm` CLI](https://github.com/EmbeddedSwift/MadMachine).

## Organization

```
├── Makefile
├── README.md
├── SwiftIO-Projects.xcodeproj
├── Blink
│   ├── Blink.mmp
│   └── Sources
│       └── main.swift
├── Potentiometer
│   ├── Potentiometer.mmp
│   └── Sources
│       └── main.swift
├── ...
```

Each project has a macOS static library target that links the SwiftIO Swift package, with a main.swift file that's compiled just for editing purposes in Xcode.

Each target also has its own `.mmp` file, which is the MadMachine Project file used by `mm` (and the MadMachine IDE) to build the `swiftio.bin` file that's copied to the board's SD card to load on boot.

`Makefile` has tasks for building each target with `mm` and for deploying to the board.
