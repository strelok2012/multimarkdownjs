## multimarkdownjs

Online [demo](https://strelok2012.github.io/multimarkdownjs)

> NOTE: I don't think that you can use this library for production now, due to BIG size (~780 kB in asm.js version and ~350 for WASM version). But we work on it!

If you want to use this library, just include `dist/multimarkdown.asm.js`.

Then, you can use it like:
```javascript
var html = MultiMarkdown.render("## Hello world!");
```
If you want to set extensions, just call:
```javascript
MultiMarkdown.setExtensions(FLAG1 | FLAG2 | ...);
```
Extensions flags table:

| Flag | Description |
| --- | --- |
|EXT_COMPATIBILITY|Markdown compatibility mode|
|EXT_COMPLETE|Create complete document|
|EXT_SNIPPET(*Default*)|Create snippet only|
|EXT_SMART|Enable Smart quotes|
|EXT_NOTES|Enable Footnotes|
|EXT_NO_LABELS|Don't add anchors to headers, etc.|
|EXT_PROCESS_HTML|Process Markdown inside HTML|
|EXT_NO_METADATA|Don't parse Metadata|
|EXT_OBFUSCATE|Mask email addresses|
|EXT_CRITIC|Critic Markup Support|
|EXT_CRITIC_ACCEPT|Accept all proposed changes|
|EXT_CRITIC_REJECT|Reject all proposed changes|
|EXT_RANDOM_FOOT|Use random numbers for footnote links|
|EXT_TRANSCLUDE(*Unused*)|Perform transclusion(s)|

Extension flags can be accessed as `MultiMarkdown.extensions.FLAG`

If you use `Smart qoutes` extenstion, you can set `Smart quotes` language as:
```javascript
MultiMarkdown.setLanguage(LANG);
```
Supported languages:

* `MultiMarkdown.languages.ENGLISH`
* `MultiMarkdown.languages.DUTCH`
* `MultiMarkdown.languages.FRENCH`
* `MultiMarkdown.languages.GERMAN`
* `MultiMarkdown.languages.GERMANGUILL`
* `MultiMarkdown.languages.SWEDISH`

## How to build
> If you want to build library yourself, you'll need to install latest [Emscripten SDK](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html#linux-and-mac-os-x).

Just call `./build.sh [asm|wasm]` - calling without options will build for asm.js and WASM simultaneously.

You can find result files in `dist` folder.



