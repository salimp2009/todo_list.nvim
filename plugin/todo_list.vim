" Title:        TODO List Plugin
" Description:  A plugin to learn for creating Neovim plugins.
" Last Change:  
" Maintainer:   Salim Pamukcu <https://github.com/salimp2009>


" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_todolist")
    finish
endif
let g:loaded_todolist = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/todo_list/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 FetchTodos lua require("todo_list").fetch_todos()
command! -nargs=0 InsertTodo lua require("todo_list").insert_todo()
command! -nargs=0 CompleteTodo lua require("todo_list").complete_todo()
