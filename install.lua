shell.run("cd ..")
shell.run("cd ..")
shell.run("cd ..")
--yes this is ugly code
shell.run("mkdir tts-sounds")
shell.run("cd tts-sounds")
for i=1,9 do
    shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/etc00"..i..".dfpwm")
end
shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/etc010.dfpwm")
shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/etc011.dfpwm")
shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/etc012.dfpwm")
print("taking a quick break as a precaution, please wait...")
sleep(5)
for i=1,6 do
    shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/fr"..i..".dfpwm")
end
for i=1,4 do
    shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/pl"..i..".dfpwm")
end
shell.run("wget https://raw.githubusercontent.com/TheAio/tts-engine/main/tts-sounds/na1.dfpwm")
shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/na2.dfpwm")
shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/na3.dfpwm")
print("please wait, this might take a moment...")
sleep(2)
for i=1,32 do
    sleep(1)
    if i < 10 then
        shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/wrd00"..i..".dfpwm")
    else
        shell.run("wget https://github.com/TheAio/tts-engine/raw/main/tts-sounds/wrd0"..i..".dfpwm")
    end
end
shell.run("cd ..")
shell.run("wget https://raw.githubusercontent.com/TheAio/tts-engine/main/license.txt")
shell.run("wget https://raw.githubusercontent.com/TheAio/tts-engine/main/tts-engine.lua")
print("")
print("Hello World. Welcome to aios tts engine!")
shell.run("tts-engine speak Hello World. Welcome to aios tts engine!")
