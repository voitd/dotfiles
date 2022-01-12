local cmd = vim.cmd

local abbreviations = {
  Wq = "wq!",
  wq = "wq!",
  WQ = "wq!",
  Wqa = "wqa!",
  Wa = "wa!",
  wa = "wa!",
  wA = "wa!",
  W = "w!",
  w = "w!",
  Q = "q!",
  q = "q!",
  Qa = "qa!",
  qa = "qa!",
  wrap = "set wrap",
  nowrap = "set nowrap",
  spell = "set spell",
  nospell = "set nospell",
  E = "e"
}

cmd "cabbrev q!! qwa!"
cmd "cabbrev bgl :set backgroud=light"
cmd "cabbrev bgd :set backgroud=dark"

for left, right in pairs(abbreviations) do
  cmd(string.format("cnoreabbrev %s %s", left, right))
end
