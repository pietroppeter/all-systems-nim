# All Systems Nim

Talk proposal for the Open Source Systems Languages devroom at FOSDEM 2027
(CfP closes 23 November 2026), with a nimib explainer page that surveys
possible approaches to the talk.

- `index.html`: the explainer, themed as a 1961 mission control flight plan ("all systems go").
- `src/index.nim`, `src/style.nim`: the nimib source of the page.
- `src/proposal.txt`: the proposal as plain text, for the CfP form (written by the build).

Build (Nim 2.x, needs libpcre for nim-markdown):

```sh
sh deps.sh          # nimib and deps at pinned commits into ./deps
nim r src/index.nim # writes index.html and src/proposal.txt
```

Then the post-build code-block pass from [claude-artifacts](https://github.com/pietroppeter/claude-artifacts/tree/main/tools)
(highlights the raw `<pre>` blocks at build time, makes code scroll inside its box), and the phone check:

```sh
pip install pygments
for t in codeblocks.py phonecheck.js; do curl -sO https://raw.githubusercontent.com/pietroppeter/claude-artifacts/main/tools/$t; done
python3 codeblocks.py index.html
node phonecheck.js index.html   # needs Playwright
```
