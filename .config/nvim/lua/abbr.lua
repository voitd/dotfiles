local cmd = vim.cmd

local abbreviations = {
  Wq = 'wq!',
  wq = 'wq!',
  WQ = 'wq!',
  Wqa = 'wqa!',
  Wa = 'wa!',
  wa = 'wa!',
  wA = 'wa!',
  W = 'w!',
  w = 'w!',
  Q = 'q!',
  q = 'q!',
  Qa = 'qa!',
  qa = 'qa!',
  wrap = 'set wrap',
  nowrap = 'set nowrap',
  E = 'e'
}

cmd('cabbrev q!! qwa!')

for left,right in pairs(abbreviations) do
  cmd(string.format('cnoreabbrev %s %s', left, right))
end
