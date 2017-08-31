## multimarkdownjs

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
```markdown
./build.sh [asm|wasm]

