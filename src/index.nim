import std/[json, os, strutils, strformat]
import nimib
import style

nbInit
# write the page next to src/, wherever the build is run from
nb.doc.filename = currentSourcePath().parentDir.parentDir / "index.html"
nb.doc.context["title"] = %"All Systems Nim · talk proposal flight plan"
nb.doc.context["stylesheet"] = %pageStyle
nb.doc.context["highlight"] = %""
nb.doc.context["disableHighlightJs"] = %true
func pageHeader(blk: JsonNode, nb: Nb): string =
  """<header><span>Flight plan · a nimib notebook</span><span>FOSDEM 2027 · Open Source Systems Languages</span></header>"""
nb.backend.partials["header"] = pageHeader

# ---------------------------------------------------------------- consoles
# One row per console of the poll. Used for the board in the hero and for
# the console section below; the board's script reads the data- attributes.
type Console = object
  code, name, short, call: string

const consoles = [
  Console(code: "BOOSTER", name: "Bare metal", short: "kernels, firmware, tiny binaries",
          call: "Compiles to C, no VM, no mandatory runtime. Kernels, firmware and handhelds."),
  Console(code: "EECOM", name: "Life support", short: "memory: ARC/ORC, destructors",
          call: "Deterministic destructors and move semantics. No stop-the-world collector."),
  Console(code: "GUIDO", name: "Guidance", short: "macros and compile time",
          call: "Templates, macros and a compile-time VM. The language bends to the domain."),
  Console(code: "FIDO", name: "Flight dynamics", short: "C, C++, ObjC and JS backends",
          call: "One codebase, four backends. Native at build time, JavaScript in the browser."),
  Console(code: "RETRO", name: "Docking", short: "interop both ways",
          call: "importc in, exportc out. Rust through the C ABI, plugins loaded by Python."),
  Console(code: "INCO", name: "Compiler", short: "HCR, IC, NimScript, Nimony",
          call: "The compiler is a platform: hot code reloading, incremental compilation."),
  Console(code: "SURGEON", name: "Crew health", short: "low cognitive load",
          call: "Reads like Python, checked like Ada. Easy on humans, easy on agents."),
  Console(code: "CAPCOM", name: "The crew", short: "people and whimsy",
          call: "A browser from scratch, e-ink frames, games, a wordoku. People fly it."),
]

proc boardHtml(): string =
  result = """<div class="console" id="board"><div class="bar"><span>MISSION CONTROL · NIM-1 · GO/NO-GO POLL</span>""" &
    """<span class="tminus" id="tminus">T-MINUS <b>--</b> DAYS TO CFP CLOSE</span></div><div class="lamps">"""
  for c in consoles:
    result.add &"""<div class="lamp" data-code="{c.code}" data-call="{c.call}"><i></i><b>{c.code}</b><span>{c.name}</span></div>"""
  result.add """</div><div class="callout" id="callout">FLIGHT: Stand by for the go/no-go poll.</div>""" &
    """<div style="display:flex;gap:8px;margin-top:10px;flex-wrap:wrap"><button id="poll">▶ Poll the consoles</button>""" &
    """<button class="alt" id="holds">Show holds</button></div></div>"""

# ---------------------------------------------------------------- hero
nbRawHtml: """
<h1>All Systems <span class="nim">Nim</span></h1>
<p class="lede">A flight plan for a FOSDEM talk: what Nim is as a systems language, what it can do from kernels to word puzzles,
and seven ways to tell it in 25 minutes. Ends with a proposal ready to paste into the CfP form.</p>
<span class="stamp">DRAFT · REV 1 · 7 NOV 2026</span>
""" & boardHtml()

nbText: """
The board above is the talk in miniature. Before a launch, the flight director polls every console of mission control
and each one answers *go* or *no-go*. Press **Poll the consoles** to run the poll on Nim: eight consoles,
eight things Nim brings to systems programming. **Show holds** lights the consoles where the honest answer
is "go, with a hold". The board's script is Nim, compiled to JavaScript by this page.
"""

# ---------------------------------------------------------------- 1 the phrase
nbRawHtml: """<h2><span class="t">T-10 · THE PHRASE</span>Cabin pressure go</h2>"""

nbRawHtml: """
<div class="transcript">
<div><span class="who">FREEDOM 7</span>Cabin pressure go.</div>
<div><span class="who"></span>Fuel system go.</div>
<div><span class="who"></span>Oxygen go.</div>
<div><span class="who"></span><b>All systems go.</b></div>
<div class="src">Alan Shepard, Mercury-Redstone 3, 5 May 1961, as retold by
<a href="https://grammarist.com/idiom/all-systems-go/">Grammarist</a> and
<a href="https://www.phrases.org.uk/meanings/all-systems-go.html">phrases.org.uk</a>, which credit the flight transcript.
The <a href="https://mercury3.spacelog.org/page/PAO">Spacelog transcript</a> of the flight is the place to check the exact words before a slide.
Not to be mixed up with "A-OK", which NASA's PAO John "Shorty" Powers attributed to Shepard and the tapes later showed he never said.</div>
</div>
"""

nbText: """
"All systems go" means every check is done and you can proceed without delay. It comes from the countdowns of
the American space program, and it left aerospace to become everyday language for launches of any kind.

It fits this talk three times over:

1. **A launch.** FOSDEM 2027 has a brand new devroom for *non-mainstream* systems languages, and Nim is named in its call.
   There is no Nim devroom in the 2027 list, so this room is where Nim lives this year.
2. **A poll of systems.** A systems language is many systems working together: memory, compiler, backends, interop.
   Mission control polls each console in turn, and a talk can do the same. Each console is one capability, a demo and a verdict.
3. **Honesty.** A console can answer *no-go*, or call a *hold*. The scientific Nim talk had "rocks ahead"
   at the end of each island; here the same honesty has a better name.

Title: **All Systems Nim**. The pun works when read aloud ("all systems go" with one sound changed) and
says the thesis: every system is there, and it is Nim all the way down.
"""

# ---------------------------------------------------------------- 2 the room
nbRawHtml: """<h2><span class="t">T-09 · THE LAUNCH SITE</span>The devroom</h2>"""

nbRawHtml: """
<div class="facts">
<div><b>Room</b>Open Source Systems Languages (new in 2027)</div>
<div><b>When</b>Sunday 31 January 2027, afternoon</div>
<div><b>Slots</b>25 or 45 minutes (say which in the submission)</div>
<div><b>CfP closes</b>23 November 2026</div>
<div><b>Speakers told</b>1 December · schedule 7 December</div>
<div><b>Submit at</b><a href="https://fosdem.org/submit">fosdem.org/submit</a>, track "Open Source Systems Languages"</div>
<div><b>Organizers</b>Jose E. Marchesi, Iain Buclaw, Sergei Giniatulin, Mike Shah</div>
<div><b>Named languages</b>D, Odin, C3, Lobster, Zig, Nim</div>
</div>
"""

nbText: """
From the [devroom page](https://mikeshah.github.io/fosdem27-ossl-devroom/): a place to "geek out about awesome
non-mainstream programming languages". A non-mainstream systems language "allows low level programming, and is not
a 'top-20' language on the TIOBE index". The audience doesn't care about popularity: they "want to do great engineering
and are going to choose the right open source tool to get the work done". Suggested topics: adoption at your company,
how language design trade-offs helped you, or a cool project you built.

What this tells us about the audience:

- They already like at least one odd language (D, Zig, Odin, C3). They don't need convincing that a small language
  can be good; they want to know **what is different about this one**.
- "Systems" is in the room name, so the talk must show low-level credentials early, before the whimsy.
- The room invites design trade-offs. Talking about Nim's choices (and their costs) is on topic, not a detour.
- The neighbours will be D, Zig and Odin people. Comparisons should be trade-offs, not a contest, as in the
  scientific talk.
"""

# ---------------------------------------------------------------- 3 telemetry
nbRawHtml: """<h2><span class="t">T-08 · TELEMETRY</span>What we have to work with</h2>"""

nbText: """
### The sister talk

[Sailing Seas of Scientific Nim](https://github.com/pietroppeter/talk-sailing-seas-scientific-nim) is at
Compute! Paris on 26 November 2026, three days after this CfP closes. Its shape is a template for this one:

- a **metaphor** carrying the whole talk (a sea voyage, seven islands),
- **no tutorial**: Nim reads like Python, so examples stand on their own,
- **success stories** of other people before your own work,
- an honest **"rocks ahead"** line at the end of each island,
- a nimib **explainer page** behind each slide for the curious,
- prepared **spec-driven**, with OpenSpec and a custom `talk` schema.

The same moves apply here with a different domain: from scientific computing to systems programming. The
islands become consoles, the rocks become holds, the voyage becomes a countdown.

### The recent experiments

These are all from the last few weeks, most built with a coding agent and planned with OpenSpec.
Each one shows a different systems feature, which is what makes them good talk material.
"""

nbText: """
| Project | What it is | The systems feature it shows |
|---|---|---|
| [nanuq](https://github.com/pietroppeter/nanuq) | Polars DataFrames for Nim, 116 of 128 Polars feature groups | A Rust crate exports a C ABI; Nim calls it with `importc` and frees Rust-heap objects in `=destroy`. Rust panics come back as Nim exceptions. |
| [nanuq-more](https://github.com/pietroppeter/nanuq-more) | Polars expression plugins written in Nim | The Polars plugin ABI (Arrow C data interface) in pure Nim; one `{.polarsExpr.}` macro; the same shared library loads in Nanuq **and in Python Polars**. Built with `uv` and `zig cc`. |
| [nanuqy](https://github.com/pietroppeter/nanuqy) | Just started: replace the Rust half of nanuq | Nimony (the next Nim compiler) and NIF. |
| [cicak](https://github.com/pietroppeter/cicak) | A REPL for Nim (research) | Each input is a module, loaded into a live process with hot code reloading; incremental compilation (Nim 2.4) keeps each step cheap. The compiler as a platform. |
| [cadero](https://github.com/pietroppeter/cadero) | A mini CAD to design panel furniture (a real wall unit with a bed niche) | Same model code native (drawings, cut list) and in the browser (3D viewer compiled to JS). |
| [parloku](https://github.com/pietroppeter/parloku) | A wordoku game with a puzzle builder | A nimib notebook compiled to JavaScript; drag and drop by "declarative dragging". |
| [zogyn](https://github.com/pietroppeter/zogyn) | Declarative dragging as a library | The engine is tested natively and runs in the browser, unchanged. |
| [playdate-nim](https://github.com/pietroppeter/playdate-nim-emilia) experiments | Small games for the Playdate handheld | An ARM microcontroller target with a C SDK. |
| [nimib](https://github.com/pietroppeter/nimib) | The notebook library this page is written in | Runs code at build time, ships JS compiled from the same file. |
"""

nbText: """
### Other people's systems

The scientific talk's [beyond-science explainer](https://pietroppeter.github.io/talk-sailing-seas-scientific-nim/island2_beyond_explainer.html)
already collects many of these. The ones that answer "can Nim do real systems work?":

| Domain | Project | Why it counts |
|---|---|---|
| Kernels | [Fusion OS](https://github.com/khaledh/fusion) (khaledh) | A hobby x86-64 OS in Nim, with a [write-up](https://0xc0ffee.netlify.app/osdev/01-intro) from boot to user space. |
| Browsers | [Chawan](https://sr.ht/~bptato/chawan/) (bptato) | A terminal web browser written from scratch: its own HTML and CSS engine, JavaScript through QuickJS. |
| E-ink | [FrameOS](https://github.com/FrameOS) | An OS for single-function smart frames and e-ink displays, apps compiled with Nim. |
| Embedded | [Ratel](https://github.com/PMunch/ratel) (PMunch), [playdate-nim](https://github.com/samdze/playdate-nim), INGCHIPS BLE SDK | Microcontrollers with zero-cost abstractions; a vendor SDK that lists Nim next to C. |
| GUI | [owlkettle](https://github.com/can-lehmann/owlkettle) (GTK 4), [Figuro](https://github.com/elcritch/figuro), Status Desktop (Qt) | A declarative GUI DSL built with macros; a desktop messenger shipping on three OSes. |
| Games | [naylib](https://github.com/planetis-m/naylib), Turing Complete (Godot + Nim), [NimForUE](https://github.com/jmgomez/NimForUE) | A game on Steam; Unreal Engine 5 with hot reloading. |
| Infrastructure | [Nimbus](https://github.com/status-im/nimbus-eth2), [Constantine](https://github.com/mratsim/constantine) | An Ethereum consensus client light enough for a Raspberry Pi; constant-time cryptography. |
| Compilers | [nlvm](https://github.com/arnetheduck/nlvm), Nimony | An LLVM backend with a JIT REPL; the next Nim compiler. |

Before the talk, check each claim and its date with the project: these are from memory and from the Paris explainer.
"""

# ---------------------------------------------------------------- 4 what is a system
nbRawHtml: """<h2><span class="t">T-07 · SYSTEMS THINKING</span>What is a system, anyway?</h2>"""

nbText: """
The prompt for this talk asks it directly: *what is systems thinking, after all?* Three answers, each good for one slide.

**The 1998 split.** In "Scripting: Higher Level Programming for the 21st Century" (IEEE Computer, 1998), John Ousterhout
split languages in two: *system programming languages* (C, C++, Java), typed and compiled, for building data structures
and algorithms from scratch; and *scripting languages* (Tcl, Perl, Python), for gluing components together quickly.
You pick one side and pay its price. Most "non-mainstream systems languages" in this devroom are attempts to refuse
that choice. Nim's tagline says it plainly: a statically typed compiled systems language with concepts from Python,
Ada and Modula, aiming to be *efficient, expressive, elegant*.

**The systems-thinking definition.** Donella Meadows, in *Thinking in Systems*: a system is a set of elements, interconnected
so that together they achieve a purpose. Look at a language that way and the question changes. Not "can it touch
the metal?" but "how do its parts work together?" In Nim the macros, the type system, the destructors and the backends are
not separate features. A macro writes code the type checker checks, which the destructors manage, which any backend can emit.
`{.polarsExpr.}` in nanuq-more is a good example: one macro turns a plain Nim proc into a C ABI function with Arrow buffers,
and on the JS backend the same macro does nothing, so the module runs in a browser too.

**The human in the loop.** The part of a system people forget is the operator. Cognitive load is a systems property:
a language that fits in your head lets you hold more of the *rest* of the system in it. The 2026 version of this
argument has a new operator: the coding agent. A language with little syntax, one obvious way to build, readable code
and a fast, strict compiler gives an agent the same thing it gives a human: short feedback loops and fewer places to be wrong.
Most of the experiments above were written that way.

The talk's thesis, in one sentence:

> Nim is a systems language because its parts form a system: low-level control, a high ceiling and a low cognitive load,
> held together by a compiler you can program. That is why it is good at kernels **and** at word puzzles.
"""

# ---------------------------------------------------------------- 5 consoles
nbRawHtml: """<h2><span class="t">T-06 · THE CONSOLES</span>The poll, console by console</h2>"""

nbText: """
This is the material for the main body of the recommended talk. Each console is one capability, with one community example,
one example from the recent experiments, and a hold where there is one. A couple of consoles have code that ran
when this page was built.
"""

proc station(c: Console, body: string, hold = ""): string =
  result = &"""<div class="station"><div class="hd"><i></i><b>{c.code}</b><span>{c.name}</span></div><div class="bd">{body}"""
  if hold.len > 0: result.add &"""<div class="hold">{hold}</div>"""
  result.add "</div></div>"

nbRawHtml: station(consoles[0], """
<p>Nim compiles to C (or C++, or Objective-C) and then to machine code with the C compiler you already trust.
No virtual machine, no mandatory runtime, binaries in the tens of kilobytes. You can turn the GC off, write
<code>ptr</code> and <code>cast</code>, and target anything with a C toolchain.</p>
<p><b>Community:</b> Fusion OS boots on x86-64; Ratel runs on AVR microcontrollers; INGCHIPS lists Nim in its BLE SDK.
<b>Lab:</b> Playdate games through playdate-nim.</p>""")

nbRawHtml: station(consoles[1], """
<p>Since Nim 2.0 the default memory management is ORC: reference counting with move semantics and a cycle collector,
so memory is freed at a predictable point, with no stop-the-world pauses. You can write your own <code>=destroy</code>,
<code>=copy</code> and <code>=sink</code> hooks. nanuq uses them to own objects that live on the Rust heap:</p>
<pre><code class="language-nim">proc `=destroy`(x: DataFrameObj) =
  if x.raw != nil: nq_df_free(x.raw)

proc `=copy`(a: var DataFrameObj, b: DataFrameObj) {.error.}   # no accidental copies</code></pre>
<p>That is RAII across a language boundary, in three lines. <b>Community:</b> Nimbus runs an Ethereum node on a Raspberry Pi.</p>""",
  "ORC's cycle collector and multithreading took years to settle; older libraries and tutorials still assume refc.")

nbRawHtml: station(consoles[2], """
<p>Templates, hygienic macros over the typed AST, and a VM that runs ordinary Nim at compile time. Libraries
grow their own syntax without a separate code generator. In nanuq, a dataframe is a block:</p>
<pre><code class="language-nim">let bears = newDataFrame:
  name: ["Nanuq", "Siku", "Ursa", "Kallik"]
  island: ["Svalbard", "Svalbard", "Wrangel", "Wrangel"]
  kg: [420, 95, 380, nil]                # nil is a missing value</code></pre>
<p>Below, a macro written for this page runs the poll. The strings are put together by the compiler;
the program only prints them.</p>""")

nbCode:
  import std/macros

  func spoken(id: string): string =
    ## cabinPressure -> "Cabin pressure"
    for i, ch in id:
      if ch.isUpperAscii: result.add ' '
      result.add(if i == 0: ch.toUpperAscii else: ch.toLowerAscii)

  macro poll(systems: varargs[untyped]): untyped =
    result = newStmtList()
    for s in systems:
      let line = spoken(s.strVal) & " go."   # runs inside the compiler
      result.add quote do: echo `line`
    result.add quote do: echo "All systems go."

  poll cabinPressure, fuelSystem, oxygen

nbRawHtml: """<div class="small" style="margin:-4px 0 20px">The macro's output, as the compiler sees it, is just
<code>echo "Cabin pressure go."</code> three times and a last line. <b>Community:</b> owlkettle builds GTK 4 apps from a declarative
macro DSL; Karax does the same for the web.</div>"""

nbRawHtml: station(consoles[3], """
<p>The same source compiles to C, C++, Objective-C and JavaScript, and NimScript runs it in the compiler's VM.
That is not a gimmick for the web: it is how cadero draws its plans natively and shows a 3D viewer in the browser
from the same model, how zogyn tests its drag engine natively and ships it to the browser unchanged, and how the board at
the top of this page works.</p>
<pre><code class="language-bash">nim c   -d:release app.nim     # C, then your C compiler
nim cpp app.nim                # C++: talk to C++ libraries, Unreal, Qt
nim objc app.nim               # Objective-C: talk to Apple frameworks
nim js  app.nim                # JavaScript: the browser
nim e   build.nims             # NimScript: the compiler's VM</code></pre>""",
  "The JS backend is a different world: no threads, no C FFI, and some stdlib modules don't exist there.")

nbRawHtml: station(consoles[4], """
<p>Nim speaks the C ABI in both directions. <code>importc</code> calls anything with a C interface, including Rust
that exports one: that is all of nanuq. <code>exportc</code> and <code>--app:lib</code> go the other way:
nanuq-more builds a shared library that Python Polars loads as a plugin, from plain Nim procs:</p>
<pre><code class="language-nim">proc isoweek*(d: Date32): IsoWeek {.polarsExpr.} =
  ...   # plain Nim; the pragma also exports it to Polars</code></pre>
<p><b>Community:</b> nimpy (Python both ways), godot-nim, NimForUE, wrappers generated by Futhark from C headers.</p>""",
  "nanuq's Rust half is a ~286 MB static library (53 MB download). Interop is easy; distribution is the hard part. nanuqy is the experiment to drop it.")

nbRawHtml: station(consoles[5], """
<p>The compiler is a library and a platform: NimScript for build files, hot code reloading (each module a shared library,
globals survive reloads), and incremental compilation in Nim 2.4. cicak puts the last two together to try a real REPL:
each input becomes a module, loaded into a live process. Nimony, the next compiler, works on NIF, a text format for
the compiler's intermediate code that other tools can read and write.</p>""",
  "Hot code reloading is rough (main module not reloadable, leaks under ORC, tested only without threads); 2.4.0 shipped without a tool that IC needs. Nimony means a transition ahead.")

nbRawHtml: station(consoles[6], """
<p>Nim reads like Python: indentation, few symbols, type inference, uniform call syntax. It checks like Ada: distinct types,
range types, effects, exhaustive <code>case</code>. There is one main way to build. That makes it light to read, which
matters for humans maintaining code and for agents writing it: a strict compiler with clear errors is the best reviewer
an agent can get. Every experiment in the lab table was built with an agent, spec first, in a few days.</p>""",
  "Models have seen far less Nim than Python or Rust: they drift to old APIs and invent procs. Specs, tests and a fast compiler catch it, but the friction is real.")

nbRawHtml: station(consoles[7], """
<p>A language is its people. A web browser from scratch, e-ink photo frames, a kernel tutorial, a game on Steam,
an Ethereum client. And the whimsical: a wordoku you play by dragging tiles, a CAD drawn for one wall of one flat,
animated explainers, a notebook library that writes pages like this one.</p>""",
  "A small community with a short bench: when a key maintainer gets busy, a library stops. Package tooling (nimble, atlas) has been in flux.")

# ---------------------------------------------------------------- 6 approaches
nbRawHtml: """<h2><span class="t">T-05 · MISSION PROFILES</span>Seven ways to fly this talk</h2>"""

nbText: """
Same payload, different flight plans. Each one could carry the thesis; they differ in how much they demo, how personal
they are and how they answer "but is it really systems?". Times are for a 25-minute slot.
"""

proc mission(letter, title, meta, body, pros, cons: string, pick = false): string =
  let cls = if pick: "mission pick" else: "mission"
  &"""<div class="{cls}"><div class="patch">{letter}</div><h3>{title}</h3><div class="meta">{meta}</div>{body}<div class="pros">{pros}</div><div class="cons">{cons}</div></div>"""

nbRawHtml: """<div class="missions">""" &
  mission("A", "The go/no-go poll", "<em>recommended</em><em>25′ or 45′</em><em>demo: medium</em>",
    "<p>Open with the Freedom 7 checks. The flight director polls eight consoles (the ones above); each answers with a capability, " &
    "a community example, an example from the lab and a verdict: go, or go with a hold. Close with the holds summed up and \"all systems Nim\".</p>",
    "The same skeleton as the Paris talk (islands become consoles, rocks become holds), so the preparation carries over. Honest by design. Scales: drop consoles for 25′, add demos for 45′.",
    "Eight beats in 18 minutes is tight; each console gets about two. Needs a strong visual (the board) so it doesn't feel like a list.",
    pick = true) &
  mission("B", "From the pad to the payload", "<em>25′</em><em>demo: medium</em>",
    "<p>Climb the stack from the bottom: hardware and firmware, kernel, runtime and memory, compiler and macros, applications and GUIs, " &
    "the browser, and at the top the human (cognitive load). Each layer is one Nim project.</p>",
    "Answers \"is it systems?\" first, then earns the whimsy at the top. Easy for a systems audience to follow.",
    "Your own experiments are all near the top of the stack, so the low layers are other people's work only.") &
  mission("C", "Mercury, Gemini, Apollo", "<em>45′</em><em>demo: high</em>",
    "<p>Three programs of growing ambition. Mercury: one-person flights, small whimsical tools (parloku, cadero). " &
    "Gemini: two-seat docking, interop (nanuq and Rust, nanuq-more and Python). Apollo: going far, the compiler as a platform (cicak, Nimony) and the community's kernels and browsers.</p>",
    "A strong arc with a climax. Lets the lab projects lead.",
    "Needs the 45′ slot. The space history can eat the time it decorates.") &
  mission("D", "Thinking in systems", "<em>25′</em><em>demo: low</em>",
    "<p>An essay talk. Meadows' elements, interconnections and purpose, applied to a language. Stocks and flows: libraries and contributors. " &
    "Feedback loops: low cognitive load → more experiments → more libraries, and agents as a new loop. Nim as the example throughout.</p>",
    "The most original take, and directly answers \"what is systems thinking?\". Nobody else in the room will give this talk.",
    "Little code for a room that wants code. Risky if the abstraction doesn't land.") &
  mission("E", "Mission log: four flights in four weeks", "<em>25′</em><em>demo: high</em>",
    "<p>A case-study talk. nanuq, cicak, cadero and parloku, each a short flight report: the goal, what Nim made easy, what broke, " &
    "what it says about Nim as a systems language. The agents and OpenSpec workflow as the ground crew.</p>",
    "Concrete and personal; the devroom asks for \"a cool project you built\". All the material exists.",
    "Reads as a portfolio. Weak on the low-level end, and the agent angle may dominate questions.") &
  mission("F", "One payload, many boosters", "<em>25′</em><em>demo: very high</em>",
    "<p>One small program (say, a wordoku solver) launched on every target live: C, C++, Objective-C, JavaScript in the browser, " &
    "a Python extension, a Playdate, WebAssembly through emscripten. Each launch shows one feature.</p>",
    "Memorable and visual. The backends are Nim's most distinctive trait among systems languages.",
    "Live demos at FOSDEM (with FOSDEM wifi) are a gamble. Shows breadth, less depth.") &
  mission("G", "Humans and agents in the loop", "<em>25′</em><em>demo: medium</em>",
    "<p>Nim as a language for agent-written code. Low cognitive load, a strict and fast compiler, macros that keep code short, " &
    "and what happened when the lab projects were built that way: what agents get right and wrong in Nim.</p>",
    "Very topical, with first-hand data.",
    "Divisive at FOSDEM; the language becomes a backdrop. Better as one console (SURGEON) than as the whole talk.") &
  "</div>"

nbText: """
### Recommendation

Fly **A, the go/no-go poll**, and borrow from the others:

- the **opening** of D: the 1998 split and Meadows' definition, one slide each, to set up "what is a system";
- the **console demos** from E: lab projects as the second example on each console, after a community example;
- a **running gag** from F: the poll board itself is Nim compiled to JS, and a single slide shows the same file on four backends;
- the **agent angle** from G, but kept to one console (SURGEON), so it is a point and not the whole talk.

Ask for **25 minutes**. Eight consoles fit if each is two minutes, and the poll format makes cutting one easy on the day.
If you'd rather have 45, profile C (Mercury, Gemini, Apollo) is the one that uses the time best.
"""

nbText: """
### Flight plan for 25 minutes

| Phase | Min | Content |
|---|---|---|
| T-minus | 3 | Freedom 7 checks. What's a systems language: Ousterhout's split, Meadows' definition, Nim's "efficient, expressive, elegant". Thesis. |
| Poll: BOOSTER, EECOM | 4 | Bare metal (Fusion OS, Playdate). Memory: ORC and `=destroy`, nanuq owning Rust objects. |
| Poll: GUIDO, FIDO | 5 | Macros and compile time (the `poll` macro, nanuq's DSL). Four backends: cadero's plans and 3D viewer from one model. |
| Poll: RETRO, INCO | 5 | Interop: nanuq calls Rust, nanuq-more is loaded by Python. The compiler as a platform: cicak's REPL with HCR and IC. |
| Poll: SURGEON, CAPCOM | 4 | Cognitive load for humans and agents. The crew: Chawan, FrameOS, games, parloku. |
| Splashdown | 2 | The holds, summed up. Where to start, where the community is. "All systems Nim." |
| Q&A | 2 | |
"""

# ---------------------------------------------------------------- 7 proposal
nbRawHtml: """<h2><span class="t">T-04 · PAYLOAD</span>The proposal</h2>"""

nbText: """
Ready for the CfP form. The plain-text version below has the same words, for copy and paste.
The bio is a placeholder: adjust it to how you want to be introduced.
"""

const
  propTitle = "All Systems Nim"
  propSubtitle = "A go/no-go poll for a systems language with a low cognitive load"
  propAbstract = """"Cabin pressure go. Fuel system go. Oxygen go. All systems go." Before a launch, mission control polls every console, and each one answers go or no-go. This talk runs the same poll on Nim.

Nim is an open source systems language that compiles to C, C++, Objective-C and JavaScript. It reads like Python, frees memory with deterministic destructors, and has macros that run inside the compiler. People have written kernels, a web browser from scratch, e-ink display frameworks, firmware, GUIs, games and an Ethereum client in it. It is also a language where a whimsical idea becomes a working tool in a weekend, with a human or a coding agent at the keyboard.

We poll eight consoles, one capability each: bare metal, memory, metaprogramming, backends, interop, the compiler as a platform, cognitive load and the crew. Each answers with an example from the community and one from my recent experiments: a Polars dataframe library that calls Rust through its C ABI, Polars plugins written in Nim that Python loads, a REPL built on hot code reloading and incremental compilation, a furniture CAD with a 3D viewer in the browser, and a word puzzle game. Where Nim is not ready, we call a hold and say why.

Along the way we ask what makes a language a systems language, and why a low cognitive load is a systems property, for humans and agents alike."""
  propDescription = """No Nim knowledge is needed: the examples read like Python. The talk is for people who build systems in any language and want to know what is different about Nim, and for Nim users looking for arguments.

Outline (25 minutes):
1. T-minus (3 min): the Freedom 7 checks; what is a systems language, from Ousterhout's 1998 split between system and scripting languages to Nim's aim of being efficient, expressive and elegant.
2. The poll (18 min): eight consoles, each a capability with a community example, an example of mine and a verdict.
   - Bare metal: compiling through C, no runtime; kernels, microcontrollers, a handheld console.
   - Memory: ORC, move semantics and destructors; a Nim library owning objects on the Rust heap.
   - Metaprogramming: templates, macros and compile-time code; DSLs for dataframes and GUIs.
   - Backends: one model drawn natively and in the browser.
   - Interop: calling Rust through the C ABI; Nim plugins loaded by Python Polars.
   - The compiler as a platform: hot code reloading and incremental compilation for a REPL; the next compiler, Nimony.
   - Cognitive load: why it matters for people, and for coding agents.
   - The crew: a browser from scratch, e-ink frames, games, and some whimsy.
3. Splashdown (2 min): the holds (ecosystem size, tooling, a compiler transition), and where to start.

Every example links to an open source repository and to a notebook page that explains it."""
  propBio = """Pietro Peterlongo is a mathematician and data scientist at AgileLab, maintainer of nimib (literate programming notebooks in Nim) and a long-time organizer of the Nim devroom at FOSDEM. He organizes Python Milan and PyData Milan, and builds odd and useful things in Nim."""

nbRawHtml: &"""
<div class="form">
<div class="row"><div class="lab">Title</div><div class="val"><div class="title">{propTitle}</div></div></div>
<div class="row"><div class="lab">Subtitle</div><div class="val">{propSubtitle}</div></div>
<div class="row"><div class="lab">Track</div><div class="val">Open Source Systems Languages</div></div>
<div class="row"><div class="lab">Duration</div><div class="val">25 minutes</div></div>
<div class="row"><div class="lab">Abstract</div><div class="val"><p>{propAbstract.replace("\n\n", "</p><p>")}</p></div></div>
<div class="row"><div class="lab">Description</div><div class="val"><p>{propDescription.replace("\n\n", "</p><p>").replace("\n", "<br>")}</p></div></div>
<div class="row"><div class="lab">Speaker bio</div><div class="val"><p>{propBio}</p></div></div>
</div>
"""

let proposalPlain = &"""TITLE
{propTitle}: {propSubtitle}

TRACK
Open Source Systems Languages (25 minutes)

ABSTRACT
{propAbstract}

DESCRIPTION
{propDescription}

SPEAKER BIO
{propBio}
"""
# also written next to the page, for copy and paste
writeFile(currentSourcePath().parentDir / "proposal.txt", proposalPlain)

nbRawHtml: """<details><summary>PLAIN TEXT FOR THE CFP FORM</summary>""" &
  """<button class="copy" id="copy">Copy to clipboard</button>""" &
  """<pre class="plain" id="plain">""" & proposalPlain.multiReplace(("&", "&amp;"), ("<", "&lt;"), (">", "&gt;")) &
  """</pre></details>"""

nbText: """
#### Other titles, if the pun is too much

- All Systems Nim: from kernels to wordokus
- All Systems Nim: low cognitive load, high ceiling
- Go/No-Go: polling Nim as a systems language
"""

# ---------------------------------------------------------------- 8 abort modes
nbRawHtml: """<h2><span class="t">T-03 · ABORT MODES</span>Risks and open questions</h2>"""

nbText: """
- **Deadline.** The CfP closes on 23 November, three days before the Paris talk. Submit the proposal first; the slides
  can reuse the Paris machinery (nimiSlides, OpenSpec talk schema, explainers) after Paris.
- **"Is it systems?"** The whimsical projects are the most fun and the least low-level. Keep the order: credentials first
  (BOOSTER, EECOM), whimsy last (CAPCOM).
- **The agent angle** is the most likely to start an argument at FOSDEM. Keep it a point about cognitive load, with your own
  data, and avoid predictions.
- **Overlap with Paris.** Some examples (the success stories, nimib) are shared. The audience is different, and the focus
  moves from data to systems, so a little overlap is fine; reuse the explainers.
- **Facts to check** before slides: the exact Freedom 7 wording (Spacelog transcript), the community project claims in the table (all from memory),
  and nanuq's numbers on the day.
- **Demo budget.** No live builds on stage. Recorded demos or pages that already run in the browser (parloku, cadero's viewer,
  this board) are safe.
"""

# ---------------------------------------------------------------- 9 sources
nbRawHtml: """<h2><span class="t">T-02 · REFERENCES</span>Sources</h2>"""

nbText: """
- FOSDEM 2027: [accepted developer rooms](https://fosdem.org/2027/news/accepted-developer-rooms/) and the
  [Open Source Systems Languages devroom page](https://mikeshah.github.io/fosdem27-ossl-devroom/).
- [FOSDEM devrooms 2024 to 2027 compared](https://pietroppeter.github.io/claude-artifacts/fosdem-devrooms/), an earlier page in this repository.
- [Sailing Seas of Scientific Nim](https://github.com/pietroppeter/talk-sailing-seas-scientific-nim): abstract, outline and explainers.
- The lab: [nanuq](https://github.com/pietroppeter/nanuq), [nanuq-more](https://github.com/pietroppeter/nanuq-more),
  [cicak](https://github.com/pietroppeter/cicak), [cadero](https://github.com/pietroppeter/cadero),
  [parloku](https://github.com/pietroppeter/parloku), [zogyn](https://github.com/pietroppeter/zogyn).
- John K. Ousterhout, "Scripting: Higher Level Programming for the 21st Century", *IEEE Computer*, March 1998.
- Donella H. Meadows, *Thinking in Systems: A Primer*, 2008.
- [Writing an OS in Nim](https://0xc0ffee.netlify.app/osdev/01-intro) (Fusion OS).
"""

nbRawHtml: """<p class="small" style="margin-top:30px">Countdown complete. <span class="allgo" style="color:var(--ink)">All systems Nim.</span></p>"""

# ---------------------------------------------------------------- the board, in Nim compiled to JS
nbJsFromCode:
  import std/[dom, math]

  let lamps = document.querySelectorAll(".lamp")
  let callout = document.getElementById("callout")
  var running = false

  proc say(html: string) = callout.innerHTML = html.cstring

  proc reset() =
    for i in 0 ..< lamps.len:
      lamps[i].classList.remove("go")
      lamps[i].classList.remove("hold")
      lamps[i].classList.remove("live")

  proc step(i: int) =
    if i > 0: lamps[i - 1].classList.remove("live")
    if i >= lamps.len:
      say("<span class=\"k\">FLIGHT:</span> All consoles report go.<br><span class=\"allgo\">All systems Nim.</span>")
      running = false
      return
    let lamp = lamps[i]
    lamp.classList.add("live")
    lamp.classList.add("go")
    say("<span class=\"k\">" & $lamp.getAttribute("data-code") & ":</span> " & $lamp.getAttribute("data-call") & " <b>Go.</b>")
    discard setTimeout(proc () = step(i + 1), 1300)

  document.getElementById("poll").addEventListener("click", proc (e: Event) =
    if running: return
    running = true
    reset()
    say("<span class=\"k\">FLIGHT:</span> All consoles, go/no-go for launch.")
    discard setTimeout(proc () = step(0), 900))

  # consoles that answer "go, with a hold" (see the holds in the console section)
  const holdCodes = ["EECOM", "FIDO", "RETRO", "INCO", "SURGEON", "CAPCOM"]
  document.getElementById("holds").addEventListener("click", proc (e: Event) =
    if running: return
    reset()
    for i in 0 ..< lamps.len:
      let code = $lamps[i].getAttribute("data-code")
      if code in holdCodes: lamps[i].classList.add("hold")
      else: lamps[i].classList.add("go")
    say("<span class=\"k\">FLIGHT:</span> Amber is go, with a hold: it works, with a caveat the talk names. Green is clean go."))

  # days left to the CfP deadline, 23 November 2026
  proc msNow(): float {.importjs: "Date.now()".}
  proc msUtc(y, m, d: int): float {.importjs: "Date.UTC(#, #, #)".}   # month from 0
  let days = int(floor((msUtc(2026, 10, 24) - msNow()) / 86_400_000.0))
  let tm = document.getElementById("tminus")
  if days >= 0: tm.innerHTML = cstring("T-MINUS <b>" & $days & "</b> DAYS TO CFP CLOSE")
  else: tm.innerHTML = cstring("CFP CLOSED · <b>T+" & $(-days) & "</b> DAYS")

  document.getElementById("copy").addEventListener("click", proc (e: Event) =
    let txt = document.getElementById("plain").textContent
    {.emit: "navigator.clipboard.writeText(`txt`);".}
    document.getElementById("copy").textContent = "Copied")

nbSave
