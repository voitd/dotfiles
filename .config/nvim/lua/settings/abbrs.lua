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
  E = 'e',
  bd = 'BufferClose',
  bo = 'BufferCloseAllButCurrent'
}

cmd('cabbrev q!! qwa!')

for left,right in pairs(abbreviations) do
  cmd(string.format('cnoreabbrev %s %s', left, right))
end

cmd 'iab con const =<Left><Left>'
cmd 'iab rt return'
cmd 'iab aw await'
cmd 'iab as async'
cmd 'iab rt return'



