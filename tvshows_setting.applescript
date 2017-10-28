on run
  with timeout of (1 * 60 * 60) seconds
    tell application "iTunes"
      --Get selected item   
      set select_list to selection
      if 0 is (count of select_list) then
        display dialog "Not selected."
        return 0
      end if
      
      set title to text returned of (display dialog "Input show name" default answer "")
      set season to text returned of (display dialog "Input season number" default answer "1")
      set epn to text returned of (display dialog "Input start episode number" default answer "1")
      
      if (length of epn) is not 0 then
        set epn to 1 as number
      end if
      set epn to epn as number
      
      repeat with select_item in select_list
        
        --Setting information
        set episode number of select_item to epn
        set comment of select_item to "edited by Script"
        
        if (length of title) is not 0 then
          set show of select_item to title
        end if
        
        if (length of season) is not 0 then
          set season number of select_item to season
        end if
        
        set epn to epn + 1 as number
      end repeat
      
      repeat with select_item in select_list
        set video kind of select_item to TV show
      end repeat
      
    end tell
  end timeout
  display notification "TV Shows setting complete" with title title sound name "Purr"
  return 0
end run
