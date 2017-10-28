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
        --display dialog select_item
        set old_comment to comment of select_item
        set old_name to name of select_item
        set new_comment to ""
        
        if (length of old_comment) is not 0 then
          if (count of findText(old_comment, "Original:") of me) is 0 then
            set new_comment to old_comment & "\tOriginal:" & old_name
          else
            --display dialog "setting completed\n" & old_name
          end if
        else
          set new_comment to "Original:" & old_name
        end if
        
        if (length of new_comment) is not 0 then
          set comment of select_item to new_comment
        end if
        
      end repeat
    end tell
  end timeout
  display notification "copied name to comment" sound name "Purr"
  return 0
end run


on findText(theText, serchStr)
  set tmp to AppleScript's text item delimiters
  set AppleScript's text item delimiters to serchStr
  set theText to every text item of theText
  set theList to {}
  set x to 0
  set delNum to number of serchStr
  repeat with curItem in theText
    set x to x + (number of curItem)
    set end of theList to x + 1
    set x to x + delNum
  end repeat
  set AppleScript's text item delimiters to tmp
  if (number of theList) = 1 then return {}
  return items 1 thru -2 of theList
end findText