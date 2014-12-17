package.path =  ((debug.getinfo(1).source):match('^@?(.-)/index.lua$') or '')..'../sailor/src/?.lua;'..package.path
require "sailor"
sailor.launch()
