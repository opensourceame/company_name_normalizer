require 'i18n'
require 'yaml'

I18n.config.available_locales = :en
I18n.default_locale           = :en

class CompanyNameNormalizer

  COUNTRIES          = YAML.load_file(__dir__ + '/countries.yaml').freeze
  COUNTRY_SUBS       = COUNTRIES.values.map { |c| '(' + c + ')' }
  REGION_SUBS        = %w[ASIA EUROPE UK].map { |c| '(' + c + ')' }
  NON_UNICODE_REGEXP = /\P{Word}+/.freeze

  SUFFIXES = %w[
    BHD
    BV
    CO
    COMPANY
    CORP
    CORPORATION
    DMCC
    DOO
    DWC
    FZC
    FZE
    GMBH
    INC
    KSCC
    LIMITED
    LLC
    LTD
    NV
    PLC
    PRIVATE
    P/L
    PTE
    PTY
    PVT
    SA
    SAS
    SDN
    SL
    SLU
    SRL
    TR
    WLL
  ].freeze

  SUFFIXES_SPACED = [
    'S. A.',
    'SP Z OO',
    'SP. Z O.O.'
  ]

  SUFFIXES.each do |suffix|
    next unless suffix.length > 2 && suffix.length < 5

    SUFFIXES_SPACED << ' ' + suffix.split('').join(' ')
    SUFFIXES_SPACED << ' ' + suffix.split('').join('.')
  end

  SPLIT_WORDS = [
    'VIA ',
    'C/O ',
    'P\.O\.',
    'PO BOX',
  ].freeze

  def self.normalize(name)
    self.new.normalize(name)
  end

  def normalize(name)

    name = name.upcase
    name = clean_whitespace(name)
    name = get_primary_name(name)
    name = transliterate(name)
    name = remove_place(name)
    name = space_word_stops(name)
    name = remove_spaced_suffixes(name)
    name = space_letter_stops(name)
    name = replace_dashes(name)
    name = replace_ands(name)

    words = name
              .split(' ').map! { |word| replace_non_alphanumeric_chars(word) }
              .reject{|w| w == ''}

    while company_suffix?(words.last)
      words.pop
    end

    words.map! do |word|
      capitalize(word)
    end

    n = words.join

    return nil if n == ''

    n
  end

  def transliterate(name)
    I18n.transliterate(name)
  end

  def remove_spaced_suffixes(name)
    SUFFIXES_SPACED.each do |suffix|
      name = name.gsub(suffix, '')
    end

    name
  end

  def replace_ands(name)
    name.gsub('&', ' AND ').gsub('+', ' AND ')
  end

  def clean_whitespace(name)
    name.gsub(/[[:space:]]+/, " ").strip
  end

  def space_word_stops(name)
    name.gsub(/(\w\w)\.(\S)/, '\1. \2')
  end

  def space_letter_stops(name)
    name
      .gsub(/^(\w)\.(\S)/, '\1. \2')
      .gsub(/(\W\w)\.(\S)/, '\1. \2')
  end

  def replace_dashes(name)
    name.gsub('-', ' ')
  end

  def get_primary_name(name)

    SPLIT_WORDS.each do |split_term|
      match = name.match(/(.*)\s?#{split_term}\s?(.*)/)

      next unless match

      a = match[1]
      b = match[2]

      name = a.length > 4 ? a : b
    end

    name
  end

  def remove_place(name)
    (COUNTRY_SUBS + REGION_SUBS).each do |c|
      name = name.sub(c, '')
    end

    name
  end

  def company_suffix?(word)
    SUFFIXES.member?(word)
  end

  def replace_non_alphanumeric_chars(word)
    return '&' if word == 'AND'

    word.gsub(NON_UNICODE_REGEXP, '')
  end

  def capitalize(word)
    return if word == ''

    word.downcase!
    word[0] = word[0].upcase

    word
  end
end
