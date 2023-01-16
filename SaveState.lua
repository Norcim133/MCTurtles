function initializeState()
    local state = {
        x = 0,
        y = 0,
        z = 0,
        facing = "north",
    }
    return state
end

function serialize(data)
    serialData = textutils.serialize(data)
    return serialData
end

function unserialize(data)
    local unserializedData = textutils.unserialize( contents )
    return unserializedData
end

function getState()
  local file = io.open( "TurtleState", "r" )
  local contents = file:read( "*a" )
  file:close()
  if contents then
      local success, result = pcall(unserialize, contents)
      if success then
          return result
      else
         return "placeholder"
      end
  end
end

function setState(state)
  local file = io.open( "TurtleState", "w" )
    local success, result =pcall(serialize, state)
    if success then
        file:write( result )
    else
        file:write("Placeholder")
    end

    file:close( )

end

function GetChildren()

end

state = initializeState()
setState(state)

