# Dependencies from deps.sh (ALL_SYSTEMS_NIM_DEPS, default ./deps).
import std/os
let deps = getEnv("ALL_SYSTEMS_NIM_DEPS", thisDir().parentDir / "deps")
for d in ["nimib", "fusion", "markdown", "parsetoml", "jsony"]:
  switch("path", deps / d / "src")
switch("hints", "off")
