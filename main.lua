local discordRPC = require("discordRPC")
local appId = require("applicationId")

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
	game = "None"

	smash = {
	    largeImageKey = "ns",
	    smallImageKey = "smash",
	    smallImageText = "Super Smash Bros Ultimate",
        details = "Super Smash Bros Ultimate"
    }
   	splatoon = {
	    largeImageKey = "ns",
	    smallImageKey = "splatoon_2",
	    smallImageText = "Splatoon 2",
        details = "Splatoon 2"
    }
	odyssey = {
	    largeImageKey = "ns",
	    smallImageKey = "super_mario_odyssey",
	    smallImageText = "Super Mario Odyssey",
        details = "Super Mario Odyssey"
    }
	fortnite = {
	    largeImageKey = "ns",
	    smallImageKey = "fn",
	    smallImageText = "Fortnite",
        details = "Fortnite"
    }
	mk8d = {
	    largeImageKey = "ns",
	    smallImageKey = "mk8d",
	    smallImageText = "Mario Kart 8 Deluxe",
        details = "Mario Kart 8 Deluxe"
    }
	mc = {
	    largeImageKey = "ns",
	    smallImageKey = "mc",
	    smallImageText = "Minecraft",
        details = "Minecraft"
    }
	botw = {
	    largeImageKey = "ns",
	    smallImageKey = "botw",
	    smallImageText = "The Legend of Zelda: BoTW",
        details = "The Legend of Zelda: BoTW"
    }
	yt = {
	    largeImageKey = "ns",
	    smallImageKey = "yt",
	    smallImageText = "YouTube",
        details = "YouTube"
    }

	discordRPC.initialize(appId, true)
end



function love.draw()
	gamestr = [[ Playing: ]] .. game 
	love.graphics.setNewFont("PRESSSTART2P.TTF")
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print("SwitchPresence", "50", "50")
	love.graphics.setColor( 255, 0, 0 )
	love.graphics.print("Press ESC at any time to quit", "50", "100")
	love.graphics.setColor( 0, 255, 0 )
	love.graphics.print("Press 1 for Splatoon 2", "50", "125")
	love.graphics.print("Press 2 for Smash Ultimate", "50", "150")
	love.graphics.print("Press 3 for Super Mario Odyssey", "50", "175")
	love.graphics.print("Press 4 for Fortnite", "50", "200")
	love.graphics.print("Press 5 for Mario Kart 8 Deluxe", "50", "225")
	love.graphics.print("Press 6 for Minecraft", "50", "250")
	love.graphics.print("Press 7 for The Legend of Zelda: Breath of the Wild", "50", "275")
	love.graphics.print("Press 8 for YouTube", "50", "300")
	love.graphics.setColor( 0, 255, 0 )
	love.graphics.print(gamestr, "550", "50")
end

function love.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	if love.keyboard.isDown("2") then
		discordRPC.updatePresence(smash)
		game = "Smash"
	end
	if love.keyboard.isDown("1") then
		discordRPC.updatePresence(splatoon)
		game = "Splatoon2"
	end
	if love.keyboard.isDown("3") then
		discordRPC.updatePresence(odyssey)
		game = "SMOdyssey"
	end
	if love.keyboard.isDown("4") then
		discordRPC.updatePresence(fortnite)
		game = "Fortnite"
	end
	if love.keyboard.isDown("5") then
		discordRPC.updatePresence(mk8d)
		game = "MarioKart"
	end
	if love.keyboard.isDown("6") then
		discordRPC.updatePresence(mc)
		game = "Minecraft"
	end
	if love.keyboard.isDown("7") then
		discordRPC.updatePresence(botw)
		game = "Zelda BoTW"
	end
	if love.keyboard.isDown("8") then
		discordRPC.updatePresence(yt)
		game = "Youtube"
	end
end

function love.quit()
	discordRPC.shutdown()
end