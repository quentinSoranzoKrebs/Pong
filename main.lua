

width, height = love.window.getDesktopDimensions()




local w, h = love.graphics.getDimensions()

math.randomseed(os.time())
  
local random_number = math.random(-10, 10)


fond = love.graphics.newImage("sprite/tennis.png") --640 318

atnd = {}
atnd.img = love.graphics.newImage("sprite/bille.png")
atnd.x = 10
atnd.x1 = 60
atnd.x2 = 50
atnd.x3 = 40
atnd.x4 = 30
atnd.x5 = 20
atnd.x6 = 10
atnd.y = h/2 + h/7
atnd.sx = w/80000
atnd.sy = w/80000
atnd.r = math.rad(0)
atnd.speed1 = 200
atnd.speed2 = 200
atnd.speed3 = 200
atnd.speed4 = 200
atnd.speed5 = 200
atnd.speed6 = 200


atnd1 = {}
atnd1.img = love.graphics.newImage("sprite/attendre.png")
atnd1.x = 10
atnd1.y = 10
atnd1.sx = w/30000
atnd1.sy = w/30000
atnd1.r = math.rad(0)

raq1 = {}
raq1.img = love.graphics.newImage("sprite/RAQUETTE2.png")
raq1.sx = h /850
raq1.sy = h /850
raq1.x = 10
raq1.y = h/2
raq1.r = math.rad(0)
raq1.speed = 400
raq1.score = 10

raq2 = {}
raq2.img = love.graphics.newImage("sprite/RAQUETTE2.png")
raq2.sx = h/850
raq2.sy = h/850
raq2.x = (w-10) - 48*raq2.sx
raq2.y = h/2
raq2.r = math.rad(0)
raq2.speed = 400
raq2.score = 10


ball = {}
ball.img = love.graphics.newImage("sprite/balle.png")
ball.x = w/2
ball.y = h/2
ball.r = math.rad(0)
ball.sx = 0.01
ball.sy = 0.01
ball.speedx = w/2.7
ball.speedy = random_number * 50
ball.speed = 2
ball.d = 1



jouer = {}
jouer.img = love.graphics.newImage("sprite/bouton_jouer.png")
jouer.img2 = love.graphics.newImage("sprite/bouton_jouer2.png")
jouer.x = 10
jouer.y = 10
jouer.sx = h/1500
jouer.sy = h/1500
jouer.jo = 1
jouer.on = 0

pause = {}
pause.img = love.graphics.newImage("sprite/pause.png")
pause.x = 10
pause.y = 10
pause.sx = h/5500
pause.sy = h/5500
pause.press = 1
pause.ps = 0

screenshot = {}
screenshot.img = love.graphics.newImage("sprite/screenshot.png")
screenshot.img2 = love.graphics.newImage("sprite/screenshot2.png")
screenshot.x = w/2
screenshot.y = h/2
screenshot.sx = w/7500
screenshot.sy = w/7500
screenshot.on = 0
--screenshot.sx =  h/2181818
--screenshot.sy = h/2181818

ongletpm = {}
ongletpm.img = love.graphics.newImage("sprite/ongletpm.png")
ongletpm.img_on = love.graphics.newImage("sprite/ongletpm_on.png")
ongletpm.img_fd = love.graphics.newImage("sprite/ongletpm_fd.png")
ongletpm.x = w/8
ongletpm.y = h/5
ongletpm.sx = w/15000
ongletpm.sy = w/15000
ongletpm.on = 0

onglethp = {}
onglethp.img = love.graphics.newImage("sprite/onglethp.png")
onglethp.img_on = love.graphics.newImage("sprite/onglethp_on.png")
onglethp.img_fd = love.graphics.newImage("sprite/onglethp_fd.png")
onglethp.x = 0
onglethp.y = 0
onglethp.sx = w/15000
onglethp.sy = w/15000
onglethp.on = 0

home = {}
home.img = love.graphics.newImage("sprite/home.png")
home.img2 = love.graphics.newImage("sprite/home2.png")
home.x = w/2
home.y = h/2
home.sx = w/7500
home.sy = w/7500
home.on = 0


nb1 = {}
nb1.img_press = love.graphics.newImage("sprite/r_b_1.png")
nb1.img_nopress = love.graphics.newImage("sprite/r_b_1_press.png")
nb1.x = 100
nb1.y = h/3
nb1.sx = h/10500
nb1.sy = h/10500
nb1.press = 1

nb2 = {}
nb2.img_press = love.graphics.newImage("sprite/r_b_2.png")
nb2.img_nopress = love.graphics.newImage("sprite/r_b_2_press.png")
nb2.x = 100
nb2.y = h/2
nb2.sx = h/10500
nb2.sy = h/10500
nb2.press = 0

help = {}
help.img = love.graphics.newImage("sprite/help.png")
help.help_img1 = love.graphics.newImage("sprite/help_img1.png")
help.help_img2 = love.graphics.newImage("sprite/help_img.png")
help.sx = w/5500
help.sy = w/5500
help.x = w - 380*help.sy/2
help.y = w - 380*help.sy/2
help.press = 0
help.ps = 0

local data = 1

timer = 0

intro = love.graphics.newImage("sprite/titre.png")
loading = love.graphics.newImage("sprite/loading.png")
game_over = love.graphics.newImage("sprite/game_over.png")
homefond = love.graphics.newImage("sprite/homefond.png")
homefond2 = love.graphics.newImage("sprite/homefond.png")

choix = 0

etat = "intro"

ps = 3

_gameover_ = 0

timer = 0

score = raq1.score


function  bille(x,x1,dec,w)
  if x>0 and x<w/2-w/25 or x>w/2+w/25 and x<w then
    return 500
  else
    if x1-dec > x then
      return 72
    else
      return 0
    end
  end
end

function bord(x,w)
  if x>w then
    return 5
  end
  return x
end

function btn_on(on,img,img2,x,y,sx,sy)
  if on == 0 then
    love.graphics.draw(img, x, y, 0, sx, sy)
  else
    love.graphics.draw(img2, x, y, 0, sx, sy)
  end
end

function get_mouse(x,y,sx,sy,img)
  if love.mouse.getX() > x and love.mouse.getX() < x + img:getWidth()*sx and love.mouse.getY() > y and love.mouse.getY() < y + img:getHeight()*sy then
    return 1
  else
    return 0
  end
end

love.window.setMode(width/2.5, height/3, {borderless = true})



function love.draw()

  local currentDateTime = os.date("%c")
  local w, h = love.graphics.getDimensions()
  local width, height = love.window.getDesktopDimensions()
  
  -- intro  

  if etat == "intro" then
    love.graphics.setBackgroundColor(0.2,0.2,0.2)
    love.graphics.draw(intro, w/2, h/2, 0, w/1000, w/1000, intro:getWidth() / 2, intro:getHeight() / 2)
    --love.graphics.draw(loading, w/2-(1300*w/4000/2), h/2 + h/4, 0, timer/3*w/4000, w/5000)
    love.graphics.draw(atnd1.img, atnd1.x, atnd1.y, atnd1.r, atnd1.sx, atnd1.sy ,atnd1.img:getWidth() / 2, atnd1.img:getHeight() / 2)
    atnd1.sx = w/30000
    atnd1.sy = w/30000
    atnd1.x = w/2
    love.graphics.setNewFont(h/25)
    --love.graphics.printf("Loading...", 0, w/2, h/2+h/4, "center")
    love.graphics.printf("Loading...", 0, love.graphics.getHeight()/1.2, love.graphics.getWidth(), "center")
    love.graphics.setNewFont(h/28)
    love.graphics.printf("créateur : Quentin", 0, h - h/8, w - w/20, "right")
    love.graphics.print("version 0.1", w/20, h - h/8)
    love.graphics.draw(atnd.img, atnd.x1, atnd.y, atnd.r, atnd.sx, atnd.sy ,atnd.img:getWidth() / 2, atnd.img:getHeight() / 2)
    love.graphics.draw(atnd.img, atnd.x2, atnd.y, atnd.r, atnd.sx, atnd.sy ,atnd.img:getWidth() / 2, atnd.img:getHeight() / 2)
    love.graphics.draw(atnd.img, atnd.x3, atnd.y, atnd.r, atnd.sx, atnd.sy ,atnd.img:getWidth() / 2, atnd.img:getHeight() / 2)
    love.graphics.draw(atnd.img, atnd.x4, atnd.y, atnd.r, atnd.sx, atnd.sy ,atnd.img:getWidth() / 2, atnd.img:getHeight() / 2)
    
    if atnd.x1>0 and atnd.x1<w/2-w/25 or atnd.x1>w/2+w/25 and atnd.x1<w then
      atnd.speed1 = 500
    else
      if atnd.x2+10 > atnd.x1 then
        atnd.speed1 = 72
      else
        atnd.speed1 = 68
      end
    end

    atnd.x1 = bord(atnd.x1,w)

    atnd.speed2 = bille(atnd.x2,atnd.x1,10,w)

    atnd.x2 = bord(atnd.x2,w)

    atnd.speed3 = bille(atnd.x3,atnd.x1,20,w)

    atnd.x3 = bord(atnd.x3,w)

    atnd.speed4 = bille(atnd.x4,atnd.x1,30,w)

    atnd.x4 = bord(atnd.x4,w)

    --ps = ps - 1

    if timer > 6 then
      etat = "menu"
      timer = 0
      love.timer.sleep( 1 )
      love.window.setMode(1100, 600, {resizable = true})
      --love.window.setMode(1100, 600, {resizable = true})
    end
  end

  --menu

  if etat == "menu" then
    local w, h = love.graphics.getDimensions()
    love.graphics.rectangle("line", w/2 - w/16, h/3.2, w/8, h/18)
    love.graphics.line(w/2+w/24, h/3, w/2+w/21, h/2.9)
    love.graphics.line(w/2+w/21, h/2.9, w/2+w/19,h/3 )
    love.graphics.setNewFont(h/40)
    love.graphics.print(tostring(ball.speed), w/2 - w/18, h/3.1)
    if choix == 1 then
      love.graphics.setColor(0.5,0.5,0.5)
      love.graphics.rectangle("fill", w/2 - w/16, (h/3.2)+(h/18), w/16, h/4)
      love.graphics.setColor(255, 255, 255)
      love.graphics.setNewFont(h/40)
      love.graphics.print("1", w/2 - w/18, (h/3.2)+(h/16))
      love.graphics.line( w/2 - w/16, (h/3.2)+(h/10), (w/2 - w/16)+(w/16), (h/3.2)+(h/10))
      love.graphics.print("2", w/2 - w/18, (h/3.2)+(h/9))
      love.graphics.line( w/2 - w/16, (h/3.2)+(h/7), (w/2 - w/16)+(w/16), (h/3.2)+(h/7))
      love.graphics.print("3", w/2 - w/18, (h/3.2)+(h/6.3))
      love.graphics.line( w/2 - w/16, (h/3.2)+(h/5.6), (w/2 - w/16)+(w/16), (h/3.2)+(h/5.6))
    end



    --affichage des graphiques
  
    if nb1.press == 0 then
      love.graphics.draw(nb1.img_nopress, nb1.x, nb1.y, 0, nb1.sx, nb1.sy)
    elseif nb1.press == 1 then
      love.graphics.draw(nb1.img_press, nb1.x, nb1.y, 0, nb1.sx, nb1.sy)
    end

    if nb2.press == 0 then
      love.graphics.draw(nb2.img_nopress, nb2.x, nb2.y, 0, nb2.sx, nb2.sy)
    elseif nb2.press == 1 then
      love.graphics.draw(nb2.img_press, nb2.x, nb2.y, 0, nb2.sx, nb2.sy)
    end

    btn_on(jouer.on,jouer.img,jouer.img2,jouer.x,jouer.y,jouer.sx,jouer.sy)

    love.graphics.setNewFont(h/35)
    love.graphics.print("Nombre de joueurs", w/18, h/4)
    love.graphics.setNewFont(h/35)
    love.graphics.printf("Vitesse de la balle", 0, h/4, w, "center")
    love.graphics.setNewFont(h/10)
    love.graphics.printf("Menu", 0, h/20, w, "center")

  
    -- sourie
    function love.mousepressed(x, y, button)

      if x > w/2 - w/16 and x < (w/2 - w/16)+(w/8) and y > h/3.2 and y < (h/3.2)+(h/18) then
        if choix == 0 then
          choix = 1
        else
          choix = 0
        end 
      else
        choix = 0
      end
      if x > jouer.x and x < jouer.x + 500*jouer.sx and y > jouer.y and y < jouer.y + 139*jouer.sy then
        --love.timer.sleep( 1 )
        --jouer.jo = 0
        jouer.sx = h/1400
        jouer.sy = h/1400
        love.graphics.draw(jouer.img2, jouer.x, jouer.y, 0, jouer.sx, jouer.sy)
        etat = "jeu"
        love.timer.sleep( 0.5 )
      end
      if x > nb1.x and x < nb1.x + 1300*nb1.sx and y > nb1.y and y < nb1.y + 380*nb1.sy then
        if nb1.press == 0 then
          nb1.press = 1
          nb2.press = 0
        end
      end
      if x > nb2.x and x < nb2.x + 1300*nb2.sx and y > nb2.y and y < nb2.y + 380*nb2.sy then
        if nb2.press == 0 then
          nb2.press = 1
          nb1.press = 0
        end
      end
    end



    -- actualisation
    local w, h = love.graphics.getDimensions()
    jouer.x = w - (w/5)
    jouer.y = h - (h/6)
    nb1.sx = h/15000
    nb1.sy = h/15000
    nb2.sx = h/15000
    nb2.sy = h/15000
    nb2.x = w/8
    nb2.y = h/2.5
    nb1.x = w/8
    nb1.y = h/3
    jouer.sx = h/1600
    jouer.sy = h/1600
  end

--jeu

  if etat == "jeu" then
    love.graphics.setBackgroundColor(0.7,0.2,0.0)
    love.graphics.draw(fond, 0, 0, 0, w/640, h/318)
    
    function love.mousepressed(x, y, button)
      if x > pause.x and x < pause.x + 540*pause.sx and y > pause.y and y < pause.y + 540*pause.sy then
        --love.timer.sleep( 1 )
        pause.press = 0
        pause.sx = w/30000
        pause.sy = w/30000
        etat = "home"
        if pause.ps == 1 or help.ps == 1 then
          pause.ps = 0
          help.ps = 0
        else
          pause.ps = 1
        end
      end
      if x > screenshot.x and x < screenshot.x + 1080*screenshot.sx and y > screenshot.y and y < screenshot.y + 1080*screenshot.sy then
        love.graphics.captureScreenshot('screenshot' .. data .. '.png')
        love.graphics.setNewFont(h/20)
        love.graphics.print("screenshot", w/2, h/2)
        data = data + 1
        love.timer.sleep( 0.3 )
      end
      if x > home.x and x < home.x + 1080*home.sx and y > home.y and y < home.y + 1080*home.sy then
        etat = "home"
      end
      if x > help.x and x < help.x + 380*help.sx and y > help.y and y < help.y + 380*help.sy then
        --love.timer.sleep( 1 )
        help.press = 0
        help.sx = w/7000
        help.sy = w/7000
        --help = love.window.open("Help", {width = 400, height = 300, resizable = true, borderless = false, centered = true})
        if help.ps == 1 then
          help.ps = 0
          pause.ps = 0
        else
          help.ps = 1
        end
      end
    end



    local w, h = love.graphics.getDimensions()
    ball.speedx = w/2.7
    screenshot.x = w/2 - 1080*screenshot.sx
    screenshot.y = h/62
    screenshot.sx = w/15000
    screenshot.sy = w/15000
    home.x = w/2
    home.y = h/62
    home.sx = w/15000
    home.sy = w/15000
    raq1.sx = h/850
    raq1.sy = h /850
    raq2.sx = h/850
    raq2.sy = h /850
    pause.x = w/30 - 540*pause.sx/2
    pause.y = h/62
    help.x = w/1.03 - 380*help.sy/2
    help.y = h/62
    --help.x = w - 380*help.sx/2
    --help.y = w - 380*help.sy/2
    if pause.sy < w/9000 and pause.press == 0 then
      pause.sx = pause.sx + w/100000
      pause.sy = pause.sy + w/100000
    elseif pause.sy > w/9000 and pause.press == 0 then
      pause.press = 1
    else
      pause.sx = w/9000
      pause.sy = w/9000
    end
    if help.sy < w/5500 and help.press == 0 then
      help.sx = help.sx + w/100000
      help.sy = help.sy + w/100000
    elseif help.sy > w/5500 and help.press == 0 then
      help.press = 1
    else
      help.sx = w/5500
      help.sy = w/5500
    end
  
    ball.sx = h/40000
    ball.sy = h /40000
    love.graphics.setNewFont(h/30)
    
    love.graphics.draw(pause.img, pause.x, pause.y, 0, pause.sx, pause.sy)
    love.graphics.printf("score : " .. raq2.score, 0, love.graphics.getHeight()/37, love.graphics.getWidth() - (w - help.x), "right")
    love.graphics.print("score : " .. raq1.score, w/15, h/37)
    love.graphics.draw(raq2.img, raq2.x, raq2.y, raq2.r, raq2.sx, raq2.sy)
    love.graphics.draw(ball.img, ball.x, ball.y, ball.r, ball.sx, ball.sy)
    
    if nb1.press == 1 then
      if help.ps == 0 then
        love.graphics.draw(help.img, help.x, help.y, 0, help.sx, help.sy)
      elseif help.ps == 1 then
        love.graphics.draw(help.help_img1, help.x - 999*w/2500 + 360*help.sx , help.y , 0, w/2500, w/2500)
      end
    end
    if nb2.press == 1 then
      if help.ps == 0 then
        love.graphics.draw(help.img, help.x, help.y, 0, help.sx, help.sy)
      elseif help.ps == 1 then
        love.graphics.draw(help.help_img2, help.x - 999*w/2500 + 360*help.sx , help.y , 0, w/2500, w/2500)
      end
    end

    btn_on(screenshot.on,screenshot.img,screenshot.img2,screenshot.x,screenshot.y,screenshot.sx,screenshot.sy)

    btn_on(home.on,home.img,home.img2,home.x,home.y,home.sx,home.sy)



    raq2.x = (w-10) - 48*raq2.sx
   
  

    if ball.x < (raq1.x + ((48*raq1.sx)/2)) and ball.y > raq1.y and ball.y < (raq1.y + (212*raq1.sy)) then
      ball.d = 0
      math.randomseed(os.time())
      local random_number = math.random(-10, 10)
      ball.speedy = random_number * 50
    end

    if ball.x > (raq2.x - (48*raq2.sx)/2) and ball.y > raq2.y and ball.y < (raq2.y + (212*raq2.sy)) then
      ball.d = 1
      math.randomseed(os.time())
      local random_number = math.random(-10, 10)
      ball.speedy = random_number * 50
    end

    if ball.y < 0 then
      ball.speedy = ball.speedy - (2*ball.speedy)
    end

    if ball.y > h-2000*ball.sy then
      ball.speedy = ball.speedy - (2*ball.speedy)
    end

    if nb1.press == 1 then
      if ball.x < 0  then
        raq1.score = raq1.score - 1
        raq2.score = raq2.score + 1
        math.randomseed(os.time())
        local random_number = math.random(-10, 10)
        ball.speedy = random_number * 50
        ball.x = w/2
        ball.y = h/2
        ball.d = 0

      end

      if ball.x > w then
        math.randomseed(os.time())
        local random_number = math.random(-10, 10)
        raq1.score = raq1.score + 1
        raq2.score = raq2.score - 1
        ball.speedy = random_number * 50
        ball.x = w/2
        ball.y = h/2
        ball.d = 1
      end
    else
      if ball.x < 0  then
        raq1.score = raq1.score - 1
        --raq2.score = raq2.score + 1
        math.randomseed(os.time())
        local random_number = math.random(-10, 10)
        ball.speedy = random_number * 50
        ball.x = w/2
        ball.y = h/2
        ball.d = 0

      end

      if ball.x > w then
        math.randomseed(os.time())
        local random_number = math.random(-10, 10)
        --raq1.score = raq1.score + 1
        raq2.score = raq2.score - 1
        ball.speedy = random_number * 50
        ball.x = w/2
        ball.y = h/2
        ball.d = 1
      end
    end
    if nb2.press == 0 then
      if raq1.score < 0 then
        _gameover_ = 1

        if timer < 3 then
          love.graphics.draw(game_over,0 , 0, 0, w/1100, w/1100)
        else
          raq1.score = raq2.score
          _gameover_ = 0
          timer = 0
        end
      end
    else
      if raq1.score < 0 then
        if timer < 3 then
          love.graphics.setNewFont(h/10)
          love.graphics.printf("Brovo! Le joueur 2 a gagné!!!!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
          _gameover_ = 1
        else
          if raq2.score > 5 then
            raq1.score = 10
            raq2.score = 10
          else
            raq1.score = 10
            raq2.score = 10
          end
          _gameover_ = 0
        end
      elseif raq2.score < 0 then
        if timer < 3 then
          love.graphics.setNewFont(h/10)
          love.graphics.printf("Brovo! Le joueur 1 a gagné!!!!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
          _gameover_ = 1
        else
          if raq1.score > 5 then
            raq2.score = raq1.score - 5
          else
            raq1.score = 10
            raq2.score = 10
          end
          _gameover_ = 0
        end
      timer = 0
      end
    end

    
    if love.filesystem.getInfo("screenshot.pg") then
        -- Charger la valeur depuis le fichier
        local data = love.filesystem.read("screenshot.pg")
        valeur = tonumber(data)
    else
        -- Créer un nouveau fichier avec une valeur par défaut
        love.filesystem.write("screenshot.pg", tostring(1))
    end

    love.graphics.draw(raq1.img, raq1.x, raq1.y, raq1.r, raq1.sx, raq1.sy)
  end

  if etat == "home" then
    local w, h = love.graphics.getDimensions()

    

    love.graphics.draw(fond, 0, 0, 0, w/640, h/318)
    love.graphics.draw(homefond, 0, 0, 0, w/((1080/3)/timer), h/((1080/3)/timer))
    love.graphics.setNewFont(h/35)
    love.graphics.print("option", ongletpm.x + 1540*ongletpm.sx, ongletpm.y + 440*ongletpm.sy)
    
    love.graphics.setLineWidth(h/300)
    love.graphics.line(w/9, ongletpm.y + 1080*ongletpm.sy, ongletpm.x + 3080*ongletpm.sx, ongletpm.y + 1080*ongletpm.sy )
    love.graphics.line(onglethp.x + 3080*onglethp.sx , ongletpm.y + 1080*ongletpm.sy, w - w/9, ongletpm.y + 1080*ongletpm.sy )
    love.graphics.line( w/9, h - (ongletpm.y/2), w - w/9, h - (ongletpm.y/2))
    love.graphics.line( w/9, ongletpm.y + 1080*ongletpm.sy, w/9, h - (ongletpm.y/2))
    love.graphics.line( w - w/9, ongletpm.y + 1080*ongletpm.sy, w-w/9, h - (ongletpm.y/2))


    btn_on(jouer.on,jouer.img,jouer.img2,jouer.x,jouer.y,jouer.sx,jouer.sy)
    

    btn_on(ongletpm.on,ongletpm.img,ongletpm.img_on,ongletpm.x,ongletpm.y,ongletpm.sx,ongletpm.sy)


    btn_on(onglethp.on,onglethp.img,onglethp.img_on,onglethp.x,onglethp.y,onglethp.sx,onglethp.sy)
    
    love.graphics.setNewFont(h/10)
    love.graphics.printf("Menu", 0, h/20, w, "center")
    
    jouer.x = w - (w/5)
    jouer.y = h - (h/6)
    jouer.sx = h/1600
    jouer.sy = h/1600
    ongletpm.x = w/8
    ongletpm.y = h/5
    ongletpm.sx = w/30000
    ongletpm.sy = w/30000
    onglethp.x = ongletpm.x + 3080*ongletpm.sx
    onglethp.y = h/5
    onglethp.sx = w/30000
    onglethp.sy = w/30000
    function love.mousepressed(x, y, button)
      if x > jouer.x and x < jouer.x + 500*jouer.sx and y > jouer.y and y < jouer.y + 139*jouer.sy then
        jouer.sx = h/1400
        jouer.sy = h/1400
        love.graphics.draw(jouer.img2, jouer.x, jouer.y, 0, jouer.sx, jouer.sy)
        love.timer.sleep( 0.5 )
        etat = "jeu"
        ball.x=w/2
        ball.y=h/2
        pause.ps = 0
        help.ps = 0
        timer = 0
      end
    end
  end

end


function love.update(dt)

  atnd.x1 = atnd.x1 + atnd.speed1 * dt
  atnd.x2 = atnd.x2 + atnd.speed2 * dt
  atnd.x3 = atnd.x3 + atnd.speed3 * dt
  atnd.x4 = atnd.x4 + atnd.speed4 * dt
  atnd.x5 = atnd.x5 + atnd.speed5 * dt

  local currentDateTime = os.date("%c")
  
    if love.mouse.getX() > jouer.x and love.mouse.getX() < jouer.x + 490*jouer.sx and love.mouse.getY() > jouer.y and love.mouse.getY() < jouer.y + 139*jouer.sy then
      jouer.on = 1
    else
      jouer.on = 0
    end

    if etat == "home" then
      timer = timer + dt
    end

  if etat == "intro" then
    timer = timer + dt
    atnd1.r = atnd1.r + (2 * math.pi * dt)
  end

  if love.keyboard.isDown("tab") then
    love.graphics.captureScreenshot('screenshot' .. data .. '.png')
    --love.graphics.captureScreenshot('screenshot_' .. currentDateTime .. '.png')
    --screenshot:encode('png', 'screenshot_' .. currentDateTime .. '.png')
    love.graphics.setNewFont(h/20)
    love.graphics.print("screenshot", w/2, h/2)
    data = data + 1
    love.timer.sleep( 0.3 )
  end



  if raq1.score < 0 or raq1.score < 0 or raq2.score < 0 then
    timer = timer + dt
  end

  if love.keyboard.isDown("escape") then
    love.window.setFullscreen(false)
    raq1.y = h/2
    raq2.y = h/2
    raq2.x = (w-10) - 48*raq2.sx
  end
  if love.keyboard.isDown("f11") or love.keyboard.isDown('return') and love.keyboard.isDown('lalt') then
    if love.window.getFullscreen() then
      love.window.setFullscreen(false)
    else
      love.window.setFullscreen(true)
      raq1.y = h/2
      raq2.y = h/2
      raq2.x = (w-10) - 48*raq2.sx
    end
    love.timer.sleep( 0.3 )
  end


  if etat == "jeu" and help.ps == 0 and pause.ps == 0 and _gameover_ == 0 then
    if nb1.press == 1 then
      if ball.x > h/4 + h/2 and ball.d==0 then
        if raq2.y > ball.y-(212*raq2.sy/3) and raq2.y > 0 then
          raq2.y = raq2.y - raq2.speed * dt
        elseif raq2.y - (212*raq2.sy/3) < ball.y and raq2.y < h + (212*raq2.sy) then
          raq2.y = raq2.y + raq2.speed * dt
        end
      end
    end

    screenshot.on =  get_mouse(screenshot.x,screenshot.y,screenshot.sx,screenshot.sy,screenshot.img)
    

    home.on =  get_mouse(home.x,home.y,home.sx,home.sy,home.img)


    ball.y = ball.y - ball.speedy * dt 
    

    if  ball.d == 1 then
      ball.x = ball.x - ball.speedx * dt
    elseif ball.d == 0 then
      ball.x = ball.x + ball.speedx * dt
    end

    local w, h = love.graphics.getDimensions()


    
    if nb1.press == 1 then
      if love.keyboard.isDown("up") and raq1.y>0 then
        raq1.y = raq1.y - raq1.speed * dt
      elseif love.keyboard.isDown("down") and (raq1.y + (212*raq1.sy)) < h then
        raq1.y = raq1.y + raq1.speed * dt
      end
    else
      if love.keyboard.isDown("z") and raq1.y>0 then
        raq1.y = raq1.y - raq1.speed * dt
      elseif love.keyboard.isDown("w") and (raq1.y + (212*raq1.sy)) < h then
        raq1.y = raq1.y + raq1.speed * dt
      end
      if love.keyboard.isDown("p") and raq2.y>0 then
        raq2.y = raq2.y - raq2.speed * dt
      elseif love.keyboard.isDown("m") and (raq2.y + (212*raq2.sy)) < h then
        raq2.y = raq2.y + raq2.speed * dt
      end
    end
  end
end


function love.quit()
  local response = love.window.showMessageBox("Confirmation", "Voulez-vous vraiment quitter ?", {"Non", "Oui"})


  if response == 1 then
    love.filesystem.write("screenshot.pg", tostring(data))
    return true
  end

  return fals

end







