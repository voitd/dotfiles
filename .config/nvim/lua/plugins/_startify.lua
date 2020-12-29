local g, cmd = vim.g, vim.cmd


g.ascii = {
  '                                                                  ',                                                               
  '                                                                  ',                                                               
  '                                                                  ',                                                               
  '                                                                  ',                                                               
  '                                                                  ',                                                              
  '  _|      _|  _|_|_|_|    _|_|    _|      _|  _|_|_|  _|      _|  ',
  '  _|_|    _|  _|        _|    _|  _|      _|    _|    _|_|  _|_|  ',
  '  _|  _|  _|  _|_|_|    _|    _|  _|      _|    _|    _|  _|  _|  ',
  '  _|    _|_|  _|        _|    _|    _|  _|      _|    _|      _|  ',
  '  _|      _|  _|_|_|_|    _|_|        _|      _|_|_|  _|      _|  ',
  '                                                                  ',                                                              
  '                                                                  ',                                                               
  '                                                                  ',                                                               
  '                                                                  ',                                                               
  '                                                                  ',                                                             
}



g.startify_custom_header = 'startify#center(g:ascii)'


g.startify_lists = {
   { type ='sessions',                    header = {'       Sessions' }           },
   { type ='files',                       header = {'       Files'    }           },
   { type ='bookmarks',                   header = {'       Bookmarks'}           },
   { type ='commands',                    header = {'       Commands' }           },
 }

   -- { type ='dir',                         header = {'       MRU in '. getcwd() }  },
g.startify_commands = {
   { h = {'Check Vim health'       , ':checkhealth'    }},
   { i = {'Install PLugins'        , ':PackerInstall'  }},
   { u = {'Update Plugin'          , ':PackerUpdate'   }},
   { c = {'Clean Plugin'           , ':PackerClean'    }},
   { s = {'Sync Plugin'            , ':PackerSync'     }},
   }

g.startify_bookmarks = {
        {v = '~/.config/nvim/init.lua'},
        {k = '~/.config/kitty/kitty.conf'},
        {f = '~/.config/fish/config.fish'},
        {g = '~/.gitconfig'},
        {a = '~/.aliases'},
        {t = '~/.tmux.conf'},
        {d = '~/dotfiles' },
        {p = '~/CodeHub/playgrounds/playground.js'},
        }

g.startify_session_sort = 1
g.startify_change_to_dir = 1
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 0
g.startify_session_persistence = 1
g.startify_change_to_vcs_root = 1
g.startify_padding_left = 5
g.webdevicons_enable_startify = 1
g.startify_enable_special = 1
g.startify_files_number = 5
g.startify_update_oldfiles = 1
g.startify_change_to_dir = 1

