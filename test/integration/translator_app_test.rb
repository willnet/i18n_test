require 'test_helper'

class TranslatorAppTest < ActionDispatch::IntegrationTest
  setup { Translator.reload! }

  test 'can translate messages from a given locale to another' do
    assert_raise I18n::MissingTranslationData do
      I18n.l(Date.new(2010, 4, 17), locale: :pl)
    end

    visit '/translator/en/pl'
    fill_in 'date.formats.default', with: %("%d-%m-%Y")

    click_button 'Store translations'
    assert_equal '17-04-2010', I18n.l(Date.new(2010, 4, 17), locale: :pl)
  end
end
