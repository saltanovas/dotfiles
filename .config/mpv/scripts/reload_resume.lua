local mp = require "mp"

local function reload_resume()
    local position = mp.get_property_number("time-pos", 0)
    local was_paused = mp.get_property_native("pause")

    mp.osd_message("Reloading stream…")

    local function resume()
        mp.unregister_event(resume)
        mp.commandv("seek", position, "absolute+exact")
        mp.set_property_native("pause", was_paused)
        mp.osd_message("Stream reloaded")
    end

    mp.register_event("file-loaded", resume)
    mp.commandv("playlist-play-index", "current")
end

mp.add_key_binding(nil, "reload-resume", reload_resume)