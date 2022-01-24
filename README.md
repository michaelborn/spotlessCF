# SpotlessCF

A CFML wrapper for the "Spotless" java library which provides code formatting over many many languages.

[![Release](https://github.com/michaelborn/spotlessCF/actions/workflows/release.yml/badge.svg)](https://github.com/michaelborn/spotlessCF/actions/workflows/release.yml)

See [Spotless on GitHub](https://github.com/diffplug/spotless) for more info.

## Installation

1. Install this module. `box install spotlessCF`
2. Add the module's `lib/` directory to your application's `javaSettings.loadPaths`:

```js
this.javaSettings.loadPaths = [
    // ...
    expandPath( "/modules/spotlessCF/lib/spotless-lib-2.22.0/" )
];
```

Restart your app. The CF engine should "pick up" the spotless jar and load it into the application.

## Configuration

There are two ways to configure spotlessCF module settings:

1. Using a [`.env` file](#env-file-and-commandbox-dotenv)
2. Using [Module Settings](#module-settings)

### Env File and `commandbox-dotenv`

```bash
# settings go here
SPOTLESS_SETTING=blabla
```

### Module Settings

Add the following to `config/ColdBox.cfc` and update as necessary:

```js
moduleSettings = {
    spotlessCF = {
        // settings go here
    }
}
```

## API Docs

The spotlessCF class documentation is auto-generated via [DocBox](https://docbox.ortusbooks.com/) and hosted on Github Pages at [michaelborn.github.io/spotlessCF/](https://michaelborn.github.io/spotlessCF/)

## Contributing

I could use help with this!

## Thanks

Special thanks to the [Spotless library](https://github.com/diffplug/spotless). I could'na dunnit without ya. 😉