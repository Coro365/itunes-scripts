--select item name: 宝石の国,OP

--output item infos
--show: 宝石の国
--genre: AnimeOP
--item name: 宝石の国 OP
--video kind: TV Show

on run
  with timeout of (1 * 60 * 60) seconds
    tell application "iTunes"
      --Get selected item   
      set select_list to selection
      if 0 is (count of select_list) then
        display dialog "Not selected."
        return 0
      end if
      
      repeat with select_item in select_list
        
        set item_name to name of select_item
        set item_name to devText(item_name, ",") of me
        
        set show_name to item 1 of item_name
        set oped_kind to item 2 of item_name
        set item_genre to "Anime" & text 1 thru 2 of oped_kind
        set item_name to show_name & " " & oped_kind
        
        --Setting information
        set show of select_item to show_name
        set genre of select_item to item_genre
        set name of select_item to item_name
        
        set comment of select_item to "edited by Script"
        
      end repeat
      
      repeat with select_item in select_list
        set video kind of select_item to TV show
      end repeat
      
    end tell
  end timeout
  display notification "OPED setting complete" sound name "Purr"
  return 0
end run

on devText(theText, aDelimiter)
  --http://tonbi.jp/AppleScript/Tips/String/FindReplace.html
  set tmp to AppleScript's text item delimiters
  set AppleScript's text item delimiters to aDelimiter
  set theList to every text item of theText
  set AppleScript's text item delimiters to tmp
  return theList
end devText