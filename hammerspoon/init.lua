-- ctrl alone becomes esc, from: https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1
-- top row with shift becomes symbols behind numbers

send_escape = false
last_mods = {}

control_key_handler = function()
  send_escape = false
end

control_key_timer = hs.timer.delayed.new(1, control_key_handler)

control_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["ctrl"] == new_mods["ctrl"] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    last_mods = new_mods
    control_key_timer:stop()
    if send_escape then
      return true, {
        hs.eventtap.event.newKeyEvent({}, 'escape', true),
        hs.eventtap.event.newKeyEvent({}, 'escape', false),
      }
    end
  end
  return false
end

control_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, control_handler)
control_tap:start()

VORTEX_ID = 40 -- magical ID
toprow = "pqwertyuiop"
toprow_ix = 1
toprow_send = false
toprow_timer_handler = function()
  local letter = toprow:sub(toprow_ix, toprow_ix)
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, true):post()
  hs.eventtap.event.newKeyEvent(letter, true):post()
  hs.eventtap.event.newKeyEvent(letter, false):post()
  hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, false):post()
  toprow_send = false
end
toprow_timer = hs.timer.delayed.new(0.15, toprow_timer_handler)

keydown_handler = function(evt)
  -- cancel escape
  send_escape = false

  -- print(evt:getProperty(hs.eventtap.event.properties.keyboardEventKeyboardType))

  local is_shift = evt:getFlags():containExactly({"shift"})
  local ix = string.find(toprow, hs.keycodes.map[evt:getKeyCode()], 0, true)
  local is_vortex = evt:getProperty(hs.eventtap.event.properties.keyboardEventKeyboardType) == VORTEX_ID
  local not_repeat = evt:getProperty(hs.eventtap.event.properties.keyboardEventAutorepeat)==0
  if is_shift and ix and is_vortex and not_repeat then
    toprow_ix = ix
    toprow_send = true
    toprow_timer:start()
    return true
  end
  return false
end

keydown_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, keydown_handler)
keydown_tap:start()

keyup_handler = function(evt)
  local mods = evt:getFlags()
  local ix = string.find(toprow, hs.keycodes.map[evt:getKeyCode()], 0, true)
  local is_vortex = evt:getProperty(hs.eventtap.event.properties.keyboardEventKeyboardType) == VORTEX_ID
  if mods["shift"] and ix and is_vortex and toprow_send then
    toprow_timer:stop()
    return true, {
      hs.eventtap.event.newKeyEvent({"shift"}, tostring(ix-1), true),
      hs.eventtap.event.newKeyEvent({"shift"}, tostring(ix-1), false),
    }
  end
  return false
end

keyup_tap = hs.eventtap.new({hs.eventtap.event.types.keyUp}, keyup_handler)
keyup_tap:start()
