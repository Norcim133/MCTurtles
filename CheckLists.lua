function addToSet(set, key)
    set[key] = true
end

function removeFromSet(set, key)
    set[key] = nil
end

function setContains(set, key)
    print("Set", set)
    print("Key", key)
    return set[key] ~= nil
end

return {addToSet=addToSet, removeFromSet=removeFromSet, setContains=setContains}