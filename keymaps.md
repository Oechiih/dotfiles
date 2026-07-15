# Keyboard layout — keybinding approach

TUI apps are designed around the US ANSI keyboard layout. Rather than remapping
the OS keyboard or memorising arbitrary alternatives, keybindings are remapped to
the character that sits at the **same physical key position** on the Swiss German
(CH-DE) layout.

This means muscle memory from the US layout transfers directly — you press the
same key, the app just sees a different character.

## Reference table

| US character | Swiss German character | Position |
|-------------|----------------------|----------|
| `` ` ``     | `§`                  | top-left |
| `~`         | `°`                  | shift + top-left |
| `-`         | `'`                  | right of `0` |
| `_`         | `?`                  | shift + right of `0` |
| `=`         | `^`                  | two right of `0` |
| `[`         | `ü`                  | right of `P` |
| `{`         | `è`                  | shift + right of `P` |
| `]`         | `¨`                  | two right of `P` |
| `}`         | `!`                  | shift + two right of `P` |
| `\`         | `$`                  | right of `¨` |
| `\|`        | `£`                  | shift + right of `¨` |
| `;`         | `ö`                  | right of `L` |
| `:`         | `é`                  | shift + right of `L` |
| `'`         | `ä`                  | two right of `L` |
| `"`         | `à`                  | shift + two right of `L` |
| `/`         | `-`                  | rightmost bottom row |
| `?`         | `_`                  | shift + rightmost bottom row |

## Applying to an app

1. Find the app's default keybindings that use characters from the table above
2. In the app's config (managed via Nix), remap each action to the Swiss German
   equivalent from the table
3. Document the remapping with a comment referencing this file
