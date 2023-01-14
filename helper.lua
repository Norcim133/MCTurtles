function initializeState()
    local state = {
        x = 0,
        y = 0,
        z = 0,
        facing = "north",
    }
    return state
end

function getState()
  local file = io.open( "TurtleState", "r" )
  local contents = file:read( "*a" )
  file:close()
  if contents then
      state = textutils.unserialize( contents )
      return state
  end
end

function setState(state)
  local file = io.open( "TurtleState", "w" )
  file:write( textutils.serialize( state ) )
  file:close( )
end

function GetChildren()

end

state = initializeState()
setState(state)

