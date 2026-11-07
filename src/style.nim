## Page CSS, inlined in place of nimib's default theme.
## Theme: a 1961 mission control flight plan. Paper of a flight manual,
## condensed stencil-like headings, a console with GO lamps.
const pageStyle* = """
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;600;700&family=IBM+Plex+Sans:ital,wght@0,400;0,600;1,400&family=IBM+Plex+Mono:wght@400;600&display=swap" rel="stylesheet">
<style>
:root{
  --paper:#f2ecdc; --card:#fbf8ef; --ink:#15191f; --muted:#5f5a4e; --line:#d8cfb8;
  --nim:#ffe953; --go:#2f9e55; --go-glow:#7dffa6; --hold:#e39b2d; --nogo:#c8372d;
  --console:#1a2027; --console2:#232b34; --phos:#d6efd8; --steel:#8b97a3;
}
*{box-sizing:border-box}
[hidden]{display:none!important}
:root{padding:env(safe-area-inset-top,0) env(safe-area-inset-right,0) env(safe-area-inset-bottom,0) env(safe-area-inset-left,0)}
html{background:var(--paper);-webkit-text-size-adjust:100%;text-size-adjust:100%}
body{margin:0 auto;max-width:800px;padding:0 18px 60px;color:var(--ink);
  font:17px/1.62 "IBM Plex Sans",system-ui,sans-serif;background:var(--paper)}
header,footer .nb-box{display:flex;justify-content:space-between;align-items:center;gap:12px;
  font:12px "IBM Plex Mono",monospace;letter-spacing:.06em;text-transform:uppercase;color:var(--muted);padding:14px 0}
header{border-bottom:3px double var(--ink)} footer .nb-box{border-top:3px double var(--ink);margin-top:44px}
header a, footer a{color:var(--muted)}
h1,h2,h3{font-family:Oswald,"Arial Narrow",sans-serif;line-height:1.08;text-transform:uppercase;letter-spacing:.01em}
h1{font-size:clamp(46px,11vw,92px);font-weight:700;margin:30px 0 4px;letter-spacing:-.005em}
h1 .nim{background:var(--nim);padding:0 .12em;border:3px solid var(--ink);box-shadow:5px 5px 0 var(--ink);display:inline-block;transform:rotate(-1.5deg)}
h2{font-size:34px;font-weight:600;margin:60px 0 12px;padding-top:16px;border-top:3px solid var(--ink)}
h2 .t{font:600 13px "IBM Plex Mono",monospace;color:var(--nogo);display:block;margin-bottom:8px;letter-spacing:.12em}
h3{font-size:22px;font-weight:600;margin:30px 0 6px}
a{color:#1f5f8b;text-decoration-thickness:1px;text-underline-offset:3px}
p code, li code, td code{font:14px "IBM Plex Mono",monospace;background:#e8e0ca;padding:1px 5px;border-radius:3px}
.lede{font-size:20px;line-height:1.5;color:#2c2a24}
.stamp{display:inline-block;font:600 12px "IBM Plex Mono",monospace;letter-spacing:.14em;color:var(--nogo);
  border:2px solid var(--nogo);padding:2px 8px;transform:rotate(-2deg);margin:8px 0}
blockquote{margin:18px 0;padding:8px 18px;border-left:6px solid var(--nim);background:var(--card);color:#2c2a24}
pre{margin:14px 0;overflow-x:auto}
body pre > code, pre code{display:block;padding:14px 16px;font:12.8px/1.55 "IBM Plex Mono",monospace;background:var(--card);
  border:1px solid var(--line);border-left:6px solid var(--ink);color:#22252a}
body pre.nb-output, body pre > samp, pre samp{display:block;padding:12px 16px;font:12.8px/1.5 "IBM Plex Mono",monospace;background:var(--console);
  color:var(--phos);white-space:pre;border-left:6px solid var(--go)}
.hljs-keyword{color:#8a1f7a;font-weight:600}.hljs-type,.hljs-built_in{color:#9a5b00}.hljs-string{color:#2d7a3a}
.hljs-number,.hljs-literal{color:#9a5b00}.hljs-comment{color:#8c8676;font-style:italic}.hljs-meta{color:#1f5f8b}
table{border-collapse:collapse;width:100%;margin:16px 0;font-size:14.5px;line-height:1.45}
th{font:600 12px "IBM Plex Mono",monospace;letter-spacing:.08em;text-transform:uppercase;text-align:left;
  border-bottom:2px solid var(--ink);padding:6px 8px}
td{border-bottom:1px solid var(--line);padding:7px 8px;vertical-align:top}
details{margin:14px 0;border:1px dashed #bfb497;padding:4px 14px;background:var(--card)}
details summary{cursor:pointer;font:600 13px "IBM Plex Mono",monospace;color:var(--muted);padding:6px 0;letter-spacing:.04em}

/* transcript card */
.transcript{background:var(--card);border:2px solid var(--ink);padding:16px 20px;margin:22px 0;
  font:15px/1.7 "IBM Plex Mono",monospace;box-shadow:5px 5px 0 var(--ink)}
.transcript .who{display:inline-block;min-width:110px;color:var(--muted)}
.transcript .src{font-size:12px;color:var(--muted);margin-top:8px;border-top:1px dashed var(--line);padding-top:6px}

/* the console */
.console{background:var(--console);border-radius:6px;padding:16px;margin:22px 0;color:var(--phos);
  border:3px solid #0e1216;box-shadow:inset 0 0 0 2px var(--console2),6px 6px 0 var(--ink)}
.console .bar{display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:8px;
  font:600 11px "IBM Plex Mono",monospace;letter-spacing:.14em;color:var(--steel);margin-bottom:12px}
.lamps{display:grid;grid-template-columns:repeat(4,1fr);gap:10px}
@media (max-width:620px){.lamps{grid-template-columns:repeat(2,1fr)}}
.lamp{background:var(--console2);border:1px solid #39434e;border-radius:4px;padding:10px 10px 9px;display:grid;
  grid-template-columns:22px 1fr;gap:2px 10px;align-items:center;transition:background .3s}
.lamp i{grid-row:span 2;width:20px;height:20px;border-radius:50%;background:#2f3a33;border:2px solid #0e1216;transition:all .25s}
.lamp b{font:600 13px "IBM Plex Mono",monospace;letter-spacing:.1em;color:#e9eef2}
.lamp span{font:12px "IBM Plex Sans",sans-serif;color:var(--steel)}
.lamp.go i{background:var(--go-glow);box-shadow:0 0 10px 2px rgba(125,255,166,.65)}
.lamp.go{background:#20302a}
.lamp.hold i{background:var(--hold);box-shadow:0 0 10px 2px rgba(227,155,45,.6)}
.lamp.live{outline:2px solid var(--nim)}
.callout{margin-top:12px;min-height:3.4em;font:14px/1.55 "IBM Plex Mono",monospace;color:var(--phos);
  border-top:1px solid #39434e;padding-top:10px}
.callout .k{color:var(--nim)}
.console button{font:600 12px "IBM Plex Mono",monospace;letter-spacing:.1em;text-transform:uppercase;cursor:pointer;
  background:var(--nim);color:var(--ink);border:2px solid #0e1216;border-radius:3px;padding:6px 12px;box-shadow:2px 2px 0 #000}
.console button.alt{background:var(--console2);color:var(--phos);border-color:#39434e}
.console button:active{transform:translate(2px,2px);box-shadow:none}
.allgo{font:700 22px Oswald,sans-serif;letter-spacing:.06em;color:var(--nim);text-transform:uppercase}

/* countdown */
.tminus{font:600 13px "IBM Plex Mono",monospace;letter-spacing:.1em;color:var(--steel)}
.tminus b{color:var(--nim);font-size:15px}

/* fact sheet */
.facts{display:grid;grid-template-columns:repeat(2,1fr);gap:0;border:2px solid var(--ink);background:var(--card);margin:18px 0}
@media (max-width:620px){.facts{grid-template-columns:1fr}}
.facts div{padding:8px 12px;border-bottom:1px solid var(--line);border-right:1px solid var(--line)}
.facts div b{display:block;font:600 11px "IBM Plex Mono",monospace;letter-spacing:.1em;color:var(--muted);text-transform:uppercase}

/* consoles section */
.station{border:2px solid var(--ink);background:var(--card);margin:22px 0;box-shadow:5px 5px 0 var(--ink)}
.station .hd{display:flex;align-items:center;gap:12px;background:var(--ink);color:#f2ecdc;padding:8px 14px}
.station .hd i{width:16px;height:16px;border-radius:50%;background:var(--go-glow);box-shadow:0 0 8px rgba(125,255,166,.7);flex:none}
.station .hd b{font:600 14px "IBM Plex Mono",monospace;letter-spacing:.12em}
.station .hd span{font:600 18px Oswald,sans-serif;text-transform:uppercase;letter-spacing:.03em}
.station .bd{padding:6px 16px 10px}
.station .bd p{margin:8px 0}
.station .hold{border-top:1px dashed var(--line);margin-top:8px;padding-top:6px;font-size:15px}
.station .hold::before{content:"HOLD";font:600 11px "IBM Plex Mono",monospace;letter-spacing:.12em;color:#fff;background:var(--hold);
  padding:1px 6px;margin-right:8px;border-radius:2px}

/* mission profiles */
.missions{display:grid;grid-template-columns:1fr;gap:16px;margin:18px 0}
.mission{border:2px solid var(--ink);background:var(--card);padding:12px 16px 10px;position:relative}
.mission.pick{box-shadow:6px 6px 0 var(--go);border-color:var(--go)}
.mission .patch{position:absolute;right:14px;top:12px;width:46px;height:46px;border-radius:50%;border:3px solid var(--ink);
  display:grid;place-items:center;font:700 22px Oswald,sans-serif;background:var(--nim)}
.mission h3{margin:2px 64px 4px 0}
.mission .meta{font:12px "IBM Plex Mono",monospace;color:var(--muted);letter-spacing:.04em;margin-bottom:6px}
.mission .meta em{font-style:normal;color:var(--ink);background:#e8e0ca;padding:0 4px;margin-right:4px}
.mission ul{margin:6px 0;padding-left:20px}
.mission .pros::before{content:"GO  ";font:600 12px "IBM Plex Mono",monospace;color:var(--go)}
.mission .cons::before{content:"HOLD  ";font:600 12px "IBM Plex Mono",monospace;color:var(--hold)}
.mission .pros,.mission .cons{margin:4px 0;font-size:15.5px}

/* proposal form */
.form{border:2px solid var(--ink);background:#fffdf6;margin:22px 0}
.form .row{display:grid;grid-template-columns:150px 1fr;border-bottom:1px solid var(--line)}
@media (max-width:620px){.form .row{grid-template-columns:1fr}}
.form .row:last-child{border-bottom:0}
.form .lab{font:600 11px "IBM Plex Mono",monospace;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);
  padding:10px 12px;border-right:1px solid var(--line);background:#f6f0e0}
.form .val{padding:10px 14px}
.form .val p{margin:0 0 10px}
.form .val p:last-child{margin-bottom:0}
.form .val ol{margin:0;padding-left:20px}
.form .title{font:600 24px Oswald,sans-serif;text-transform:uppercase;line-height:1.15}
.copy{font:600 12px "IBM Plex Mono",monospace;letter-spacing:.06em;border:2px solid var(--ink);background:var(--nim);
  padding:5px 12px;cursor:pointer;box-shadow:2px 2px 0 var(--ink);margin:4px 0}
.copy:active{transform:translate(2px,2px);box-shadow:none}
pre.plain{white-space:pre-wrap;font:13.5px/1.55 "IBM Plex Mono",monospace;background:var(--card);border:1px solid var(--line);padding:14px 16px}
.small{font-size:14px;color:var(--muted)}
#source{display:none}
footer button{font:600 12px "IBM Plex Mono",monospace;border:1.5px solid var(--ink);background:var(--card);padding:4px 12px;cursor:pointer}
</style>
"""
