import speech_recognition
import speech_recognition as sr

def recognize_speech():
    
    r = sr.Recognizer()
    
    mic = sr.Microphone(device_index = 1)
    with mic as source:
        r.adjust_for_ambient_noise(source)
        audio = r.listen(source, timeout = 10, phrase_time_limit = 10)
    
    try:
        result = r.recognize_google(audio, language = "ko-KR")
        return result
    except speech_recognition.UnknownValueError:
        return "음성 인식 실패"
    except speech_recognition.RequestError:
        return "HTTP Request Error 발생"
    except speech_recognition.WaitTimeoutError:
        return "WaitTimeout Error 발생"
    

print(recognize_speech(),flush=True) 
#flush : 버퍼에 저장된 데이터를 강제로 출력
