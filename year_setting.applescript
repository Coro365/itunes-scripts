on run
  with timeout of (1 * 60 * 60) seconds
    tell application "iTunes"
      --Get selected item   
      set select_list to selection
      if 0 is (count of select_list) then
        display dialog "Not selected."
        return 0
      end if
      
      set input_year to text returned of (display dialog "Input input_year" default answer "")
      if length of input_year is not 4 then
        display dialog "input error." & input_year
        return 0
      end if
      set input_year to input_year as number
      
      repeat with select_item in select_list
        
        --Setting information
        set year of select_item to input_year
        set comment of select_item to "edited by Script"
        
      end repeat
      
    end tell
  end timeout
  display notification "Year setting complete" sound name "Purr"
  return 0
end run
