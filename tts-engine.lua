args = {...}
--configure tts-engine here!
debugMode = false
words_enable = true --disable this if you do not have then word package!!!
folder = "tts-sounds/"
space_length = 1 --seconds
dot_length = 1.5 --seconds (aka fullstop)
config = {
a = "etc010.dfpwm",
b = "etc012.dfpwm",
c = "fr6.dfpwm",
d = "pl3.dfpwm",
e = "etc003.dfpwm",
f = "fr5.dfpwm",
g = "etc004.dfpwm",
h = "etc005.dfpwm",
i = "etc006.dfpwm",
j = "etc007.dfpwm",
k = "etc008.dfpwm",
l = "etc009.dfpwm",
m = "na2.dfpwm",
n = "na3.dfpwm",
o = "etc002.dfpwm",
p = "fr5.dfpwm",
q = "etc008.dfpwm",
r = "etc011.dfpwm",
s = "fr3.dfpwm",
t = "fr4.dfpwm",
u = "etc001.dfpwm",
v = "fr2.dfpwm",
w = "fr2.dfpwm",
x = "fr3.dfpwm",
y = "etc007.dfpwm",
z = "fr1.dfpwm"
}
words = {"boy","byte","call","common","delete","english","error","exit","general","girl",
"good","hello","license","nonbinary","no","paste","program","public","shell","source","space",
"string","support","to","version","wiktionary","world","interactive","terminated","creative",
"redirect","prompt"}
--code
if #args < 0 then
    print("Usage:")
    print("tts-engine say <sentance>")
    print("tts-engine demo")
    error("incorrect usage")
end

function play(file)
    if debugMode then
        print("PLAY >>>>>>",file)
    end
    local dfpwm = require("cc.audio.dfpwm")
    local speaker = peripheral.find("speaker")
    local decoder = dfpwm.make_decoder()
    for chunk in io.lines(file, 16 * 1024) do
        local buffer = decoder(chunk)
        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
    end
end

function say(letter)
    play(folder..config[letter])
end

function speak(sentance)
    i=0
    while i < string.len(sentance)+1 do
        i=i+1
        j=string.byte(string.upper(string.sub(sentance,i,i)))
        if string.sub(sentance,i,i) == " " then
            sleep(space_length)
        elseif string.sub(sentance,i,i) == "." then
            sleep(dot_length)
        else
            sentance = string.lower(tostring(sentance))
            m=false
            if words_enable then
            for k=1,#words do
                if debugMode then
                    print(string.sub(sentance,i,i+string.len(words[k])-1),"/",words[k])
                end
                if string.sub(sentance,i,i+string.len(words[k])-1) == words[k] then
                    if k < 10 then k = "00"..tostring(k)
                    elseif k < 100 then k = "0"..tostring(k)
                    else k = tostring(k) end
                    play(folder.."wrd"..k..".dfpwm")
                    m=true
                    i=i+string.len(words[tonumber(k)])
                    break
                end
            end
            end
            if m == false then
                if j == nil then
                elseif j > 64 and j < 91 then
                    say(string.lower(string.sub(sentance,i,i)))
                end
            end
        end
    end
end

if args[1] == "speak" then
    for o=1,#args-1 do
        speak(args[o+1])
    end
end
if args[1] == "demo" then
    speak("a b c d e f g.h i j k l m n o p.q r s t u v. w x y and z")
    for o=1,#words do
        speak(words[o])
    end
end
