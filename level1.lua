local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

physics.start()

physics.setGravity(0, 50)

local scores = {1300, 1122, 1077, 1010}

classicalScore = scores[1] - 1000
rockScore = scores[2] - 1000
jazzScore = scores[3] - 1000
rapScore = scores[4] - 1000

noteSize = 50

local rapNotes = {"quarternote.png", "wholenote.png", "halfnote.png", "8triple.png", "8notes.png"}
local jazzNotes = {"sixteennotes.png", "16th note.png", "8notes.png", "halfnote.png"}
local rockNotes = {"sixteennotes.png", "16th note.png", "wholenote.png", "halfnote.png"}
local classicalNotes = {"sixteennotes.png", "32 note.png", "32rest.png", "8notes.png", "wholenote.png", "halfnote.png", "16triple.png", "8triple.png" }

local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX

music = display.newGroup()

rapNote = {}

local function addRap()
	physics.setGravity(0, 46)
	for i = 1, rapScore do
		complexRap = math.random(1, 5)
		rapNote[i] = display.newImage(rapNotes[complexRap])
		rapNote[i].x = math.random( display.actualContentWidth * 0.44, display.actualContentWidth * 0.66)
		rapNote[i].y = i * -10
		rapNote[i].height = noteSize; rapNote[i].width = noteSize
		physics.addBody( rapNote[i], "dynamic", {radius = 25})
		rapNote[i].rotation = 2
		music:insert(rapNote[i])
	end
end

rapFall = timer.performWithDelay(11000, addRap, 1)

rockNote = {}

local function addRock()
	physics.setGravity(0, 4)
	for i = 1, rockScore do
		complexRock = math.random(1,3)
		rockNote[i] = display.newImage(rockNotes[complexRock])
		rockNote[i].x = math.random( display.actualContentWidth * -0.07, display.contentCenterX - 50)
		rockNote[i].y = i * -10
		rockNote[i].height = noteSize; rockNote[i].width = noteSize
		physics.addBody( rockNote[i], "dynamic", {radius = 25})
		rockNote[i].alpha = 0.75
		music:insert(rockNote[i])
	end
end

rockFall = timer.performWithDelay(3000, addRock, 1)

jazzNote = {}

local function addJazz()
	physics.setGravity(0 , 48)
	for i = 1, jazzScore do
		complexJazz = math.random(1, 4)
		jazzNote[i] = display.newImage(jazzNotes[complexJazz])
		jazzNote[i].x = math.random(display.contentCenterX + 60, display.actualContentWidth * 0.3) 
		jazzNote[i].y = i * -10
		jazzNote[i].height = noteSize; jazzNote[i].width = noteSize
		physics.addBody( jazzNote[i], "dynamic", {radius = 25})
		jazzNote[i].alpha = 0.5
		music:insert(jazzNote[i])
	end
end

jazzFall = timer.performWithDelay(8000, addJazz, 1)

classicNote = {}

local function addClassic()
	physics.setGravity(0, 20)
	for i = 1, classicalScore do
		complexClassic = math.random(1,8)
		classicNote[i] = display.newImage(classicalNotes[complexClassic])
		classicNote[i].x = math.random(display.actualContentWidth * -0.25, display.actualContentWidth * -0.18)
		classicNote[i].y = i * -10
		classicNote[i].height = noteSize; classicNote[i].width = noteSize
		physics.addBody( classicNote[i], "dynamic", {radius = 25})
		classicNote[i].alpha = 0.25
		music:insert(classicNote[i])
		
	end
end

addClassic()
		
peri = display.newGroup()

classicText = display.newImage("classicText.png")
classicText.height = 100
classicText.width = 300
classicText.x = display.actualContentWidth * -0.2
classicText.y = display.actualContentHeight * 0.04

peri:insert(classicText)

jazzText = display.newImage("jazzText.png")
jazzText.height = 100
jazzText.width = 200
jazzText.x = display.actualContentWidth * 0.3
jazzText.y = display.actualContentHeight * 0.04

peri:insert(jazzText)

rockText = display.newImage("rockText.png")
rockText.height = 100
rockText.width = 225
rockText.x = display.actualContentWidth * 0.05
rockText.y = display.actualContentHeight * 0.04

peri:insert(rockText)

rapText = display.newImage("rapText.png")
rapText.height = 100
rapText.width = 175
rapText.x = display.actualContentWidth * 0.55
rapText.y = display.actualContentHeight * 0.04

peri:insert(rapText)

local function medsat()
	for i = 1, 4 do
		medSat1 = display.newText("Median SAT", (i * 705) - 1250, display.actualContentHeight * 0.09, native.systemFont, 30)
		peri:insert(medSat1)
	end

	for i = 1,4 do 
		medScore = display.newText(scores[i], (i * 705) - 1250, display.actualContentHeight * 0.12, native.systemFont, 30)
		peri:insert(medScore)
	end
end

medsat()


function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

	-- We need physics started to add bodies, but we don't want the simulaton
	-- running until the scene is on the screen.
	physics.start()
	physics.pause()

	local background = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
	
	background.fill = { 0.8, 0.9, 0.92}

	local board = display.newRect(display.contentCenterX, display.actualContentHeight * 0.05, display.actualContentWidth, 300)
	board.fill = {0.3, 0.3, 0.3, 0.4}

	local split1 = display.newRect(display.actualContentWidth * 0.675 , display.contentCenterY, 10, display.actualContentHeight * 3)
	physics.addBody(split1, "static")
	split1.alpha = 0

	local split2 = display.newRect(display.actualContentWidth * 0.42, display.contentCenterY, 10, display.actualContentHeight * 3)
	physics.addBody(split2, "static")
	split2.alpha = 0

	local split3 = display.newRect(display.contentCenterX, display.contentCenterY, 10, display.actualContentHeight * 3)
	physics.addBody(split3, "static")
	split3.alpha = 0

	local split4 = display.newRect(display.actualContentWidth * -0.075, display.contentCenterY, 10, display.actualContentHeight * 3)
	physics.addBody(split4, "static")
	split4.alpha = 0

	local split5 = display.newRect(display.actualContentWidth * -0.323, display.contentCenterY, 10, display.actualContentHeight * 3)
	physics.addBody(split5, "static")
	split5.alpha = 0

	local bottom = display.newRect( display.contentCenterX, display.actualContentHeight * 0.78, display.actualContentWidth * 2, 10)
	physics.addBody(bottom, "static")
	bottom.alpha = 0

	local rules = display.newImage("rules.png")
	rules.x = display.contentCenterX
	rules.y = display.actualContentHeight * 0.87

	sceneGroup:insert(background)
	sceneGroup:insert(board)
	sceneGroup:insert(split1)
	sceneGroup:insert(split2)
	sceneGroup:insert(split3)
	sceneGroup:insert(split4)
	sceneGroup:insert(split5)
	sceneGroup:insert(bottom)
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
		physics.start()
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
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene