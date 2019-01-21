local discordRPC = require("discordRPC")
local appId = require("applicationId")
local utf8 = require("utf8")

function discordRPC.ready(userId, username, discriminator, avatar)
    print(string.format("Discord: ready (%s, %s, %s, %s)", userId, username, discriminator, avatar))
end

function discordRPC.disconnected(errorCode, message)
    print(string.format("Discord: disconnected (%d: %s)", errorCode, message))
end

function discordRPC.errored(errorCode, message)
    print(string.format("Discord: error (%d: %s)", errorCode, message))
end


function love.load()
	bold = love.graphics.setNewFont("SanFranciscoDisplay-Bold.ttf", 18)

	love.graphics.setBackgroundColor("255", "0", "0")
	image = love.graphics.newImage( "logowhite.png" )
	text = ""
	presence = {
	    largeImageKey = "ns",
        details = "Idle",
        smallImageKey = "nil"
    }
	discordRPC.initialize(appId, true)
	discordRPC.updatePresence(presence)
end

function love.textinput(t)
	text = text .. t
	presence.details = text
	if presence.details == "Super Smash Bros Ultimate" then
		presence.smallImageKey = "smash"
	elseif presence.details == "Fortnite" then
	    presence.smallImageKey = "fn"
	elseif presence.details == "Minecraft" then
	    presence.smallImageKey = "mc"
	elseif presence.details == "Splatoon 2" then
		presence.smallImageKey = "splatoon_2"
	elseif presence.details == "YouTube" then
		presence.smallImageKey = "yt"
	elseif presence.details == "Undertale" then
	    presence.smallImageKey = "undertale"
    elseif presence.details == "Super Mario Odyssey" then
    	presence.smallImageKey = "super_mario_odyssey"
	else
	    presence.smallImageKey = "nil"
	end

	discordRPC.updatePresence(presence)
end

function love.keypressed(key)
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text, -1)
 
        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            text = string.sub(text, 1, byteoffset - 1)
        end

    	if presence.details == "Super Smash Bros Ultimate" then
			presence.smallImageKey = "smash"
		elseif presence.details == "Fortnite" then
		    presence.smallImageKey = "fn"
		elseif presence.details == "Minecraft" then
		    presence.smallImageKey = "mc"
		elseif presence.details == "Splatoon 2" then
			presence.smallImageKey = "splatoon_2"
		elseif presence.details == "YouTube" then
			presence.smallImageKey = "yt"
		elseif presence.details == "Undertale" then
		    presence.smallImageKey = "undertale"
	    elseif presence.details == "Super Mario Odyssey" then
	    	presence.smallImageKey = "super_mario_odyssey"
		else
		    presence.smallImageKey = "nil"
		end
    	presence.details = text
		discordRPC.updatePresence(presence)
    end

    if key == "escape" then
    	love.event.quit()
    end
end

function love.draw()
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print("SwitchPresence", "90", "20")
	love.graphics.draw(image, "55", "50", "0", "0.5", "0.5")
	love.graphics.setColor( 0, 255, 0 )
	love.graphics.print("Type away!", "50", "280")
	love.graphics.print(">", "30", "300")
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.printf(displaytext, 50, 300, love.graphics.getWidth())
	-- love.graphics.rectangle("fill", 280, 50, 200, 250)
end

function love.update(dt)
	displaytext = text .. "|"
end

function love.quit()
	print("Quit called")
	discordRPC.shutdown()
end