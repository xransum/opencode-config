# Plain ASCII Punctuation

Never use Unicode punctuation characters in any file you write or edit.
Always substitute the plain ASCII equivalent:

| Avoid | Use instead |
|-------|-------------|
| `"` `"` curly double quotes | `"` |
| `'` `'` curly single quotes | `'` |
| `—` em dash | `--` or rewrite the sentence |
| `–` en dash | `-` |
| `…` ellipsis | `...` |
| `·` middle dot | `-` or rewrite |
| `•` bullet point | use Markdown `- ` lists |
| `->` Unicode arrows | `->` |
| non-breaking space (U+00A0) | regular space |
| `«` `»` guillemets | `"` |
| `‹` `›` single guillemets | `'` |

This applies to prose, comments, commit messages, documentation, and all other
files. Code string literals are exempt when the value itself must contain a
specific character.
