local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
local physics = require( "physics" )

physics.start()


music = display.newGroup()

jazzNote = {}

local function addNote()
	for i = 1, 100 do
		jazzNote[i] = display.newImage("jazzNote.png")
		jazzNote[i].fill = {0.5, 0.6, 0.7}
		physics.addBody( jazzNote[i], "dynamic", {radius = 25})
	end
end





function scene:create( event )
	local sceneGroup = self.view

	
	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
	
	background.fill = { 0.2, 0.2, 0.2}

	local split1 = display.newRect(display.contentCenterX, display.contentCenterY, 10, display.actualContentHeight)
	physics.addBody(split1, "static")

	
	
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view

end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene