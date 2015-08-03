# -*- encoding : utf-8 -*-
tt_formats = {
  :short => '%d.%m.%Y %H:%M',
  :long  => '%H:%M, %d %B %Y, %A',
  :iso8601  => '%Y-%m-%dT%H:%M:%S',
  :date => '%d %B %Y'
}
Time::DATE_FORMATS.merge!(tt_formats)
Date::DATE_FORMATS.merge!(tt_formats)
