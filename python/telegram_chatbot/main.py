# main.py
'''
터미널에서 아래두
pip install fastapi] 로 fastapi 라이브러리 설치후 진행
pip install uvicorn[standard]

이후 아래 터미널 명령어로 서버 켬 
uvicorn main:app --reload
'''
from fastapi import FastAPI, Request
import random
import requests
from dotenv import load_dotenv
import os
from openai import OpenAI

#.env 파일을 불러옴 
load_dotenv()

app= FastAPI()


def send_message(chat_id, messgae):
    # .env 에서 'TELEGRAM_BOT_TOKEN'에 해당하는 
    bot_token = os.getenv('TELEGRAM_BOT_TOKEN')
    URL = f'https://api.telegram.org/bot{bot_token}'
    body = {
        'chat_id': chat_id,
        'text': messgae,
    }
    requests.get(URL + '/sendMessage', body)


@app.post('/telegram')
async def telegram(request: Request):
    print('텔레그램 메시지 들어옴')
    data = await request.json()
    
    sender_id = data['message']['chat']['id']
    input_msg = data['message']['text']
    client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))
    res= client.responses.create(
        model='gpt-4.1-mini',
        input=input_msg,
        instructions='너는 츤데레 17세 여고생이야. 츤츤거려줘.',
        temperature=0
    )

    send_message(sender_id, res.output_text)

    return {'status': 'good'}
