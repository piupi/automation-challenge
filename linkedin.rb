require 'watir'
require 'json'


# find my email and embarrassing password 
file = File.read('C:\Users\piu\Documents\puzzle_stuff\pw.json')
data = JSON.parse(file)
em = data['pw']['email']
pa = data['pw']['password']


# open chrome and go to linkedin
b = Watir::Browser.new
# b is shorter than saying browser lol
b.goto 'https://linkedin.com/'


# enter email and password
field = b.text_field :type=> 'text'
field.exist?
field.set em 
field = b.text_field :type=> 'password'
field.exist? 
field.set pa
# that smells like too much repetition 
# i could try to shorten it like "b.text_field(:type=> 'text').set em"
# BUT i want to include "field.exist?" just in case


# click log in
b.button(:class=> 'sign-in-form__submit-btn').click


# open message box
b.button(:class=> 'msg-overlay-bubble-header__control--new-convo-btn').click


# search for a name and go to message field
b.text_field(:class=> 'msg-connections-typeahead__search-field').set 'michael fritzius'
# was using a variable for that, but made it one line instead
sleep(3) # wait for search to load
b.send_keys :enter
b.send_keys :tab


# type the message
b.div(:class=> 'msg-form__contenteditable').send_keys 'https://www.youtube.com/watch?v=YSQWMmUlgrg'


# hit send
browser.button(:type=>'submit').click


sleep(5) # for napping purposes