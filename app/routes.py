from app import app
from flask import render_template
import requests
import json
import calendar

@app.route('/')
def index():
    res = requests.get('https://api.tronalddump.io/random/quote').text
    quote = json.loads(res)
    date = quote['appeared_at'].split('T')[0]
    year = date.split('-')[0]
    month = calendar.month_abbr[int(date.split('-')[1])]
    day = date.split('-')[2]
    return render_template('index.html', title='TrumpQuote', quote=quote, day=day, month=month, year=year)