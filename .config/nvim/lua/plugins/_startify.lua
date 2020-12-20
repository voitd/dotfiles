vim.g.ascii = {
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



vim.g.startify_custom_header = 'startify#center(g:ascii)' 


vim.g.startify_lists = {
       { type ='sessions',                    header = {'       Sessions' }           },
       { type ='files',                       header = {'       Files'    }           },
       { type ='bookmarks',                   header = {'       Bookmarks'}           },
       { type ='commands',                    header = {'       Commands' }           },
     }

       -- { type ='dir',                         header = {'       MRU in '. getcwd() }  },
vim.g.startify_commands = {
       { h = {'Check Vim health'       , ':checkhealth'    }},
       { i = {'Install PLugins'        , ':PackerInstall'  }},
       { u = {'Update Plugin'          , ':PackerUpdate'   }},
       { c = {'Clean Plugin'           , ':PackerClean'    }},
       { s = {'Sync Plugin'            , ':PackerSync'     }},
       }

vim.g.startify_bookmarks = {
            {v = '~/.config/nvim/init.lua'},
            {k = '~/.config/kitty/kitty.conf'},
            {f = '~/.config/fish/config.fish'},
            {g = '~/.gitconfig'},
            {a = '~/.aliases'},
            {t = '~/.tmux.conf'},
            {d = '~/dotfiles' },
            {p = '~/CodeHub/playgrounds/playground.js'},
            }

vim.g.startify_session_sort = 1 
vim.g.startify_change_to_dir = 1 
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 0
vim.g.startify_session_persistence = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_padding_left = 5
vim.g.webdevicons_enable_startify = 1
vim.g.startify_enable_special = 1
vim.g.startify_files_number = 5
vim.g.startify_update_oldfiles = 1
vim.g.startify_change_to_dir = 1
