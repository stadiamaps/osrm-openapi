# OSRM OpenAPI

OpenAPI spec and generation script to build ([Valhalla](https://github.com/valhalla/valhalla)-flavored) OSRM Models for various platforms.

## Building OSRM Models

### Setup MacOS

The model generations script requires the openapi-generator and swiftformat cli tools. To install these using brew, run the following command.
For more information see [OpenAPI Generator Install](https://openapi-generator.tech/docs/installation) and [SwiftFormat Install](https://github.com/nicklockwood/SwiftFormat?tab=readme-ov-file#how-do-i-install-it).

```
brew install openapi-generator swiftformat
```

### Generating Model Code

```sh
./generate_models.sh swift
```

* `--clean` delete the .build and generated folder.

## References 

- OpenAPI spec based on <https://github.com/1papaya/osrm-openapi>, released under the MIT license