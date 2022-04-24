extends OptionButton

# map local names to locals
# e.g. English => en
#      German => de ...
var _translations = {}

func _ready():
	## fill language selector with available locales from TranslationServer
	
	var locales = TranslationServer.get_loaded_locales()
	# append available locales with english
	# English uses the original message text and does not need a translation.
	# Therefore, english is allways available as language
	locales.append('en')
	
	# add locales to the language selector ui
	for locale in locales:
		var locale_name = TranslationServer.get_locale_name(locale)
		_translations[locale_name] = locale
		add_item(locale_name)
		
	# select English by default 
	for id in range(get_item_count()):
		if (get_item_text(id) == 'English'):
			select(id)
			_on_item_selected(id)
			break

func _on_item_selected(index):
	TranslationServer.set_locale(_translations[get_item_text(index)])
