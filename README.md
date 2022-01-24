# SpotlessCF

A CFML wrapper for the "Spotless" java library which provides code formatting over many many languages.

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