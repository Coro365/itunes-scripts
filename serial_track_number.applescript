on run
  with timeout of (1 * 60 * 60) seconds
    tell application "iTunes"
      --Get selected item   
      set select_list to selection
      if 0 is (count of select_list) then
        display dialog "Not selected."
        return 0
      end if
      
      set track_n to text returned of (display dialog "Input start track number" default answer "1")
      
      if (length of track_n) is not 0 then
        set track_n to 1 as number
      end if
      set track_n to track_n as number
      
      repeat with select_item in select_list
        
        --Setting information
        set track number of select_item to track_n
        set track_n to track_n + 1 as number
      end repeat
      
    end tell
  end timeout
  display notification "track number setting complete" sound name "Purr"
  return 0
end run
