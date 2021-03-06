# frozen_string_literal: true

SCALE = ENV.fetch('SCALE') { 1 }
DEFAULT_FONT = 'app/assets/fonts/Public_Sans/PublicSans-VariableFont:wght.ttf'
MAX_TICK = ENV.fetch('MAX_TICK') { 720 }
ICAL_URL = ENV.fetch('ICAL_URL') { 'changeme' }
OPEN_WEATHER_API_KEY = ENV['OPEN_WEATHER_API_KEY']
GOOGLE_API_KEY = ENV['GOOGLE_API_KEY']
