pocetna=love.graphics.newImage("pocetna.jpg")
font = love.graphics.newFont("mojFont.ttf",50)
tekst = love.graphics.newText(font,"Dalje")
  
kamila = love.graphics.newImage("kamila.png")
koala = love.graphics.newImage("koala.png") 
lav = love.graphics.newImage("lav.png")
lisica = love.graphics.newImage("lisica.png")      
zirafa = love.graphics.newImage("zirafa.png")
rakun = love.graphics.newImage("rakun.png")
zec = love.graphics.newImage("zeka.png")
panda = love.graphics.newImage("panda.png")

font2 = love.graphics.newFont(12) 
poruka2=love.graphics.newText(font2,"")
poruka3=love.graphics.newText(font2,"")
poruka22=love.graphics.newText(font2,"")
poruka32=love.graphics.newText(font2,"")

pijuni= {kamila,koala,lav,lisica,zirafa,rakun,zec,panda}  

igraci2 = {
    { Ime = "Prvi Igrac", PoljeNaKomJe = 1, Slicica = pijuni[1]},
    { Ime = "Drugi Igrac", PoljeNaKomJe = 1, Slicica = pijuni[2]}
}

igraci3 = {
    { Ime = "Prvi Igrac", PoljeNaKomJe = 1, Slicica = pijuni[1]},
    { Ime = "Drugi Igrac", PoljeNaKomJe = 1, Slicica = pijuni[2]},
    { Ime = "Treci Igrac", PoljeNaKomJe = 1, Slicica = pijuni[3]}    
}

igraci={}
if(brojIgraca == 2) then
    igraci = igraci2
else if(brojIgraca == 3) then
        igraci = igraci3
     end
end

local textbox1 = {
    x = 10,
    y = 20,
    width = 400,
    height = 50,
    text = "Ime prvog igraca:  ",
    active = false,
    colors = {
        background = { 70/255,130/255,180/255,1 },
        text = { 40, 40, 40, 255 }
    }
}

local textbox2 = {
    x = 10,
    y = 220,
    width = 400,
    height = 50,
    text = "Ime drugog igraca:  ",
    active = false,
    colors = {
        background = { 70/255,130/255,180/255,1 },
        text = { 40, 40, 40, 255 }
    }
}

local textbox3 = {
    x = 10,
    y = 420,
    width = 400,
    height = 50,
    text = "Ime treceg igraca:  ",
    active = false,
    colors = {
        background = { 70/255,130/255,180/255,1 },
        text = { 40, 40, 40, 255 }
    }
}

function love.draw()
  love.graphics.draw(pocetna)
  
  love.graphics.draw(kamila,20,100)
  love.graphics.draw(koala,120,110)
  love.graphics.draw(lav,210,100)
  love.graphics.draw(lisica,310,100)
  love.graphics.draw(zirafa,410,90)
  love.graphics.draw(rakun,510,100)
  love.graphics.draw(zec,610,100)
  love.graphics.draw(panda,710,110)
  
  love.graphics.draw(kamila,20,300)
  love.graphics.draw(koala,120,310)
  love.graphics.draw(lav,210,300)
  love.graphics.draw(lisica,310,300)
  love.graphics.draw(zirafa,410,290)
  love.graphics.draw(rakun,510,300)
  love.graphics.draw(zec,610,300)
  love.graphics.draw(panda,710,310)
  
  love.graphics.setColor(70/255,130/255,180/255,1)
  love.graphics.rectangle('fill',830,20,100,50,35,35)
  love.graphics.setColor(1,1,1,100)
  love.graphics.draw(tekst,850,20)
  
  love.graphics.draw(poruka2,10,275)
  love.graphics.draw(poruka3,10,475)
  love.graphics.draw(poruka22,230,275)
  love.graphics.draw(poruka32,230,475)
  
  love.graphics.setColor(unpack(textbox1.colors.background))
  love.graphics.rectangle('fill', textbox1.x, textbox1.y, textbox1.width, textbox1.height)

  love.graphics.setColor(unpack(textbox1.colors.text))
  love.graphics.printf(textbox1.text, textbox1.x, textbox1.y, textbox1.width)
  
  love.graphics.setColor(unpack(textbox2.colors.background))
  love.graphics.rectangle('fill', textbox2.x, textbox2.y, textbox2.width, textbox2.height)

  love.graphics.setColor(unpack(textbox2.colors.text))
  love.graphics.printf(textbox2.text, textbox2.x, textbox2.y, textbox2.width)
  
  if brojIgraca==3 then
  
    love.graphics.setColor(unpack(textbox3.colors.background))
    love.graphics.rectangle('fill', textbox3.x, textbox3.y, textbox3.width, textbox3.height)

    love.graphics.setColor(unpack(textbox3.colors.text))
    love.graphics.printf(textbox3.text, textbox3.x, textbox3.y, textbox3.width)
    
    love.graphics.draw(kamila,20,500)
    love.graphics.draw(koala,120,510)
    love.graphics.draw(lav,210,500)
    love.graphics.draw(lisica,310,500)
    love.graphics.draw(zirafa,410,490)
    love.graphics.draw(rakun,510,500)
    love.graphics.draw(zec,610,500)
    love.graphics.draw(panda,710,510)
    
  end

end

function love.textinput (text)
    if textbox1.active and not textbox2.active and not textbox3.active then
        textbox1.text = textbox1.text..text
    end
    if textbox2.active and not textbox1.active and not textbox3.active then
        textbox2.text = textbox2.text..text
    end
    if brojIgraca==3 and textbox3.active and not textbox1.active and not textbox2.active then
        textbox3.text = textbox3.text..text
    end
end

function love.mousepressed (x, y)
   
  if x>=830 and x<=930 and y>=20 and y<=70 then
      igraci[1]["Ime"]=string.sub(textbox1.text,20)
      igraci[2]["Ime"]=string.sub(textbox2.text,21)
      if brojIgraca==3 then
        igraci[3]["Ime"]=string.sub(textbox3.text,21)
      end

      if brojIgraca==2 then
          
if igraci[1]["Slicica"] == igraci[2]["Slicica"] or igraci[2]["Ime"] == igraci[1]["Ime"] then

       if igraci[1]["Slicica"] == igraci[2]["Slicica"] then
            poruka22:set("Figurica je vec zauzeta...")
       else poruka22:set("")
       end
        if igraci[2]["Ime"] == igraci[1]["Ime"] then
             poruka2:set("Zao mi je, to ime je vec zauzeto...")
         else  poruka2:set("")
         end
       
       
else require("tabla")
end
       
      else if brojIgraca==3 then
if igraci[1]["Slicica"] == igraci[2]["Slicica"] or igraci[3]["Slicica"] == igraci[1]["Slicica"] or igraci[3]["Slicica"] == igraci[2]["Slicica"] or igraci[2]["Ime"] == igraci[1]["Ime"] or igraci[3]["Ime"] == igraci[1]["Ime"] or igraci[3]["Ime"] == igraci[2]["Ime"] then
               if igraci[1]["Slicica"] == igraci[2]["Slicica"] then
                       poruka22:set("Figurica je vec zauzeta...")
               else poruka22:set("")
               end
               if igraci[3]["Slicica"] == igraci[1]["Slicica"] or igraci[3]["Slicica"] == igraci[2]["Slicica"] then
                       poruka32:set("Figurica je vec zauzeta...")
               else poruka32:set("")
               end
                  
               if igraci[2]["Ime"] == igraci[1]["Ime"] then
                               poruka2:set("Zao mi je, to ime je vec zauzeto...")
               else poruka2:set("")
               end
               if igraci[3]["Ime"] == igraci[1]["Ime"] or igraci[3]["Ime"] == igraci[2]["Ime"] then
                               poruka3:set("Zao mi je, to ime je vec zauzeto...")
               else poruka3:set("")  
               end         
                    
else require("tabla")
end      
          end
        end
    end
    
    ---> ne mogu se vise odabrati ista imena/figurice
  
    if x>=20 and x<120 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[1]
    end
    if x>=120 and x<210 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[2]
    end
    if x>=210 and x<310 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[3]
    end
    if x>=310 and x<410 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[4]
    end
    if x>=410 and x<510 and y>=90 and y<=200 then
      igraci[1]["Slicica"]=pijuni[5]
    end
    if x>=510 and x<610 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[6]
    end
    if x>=610 and x<710 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[7]
    end
    if x>=710 and x<=810 and y>=100 and y<=200 then
      igraci[1]["Slicica"]=pijuni[8]
    end
    if x>=20 and x<120 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[1]
    end
    if x>=120 and x<210 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[2]
    end
    if x>=210 and x<310 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[3]
    end
    if x>=310 and x<410 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[4]
    end
    if x>=410 and x<510 and y>=290 and y<=400 then
      igraci[2]["Slicica"]=pijuni[5]
    end
    if x>=510 and x<610 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[6]
    end
    if x>=610 and x<710 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[7]
    end
    if x>=710 and x<=810 and y>=300 and y<=400 then
      igraci[2]["Slicica"]=pijuni[8]
    end
    if brojIgraca==3 then
      if x>=20 and x<120 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[1]
      end
      if x>=120 and x<210 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[2]
      end
      if x>=210 and x<310 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[3]
      end
      if x>=310 and x<410 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[4]
      end
      if x>=410 and x<510 and y>=490 and y<=600 then
        igraci[3]["Slicica"]=pijuni[5]
      end
      if x>=510 and x<610 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[6]
      end
      if x>=610 and x<710 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[7]
      end
      if x>=710 and x<=810 and y>=500 and y<=600 then
        igraci[3]["Slicica"]=pijuni[8]
      end
    end
    if x >= textbox1.x and x <= textbox1.x + textbox1.width and y >= textbox1.y and y <= textbox1.y + textbox1.height then
        textbox1.active = true
    elseif textbox1.active then
        textbox1.active = false
    end
    if x >= textbox2.x and x <= textbox2.x + textbox2.width and y >= textbox2.y and y <= textbox2.y + textbox2.height then
        textbox2.active = true
    elseif textbox2.active then
        textbox2.active = false
    end
    if brojIgraca==3 and x >= textbox3.x and x <= textbox3.x + textbox3.width and y >= textbox3.y and y <= textbox3.y + textbox3.height then
        textbox3.active = true
    elseif textbox3.active then
        textbox3.active = false
    end
    
end

function love.keypressed(key)
  
  if key=="backspace" then
       text=""
       if textbox1.active then
           textbox1.text=string.sub(textbox1.text,1,19) .. string.sub(textbox1.text,20,-2)
       else if textbox2.active then
                 textbox2.text=string.sub(textbox2.text,1,20) .. string.sub(textbox2.text,21,-2)
            else if brojIgraca==3 and textbox3.active then
                      textbox3.text=string.sub(textbox3.text,1,20) .. string.sub(textbox3.text,21,-2)
                 end
            end
       end
  else if key=="space" then
            text=" "
       else
            text=key
       end
  end
  
end

function love.quit()
end

function love.update(dt)
end
