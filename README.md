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
